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

	<title>DCIC Human Face of Big Data</title>

	<?php
	require '../credentials.inc.php';
	include 'edit_dropdown_names.php';

	ini_set('display_errors', 1);

	//Connection to PostgreSQL
	$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
	if (!$connect){
		die("Error in connection!:" . pg_last_error());
	}

	// processing the passed parcel_id
	$p_id = $_GET["pid"];

	//Query for parcel information
	$query = "SELECT p.parcel_id, p.block_no, p.parcel_no, p.ward_no, p.land_use
			FROM humanface.parcels p
			WHERE parcel_id = '" . $p_id . "';";

	$result = pg_query($connect, $query);
	$parcel_info = pg_fetch_all($result);

	$query = "SELECT a.id as \"address_id\", a.st_num, a.st_name
			FROM humanface.addresses a
				WHERE parcel_id = '" . $p_id . "';";

	$result = pg_query($connect, $query);
	$address_info = pg_fetch_all($result);

	$query = "SELECT e.event_id, e.response, e.extra_information, e.date, e.price, 
					et.id as event_type_id, et.type, epa.id as event_asso_id, epa.role,
					peo.person_id, peo.name
			FROM humanface.parcels p
            	JOIN humanface.events e on p.parcel_id = e.parcel_id
                JOIN humanface.event_types et on e.type = et.id
                JOIN humanface.event_people_assoc epa on e.event_id = epa.event_id
                JOIN humanface.people peo on epa.person_id = peo.person_id
			WHERE p.parcel_id = '" . $p_id . "';";	

	$result = pg_query($connect, $query);
	$event_info = pg_fetch_all($result);

	# Extracting properties
	// $parcel_cols = array_keys($parcel_info[0]);
	// $address_cols = array_keys($address_info[0]);	
	?>

</head>
<body>
	<header>
	<h1>DCIC: Human Face of big Data</h1>
	<p1>Utilize this search page to find parcel specific information within the DCIC: Human Face of Big Data relational database system.</p1>
	</header>


	<div class="container lg-font col-md-12">
		<div class="col-md-12" role="titlebar" id="titlebar">
      		<div class="section-title"><h3>Parcel Information</h3></div>
    	</div>
    	<!-- Basic Parcel Information -->
  		<div class="form-group col-md-3">
  			<!--Iterate the parcel_info array -->
  			<?php $i=0; foreach ($parcel_info[0] as $key => $value){ if($key == 'parcel_id'){continue;} ?>
				<label><?php echo $key;?><small class="required">*</small></label>
				<?php if($key != 'land_use') { ?>
    		<input type="text" class="parcel" id="<?php echo 'parcel' . $i;?>" parcel_id=<?php echo $parcel_info[0]['parcel_id'];?> name="<?php echo $key;?>" value = "<?php echo trim($value);?>" required minlength="1" onblur="pageUpdate(id)">
    		<?php } else { ?>
			<input list="land-usage" type="text" class="parcel" id="<?php echo 'parcel' . $i;?>" parcel_id="<?php echo $parcel_info[0]['parcel_id'];?>" name="land_use" value="<?php echo trim($parcel_info[0]['land_use']);?>" required minlength="1" onblur="pageUpdate(id)">
				<datalist id="land-usage">
					<option value="residential"></option>
					<option value="commercial"></option>
				</datalist> 
				<?php } $i++; } ?>
		</div>

  		<!-- Address Information -->
  		<div class="form-group col-md-3">
        	<?php $index=0; for ($i=0; $i<sizeof($address_info); $i++) { foreach($address_info[$i] as $key => $value) { if ($key == 'address_id') {continue;}?>
    		<label><?php echo trim($key);?></label>
			<input type="text" class="form-control" id="<?php echo 'address' . $index;?>" address_id="<?php echo $address_info[$i]['address_id'];?>" value = "<?php echo trim($value);?>" onblur="pageUpdate(id)">
        	<?php $index++;}} ?>
		</div>

		<!-- Event Information -->
		<div class="form-group col-md-3">
    	<?php $index=0; for ($i=0; $i<sizeof($event_info); $i++) { ?>
			<div class="col-md-12" role="events">
    	<?php foreach($event_info[$i] as $key => $value) { 
    			if ($key == 'event_id' || $key == 'event_type_id' || $key == 'person_id' || $key == 'event_asso_id') {
				continue; }?>
			<?php if ($key == 'name') { ?>
				<label><?php echo trim($key);?><small class="required">*</small></label>
				<div class="autocomplete" style="width:300px;">
		    		<input class="namecell" type="text" id="<?php echo 'event_person' . $index;?>" person_id="<?php echo $event_info[$i]['person_id'];?>" value="<?php echo trim($value);?>" onblur="pageUpdate(id)">
		    	</div>
	    	<?php } else { ?>
	        	<label><?php echo trim($key);?><?php if (!($key == 'response' || $key == 'extra_information')) {?><small class="required">*</small>
	        	<?php } ?></label>
    			<input type="text" class="form-control" id=
    				<?php if ($key == 'response' || $key == 'extra_information' 
    				|| $key == 'date' || $key == 'price') {
    					echo 'event' . $index . ' ' . 'event_id=' . $event_info[$i]['event_id'];
    				} elseif ($key == 'type') {
    					echo 'event_type' . $index . ' ' . 'event_type_id=' . $event_info[$i]['event_type_id'];
    				} else if ($key == 'role') {
    					echo 'event' . $index . ' ' . 'event_asso_id=' . $event_info[$i]['event_asso_id'];
    			}?> value = "<?php echo trim($value);?>" 
				<?php if (!($key == 'response' || $key == 'extra_information')) {?>
    				required minlength="1" <?php }?>
    				onblur="pageUpdate(id)">
    			<?php } ?>
			<?php $index++;} ?>
			</div>
		<?php } ?>
		</div>

			<!-- Submit Button -->
        <div class="col-md-12" role="submit-titlebar"  id="role-submit-titlebar">
            <div class="section-title"><h3>Submit this Entry</h3></div>
        </div>
        <div class="col-md-12">    
            <button onclick="updateDB()">SUBMIT</button>
        </div>
        	<div class="col-md-12 form-footer">            
        </div>
	    <div class="col-md-12">
	    	<div class="required"> * Required</div>
	    </div>
	</div>

	<br><br>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

