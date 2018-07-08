<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="main_php.css">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  <title>DCIC Human Face of Big Data</title>

  <?php
  require '../credentials.inc.php';
  //include 'search.php';
  ini_set('display_errors', 1);
  //Connection to PostgreSQL
  $connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
  if (!$connect){
  	die("Error in connection!:" . pg_last_error());
  }
else{
  echo "Successfully connected to database:" . " " . pg_dbname() . " on " . pg_host();
  }

  //Querying Parcels Table Information
  $query = 'SELECT * FROM humanface.parcels';
  $par = pg_query($connect, $query);
  $row = pg_fetch_all($par);
  $num = pg_num_rows($par);
  ?>

<script>
  function validateForm(){
    var x;
    x = document.forms["form"]["search"].value;
    if(x == ""){
      alert("Input not valid");
      return false;
    }
  }
  function mouse(){
    var e;
    e = document.getElementById("form");
    if(e.type == 'mouseover'){}
  }
</script>

</head>
<body>
  <header>
    <h1>DCIC: Human Face of big Data</h1>
    <p1>Utilize this search page to find parcel specific information within the DCIC: Human Face of Big Data relational database system.</p1>
  </header>

  <div>
    <form class = "form-inline align-content-sm-end" name = "form" id = "form" method="post" action = "search.php" onsubmit="return validateForm()">
      <div class="form-group">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" name = "search">
      <input class=" btn btn-outline-danger my-2 my-sm-0" type = "submit" name = "submit" value = "submit">
      </div>
    </form>
  </div>

  <?php echo "There are " . $num . " rows in the " . pg_dbname() . " database"; ?>

  <table class="table table-light table-hover table-striped table-bordered">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col col-md">Parcel ID</th>
        <th scope="col">Block Number</th>
        <th scope="col">Parcel Number</th>
        <th scope="col">Ward Number</th>
        <th scope="col">Land Use</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($row as $rows){ ?>
      <tr>
        <td></td>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</html>
