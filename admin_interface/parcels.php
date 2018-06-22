<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  <title>DCIC Human Face of Big Data</title>

  <?php
  require '../credentials.inc.php';
  ini_set('display_errors', 1);
  //Connection to PostgreSQL
  $connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
  if (!$connect){
  	die("Error in connection!:");
  }
else{
  echo "DB connection successful";
  }
  //Parcels Table
  $query = 'SELECT * FROM parcels';
  $parcel = 'SELECT * parcel_id FROM parcels'
  $par = pg_query($connect, $query);
  ?>
</head>
<body>
  <header>
    <h1>DCIC: Human Face of big Data</h1>
    <p1>Utilize this search page to find parcel specific information within the DCIC: Human Face of Big Data relational database system.</p1>
  </header>
  <table class="table table-hover table-striped">
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
      <?php while($row = pg_fetch_array($par)){?>
      <tr>
        <td><?php echo $row['parcel_id']; ?></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    <?php } ?>
    </tbody>
  </table>
</body>
</html>
