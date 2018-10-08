<?php
function send_query($con, $q) {
	$result = pg_query($con, $q);
	if(!$result){
		die("Error in SQL query: " . pg_last_error());
	}
	pg_free_result($result);
}

ini_set('display_errors', 1);
require '../credentials.inc.php';
$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
	die("Error in connection!");
}

		// $person_query = "SELECT name FROM humanface.people;";
		// $person_result = pg_query($connect, $person_query);

		// while ($row = pg_fetch_array($person_result)) {
		// 	$person_name = array(
		// 		"name" => trim($row['name'])
		// 	);
		// 	$people_names[] = $person_name;
		// }	
		// echo "<pre>";
		// print_r($people_names);
		// echo "</pre>";

// javascript object from edit page
$a_parcel = $_POST;

foreach ($a_parcel as $key => $value) {
	if ($key == 'parcel') {
		$parcel_id = $value[0]['parcel_id'];
		$block_no = $value[0]['block_no'];
		$parcel_no = $value[0]['parcel_no'];
		$ward_no = $value[0]['ward_no'];
		$land_use = $value[0]['land_use'];		

		$p_query = "UPDATE humanface.parcels SET block_no=" . $block_no . ", parcel_no=" . $parcel_no . ", ward_no=" . $ward_no . ", land_use='" . $land_use . "' WHERE parcel_id=" . $parcel_id . ";";

		send_query($connect, $p_query);
	}
	else if ($key == 'address') {
		foreach ($value as $k => $v) {
			$address_id = $v['address_id'];
			$st_num = $v['st_num'];
			$st_name = $v['st_name'];

			$a_query = "UPDATE humanface.addresses SET st_num='" . $st_num . "', st_name='" . $st_name . "' WHERE id=" . $address_id . ";";

			send_query($connect, $a_query);
		}
	}
	else if ($key == 'events') {
		// person name case
		$person_query = "SELECT name FROM humanface.people;";
		$person_result = pg_query($connect, $person_query);

		while ($row = pg_fetch_array($person_result)) {
			$person_name = array(
				"name" => trim($row['name'])
			);
			$people_names[] = $person_name;
		}	

		foreach ($value as $k => $v) {
			$event_id = $v['event_id'];
			$response = $v['response'];
			$extra_information = $v['extra_information'];
			$date = $v['date'];
			$price = $v['price'];
			$event_type_id = $v['event_type_id'];
			$event_type = $v['event_type'];
			$event_asso_id = $v['event_asso_id'];
			$role = $v['role'];
			$person_id = $v['person_id'];
			$name = $v['name'];

			$e_query = "UPDATE humanface.events SET response='" . $response . "', extra_information='" . $extra_information . "', date='" . $date . "', price=" . $price . ", type=" . $event_type_id . " WHERE event_id=" . $event_id . ";";

			send_query($connect, $e_query);

			if (array_search($name, array_column($people_names, 'name')) !== False) {
				$peo_query = "UPDATE humanface.event_people_assoc SET person_id=" . $person_id  . ", role='" . $role . "' WHERE id=" . $event_asso_id . ";";
				
				send_query($connect, $peo_query);
			}
			else {
				echo "name is NOT in the list";
				$peo_query = "UPDATE humanface.people SET name='" . $name . "' WHERE person_id=" . $person_id . ";";
				
				send_query($connect, $peo_query);
				
			}
		}
	}
}

pg_close($connect);


// echo $a_parcel;
// echo "<pre>";
// print_r($a_parcel);
// echo "</pre>";
?>

