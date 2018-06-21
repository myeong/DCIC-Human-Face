<!DOCTYPE HTML>
<html lang="en">
<head>
  <?php
  require 'credentials.php';
  $connect = pg_connect('host=' . DBHOST . ' dbname=' .DBNAME . ' user=' .DBUSER . ' password=' . DBPASS);
  if (!$connect){
  	echo "Error in connection!";
  }
else{
  echo "DB connection successful";
}
  ?>
</head>
</html>
