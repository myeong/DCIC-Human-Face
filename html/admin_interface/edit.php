<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="stylesheet" href="main_php.css">
	<link rel="stylesheet" href="auto_complete_form.css">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

	<style>
		input {
			text-align: center;
		}
	</style>

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

	$p_id = $_GET["pid"];
	$query = "SELECT block_no, parcel_no
				FROM humanface.parcels
				WHERE parcel_id = '" . $p_id . "';";
	$result = pg_query($connect, $query);
	$parcel_block_nums = pg_fetch_all($result);

	$parcel_num = $parcel_block_nums[0]['parcel_no'];
	$block_num = $parcel_block_nums[0]['block_no'];

	//Query for parcel information
	// $query = "SELECT p.parcel_id, p.block_no, p.parcel_no, p.ward_no, p.land_use, 
	// 			a.id as \"address_id\", a.st_num ,a.st_name
	// 		FROM humanface.parcels p
	// 			JOIN humanface.addresses a on p.parcel_id = a.parcel_id
	// 		WHERE parcel_no = '" . $parcel_num . "' AND block_no = '" . $block_num . "';";

	$query = "SELECT p.parcel_id, p.block_no, p.parcel_no, p.ward_no, p.land_use
			FROM humanface.parcels p
			WHERE parcel_no = '" . $parcel_num . "' AND block_no = '" . $block_num . "';";

	$result = pg_query($connect, $query);
	$parcel_info = pg_fetch_all($result);

	$query = "SELECT a.id as \"address_id\", a.st_num, a.st_name
			FROM humanface.parcels p
				JOIN humanface.addresses a on p.parcel_id = a.parcel_id
				WHERE parcel_no = '" . $parcel_num . "' AND block_no = '" . $block_num . "';";

	$result = pg_query($connect, $query);
	$address_info = pg_fetch_all($result);

	$query = "SELECT e.event_id, e.response, e.extra_information, e.date, e.price, 
					et.id as event_type_id, et.type, epa.role,
					peo.person_id, peo.name
			FROM humanface.parcels p
            	JOIN humanface.events e on p.parcel_id = e.parcel_id
                JOIN humanface.event_types et on e.type = et.id
                JOIN humanface.event_people_assoc epa on e.event_id = epa.event_id
                JOIN humanface.people peo on epa.person_id = peo.person_id
			WHERE p.parcel_id = (SELECT parcel_id FROM humanface.parcels WHERE parcel_no = '" . $parcel_num . "' AND block_no = '" . $block_num . "');";

	$result = pg_query($connect, $query);
	$event_info = pg_fetch_all($result);

	# Extracting properties
	$parcel_cols = array_keys($parcel_info[0]);
	$address_cols = array_keys($address_info[0]);
	$event_cols = array_keys($event_info[0]);

	// echo "<pre>";
	// print_r($parcel_info);
	// echo "</pre>";

	// echo "<pre>";
	// print_r($address_info);
	// echo "</pre>";

	// echo "<pre>";
	// print_r($event_info);
	// echo "</pre>";	
	?>

