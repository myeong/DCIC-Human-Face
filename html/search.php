<?php
//Connection to PostgreSQL
$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
  die("Error in connection!:" . pg_last_error());
}
else{
echo "Successfully connected to database:" . " " .pg_dbname() . " on " . pg_host();
}
?>
