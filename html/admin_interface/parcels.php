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
  echo "Successfully connected to database:" . " " . pg_dbname() . " on " . pg_host();
  }
  //Querying Parcels Table Infomation
  $query = 'SELECT * FROM humanface.parcels';
  $par = pg_query($connect, $query);
  $row = pg_fetch_all($par);
  $num = pg_num_rows($par);

  //PHP Search Bar
  if(isset($_POST['submit'])){
    $search = $_POST['search'];
    $q = "SELECT * FROM humanface.parcels WHERE $search = '$search'";
    $parcels = pg_query($connect, $q);
    $qsearch = pg_fetch_array($parcels);
    /*foreach($qsearch as $p){
      echo "<p> $p['parcel_id'] </p>";
    }*/
  }
  /*else{
    $q = "SELECT * FROM humanface.parcels";
    $cue = pg_query($connect, $q);
  }*/
  ?>
</head>
<body>
  <header>
    <h1>DCIC: Human Face of big Data</h1>
    <p1>Utilize this search page to find parcel specific information within the DCIC: Human Face of Big Data relational database system.</p1>
  </header>

  <form class = "form-inline my-2 my-lg-0" name = "form" method="post" action = "search.php">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" name = "search">
    <input class=" btn btn-outline-danger my-2 my-sm-0" type = "submit" name = "submit" value = "submit">
  </form>

  <?php echo "There are " . $num . " rows in the " . pg_dbname() . " database"; ?>
  <p>You searched for <?php echo $search; ?></p>

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
