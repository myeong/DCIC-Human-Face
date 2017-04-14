<?php
// Expand memory being used by PHP
ini_set('memory_limit','400M');
// server should keep session data for AT LEAST 1 hour
ini_set('session.gc_maxlifetime', 3600);
// each client should remember their session id for EXACTLY 1 hour
session_set_cookie_params(3600);
session_start();
$now = time();

if (isset($_SESSION['discard_after']) && $now > $_SESSION['discard_after']) {
    // this session has worn out its welcome; kill it and start a brand new one
    session_unset();
    session_destroy();
    session_start();
}
$_SESSION['discard_after'] = $now + 3600;
date_default_timezone_set('America/New_York'); 

if (!file_exists('credentials.inc.php')) {
   echo "My credentials are missing!";
   exit;
}

// Include libraries added with composer
require 'vendor/autoload.php';
// Include credentials
require 'credentials.inc.php';

function connect_db(){
	// Connecting, selecting database
	$dbconn = pg_connect('host=' . DBHOST . ' dbname=' .DBNAME . ' user=' .DBUSER . ' password=' . DBPASS)
	    or die('Could not connect: ' . pg_last_error());
	return $dbconn;
}

// Start Slim instance
//-------------------------------
$app = new \Slim\Slim(array(
    'debug' => true
));

// Handle not found
$app->notFound(function () use ($app) {
	// Temporarily route /map, /viz to /map.html
	$actual_link = "$_SERVER[REQUEST_URI]";
	print($actual_link);
	exit;
	// Let's make sure we remove a trailing "/" on any not found paths
    $actual_link = rtrim($actual_link, '/');
        
	// if ($actual_link == "/phppgadmin"){
	// 	echo "this is phppgadmin";
	// } else {		
 //    	$app->redirect('/404.html');
 //    }
});


$app->get('/index.html', function () use ($app) {
  	$app->redirect("/");
});

$app->get('/', function () use ($app) {
    $content['title'] = "Human Face of Big Data";
    $content['intro'] = <<<HTML
		<p>Asheville, NC</p>
HTML;
	// return $app->response->setBody($response);
	// Render content with simple bespoke templates
	$app->view()->setData(array('content' => $content));
	$app->render('tp_main_map.php');
});

$app->get('', function () use ($app) {
    $app->redirect("/");
});

$app->get('/map/', function () use ($app) {
	
    $content['title'] = "Human Face of Big Data";
    $content['intro'] = <<<HTML
		<p>Asheville, NC</p>
HTML;
	// return $app->response->setBody($response);
	// Render content with simple bespoke templates
	$app->view()->setData(array('content' => $content));
	$app->render('tp_main_map.php');
    
});

# Data management interface
$app->get('/data/', function () use ($app) {
	// Connecting, selecting database
	$dbconn = connect_db();

	// Performing SQL query
	$query = "SELECT max(parcel_id) FROM humanface.parcels";
	$result = pg_query($query) or die('Query failed: ' . pg_last_error());

	$content['title'] = "Data Management";
    $content['intro'] = "This is an admin interface for data management";
	
	$line = pg_fetch_array($result, null, PGSQL_ASSOC);
	$content['parcel_id'] = $line['max'] + 1;
	
	$app->view()->setData(array('content' => $content));
	$app->render('tp_data.php');
});

$app->get('/crowd/', function () use ($app) {
	// Connecting, selecting database
	$dbconn = connect_db();

	// Performing SQL query
	$query = "SELECT max(parcel_id) FROM humanface.parcels";
	$result = pg_query($query) or die('Query failed: ' . pg_last_error());
	$line = pg_fetch_array($result, null, PGSQL_ASSOC);
	$content['parcel_id'] = $line['max'] + 1;

	$content['title'] = "Data Management";
    $content['intro'] = "This is an admin interface for data management";
	
	// event types
	$query = "SELECT id, type FROM humanface.event_types";
	$result = pg_query($query) or die('Query failed: ' . pg_last_error());

	$line = pg_fetch_all($result);
	$event_types = array();
	$event_ids = array();

	for ($i=0; $i<sizeof($line); $i++){
		$event_types[$i] = $line[$i]["type"];
		$event_ids[$i] = intval($line[$i]["id"]);
	}
	

	$content['event_types'] = $event_types;
	$content['event_ids'] = $event_ids;

	// pre-load people
	$query = "SELECT person_id, name FROM humanface.people where name != '';";
	$result = pg_query($query) or die('Query failed: ' . pg_last_error());

	$line = pg_fetch_all($result);
	$people = array();
	$people_ids = array();

	for ($i=0; $i<sizeof($line); $i++){
		$people[$i] = $line[$i]["name"];
		$people_ids[$i] = intval($line[$i]["person_id"]);
	}

	$content['people'] = $people;
	$content['people_ids'] = $people_ids;
	
	$app->view()->setData(array('content' => $content));
	$app->render('tp_crowdsourcing.php');
});

