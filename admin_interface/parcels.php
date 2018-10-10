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
  	die("Error in connection!:" . pg_last_error());
  }
else{
  echo "DB connection successful";
  }
  //Parcels Table
  $query = 'SELECT * FROM humanface.parcels';
  $par = pg_query($connect, $query);
  $row = pg_fetch_all($par);
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
      <?php foreach($row as $rows){ ?>
      <tr>
        <td><?php echo $rows['parcel_id'] . "\n"; ?></td>
        <td><?php echo $rows['block_no'] . "\n"; ?></td>
        <td><?php echo $rows['parcel_no'] . "\n"; ?></td>
        <td><?php echo $rows['ward_no'] . "\n"; ?></td>
        <td><?php echo $rows['land_use'] . "\n"; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
</body>
</html>
