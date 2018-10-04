<?php
//Driver for Humanface of Big Data Admin Interface
//Connection to PostgreSQL
require '../credentials.inc.php';

ini_set('display_errors');

$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
  die("Error in connection!:" . pg_last_error());
}
else{
  echo "Successfully connected to database:" . " " .pg_dbname() . " on " . pg_host() . "\n";
}
print_r($_POST);
//Store post data to array (parcels table)
$parcel_id = $_POST['parcel_id'];
$block_no = $_POST['block_no'];
$parcel_no = $_POST['parcel_no'];
$ward_no = $_POST['ward_no'];
$land_use = $_POST['land_use'];

//Store post data to array (addresses table)
/*$id = $_POST['id'];
$st_num = $_POST['st_num'];
$st_name = $_POST['st_name'];
$parcel = $_POST['parcel_id']*/

//Inserting Data into Parcels table
if(isset($_POST['add'])){
  /*$human = "SELECT * FROM humanface.parcels p
    JOIN humanface.addresses a on p.parcel_id = a.parcel_id
    JOIN humanface.events e on p.parcel_id = e.parcel_id
    JOIN humanface.event_types et on e.event_id = et.id
    JOIN humanface.event_people_assoc epa on e.event_id = epa.id
    JOIN humanface.people peo on epa.person_id = peo.person_id";*/
  //Insert form data into multiple tables
  $sql = "INSERT INTO humanface.parcels ('block_no', 'parcel_no', 'ward_no', 'land_use') VALUES ('$block_no', '$parcel_no', '$ward_no', '$land_use'); ";
  $sql .= "INSERT INTO humanface.addresses ('st_num', 'st_name', 'parcel_id') VALUES ('$st_num', '$st_name', '$parcel_id'); ";
  $sql .= "INSERT INTO humanface.events (
'response', 'extra_information', 'parcel_id', 'date', 'type', 'price') VALUES ('$response', '$extra_information', '$parcel_id', '$date', '$type', '$price'); ";

  $query = pg_query($connect, $sql);
  /*$result = pg_get_result($connect);
  echo "Query Result:" . $result;*/
  /*echo $parcel_id;
  echo $block_no;
  echo $parcel_no;
  echo $ward_no;
  echo $land_use;*/
  //echo $sql;
}

//Deleting Data in Parcels table
if(isset($_POST['delete'])){
  $sql = "DELETE FROM humanface.parcels WHERE parcel_id = '$parcel_id'";
  $query = pg_query($connect, $sql);
}
 ?>