// DB operations for Data Insertion
$app->post('/input/:parcel_id/', function($pid) use ($app) {
	$dbconn = connect_db();

	$vars = $app->request->post(); 	
	$log_time = date_format(date_create(), 'Y-m-d H:i:s');

	echo "<pre>";
	print_r($vars);
	echo "</pre>";

	// Data into the Parcels table
	$parcel = array();
	
	$parcel['block_no'] = intval($vars['block_no']);
	$parcel['parcel_no'] = intval($vars['parcel_no']);
	$parcel['ward_no'] = intval($vars['ward_no']);
	$parcel['land_use'] = (!isset($vars['land_use_other']) || $vars['land_use_other'] == "") ? strval($vars['land_use']) : pg_escape_string(strval($vars['land_use_other']));

	$res = pg_query_params('INSERT into humanface.parcels (parcel_id, block_no, parcel_no, ward_no, land_use)'.
		' VALUES (default, $1, $2, $3, $4) RETURNING parcel_id', $parcel);
	if ($res) {
		echo "Parcel data is successfully logged<br />";
	} else {
		echo "There's an error in inserting parcel data<br />";
	}

	$parcel_id = pg_fetch_row($res)[0];

	// Addresses
	$address = array();	
	$address['st_num'] = isset($vars['st_num_1']) ? $vars['st_num_1'] : null;
	$address['st_name'] = isset($vars['st_name_1']) ? $vars['st_name_1'] : null;	
	$address['parcel_id'] = $parcel_id;

	$res = pg_query_params('INSERT into humanface.addresses (id, st_num, st_name, parcel_id)'.
		' VALUES (default, $1, $2, $3) RETURNING id', $address);
	if ($res) {
		echo "Address data 1 is successfully logged<br />";
	} else {
		echo "There's an error in inserting Address 1 data<br />";
	}

	if ($vars['st_num_2'] != "" || isset($vars['st_num_2'])){
		$address = array();	
		$address['st_num'] = isset($vars['st_num_2']) ? $vars['st_num_2'] : null;
		$address['st_name'] = isset($vars['st_name_2']) ? $vars['st_name_2'] : null;
		$address['parcel_id'] = $parcel_id;

		$res = pg_query_params('INSERT into humanface.addresses (id, st_num, st_name, parcel_id)'.
			' VALUES (default, $1, $2, $3) RETURNING id', $address);
		if ($res) {
			echo "Address data 2 is successfully logged<br />";
		} else {
			echo "There's an error in inserting Address 2 data<br />";
		}
	}	

	$names = array();
	
	// Data into the Events table
	$i = 1;	
	while(isset($vars['event_type-'.strval($i)])) {		
		$event = array();	
		$event['type'] = isset($vars['event_type-'.strval($i)]) && $vars['event_type-'.strval($i)] != "" ? intval($vars['event_type-'.strval($i)]) : null;
		$event['date'] = isset($vars['event_date-'.strval($i)]) && $vars['event_date-'.strval($i)] != "" ? strval($vars['event_date-'.strval($i)]) : null;
		$event['price'] = isset($vars['event_money-'.strval($i)]) ? intval($vars['event_money-'.strval($i)]) : null;		
		$event['response'] = isset($vars['event_response-'.strval($i)]) ? $vars['event_response-'.strval($i)] : null;
		$event['extra_information'] = isset($vars['event_extra-'.strval($i)]) ? pg_escape_string(strval($vars['event_extra-'.strval($i)])) : null;
		$event['parcel_id'] = $parcel_id;
		
		$res = pg_query_params('INSERT into humanface.events (event_id, type, date, price, response, extra_information, parcel_id)'.
			' VALUES (default, $1, $2, $3, $4, $5, $6) RETURNING event_id', $event);
		if ($res) {
			echo "Event data are successfully logged<br />";
		} else {
			echo "There's an error in inserting Event data<br />";
		}

		$event_id = pg_fetch_row($res)[0];				

		$j = 1;
		while(isset($vars['person_name-'.strval($i) . '-'. strval($j)])) {					
			$person = array();	
			$assoc = array();

			$assoc['role'] = isset($vars['person_role-'.strval($i) . '-'. strval($j)]) ? $vars['person_role-'.strval($i) . '-'. strval($j)] : null;
			$assoc['event_id'] = $event_id;

			if (isset($vars['person_name-'.strval($i) . '-'. strval($j)])){
				// if the person is an existing one, just add an association entry
				if (is_numeric($vars['person_name-'.strval($i) . '-'. strval($j)])){
					$assoc['person_id'] = intval($vars['person_name-'.strval($i) . '-'. strval($j)]);

					$res = pg_query_params('INSERT into humanface.event_people_assoc (id, role, event_id, person_id)'.
						' VALUES (default, $1, $2, $3) RETURNING id', $assoc);
					if ($res) {
						echo "Association <strong>". strval($assoc['event_id']) ."-".strval($assoc['person_id']). "</strong> has been successfully logged.<br />";
					} else {
						echo "There's an error in inserting Association data.<br />";
					}
				}
				// if this person is a new one, need to add both assoc and person entry 
				else {
					$person['name'] = pg_escape_string($vars['person_name-'.strval($i) . '-'. strval($j)]);

					// if there are multiple same names in a document, it is regarded as a same person.
					if (in_array($person['name'], $names)){
						$assoc['person_id'] = array_search($person['name'],$names);						
					} 
					else {					

						$result = pg_query_params('INSERT into humanface.people (person_id, name)'.
							' VALUES (default, $1) RETURNING person_id', $person);
						if ($result) {
							echo "Person <strong>". $person['name']. "</strong> has been successfully logged<br />";
						} else {
							echo "There's an error in inserting Person data<br />";
						}

						$assoc['person_id']  = pg_fetch_row($result)[0];
						$names[$assoc['person_id']] = $person['name'];
					}
					
					$res = pg_query_params('INSERT into humanface.event_people_assoc (id, role, event_id, person_id)'.
						' VALUES (default, $1, $2, $3) RETURNING id', $assoc);
					if ($res) {
						echo "Association <strong>". strval($assoc['event_id']) ."-". strval($assoc['person_id']). "</strong> has been successfully logged.<br />";
					} else {
						echo "There's an error in inserting Association data.<br />";
					}
				}
			}
			
			
			$j++;
		}

		$i++;		
	}

	echo "<br><br><a href='/crowd'><strong>GO BACK to Data Insertion Interface</strong></a>";
	

});

