<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

  <!-- Icons8 -->
  <a href="https://icons8.com"></a>

  <!-- CSS -->
  <link rel="stylesheet" href="css/parcels.css" type="text/css">

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
   /*echo "<div class='alert alert-success' role='alert'>";
   print "Successfully connected to database:" . " " . pg_dbname() . " on " . pg_host();
   echo "</div>";*/
  }

  //Querying Parcels Table Information
  $query = 'SELECT * FROM humanface.parcels';
  $par = pg_query($connect, $query);
  $row = pg_fetch_all($par);
  $num = pg_num_rows($par);

  //Obtain Parcel ID when user selects Edit button in table
  /*if($_GET['pid']){
    $x = "SELECT * FROM humanface.parcels WHERE parcel_id = " . $_GET['pid'];
    $p = pg_query($connect, $x);
    $prow = pg_fetch_assoc($p);
  }*/
  ?>

</head>
<body>
  <div id="section-header">
  <img src="../images/LOGO.png" alt="DCIC Logo">
  </div>

<!-- Bootstrap Table Button Groups-->

    <div class="form-row float-md-left" id="toolbar">
      <form class="form-group col" method="post" action="delete.php" name="delete">
      <button class="btn btn-danger my-2 my-sm-0" name="delete" type="submit" value="submit"
      data-toggle="popover"
      title="Delete an Existing Record"
      data-trigger="hover"
      data-placement="bottom"
      data-content="Selecting this button will delete an existing record in the Humanface of Big Data Relational Database">
        <i class="fas fa-trash-alt"></i>
        Delete
      </button>
    </form>
      <form class="form-group col" method="post" name="edit" action="edit.php">
      <button type="button" class="btn btn-primary my-2 my-sm-0"
      data-toggle="popover"
      title="Edit an Existing Record"
      data-trigger="hover"
      data-placement="bottom"
      data-content="Selecting this button will update an existing record in the Humanface of Big Data Relational Database">
        <i class="fas fa-edit"></i>
        Edit
      </button>
      </form>
      <form class="form-group col" action="insert.php" method="post" name="add">
      <button class="btn btn-success my-2 my-sm-0 octicon-diff-added" type="submit" value="submit"
      data-toggle="popover"
      title="Add New Record"
      data-trigger="hover"
      data-placement="bottom"
      data-content="Selecting this button will add a new record to the Humanface of Big Data Relational Database">
        <i class="fas fa-plus"></i>
          Add
        </button>
      </form>
      <form class="form-group col">
        <button type="button" class="btn btn-info"
        data-toggle="popover"
        title="Human Face of Big Data Parcel Table Information"
        data-trigger="click"
        data-placement="right"
        data-content="Welcome, this page displays the current Human Face of Big Data Parcel Table">
      <i class="fas fa-info-circle"></i>
        Info
    </button>
    </form>
    </div>

      <!-- Search Bar -->

      <div class="float-md-right">
      <form class = "form-inline" name = "form" method="post" action="search.php" onsubmit="return validateForm()">
          <input class="form-control mr-sm-2 float-md-right" type="search" placeholder="Search" name = "search" id="input" onkeyup="filter()">
          <button class="btn btn-outline-success my-2 my-sm-0" type = "submit" name = "submit" value = "submit"
          data-toggle="popover"
          title="Submit"
          data-placement="top"
          data-content="Select this button to query existing parcel data."
          data-trigger="hover" >
        <i class="fas fa-search"></i>
          Search
      </button>
      </form>
      </div>

      <!-- Pagination Bar Button Group -->

      <div align="center" class="btn-group col-4 float-md-right">
        <button type="button" class="btn btn-dark" id="pagi"
        data-toggle="popover"
        data-trigger="hover"
        data-content="hide/show pagination"
        data-placement="bottom">
        <i class="fas fa-minus-square"></i>
      </button>
        <button type="button" class="btn btn-dark" id="table-pagi"
        data-toggle="popover"
        data-trigger="hover"
        data-content="hide/show table"
        data-placement="bottom">
        <i class="fas fa-table"></i>
      </button>
      <button class="btn btn-dark" onclick="sort()"
        data-toggle="popover"
        data-trigger="hover"
        data-content="sort table"
        data-placement="bottom">
        <i class="fas fa-sort"></i>
      </button>
        <button type="button" class="btn btn-dark" onclick="refresh()"
          data-toggle="popover"
          data-trigger="hover"
          data-content="refresh"
          data-placement="bottom">
          <i class="fas fa-sync-alt"></i>
        </button>
        <button class="btn btn-dark"
          data-toggle="popover"
          data-trigger="hover"
          data-content="table columns"
          data-placement="bottom">
          <i class="fas fa-th"></i></button>
      </div>

  <br><br>
