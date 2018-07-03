<DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  <title>DCIC Human Face of Big Data</title>
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
  $q = pg_query("SELECT * FROM humanface.parcels WHERE parcel_id = $search");
  $array = pg_fetch_array($q);
  $numb = pg_num_rows($q);
}
else{
  $q = "SELECT * FROM humanface.parcels";
  $cue = pg_query($q);
}
?>
</head>
<body>
  <table class="table table-light table-hover table-striped">
    <thead>
      <tr>
        <th scope="col">Parcel ID</th>
        <th scope="col">Block Number</th>
        <th scope="col">Parcel Number</th>
        <th scope="col">Ward Number</th>
        <th scope="col">Land Use</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($array as $arr){ ?>
      <tr>
      <td><?php echo $arr[0]; ?></td>
      <td><?php echo $arr[1]; ?></td>
      <td><?php echo $arr[2]; ?></td>
      <td><?php echo $arr[3]; ?></td>
      <td><?php echo $arr[4]; ?></td>
    </tr>
  <?php } ?>
    </tbody>
  </table>
  <?php echo "You searched for " . $search; ?>
  <?php
  foreach($array as $arr){
    echo $arr[0];
  }
  ?>
</body>
</html>
