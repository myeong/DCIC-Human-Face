<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="main_php.css">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

  <!-- DataTables CSS -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

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

</head>
<body>
  <header>
    <h1>DCIC: Human Face of big Data</h1>
    <p1 class="h6">Utilize this search page to find parcel specific information within the DCIC: Human Face of Big Data relational database system.</p1>
  </header>

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
      <form class="form-group col" method="post" name="edit">
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
      <button class="btn btn-dark"
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
  <table class="table table-light table-hover table-striped table-bordered table-responsive-md" id="table">
    <thead class="thead-dark">
      <tr>
        <th scope="col" class="pr-md-3 pr-5 text-center">
          <input class="form-check-input" type="checkbox">
          <label class="form-check-label" for = "checkbox"></label>
        </th>
        <th class="text-center">Parcel ID <button class="btn btn-link"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Block Number <button class="btn btn-link"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Parcel Number <button class="btn btn-link"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Ward Number <button class="btn btn-link"><i class="fas fa-sort"></i></button></th>
        <th scope="col" class="text-center">Land Use <button class="btn btn-link"><i class="fas fa-sort"></i></button></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach($row as $rows){ ?>
      <tr>
        <td class="pr-md-3 pr-5 text-center">
          <input data-placement = "top" class="form-check-input" type="checkbox">
          <label class="form-check-label" for = "checkbox"></label>
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

<div class="float-md-right" ng-app="todos">
<div ng-controller="pagination">
  <pagination ng-model="currentPage"
      total-items="todos.length"
      max-size="maxSize"
      boundary-links="true">
  </pagination>
</div>
</div>
<!--
<div class="float-md-right paginated-table" id="paginated-table" ng-controller="pagination">
  <pagination id="pag" total-items="87">
    <ul class="pagination" id="pagination">

      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo</span>
          <span class="sr-only">Previous</span>
        </a></li>

      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>

      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </pagination>
</div> -->

<div class="card col-sm-3" id="postgres">
<?php echo "There are " . $num . " rows in the " . pg_dbname() . " parcels table"; ?>
</div>

<footer>
  <p>DCIC Human Face of Big Data</p>
</footer>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<!-- W3.JS JavaScript -->
<script src="https://www.w3schools.com/lib/w3.js"></script>

<!-- Angular JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>



<script>
  //Javascript Code

  //JavaScript & jQuery Table Pagination, Sort, & Filter
  window.onerror = function (msg, url, line) {
                 alert("An error occurred.");
                 alert("Message: " + msg);
                 alert("url" + url);
                 alert("line number" + line);
              }

  function pagination(){
    $("table").each(function(){
      //Variables
      var page = 0;
      var numpage = 10;
      var $pagi = $(this);
      $pagi.bind('repaginate', function(){
        $pagi.find('tbody tr').hide().slice(page * numpage, (page + 1) * numpage).show();
      });
      $pagi.trigger('repaginate');
      var numrows = $pagi.find('tbody tr').length;
      var numpages = Math.ceil(numrows/numpage);
      var $pager = $('<div class = "pager"></div>');
      for(var curpage = 0; curpage < numpages; curpage++){
        $('<span class = "page-number"></span>').text(curpage + 1).bind('click',
        {newPage: curpage},
        function(event) {
          page = event.data['newPage'];
          $pagi.trigger('repaginate');
          $(this).addClass('active').siblings().removeClass('active');
        }).appendTo($pager).addClass('clickable');
      }
      $pager.insertBefore($pagi).find('span.page-number:first').addClass('active');
    });
    //$("#pag a:first").addClass('active');
  }

  /*function sort(table_id, sortColumn){
    var tableData = document.getElementById('table').getElementsByTagName('tbody').item(0);
      var rowData = tableData.getElementsByTagName('tr');
      for(var i = 0; i < rowData.length - 1; i++){
          for(var j = 0; j < rowData.length - (i + 1); j++){
              if(Number(rowData.item(j).getElementsByTagName('td').item(sortColumn).innerHTML.replace(/[^0-9\.]+/g, "")) < Number(rowData.item(j+1).getElementsByTagName('td').item(sortColumn).innerHTML.replace(/[^0-9\.]+/g, ""))){
                  tableData.insertBefore(rowData.item(j+1),rowData.item(j));
              }
          }
      }
}*/

  //Search filter
  function filter(){
    var input, filter, table, tr, td, x, q;
      input = document.getElementById("input");
      filter = input.value;
      table = document.getElementById("table");
      tr = table.getElementsByTagName("tr");
      //Loop through all the table rows, and hide those that do not match the search query
      for(x = 0; x < tr.length; x++){
        f = tr[x].getElementsByTagName("td")[5]; //Table filter
        if(f){
          if(f.innerHTML.indexOf(filter) > -1){
            tr[x].style.display = "";
          }
          else{
            tr[x].style.display = "none";
          }
        }
        }
      }

  //Refreshes the webpage
  function refresh(){
    location.reload(); //Pagination refresh button onclick function
  } //Not intended to be loaded when the document object model is ready.

  //jQuery Code

  //Bootstrap Popover
  $(function () {
    $('[data-toggle="popover"]').popover();
  });

  $(document).ready(function(){
    //$('#table').DataTable(); //Initialize Datatable
    pagination();
    //sort('table', 3);
    filter();
  }); //Waits until DOM elements are loaded and ready to execute

  //User Interface functions

  // Show/Hide Button Function
  $('#table-pagi').click(function(){
    $("table").toggle();
  });
  //Show/Hide Pagination Function
  $('#pagi').on("click", function(){
    $('#pagination').toggle();
    $('#postgres').toggle();
  });
  //Angular JS pagination
  var todos = angular.module('todos', ['ui.bootstrap']);

todos.controller('pagination', function($scope) {
   $scope.filteredTodos = []
  ,$scope.currentPage = 1
  ,$scope.numPerPage = 10
  ,$scope.maxSize = 5;

  $scope.makeTodos = function() {
    $scope.todos = [];
    for (i=1;i<=1000;i++) {
      $scope.todos.push({ text:'todo '+i, done:false});
    }
  };
  $scope.makeTodos();

  $scope.$watch('currentPage + numPerPage', function() {
    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
    , end = begin + $scope.numPerPage;

    $scope.filteredTodos = $scope.todos.slice(begin, end);
  });
});

</script>
</body>
</html>
