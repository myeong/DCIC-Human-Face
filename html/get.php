<?php

ini_set('display_errors', 1);
require 'credentials.inc.php';
$connect = pg_connect('host= ' . DBHOST . ' dbname=' .DBNAME . ' user=' .DBUSER . ' password=' . DBPASS);

if (!$connect){
	die("Error in connection!");
}

$action = $_GET['action'];

if ($action=="search") {

	$mode = $_GET['mode'];
	$st_name = $_GET['st_name'];
	$owner_name = $_GET['owner_name'];

	if ($mode=="full"){

		$sql = "SELECT DISTINCT on (a.st_num, a.st_name) a.st_num, a.st_name,b.parcel_no,b.block_no,f.name
				FROM humanface.addresses a 
				LEFT JOIN humanface.parcels b on a.parcel_id = b.parcel_id
				LEFT JOIN humanface.events c on b.parcel_id=c.parcel_id
				LEFT JOIN humanface.event_people_assoc e on c.event_id=e.event_id
				LEFT JOIN humanface.people f on e.person_id = f.person_id
				WHERE lower(f.name) SIMILAR TO lower('%$owner_name%') AND lower(a.st_name) SIMILAR TO lower('%$st_name%');";

	} else if ($mode=="owner_name") {

		$sql = "SELECT DISTINCT on (a.st_num, a.st_name) a.st_num, a.st_name,b.parcel_no,b.block_no,f.name
				FROM humanface.addresses a 
				LEFT JOIN humanface.parcels b on a.parcel_id = b.parcel_id
				LEFT JOIN humanface.events c on b.parcel_id=c.parcel_id
				LEFT JOIN humanface.event_people_assoc e on c.event_id=e.event_id
				LEFT JOIN humanface.people f on e.person_id = f.person_id
				WHERE lower(f.name) SIMILAR TO lower('%$owner_name%');";
	
	} else if ($mode=="st_name") {

		$sql = "SELECT DISTINCT on (a.st_num, a.st_name) a.st_num, a.st_name,b.parcel_no,b.block_no,f.name
				FROM humanface.addresses a 
				LEFT JOIN humanface.parcels b on a.parcel_id = b.parcel_id
				LEFT JOIN humanface.events c on b.parcel_id=c.parcel_id
				LEFT JOIN humanface.event_people_assoc e on c.event_id=e.event_id
				LEFT JOIN humanface.people f on e.person_id = f.person_id
				WHERE lower(a.st_name) SIMILAR TO lower('%$st_name%');";
	} else {
		die("Error: action=search&mode=invalid");
	}
} else if ($action=="all") {

	// $sql = "SELECT DISTINCT a.st_num,a.st_name,b.parcel_no,b.block_no,c.date,d.type
	// 		FROM humanface.addresses a 
	// 		LEFT JOIN humanface.parcels b ON a.parcel_id = b.parcel_id 
	// 		LEFT JOIN humanface.events c ON b.parcel_id=c.parcel_id
	// 		LEFT JOIN humanface.event_types d ON c.type=d.id
	// 		ORDER BY c.date DESC;";
	
	$sql = "SELECT DISTINCT on (p.parcel_no, p.block_no, t.type, e.date, t.id) 
				a.st_num,a.st_name,p.parcel_no,p.block_no,e.date,e.response,t.type,t.id
	 		FROM humanface.events e
	 		LEFT JOIN humanface.addresses a on a.parcel_id=e.parcel_id
	 		LEFT JOIN humanface.parcels p on  e.parcel_id=p.parcel_id
	 		LEFT JOIN humanface.event_types t ON e.type=t.id
	 		WHERE e.date IS NOT NULL and e.type IS NOT NULL
	 		ORDER BY e.date ASC, t.id ASC;";

} else if ($action=="owner"){
	$parcel = $_GET['parcel'];
	$block = $_GET['block'];

	$sql = "SELECT DISTINCT on (p.name, a.role) p.name, a.role
			FROM humanface.events e
			LEFT JOIN humanface.parcels c on  e.parcel_id=c.parcel_id
			LEFT JOIN humanface.event_people_assoc a on  a.event_id=e.event_id
	 		LEFT JOIN humanface.people p on p.person_id=a.person_id
	 		WHERE c.parcel_no ='$parcel' AND c.block_no = '$block'
	 		ORDER BY a.role ASC;";

} else {
	die("Error: action=invalid");
}

$result = pg_query($connect, $sql);
if(!$result){
	die("Error in SQL query: " . pg_last_error());
}
$rows = pg_num_rows($result);
if ($rows == 0) {
	echo "Zero result";
} else {

	if ($action=="search") {
		while ($row = pg_fetch_array($result)) {
			$data = array(
				"st_num" => $row['st_num'],
				"st_name" => $row['st_name'],
				"parcel_no"=> $row['parcel_no'],
				"block_no"=> $row['block_no']	
			);
			$datas[] = $data;
		}
		echo json_encode($datas);			
	} else if ($action=="all") {
		while ($row = pg_fetch_array($result)) {
			$data = array(
				"st_num" => $row['st_num'],
				"st_name" => $row['st_name'],
				"parcel_no"=> $row['parcel_no'],
				"block_no"=> $row['block_no'],
				"date"=> $row['date'],
				"type" => $row['type'],
				"response" => $row['response']		
				
			);
			$datas[] = $data;
		}
		echo json_encode($datas);			
	} else if ($action=="owner") {
		while ($row = pg_fetch_array($result)) {
			$data = array(
				"name" => $row['name'],
				"role" => $row['role']				
			);
			$datas[] = $data;
		}
		echo json_encode($datas);			
	}
}

pg_free_result($result);
pg_close($connect);
?>
