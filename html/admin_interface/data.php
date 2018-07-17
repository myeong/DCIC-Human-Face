<?php
//Connection to PostgreSQL
require '../credentials.inc.php';
$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
  die("Error in connection!:" . pg_last_error());
}
else{
  echo "Successfully connected to database:" . " " .pg_dbname() . " on " . pg_host();
}
//Store post data to array (parcels table)
$parcel_id = $_POST['parcel_id'];
$block_no = $_POST['block_no'];
$parcel_no = $_POST['parcel_no'];
$ward_no = $_POST['ward_no'];
$land_use = $_POST['land_use'];

//Inserting Data into Parcels table
if(isset($_POST['add'])){}
//Deleting Data in Parcels table
if(isset($_POST['delete'])){}
 ?>
