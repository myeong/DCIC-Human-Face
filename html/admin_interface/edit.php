<!DOCTYPE HTML>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- People name dropdown menu -->
	<script src="js/edit_dropdown_names.js"></script>

	<!-- Auto Complete Form CSS -->
	<link rel="stylesheet" href="../css/auto_complete_form.css">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">

	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">

	<title>DCIC Human Face of Big Data</title>

	<?php
	include 'edit_parcel_access.php';
	include 'edit_event_people.php';
	?>

</head>
<body>
	<header class="my-2 mx-5">
	<h1>DCIC: Administrative Interface</h1>
	<p1>Modify each parcel data. Once the modification is done, press a submit button to make change in the database.</p1>
	</header>

	<div class="container">
		<div class="row py-3" role="titlebar" id="titlebar">
      		<div class="section-title"><h3>Parcel Information</h3></div>
    	</div>
    	<!-- Basic Parcel Information -->
  		<div class="row rounded pb-5">
  			<!--Iterate the parcel_info array -->
  			<?php $i=0; foreach ($parcel_info[0] as $key => $value){ if($key == 'parcel_id'){continue;} ?>
  			<div class="col-md-3">
				<label><?php echo $key;?><small class="required">*</small></label>
				<?php if($key == 'block_no' || $key == 'parcel_no') { ?>
    			<input type="text" class="parcel" id="<?php echo 'parcel' . $i;?>" parcel_id=<?php echo $parcel_info[0]['parcel_id'];?> name="<?php echo $key;?>" value = "<?php echo trim($value);?>" required minlength="1" onblur="pageUpdate(id)">
    			<?php } else if ($key == 'ward_no') { ?>
    			<input type="number" class="parcel" id="<?php echo 'parcel' . $i;?>" parcel_id=<?php echo $parcel_info[0]['parcel_id'];?> name="<?php echo $key;?>" value = "<?php echo trim($value);?>" onblur="pageUpdate(id)">
    			<?php } else { ?>
				<select class="form-control" id="<?php echo 'parcel' . $i;?>" parcel_id="<?php echo $parcel_info[0]['parcel_id'];?>" name="land_use" value="<?php echo trim($parcel_info[0]['land_use']);?>" onblur="pageUpdate(id)">
					<option value="residential">Residential</option>
					<option value="commercial">Commercial</option>
				</select>
				<?php } $i++; ?>
			</div>
			<?php } ?>

  			<!-- Address Information -->
        	<?php $index=0; for ($i=0; $i<sizeof($address_info); $i++) { foreach($address_info[$i] as $key => $value) { if ($key == 'address_id') {continue;}?>
        	<div class="col-md-6">
    			<label><?php echo trim($key);?></label>
				<input type="text" class="form-control" id="<?php echo 'address' . $index;?>" address_id="<?php echo $address_info[$i]['address_id'];?>" value = "<?php echo trim($value);?>" onblur="pageUpdate(id)">
        	<?php $index++; ?>
        	</div>
        	<?php }} ?>
		</div>

		<div class="row py-3" role="titlebar" id="titlebar">
      		<div class="section-title"><h3>Event Information</h3></div>
    	</div>

		<!-- Event Information -->
		<div class="container event-container px-0 pb-2">
			<?php $num_event=1; $index=0; $index_reverse = 9999; for ($i=0; $i<sizeof($event_info); $i++) { ?>
			<div class="row rounded py-3 mb-5 border border-dark" role="a_event">
				<div class="col-md-12">
					<h5>Event <?php echo $num_event;?></h5>
				</div>
				<?php foreach($event_info[$i] as $key => $value) {
					if ($key == 'event_id' || $key == 'event_type_id') {
						continue;
					}
					if ($key == 'response' || $key == 'extra_information') { ?>
						<div class="col-md-6">
							<label><?php echo trim($key);?></label>
							<input type="text" class="form-control" id=<?php echo 'event' . $index; ?> event_id="<?php echo $event_info[$i]['event_id']; ?>" value="<?php echo trim($value);?>" onblur="pageUpdate(id)">
						</div>
					<?php } elseif ($key == 'date') { ?>
						<div class="col-md-4">
							<label><?php echo trim($key);?><small class="required">*</small></label>
							<input type="date" class="form-control" id=<?php echo 'event' . $index; ?> event_id="<?php echo $event_info[$i]['event_id']; ?>" value="<?php echo trim($value);?>" required minlength="1" onblur="pageUpdate(id)">
						</div>
					<?php } elseif ($key =='price') { ?>
						<div class="col-md-4">
							<label><?php echo trim($key);?><small class="required">*</small></label>
							<input type="number" class="form-control" id=<?php echo 'event' . $index; ?> event_id="<?php echo $event_info[$i]['event_id']; ?>" value="<?php echo trim($value);?>" required minlength="1" onblur="pageUpdate(id)">
						</div>
					<?php } elseif ($key == 'type') { ?>
						<div class="col-md-4 form-group">
							<label><?php echo trim($key);?><small class="required">*</small></label>
							<select class="form-control" id=<?php echo 'event_type' . $index; ?> event_type_id="<?php echo $event_info[$i]['event_type_id']; ?>" value="<?php echo trim($value);?>" onblur="pageUpdate(id)">
								<option value="Transfer of Deed" <?php if(trim($value) == 'Transfer of Deed'){ echo 'selected';}?>>Transfer of Deed</option>
								<option value="Offer Made" <?php if(trim($value) == 'Offer Made'){ echo 'selected';}?>>Offer Made</option>
								<option value="Appraisal" <?php if(trim($value) == 'Appraisal'){ echo 'selected';}?>>Appraisal</option>
								<option value="Decision (Accept/Reject)" <?php if(trim($value) == 'Decision (Accept/Reject)'){ echo 'selected';}?>>Decision (Accept/Reject)</option>
								<option value="Tenant Moved" <?php if(trim($value) == 'Tenant Moved'){ echo 'selected';}?>>Tenant Moved</option>
								<option value="Awarded" <?php if(trim($value) == 'Awarded'){ echo 'selected';}?>>Awarded</option>
								<option value="End of Case" <?php if(trim($value) == 'End of Case'){ echo 'selected';}?>>End of Case</option>
							</select>
						</div>
					<?php }	$index++; }
					$people = people_names($event_info[$i]['event_id']);
					for ($j=0; $j<sizeof($people); $j++) { ?>
						<div class="col-md-12" id="<?php echo 'db_people' . $index_reverse;?>">
							<div class="row">
							<?php foreach ($people[$j] as $k => $v) {
								if ($k == 'event_asso_id' || $k == 'person_id') {
									continue;
								}
								if ($k == 'role') { ?>
								<div class="col-md-4">
									<label><?php echo trim($k);?><small class="required">*</small></label>
									<select class="form-control" id=<?php echo 'people_role' . $index_reverse; ?> event_asso_id="<?php echo $people[$j]['event_asso_id']; ?>" value="<?php echo trim($v);?>" onblur="pageUpdate(id)">
										<option disabled>Select One</option>
										<option value="owner" <?php if(trim($v) == 'owner'){ echo 'selected';}?>>Owner</option>
										<option value="tenant" <?php if(trim($v) == 'tenant'){ echo 'selected';}?>>Tenant</option>
										<option value="haca" <?php if(trim($v) == 'haca'){ echo 'selected';}?>>HACA</option>
										<option value="purchaser" <?php if(trim($v) == 'purchaser'){ echo 'selected';}?>>Purchaser</option>
										<option value="other" <?php if(trim($v) == 'other'){ echo 'selected';}?>>Other</option>
										<option value="heir" <?php if(trim($v) == 'heir'){ echo 'selected';}?>>Heir</option>
										<option value="appraiser" <?php if(trim($v) == 'appraiser'){ echo 'selected';}?>>Appraiser</option>
										<option value="trustee" <?php if(trim($v) == 'trustee'){ echo 'selected';}?>>Trustee</option>
									</select>
								</div>
								<?php } elseif ($k == 'name') { ?>
									<div class="col-md-7">
										<label class="mb-1"><?php echo trim($k);?><small class="required">*</small></label><br>
										<div class="autocomplete container-fluid">
								    		<input class="namecell" type="text" id="<?php echo 'people_name' . $index_reverse;?>" person_id="<?php echo $people[$j]['person_id'];?>" value="<?php echo trim($v);?>" onblur="pageUpdate(id)">
							    		</div>
							    	</div>
							    	<div class="col-md-1 d-flex align-items-end justify-content-center">
							    		<button class="btn btn-danger mb-1" onclick="deletePeople(this.parentNode.parentNode.parentNode.id, '<?php echo $people[$j]['event_asso_id'];?>')">
							    			<i class="fas fa-trash-alt"></i>
							    		</button>
							    	</div>
								<?php }} $index_reverse--; ?>
						</div>
					</div>
					<?php } ?>
						<div class="col-md-12" id="ext_section<?php echo $num_event;?>"></div>
						<div class="col-md-12">
							<button type="button" class="btn btn-outline-dark my-3" onclick="addPeople('<?php echo $num_event;?>', '<?php echo $people[0]['event_id']; ?>'); dropdownRegister();">+Add a Person</button>
						</div>
			</div>
			<?php $num_event++; } ?>
		</div>

		<!-- Submit Button -->
        <div class="col-md-12" role="submit-titlebar"  id="role-submit-titlebar">
            <div class="section-title"><h3>Submit this Entry</h3></div>
        </div>
        <div class="col-md-12">
            <button onclick="updateDB();">SUBMIT</button>
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

<script src="js/edit_page_elements_update.js"></script>
<script src="js/edit_db_update.js"></script>
<script src="js/edit_add_people.js"></script>
<script src="js/edit_delete_people.js"></script>
<script src="js/edit_dropdown_register.js"></script>

</body>
</html>
