<?php
function send_query($con, $q) {
	$result = pg_query($con, $q);
	if(!$result){
		die("Error in SQL query: " . pg_last_error());
	}
	$query_result = pg_fetch_all($result);
	pg_free_result($result);
	return $query_result;
}

require '../credentials.inc.php';

ini_set('display_errors', 1);

//Connection to PostgreSQL
$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
	die("Error in connection!:" . pg_last_error());
}

// processing the passed parcel_id
$p_id = $_GET["pid"];

//Query for parcel information
$parcel_query = "SELECT p.parcel_id, p.block_no, p.parcel_no, p.ward_no, p.land_use
			FROM humanface.parcels p
			WHERE parcel_id = " . $p_id . "
			ORDER BY p.parcel_id;";

$parcel_info = send_query($connect, $parcel_query);

// Query for address information
$address_query = "SELECT a.id as \"address_id\", a.st_num, a.st_name
			FROM humanface.addresses a
			WHERE parcel_id = " . $p_id . "
			ORDER BY address_id;";

$address_info = send_query($connect, $address_query);

// Query for event information
$event_query = "SELECT e.event_id, e.response, e.extra_information, e.date, e.price, 
				et.id as event_type_id, et.type
			FROM humanface.events e
            JOIN humanface.event_types et on e.type = et.id
			WHERE e.parcel_id = " . $p_id . "
			ORDER BY e.event_id, event_type_id;";

$event_info = send_query($connect, $event_query);

# Storing all names
$name_query = "SELECT name FROM humanface.people;";
$names = send_query($connect, $name_query);

# process names
foreach ($names as $key => $value) {
    foreach ($value as $v) {
        $n[] = trim($v);
    }
}

pg_close($connect);
?>