// Simple View for the Data in the DB
$app->get('/list/', function () use ($app) {
	// Connecting, selecting database
	$dbconn = connect_db();

	// Performing SQL query
	$query = "SELECT (p.parcel_id, block_no, parcel_no, land_use, t.type, price, response, extra_information, e.date, pp.name, a.role) " .
						"FROM humanface.parcels as p LEFT JOIN humanface.events as e on p.parcel_id=e.parcel_id " .
						"LEFT JOIN humanface.event_people_assoc as a on a.event_id=e.event_id ".
						"LEFT JOIN humanface.people as pp on pp.person_id=a.person_id ". 
						"LEFT JOIN humanface.event_types as t on t.id=e.type ".
						"ORDER BY p.block_no";
	$result = pg_query($dbconn, $query) or die('Query failed: ' . pg_last_error());	
	// $line = pg_fetch_array($result, null, PGSQL_ASSOC);


	echo "<br><a href='/crowd' target='_blank'><strong>GO BACK to Data Insertion Interface</strong></a><br><br>";

	echo "<table border=1><tr>
	<td>Parcel ID (arbitrary)</td>
	<td>Block Number</td>
	<td>Parcel Number</td>
	<td>Land Use</td>
	<td>Event Type</td>
	<td>Money Involved in the Event</td>
	<td>Response to Event</td>
	<td>Extra Info about Event</td>
	<td>Event Date</td>
	<td>Person Name</td>
	<td>Person Role</td></tr>";
	
	while($line = pg_fetch_row($result)) {
		echo "<tr>";
		
		$text = str_replace(array("(", ")"), "", $line[0]);
		$elements = str_getcsv($text, ",");	

		foreach ($elements as $key=>$value){			
			 echo "<td>" . strval($value) . "</td>";
		}
		echo "</tr>";		
	}
	echo "</table>";
	
});

$app->get('/delete/:id/', function ($id) use ($app) {
	$dbconn = connect_db();

	print_r($id);
	if ($id == null || $id == 0 || $id == ''){
		echo "no id input";	
		exit();
	}

	echo "<br>";
	print "Deletion for now is prohibited. Contact admin for that."
	exit();

	$query = "DELETE FROM humanface.parcels where parcel_id!='$id'"; 
	$result = pg_query($query); 
	if (!$result) { 
	    printf ("ERROR"); 
	    $errormessage = pg_errormessage($db); 
	    echo $errormessage; 
	    exit(); 
	} 
	printf ("Deleted from the parcel table successfully"); 

	$query = "DELETE FROM humanface.addresses where st_num IS NULL"; 
	$result = pg_query($query); 
	if (!$result) { 
	    printf ("ERROR"); 
	    $errormessage = pg_errormessage($db); 
	    echo $errormessage; 
	    exit(); 
	} 
	printf ("Deleted from the address table successfully"); 
	pg_close(); 
});


$app->run();
?>