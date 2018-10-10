<!DOCTYPE HTML>
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
  $array = pg_fetch_all($q);
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
      <td><?php echo $arr['parcel_id']; ?></td>
      <td><?php echo $arr['block_no']; ?></td>
      <td><?php echo $arr['parcel_no']; ?></td>
      <td><?php echo $arr['ward_no']; ?></td>
      <td><?php echo $arr['land_use']; ?></td>
    </tr>
  <?php } ?>
    </tbody>
  </table>
  <?php echo "You searched for " . $search . "<br>"; ?>
  <?php echo "You searched for " . $numb . " row"; ?>
</body>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</html>
