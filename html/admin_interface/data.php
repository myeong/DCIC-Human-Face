<?php
//Connection to PostgreSQL
require '../credentials.inc.php';

ini_set('display_errors');

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
if(isset($_POST['add'])){
  $sql = "INSERT INTO humanface.parcels VALUES('parcel_id', 'block_no', 'parcel_no', 'ward_no', 'land_use')";
  $query = pg_query($connect, $sql);
  echo $parcel_id;
  echo $block_no;
  echo $parcel_no;
  echo $ward_no;
  echo $land_use;
  //echo $sql;
}
//Deleting Data in Parcels table
if(isset($_POST['delete'])){}
 ?>
