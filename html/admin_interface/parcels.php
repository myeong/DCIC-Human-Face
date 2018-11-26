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
    <p>Visit us!</p>
    <a href="https://dcic.umd.edu"><img src="https://img.icons8.com/ios/50/000000/internet-filled.png"></a>
    <a href="https://github.com/myeong/DCIC-Human-Face"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IgogICAgIHdpZHRoPSI1MCIgaGVpZ2h0PSI1MCIKICAgICB2aWV3Qm94PSIwIDAgNTAgNTAiCiAgICAgc3R5bGU9ImZpbGw6IzAwMDAwMDsiPiAgICA8cGF0aCBkPSJNMTcuNzkxLDQ2LjgzNkMxOC41MDIsNDYuNTMsMTksNDUuODIzLDE5LDQ1di01LjRjMC0wLjE5NywwLjAxNi0wLjQwMiwwLjA0MS0wLjYxQzE5LjAyNywzOC45OTQsMTkuMDE0LDM4Ljk5NywxOSwzOSBjMCwwLTMsMC0zLjYsMGMtMS41LDAtMi44LTAuNi0zLjQtMS44Yy0wLjctMS4zLTEtMy41LTIuOC00LjdDOC45LDMyLjMsOS4xLDMyLDkuNywzMmMwLjYsMC4xLDEuOSwwLjksMi43LDJjMC45LDEuMSwxLjgsMiwzLjQsMiBjMi40ODcsMCwzLjgyLTAuMTI1LDQuNjIyLTAuNTU1QzIxLjM1NiwzNC4wNTYsMjIuNjQ5LDMzLDI0LDMzdi0wLjAyNWMtNS42NjgtMC4xODItOS4yODktMi4wNjYtMTAuOTc1LTQuOTc1IGMtMy42NjUsMC4wNDItNi44NTYsMC40MDUtOC42NzcsMC43MDdjLTAuMDU4LTAuMzI3LTAuMTA4LTAuNjU2LTAuMTUxLTAuOTg3YzEuNzk3LTAuMjk2LDQuODQzLTAuNjQ3LDguMzQ1LTAuNzE0IGMtMC4xMTItMC4yNzYtMC4yMDktMC41NTktMC4yOTEtMC44NDljLTMuNTExLTAuMTc4LTYuNTQxLTAuMDM5LTguMTg3LDAuMDk3Yy0wLjAyLTAuMzMyLTAuMDQ3LTAuNjYzLTAuMDUxLTAuOTk5IGMxLjY0OS0wLjEzNSw0LjU5Ny0wLjI3LDguMDE4LTAuMTExYy0wLjA3OS0wLjUtMC4xMy0xLjAxMS0wLjEzLTEuNTQzYzAtMS43LDAuNi0zLjUsMS43LTVjLTAuNS0xLjctMS4yLTUuMywwLjItNi42IGMyLjcsMCw0LjYsMS4zLDUuNSwyLjFDMjEsMTMuNCwyMi45LDEzLDI1LDEzczQsMC40LDUuNiwxLjFjMC45LTAuOCwyLjgtMi4xLDUuNS0yLjFjMS41LDEuNCwwLjcsNSwwLjIsNi42YzEuMSwxLjUsMS43LDMuMiwxLjYsNSBjMCwwLjQ4NC0wLjA0NSwwLjk1MS0wLjExLDEuNDA5YzMuNDk5LTAuMTcyLDYuNTI3LTAuMDM0LDguMjA0LDAuMTAyYy0wLjAwMiwwLjMzNy0wLjAzMywwLjY2Ni0wLjA1MSwwLjk5OSBjLTEuNjcxLTAuMTM4LTQuNzc1LTAuMjgtOC4zNTktMC4wODljLTAuMDg5LDAuMzM2LTAuMTk3LDAuNjYzLTAuMzI1LDAuOThjMy41NDYsMC4wNDYsNi42NjUsMC4zODksOC41NDgsMC42ODkgYy0wLjA0MywwLjMzMi0wLjA5MywwLjY2MS0wLjE1MSwwLjk4N2MtMS45MTItMC4zMDYtNS4xNzEtMC42NjQtOC44NzktMC42ODJDMzUuMTEyLDMwLjg3MywzMS41NTcsMzIuNzUsMjYsMzIuOTY5VjMzIGMyLjYsMCw1LDMuOSw1LDYuNlY0NWMwLDAuODIzLDAuNDk4LDEuNTMsMS4yMDksMS44MzZDNDEuMzcsNDMuODA0LDQ4LDM1LjE2NCw0OCwyNUM0OCwxMi4zMTgsMzcuNjgzLDIsMjUsMlMyLDEyLjMxOCwyLDI1IEMyLDM1LjE2NCw4LjYzLDQzLjgwNCwxNy43OTEsNDYuODM2eiI+PC9wYXRoPjwvc3ZnPg==">
    </a>
    <a href="https://twitter.com/umdDCIC"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IgogICAgIHdpZHRoPSI1MCIgaGVpZ2h0PSI1MCIKICAgICB2aWV3Qm94PSIwIDAgNTAgNTAiCiAgICAgc3R5bGU9ImZpbGw6IzAwMDAwMDsiPjxnIGlkPSJzdXJmYWNlMSI+PHBhdGggc3R5bGU9IiAiIGQ9Ik0gMzQuMjE4NzUgNS40Njg3NSBDIDI4LjIzODI4MSA1LjQ2ODc1IDIzLjM3NSAxMC4zMzIwMzEgMjMuMzc1IDE2LjMxMjUgQyAyMy4zNzUgMTYuNjcxODc1IDIzLjQ2NDg0NCAxNy4wMjM0MzggMjMuNSAxNy4zNzUgQyAxNi4xMDU0NjkgMTYuNjY3OTY5IDkuNTY2NDA2IDEzLjEwNTQ2OSA1LjEyNSA3LjY1NjI1IEMgNC45MTc5NjkgNy4zOTQ1MzEgNC41OTc2NTYgNy4yNTM5MDYgNC4yNjE3MTkgNy4yNzczNDQgQyAzLjkyOTY4OCA3LjMwMDc4MSAzLjYzMjgxMyA3LjQ5MjE4OCAzLjQ2ODc1IDcuNzgxMjUgQyAyLjUzNTE1NiA5LjM4NjcxOSAyIDExLjIzNDM3NSAyIDEzLjIxODc1IEMgMiAxNS42MjEwOTQgMi44NTkzNzUgMTcuODIwMzEzIDQuMTg3NSAxOS42MjUgQyAzLjkyOTY4OCAxOS41MTE3MTkgMy42NDg0MzggMTkuNDQ5MjE5IDMuNDA2MjUgMTkuMzEyNSBDIDMuMDk3NjU2IDE5LjE0ODQzOCAyLjcyNjU2MyAxOS4xNTYyNSAyLjQyNTc4MSAxOS4zMzU5MzggQyAyLjEyNSAxOS41MTU2MjUgMS45NDE0MDYgMTkuODM5ODQ0IDEuOTM3NSAyMC4xODc1IEwgMS45Mzc1IDIwLjMxMjUgQyAxLjkzNzUgMjMuOTk2MDk0IDMuODQzNzUgMjcuMTk1MzEzIDYuNjU2MjUgMjkuMTU2MjUgQyA2LjYyNSAyOS4xNTIzNDQgNi41OTM3NSAyOS4xNjQwNjMgNi41NjI1IDI5LjE1NjI1IEMgNi4yMTg3NSAyOS4wOTc2NTYgNS44NzEwOTQgMjkuMjE4NzUgNS42NDA2MjUgMjkuNDgwNDY5IEMgNS40MTAxNTYgMjkuNzQyMTg4IDUuMzM1OTM4IDMwLjEwNTQ2OSA1LjQzNzUgMzAuNDM3NSBDIDYuNTU0Njg4IDMzLjkxMDE1NiA5LjQwNjI1IDM2LjU2MjUgMTIuOTM3NSAzNy41MzEyNSBDIDEwLjEyNSAzOS4yMDMxMjUgNi44NjMyODEgNDAuMTg3NSAzLjM0Mzc1IDQwLjE4NzUgQyAyLjU4MjAzMSA0MC4xODc1IDEuODUxNTYzIDQwLjE0ODQzOCAxLjEyNSA0MC4wNjI1IEMgMC42NTYyNSA0MCAwLjIwNzAzMSA0MC4yNzM0MzggMC4wNTA3ODEzIDQwLjcxODc1IEMgLTAuMTA5Mzc1IDQxLjE2NDA2MyAwLjA2NjQwNjMgNDEuNjYwMTU2IDAuNDY4NzUgNDEuOTA2MjUgQyA0Ljk4MDQ2OSA0NC44MDA3ODEgMTAuMzM1OTM4IDQ2LjUgMTYuMDkzNzUgNDYuNSBDIDI1LjQyNTc4MSA0Ni41IDMyLjc0NjA5NCA0Mi42MDE1NjMgMzcuNjU2MjUgMzcuMDMxMjUgQyA0Mi41NjY0MDYgMzEuNDYwOTM4IDQ1LjEyNSAyNC4yMjY1NjMgNDUuMTI1IDE3LjQ2ODc1IEMgNDUuMTI1IDE3LjE4MzU5NCA0NS4xMDE1NjMgMTYuOTA2MjUgNDUuMDkzNzUgMTYuNjI1IEMgNDYuOTI1NzgxIDE1LjIyMjY1NiA0OC41NjI1IDEzLjU3ODEyNSA0OS44NDM3NSAxMS42NTYyNSBDIDUwLjA5NzY1NiAxMS4yODUxNTYgNTAuMDcwMzEzIDEwLjc4OTA2MyA0OS43NzczNDQgMTAuNDQ1MzEzIEMgNDkuNDg4MjgxIDEwLjEwMTU2MyA0OSA5Ljk5NjA5NCA0OC41OTM3NSAxMC4xODc1IEMgNDguMDc4MTI1IDEwLjQxNzk2OSA0Ny40NzY1NjMgMTAuNDQxNDA2IDQ2LjkzNzUgMTAuNjI1IEMgNDcuNjQ4NDM4IDkuNjc1NzgxIDQ4LjI1NzgxMyA4LjY1MjM0NCA0OC42MjUgNy41IEMgNDguNzUgNy4xMDU0NjkgNDguNjEzMjgxIDYuNjcxODc1IDQ4LjI4OTA2MyA2LjQxNDA2MyBDIDQ3Ljk2NDg0NCA2LjE2MDE1NiA0Ny41MTE3MTkgNi4xMjg5MDYgNDcuMTU2MjUgNi4zNDM3NSBDIDQ1LjQ0OTIxOSA3LjM1NTQ2OSA0My41NTg1OTQgOC4wNjY0MDYgNDEuNTYyNSA4LjUgQyAzOS42MjUgNi42ODc1IDM3LjA3NDIxOSA1LjQ2ODc1IDM0LjIxODc1IDUuNDY4NzUgWiBNIDM0LjIxODc1IDcuNDY4NzUgQyAzNi43Njk1MzEgNy40Njg3NSAzOS4wNzQyMTkgOC41NTg1OTQgNDAuNjg3NSAxMC4yODEyNSBDIDQwLjkyOTY4OCAxMC41MzEyNSA0MS4yODUxNTYgMTAuNjM2NzE5IDQxLjYyNSAxMC41NjI1IEMgNDIuOTI5Njg4IDEwLjMwNDY4OCA0NC4xNjc5NjkgOS45MjU3ODEgNDUuMzc1IDkuNDM3NSBDIDQ0LjY3OTY4OCAxMC4zNzUgNDMuODIwMzEzIDExLjE3NTc4MSA0Mi44MTI1IDExLjc4MTI1IEMgNDIuMzU1NDY5IDEyLjAwMzkwNiA0Mi4xNDA2MjUgMTIuNTMxMjUgNDIuMzA4NTk0IDEzLjAxMTcxOSBDIDQyLjQ3MjY1NiAxMy40ODgyODEgNDIuOTcyNjU2IDEzLjc2NTYyNSA0My40Njg3NSAxMy42NTYyNSBDIDQ0LjQ2ODc1IDEzLjUzNTE1NiA0NS4zNTkzNzUgMTMuMTI4OTA2IDQ2LjMxMjUgMTIuODc1IEMgNDUuNDU3MDMxIDEzLjgwMDc4MSA0NC41MTk1MzEgMTQuNjM2NzE5IDQzLjUgMTUuMzc1IEMgNDMuMjIyNjU2IDE1LjU3ODEyNSA0My4wNzAzMTMgMTUuOTA2MjUgNDMuMDkzNzUgMTYuMjUgQyA0My4xMDkzNzUgMTYuNjU2MjUgNDMuMTI1IDE3LjA1ODU5NCA0My4xMjUgMTcuNDY4NzUgQyA0My4xMjUgMjMuNzE4NzUgNDAuNzI2NTYzIDMwLjUwMzkwNiAzNi4xNTYyNSAzNS42ODc1IEMgMzEuNTg1OTM4IDQwLjg3MTA5NCAyNC44NzUgNDQuNSAxNi4wOTM3NSA0NC41IEMgMTIuMTA1NDY5IDQ0LjUgOC4zMzk4NDQgNDMuNjE3MTg4IDQuOTM3NSA0Mi4wNjI1IEMgOS4xNTYyNSA0MS43MzgyODEgMTMuMDQ2ODc1IDQwLjI0NjA5NCAxNi4xODc1IDM3Ljc4MTI1IEMgMTYuNTE1NjI1IDM3LjUxOTUzMSAxNi42NDQ1MzEgMzcuMDgyMDMxIDE2LjUxMTcxOSAzNi42ODM1OTQgQyAxNi4zNzg5MDYgMzYuMjg1MTU2IDE2LjAxMTcxOSAzNi4wMTE3MTkgMTUuNTkzNzUgMzYgQyAxMi4yOTY4NzUgMzUuOTQxNDA2IDkuNTM1MTU2IDM0LjAyMzQzOCA4LjA2MjUgMzEuMzEyNSBDIDguMTE3MTg4IDMxLjMxMjUgOC4xNjQwNjMgMzEuMzEyNSA4LjIxODc1IDMxLjMxMjUgQyA5LjIwNzAzMSAzMS4zMTI1IDEwLjE4MzU5NCAzMS4xODc1IDExLjA5Mzc1IDMwLjkzNzUgQyAxMS41MzEyNSAzMC44MDg1OTQgMTEuODMyMDMxIDMwLjQwMjM0NCAxMS44MTY0MDYgMjkuOTQ1MzEzIEMgMTEuODAwNzgxIDI5LjQ4ODI4MSAxMS40NzY1NjMgMjkuMDk3NjU2IDExLjAzMTI1IDI5IEMgNy40NzI2NTYgMjguMjgxMjUgNC44MDQ2ODggMjUuMzgyODEzIDQuMTg3NSAyMS43ODEyNSBDIDUuMTk1MzEzIDIyLjEyODkwNiA2LjIyNjU2MyAyMi40MDIzNDQgNy4zNDM3NSAyMi40Mzc1IEMgNy44MDA3ODEgMjIuNDY0ODQ0IDguMjE0ODQ0IDIyLjE3OTY4OCA4LjM1NTQ2OSAyMS43NDYwOTQgQyA4LjQ5NjA5NCAyMS4zMTI1IDguMzI0MjE5IDIwLjgzNTkzOCA3LjkzNzUgMjAuNTkzNzUgQyA1LjU2MjUgMTkuMDAzOTA2IDQgMTYuMjk2ODc1IDQgMTMuMjE4NzUgQyA0IDEyLjA3ODEyNSA0LjI5Njg3NSAxMS4wMzEyNSA0LjY4NzUgMTAuMDMxMjUgQyA5LjY4NzUgMTUuNTE5NTMxIDE2LjY4NzUgMTkuMTY0MDYzIDI0LjU5Mzc1IDE5LjU2MjUgQyAyNC45MDYyNSAxOS41NzgxMjUgMjUuMjEwOTM4IDE5LjQ0OTIxOSAyNS40MTQwNjMgMTkuMjEwOTM4IEMgMjUuNjE3MTg4IDE4Ljk2ODc1IDI1LjY5NTMxMyAxOC42NDg0MzggMjUuNjI1IDE4LjM0Mzc1IEMgMjUuNDcyNjU2IDE3LjY5NTMxMyAyNS4zNzUgMTcuMDA3ODEzIDI1LjM3NSAxNi4zMTI1IEMgMjUuMzc1IDExLjQxNDA2MyAyOS4zMjAzMTMgNy40Njg3NSAzNC4yMTg3NSA3LjQ2ODc1IFogIj48L3BhdGg+PC9nPjwvc3ZnPg==">
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