<script>
function pageUpdate(id){
	$("#" + id).attr("value", $("#" + id).val());

	if (id.includes("type")) {
		$.ajax({
			type:"GET",
			async:true,
			url:"edit_db_access.php",
			data: {
				action: 'type_request',
				type: $("#" + id).attr("value")
			},
			dataType: "json"
		}).done(function(data){
			// console.log(data[0]["event_type_id"]);	
			var new_type_id = data[0]["event_type_id"];
			$("#" + id).attr("event_type_id", new_type_id);
		})
	} else if (id.includes("person")) {
		$.ajax({
			type:"GET",
			async:true,
			url:"edit_db_access.php",
			data: {
				action: 'person_request',
				name: $("#" + id).attr("value")
			},
			dataType: "json"
		}).done(function(data){
			var new_person_id = data[0]["person_id"];
			$("#" + id).attr("person_id", new_person_id);
		})
	}
}
function updateDB(){
	var property = new Object();

	var ids = ["parcel", "address", "event"];
	for (var i=0; i<ids.length; i++) {
		var input_tags = $("input[id^='" + ids[i] + "']");

		// console.log(input_tags);

		if (ids[i] == "parcel") {
			property.parcel = [];

			var par_id = input_tags[0].getAttribute("parcel_id");
			var block_no = input_tags[0].getAttribute("value");
			var parcel_no = input_tags[1].getAttribute("value");
			var ward_no = input_tags[2].getAttribute("value");
			var land_use = input_tags[3].getAttribute("value");

			var par = 
			{
				parcel_id: par_id,
				block_no: block_no,
				parcel_no: parcel_no,
				ward_no: ward_no,
				land_use: land_use
			};

			property.parcel.push(par);

		} else if (ids[i] == "address") {
			property.address = [];
			for (var k=0; k<input_tags.length; k+=2){
				var add_id = input_tags[k].getAttribute("address_id");
				var st_num = input_tags[k].getAttribute("value");
				var st_name = input_tags[k+1].getAttribute("value");

				var addr = 
				{
					address_id: add_id,
					st_num: st_num,
					st_name: st_name
				};

				property.address.push(addr);
			}
		} else if (ids[i] == "event") {
			property.events = [];
			for (var k=0; k<input_tags.length; k+=7){
				var evt_id = input_tags[k].getAttribute("event_id");
				var response = input_tags[k].getAttribute("value");
				var extra_information = input_tags[k+1].getAttribute("value");
				var date = input_tags[k+2].getAttribute("value");
				var price = input_tags[k+3].getAttribute("value");
				var evt_type_id = input_tags[k+4].getAttribute("event_type_id");
				var evt_type = input_tags[k+4].getAttribute("value");
				var evt_asso_id = input_tags[k+5].getAttribute("event_asso_id");
				var role = input_tags[k+5].getAttribute("value");
				var per_id = input_tags[k+6].getAttribute("person_id");
				var name = input_tags[k+6].getAttribute("value");

				var evnt =
				{
					event_id: evt_id,
					response: response,
					extra_information: extra_information,
					date: date,
					price: price,
					event_type_id: evt_type_id,
					event_type: evt_type,
					event_asso_id: evt_asso_id,
					role: role,
					person_id: per_id,
					name: name
				}

				property.events.push(evnt);
			}
		}
	}

	$.post("edit_db_update.php", property).done(function(data){
		console.log( data );
	}, "string");
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