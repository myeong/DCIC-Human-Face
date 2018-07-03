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

//Querying Parcel Table information
if(isset($_POST['submit'])){
  //Stores post data to array (humanface.parcels table)
  $search = $_POST['search'];
  $q = pg_query("SELECT * FROM humanface.parcels WHERE $search = '$search'");
  while(pg_fetch_all($q)){
    
  }
}
else{
  $q = "SELECT * FROM humanface.parcels";
  $cue = pg_query($q);
}
?>
