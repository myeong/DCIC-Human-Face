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

ini_set('display_errors');

$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
if (!$connect){
  die("Error in connection!:" . pg_last_error());
}
else{
  echo "Successfully connected to database:" . " " .pg_dbname() . " on " . pg_host();
}
//Querying Parcels Table information
$query = 'SELECT * FROM humanface.parcels';
$par = pg_query($connect, $query);
$row = pg_fetch_all($par);

//Obtain Selected Parcel Information (Parcel ID)
if($_GET['p_id']){
  $u = "SELECT * FROM humanface.parcels WHERE parcel_id = " . $_GET['p_id'];
  $pquery = pg_query($connect, $u);
  $arr = pg_fetch_assoc($pquery);
}
?>

</head>
<body>
  <form method="post" action="data.php" name="form" id="form">
    <div class="card float-md-none">
      <div class="card-header">
        Human Face of Big Data
      </div>
    </div>
  <div class="dropdown">
      <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown button
    </button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <?php foreach($row as $r){ ?>
      <a class="dropdown-item" href="delete.php?p_id=<?=$r['parcel_id']?>"><?php echo $r['parcel_id'];?></a>
      <?php } ?>
    </div>
  </div>
  <input id="parcel_id" type="hidden" name="parcel_id" value="<?=$arr['parcel_id']?>">
  <div class="form-group">
  <label class="float-md-center" for="Parcel ID">Parcel ID</label>
  <input class="form-control" type="text" id="parcel_id" name="parcel_id" value="<?=$arr['parcel_id'];?>">
  </div>
  <div class="form-group">
  <label class="float-md-center" for="block_number">Block Number</label>
  <input class="form-control" type="text" id="block_number" name="block_number" value="<?=$arr['block_no']?>">
  </div>
  <div class="form-group">
  <label class="float-md-center" for="parcel_number">Parcel Number</label>
  <input class="form-control" type="text" id="parcel_number" name="parcel_number" value="<?=$arr['parcel_no']?>">
  </div>
  <div class="form-group">
  <label class="float-md-center" for="ward_number">Ward Number</label>
  <input class="form-control" type="text" id="ward_number" name="ward_number" value="<?=$arr['ward_no']?>">
  </div>
  <div class="form-group">
  <label class="float-md-center" for="land_use">Land Use</label>
  <input class="form-control" type="text" id="land_use" name="land_use" value="<?=$arr['land_use']?>">
  </div>
  <button type="submit" class="btn btn-success" name="delete" id="delete">Submit</button>
  </form>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script>

//JavaScript Code

function validateForm(){
  //Form Validation
  var x, y, z, v, w;
  x = document.forms["form"]["parcel_id"].value;
  y = document.forms["form"]["block_no"].value;
  z = document.forms["form"]["parcel_no"].value;
  w = document.forms["form"]["ward_no"].value;
  v = document.forms["form"]["land_use"].value;

  //Validates that all Form fields are completed
  if(x == "" || y == "" || z == "" || w == "" || z == "" || v == ""){
    alert("Please fill out all form fields");
    return false;
  }

  //Validates that the block, parcel, and ward numbers are integers
  //Parcel ID
  if(isNaN(x)){
    alert("Please enter a number in the Parcel ID field");
    return false;
  }
  //Block Number
  if(isNaN(y)){
    alert("Please enter a number in the Block Number field");
    return false;
  }
  //Parcel Number
  if(isNaN(z)){
    alert("Please enter a number in the Parcel Number field");
    return false;
  }
  //Ward Number
  if(isNaN(w)){
   alert("Please enter a number in the Ward Number field");
   return false;
  }
}

//JQuery Code

$("#parcel_id").on("click", function(){
  alert("Please provide the Parcel ID number!");
});

//Form Submission Event
</script>
</body>
</html>