<!-- Bootstrap Table-->
  <table class="table table-light table-hover table-bordered table-responsive-md" id="table">
    <thead class="thead-light">
      <tr>
        <!-- <th scope="col" class="pr-md-3 pr-5 text-center">
          <input class="form-check-input" type="checkbox">
          <label class="form-check-label" for = "checkbox"></label>
        </th> -->
        <th scope="col" class="text-center"></th>
        <th class="text-center">Parcel ID <button class="btn btn-link" onclick="sort()"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Block Number <button class="btn btn-link" onclick="sort()"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Parcel Number <button class="btn btn-link" onclick="sort()"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Ward Number <button class="btn btn-link" onclick="sort()"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Land Use <button class="btn btn-link" onclick="sort()"><i class="fas fa-sort"></i></button></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($row as $rows){ ?>
      <tr>
        <td class="pr-md-3 pr-5 text-center">
          <a href="edit.php?pid=<?=$rows['parcel_id']?>"><button class="btn btn-primary"><i class="fas fa-edit"></i></button></a>
        </td>
        <td class="text-center"><?php echo $rows['parcel_id'] . "\n"; ?></td>
        <td class="text-center"><?php echo $rows['block_no'] . "\n"; ?></td>
        <td class="text-center"><?php echo $rows['parcel_no'] . "\n"; ?></td>
        <td class="text-center"><?php echo $rows['ward_no'] . "\n"; ?></td>
        <td class="text-center"><?php echo $rows['land_use'] . "\n"; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>

<!-- Bootstrap Table Pagination-->

<div class="float-md-right paginated-table" id="pagination">
    <pagination class="pagination">
    <ul class="pagination">
      <!-- Left Arrow -->
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo</span>
          <span class="sr-only">Previous</span>
        </a></li>
        <!-- Page Numbers -->
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
      <!-- Right Arrow -->
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
    </pagination>
    </div>
<div class="card col-sm-3" id="postgres">
<?php echo "There are " . $num . " rows in the " . pg_dbname() . " parcels table"; ?>
</div>
<br><br><br><br>

<!-- Footer -->

<footer>
  <div class="page-footer">
    <a href="https://dcic.umd.edu"><img src="https://img.icons8.com/ios/50/000000/internet-filled.png"></a>
    <a href="https://github.com/myeong/DCIC-Human-Face"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IgogICAgIHdpZHRoPSI1MCIgaGVpZ2h0PSI1MCIKICAgICB2aWV3Qm94PSIwIDAgNTAgNTAiCiAgICAgc3R5bGU9ImZpbGw6IzAwMDAwMDsiPiAgICA8cGF0aCBkPSJNMTcuNzkxLDQ2LjgzNkMxOC41MDIsNDYuNTMsMTksNDUuODIzLDE5LDQ1di01LjRjMC0wLjE5NywwLjAxNi0wLjQwMiwwLjA0MS0wLjYxQzE5LjAyNywzOC45OTQsMTkuMDE0LDM4Ljk5NywxOSwzOSBjMCwwLTMsMC0zLjYsMGMtMS41LDAtMi44LTAuNi0zLjQtMS44Yy0wLjctMS4zLTEtMy41LTIuOC00LjdDOC45LDMyLjMsOS4xLDMyLDkuNywzMmMwLjYsMC4xLDEuOSwwLjksMi43LDJjMC45LDEuMSwxLjgsMiwzLjQsMiBjMi40ODcsMCwzLjgyLTAuMTI1LDQuNjIyLTAuNTU1QzIxLjM1NiwzNC4wNTYsMjIuNjQ5LDMzLDI0LDMzdi0wLjAyNWMtNS42NjgtMC4xODItOS4yODktMi4wNjYtMTAuOTc1LTQuOTc1IGMtMy42NjUsMC4wNDItNi44NTYsMC40MDUtOC42NzcsMC43MDdjLTAuMDU4LTAuMzI3LTAuMTA4LTAuNjU2LTAuMTUxLTAuOTg3YzEuNzk3LTAuMjk2LDQuODQzLTAuNjQ3LDguMzQ1LTAuNzE0IGMtMC4xMTItMC4yNzYtMC4yMDktMC41NTktMC4yOTEtMC44NDljLTMuNTExLTAuMTc4LTYuNTQxLTAuMDM5LTguMTg3LDAuMDk3Yy0wLjAyLTAuMzMyLTAuMDQ3LTAuNjYzLTAuMDUxLTAuOTk5IGMxLjY0OS0wLjEzNSw0LjU5Ny0wLjI3LDguMDE4LTAuMTExYy0wLjA3OS0wLjUtMC4xMy0xLjAxMS0wLjEzLTEuNTQzYzAtMS43LDAuNi0zLjUsMS43LTVjLTAuNS0xLjctMS4yLTUuMywwLjItNi42IGMyLjcsMCw0LjYsMS4zLDUuNSwyLjFDMjEsMTMuNCwyMi45LDEzLDI1LDEzczQsMC40LDUuNiwxLjFjMC45LTAuOCwyLjgtMi4xLDUuNS0yLjFjMS41LDEuNCwwLjcsNSwwLjIsNi42YzEuMSwxLjUsMS43LDMuMiwxLjYsNSBjMCwwLjQ4NC0wLjA0NSwwLjk1MS0wLjExLDEuNDA5YzMuNDk5LTAuMTcyLDYuNTI3LTAuMDM0LDguMjA0LDAuMTAyYy0wLjAwMiwwLjMzNy0wLjAzMywwLjY2Ni0wLjA1MSwwLjk5OSBjLTEuNjcxLTAuMTM4LTQuNzc1LTAuMjgtOC4zNTktMC4wODljLTAuMDg5LDAuMzM2LTAuMTk3LDAuNjYzLTAuMzI1LDAuOThjMy41NDYsMC4wNDYsNi42NjUsMC4zODksOC41NDgsMC42ODkgYy0wLjA0MywwLjMzMi0wLjA5MywwLjY2MS0wLjE1MSwwLjk4N2MtMS45MTItMC4zMDYtNS4xNzEtMC42NjQtOC44NzktMC42ODJDMzUuMTEyLDMwLjg3MywzMS41NTcsMzIuNzUsMjYsMzIuOTY5VjMzIGMyLjYsMCw1LDMuOSw1LDYuNlY0NWMwLDAuODIzLDAuNDk4LDEuNTMsMS4yMDksMS44MzZDNDEuMzcsNDMuODA0LDQ4LDM1LjE2NCw0OCwyNUM0OCwxMi4zMTgsMzcuNjgzLDIsMjUsMlMyLDEyLjMxOCwyLDI1IEMyLDM1LjE2NCw4LjYzLDQzLjgwNCwxNy43OTEsNDYuODM2eiI+PC9wYXRoPjwvc3ZnPg==">
    </a>
  </div>
  <div class="footer-section">
  </div>
</footer>

<!-- Footer -->
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<!-- Javascript File -->
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