</head>
<body>
	<header>
	<h1>DCIC: Human Face of big Data</h1>
	<p1>Utilize this search page to find parcel specific information within the DCIC: Human Face of Big Data relational database system.</p1>
	</header>


	<div class="container lg-font col-md-12">
		<form id="edit_form" class="form-horizontal" style="border:0px dotted black;" action="/input/42185" method="post">
			<div class="col-md-12" role="titlebar" id="titlebar">
	      		<div class="section-title"><h3>Parcel Information</h3></div>
	    	</div>
      		<div class="form-group col-md-3">
      			<!--Iterate the parcel_info array -->
      			<?php foreach ($parcel_info[0] as $key => $value) { if ($key == 'parcel_id') { continue;}?>
  					<label for="<?php echo $key?>"><?php echo $key;?><small class="required">*</small></label>
        			<input type="text" class="form-control" for="<?php echo $key;?>" parcel_id=<?php echo $parcel_info[0]['parcel_id'];?> value = "<?php echo $value;?>" required minlength="1">
	        	<?php } for ($i=0; $i<sizeof($address_info); $i++) { foreach($address_info[$i] as $key => $value) { if ($key == 'address_id') {continue;}?>
	        		<label for="<?php echo $key?>"><?php echo $key;?><small class="required">*</small></label>
        			<input type="text" class="form-control" for="<?php echo $key;?>" address_id=<?php echo $address_info[$i]['address_id'];?> value = "<?php echo trim($value);?>" required minlength="1">
	        	<?php }} ?>
    		</div>    
			<div class="col-md-12" role="titlebar"  id="titlebar">
	      		<div class="section-title"><h3> </h3></div>
	    	</div>
	    	<?php for ($i=0; $i<sizeof($event_info); $i++) {
	    		foreach($event_info[$i] as $key => $value) {
	    			if ($key == 'address_id') {
	    				continue;
	    			} elseif ($key == 'name') { ?>
	    				<div class="col-md-12" role="events"  id="role-events">
	    					<label for="<?php echo $key?>"><?php echo $key;?><small class="required">*</small></label>
	    					<form autocomplete="off" action="/action_page.php">
							  <div class="autocomplete" style="width:300px;">
							    <input class="namecell" type="text" person_id="<?php echo $event_info[$i]['person_id'];?>" value="<?php echo trim($value);?>">
							  </div>
							</form>
		                </div>
		          	<?php } else { ?>
		        <div class="col-md-12" role="events"  id="role-events">
		        	<label for="<?php echo $key?>"><?php echo $key;?><small class="required">*</small></label>
        			<input type="text" class="form-control" for="<?php echo $key;?>" id= 
        			"<?php switch($key) { 
        				case 'response' || 'extra_information' || 'data' || 'price': 
        					echo 'event_id' . ' ' . $event_info[$i]['event_id'];
        					break;
        				case 'type' || 'role':
        					echo 'event_type_id' . ' ' . $event_info[$i]['event_type_id'];
        					break;
        				case 'name':
        					echo 'person_id' . ' ' . $event_info[$i]['person_id'];
        					break;
        				}?>" value = "<?php echo trim($value);?>" required minlength="1">
	        	</div>
			<?php }}} ?>

	        <div class="col-md-12" role="submit-titlebar"  id="role-submit-titlebar">
	            <div class="section-title"><h3>Submit this Entry</h3></div>
	        </div>
	        <div class="col-md-12">    
	            <button class="btn btn-primary" id="btnSubmit" type="submit" name="submit" value="submit">SUBMIT</button>
	        </div>

	        <div class="col-md-12 form-footer">            
	        </div>
	    </form>
	    <div class="col-md-12">
	    	<div class="required"> * Required</div>
	    </div>
	</div>

	<br><br>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script>
function validateForm(){
	var x;
	x = document.forms["form"]["search"].value;
	if(x == ""){
		alert("Input not valid");
		return false;
	}
}

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

<?php
# Storing all names
$query = "SELECT name FROM humanface.people;";
$result = pg_query($connect, $query);
$names = pg_fetch_all($result);

# process names
foreach ($names as $key => $value) {
    foreach ($value as $v) {
        $n[] = trim($v);
    }
}
?>;
// ajax call
var names = <?php echo '["' . implode('", "', array_unique($n)) . '"]' ?>;

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
var name_cells = document.getElementsByClassName("namecell");
for (var i=0; i<name_cells.length; i++) {
	autocomplete(name_cells[i], names);
}

//funtion filter(){
//Declare variables
/*var input, table, filter tr, td, x;
input = document.getElementById("input");
filter = input.value.toString();
table = document.getElementById("table");
tr = document.getElementsByTagName("tr");
//Filter Table
for(x = 0; x < tr.length(); x++){
  td = tr[x].getElementsByTagName("td")[0];
  if(td){
    if(td.innerHTML.toString().indexOf(filter) > -1){
      tr[x].style.display = "";
    }
    else{
      tr[x].style.display = "none";
    }
  }
}
}*/
  //jQuery
  //Bootstrap Popover
	$(function () {
		$('[data-toggle="popover"]').popover()
	})

</script>

</body>
</html>