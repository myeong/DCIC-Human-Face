<?php
ini_set('display_errors', 1);
require '../credentials.inc.php';
$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
	die("Error in connection!");
}
$action = $_GET['action'];

if ($action == "type_request") {
	$event_type = $_GET['type'];

	$query = "SELECT id FROM humanface.event_types WHERE type='" . $event_type . "';";
} else if ($action == "person_request") {
	$person_name = $_GET['name'];

	$query = "SELECT person_id FROM humanface.people WHERE name='" . $person_name . "';";
}

// if ($q_request == "parcel_request") {
// 		$query = "SELECT p.parcel_id, p.block_no, p.parcel_no, p.ward_no, p.land_use
// 			FROM humanface.parcels p
// 			WHERE parcel_id = '" . $p_key . "';";event_types
// 	} else if ($q_request == "address_request") {
// 		$query = "SELECT a.id as \"address_id\", a.st_num, a.st_name
// 			FROM humanface.addresses a
// 			WHERE parcel_id = '" . $p_key . "';";
// 	} else if ($q_request == "event_request") {
// 		$query = "SELECT e.event_id, e.response, e.extra_information, e.date, e.price, 
// 					et.id as event_type_id, et.type, epa.role,
// 					peo.person_id, peo.name
// 			FROM humanface.parcels p
//             	JOIN humanface.events e on p.parcel_id = e.parcel_id
//                 JOIN humanface.event_types et on e.type = et.id
//                 JOIN humanface.event_people_assoc epa on e.event_id = epa.event_id
//                 JOIN humanface.people peo on epa.person_id = peo.person_id
// 			WHERE p.parcel_id = '" . $p_key . "';";
// 	} else if($q_request == "name_request") {
// 		$query = "SELECT name FROM humanface.people;";
// 	} else if($q_request == "land_request") {
// 		$query = "SELECT DISTINCT land_use FROM humanface.parcels;";
// 	} else if($q_request == "type_request") {
// 		$query = "SELECT id FROM humanface.event_types WHERE id=" . $p_key . ";";
// 	}
$result = pg_query($connect, $query);
if(!$result){
	die("Error in SQL query: " . pg_last_error());
}

if ($action == "type_request"){
	while ($row = pg_fetch_array($result)) {
			$data = array(
				"event_type_id" => $row['id']
			);
			$datas[] = $data;
		}
	echo json_encode($datas);
} else if ($action == "person_request"){
	while ($row = pg_fetch_array($result)) {
			$data = array(
				"person_id" => $row['person_id']
			);
			$datas[] = $data;
		}
	echo json_encode($datas);
}
pg_free_result($result);
pg_close($connect);
?>