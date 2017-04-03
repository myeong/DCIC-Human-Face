<html>
<?php include __DIR__.'/'.'tp_header.php'; ?>

<div class="container lg-font col-md-12">
	<form id="survey_form" class="form-horizontal" style="border:0px dotted black;" action="/input/<?php echo $content['parcel_id']; ?>" method="post">
		
		<div class="col-md-12" role="address-titlebar"  id="role-address-titlebar">
      		<div class="section-title"><h3>1. Basic Information</h3></div>
    	</div>
    	<div class="col-md-12" role="address"  id="role-address">
      	
      		<div class="row col-md-12">
        		<div class="form-group col-md-12">
        			<!-- <input type="hidden" class="form-control" id="parcel_id" name="parcel_id" value="<?php echo $content['parcel_id']; ?>"> -->

          			<div class="form-group col-md-3">
            			<label for="block_no">Block Number<small class="required">*</small></label>
            			<input type="number" class="form-control" id="block_no" name="block_no" placeholder="Type a block number" required minlength="1">
        			</div>
        			<div class="form-group col-md-3">
            			<label for="parcel_no">Parcel Number<small class="required">*</small></label>
            			<input type="number" class="form-control" id="parcel_no" name="parcel_no" placeholder="Type a parcel number" required minlength="1">
        			</div>
        			<div class="form-group col-md-3">
            			<label for="ward_no">Ward Number<small class="required">*</small></label>
            			<input type="number" class="form-control" id="ward_no" name="ward_no" placeholder="Type a ward number" required minlength="1">
        			</div>
        			<div class="form-group col-md-6">
            			<label for="address">Parcel Address<small class="required">*</small></label>
            			<input type="text" class="form-control" id="address" name="address" placeholder="e.g., 467-491 S. French Broad Ave." required minlength="2">
        			</div> 
					<div class="form-group col-md-3">
            			<label for="concurred_price">Concurred in Price ($) <small class="required">*</small></label>
            			<input type="number" class="form-control" id="concurred_price" name="concurred_price" placeholder="Type the final price ($)" required minlength="1">
        			</div>           			
        			<div class="form-group col-md-4">
            			<label for="land_use">Land Use<small class="required">*</small></label>
            			<input type="text" class="form-control" id="land_use" name="land_use" placeholder="Residential/Commercial/..." required minlength="2">
        			</div> 
        			
        		</div>
      		</div>
      	</div>


      	<div class="col-md-12" role="dates-titlebar"  id="role-dates-titlebar">
      		<div class="section-title"><h3>2. Important Dates</h3></div>
    	</div>
    	<div class="col-md-12" role="dates"  id="role-dates">
      	
      		<div class="row col-md-12">
        		<div class="form-group col-md-12">
        			<div class="form-group col-md-3">
            			<label for="date_concurred">Date Concurred</label>
            			<input type="date" class="form-control" id="date_concurred" name="date_concurred" min="1960-01-01" max="1980-01-01">
        			</div> 
					<div class="form-group col-md-3">
            			<label for="date_title_search">Preliminary Title Search</label>
            			<input type="date" class="form-control" id="date_title_search" name="date_title_search" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_offer_made">Date Offer Made</label>
            			<input type="date" class="form-control" id="date_offer_made" name="date_offer_made" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_offer_accepted">Offer Accepted</label>
            			<input type="date" class="form-control" id="date_offer_accepted" name="date_offer_accepted" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_closed">Closed</label>
            			<input type="date" class="form-control" id="date_closed" name="date_closed" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_rejected">Rejected</label>
            			<input type="date" class="form-control" id="date_rejected" name="date_rejected" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_condemn_approval">Apprvd. for Condemnation</label>
            			<input type="date" class="form-control" id="date_condemn_approval" name="date_condemn_approval" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_assignedto_attorney">Assgined to Attorney</label>
            			<input type="date" class="form-control" id="date_assignedto_attorney" name="date_assignedto_attorney" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_petition_filed">Petition Filed</label>
            			<input type="date" class="form-control" id="date_petition_filed" name="date_petition_filed" min="1960-01-01" max="1980-01-01">            			
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_commis_hearing">Commissioners Hearing</label>
            			<input type="date" class="form-control" id="date_commis_hearing" name="date_commis_hearing" min="1960-01-01" max="1980-01-01">            			
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_order_vesting_title">Order Vesting Title</label>
            			<input type="date" class="form-control" id="date_order_vesting_title" name="date_order_vesting_title" min="1960-01-01" max="1980-01-01">            			
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_final_title_certi">Final Title Certificate</label>
            			<input type="date" class="form-control" id="date_final_title_certi" name="date_final_title_certi" min="1960-01-01" max="1980-01-01">            			
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_exception_filed">Exception Filed</label>
            			<input type="date" class="form-control" id="date_exception_filed" name="date_exception_filed" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_trial">Trial</label>
            			<input type="date" class="form-control" id="date_trial" name="date_trial" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_relocation">Assigned to Relocation</label>
            			<input type="date" class="form-control" id="date_relocation" name="date_relocation" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_vacated">Vacated</label>
            			<input type="date" class="form-control" id="date_vacated" name="date_vacated" min="1960-01-01" max="1980-01-01">
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_assigned_for_demolition">Assgined for Demolition</label>
            			<input type="date" class="form-control" id="date_assigned_for_demolition" name="date_assigned_for_demolition" min="1960-01-01" max="1980-01-01">            			
        			</div> 
        			<div class="form-group col-md-3">
            			<label for="date_removed">Removed</label>
            			<input type="date" class="form-control" id="date_removed" name="date_removed" min="1960-01-01" max="1980-01-01">            			
        			</div> 
          			       			
        		</div>
      		</div>
      	</div>

      	<div class="col-md-12" role="building-titlebar"  id="role-building-titlebar">
      		<div class="section-title"><h3>3. Buildings</h3></div>
    	</div>
    	<div class="col-md-12" role="building"  id="role-building">
    		<!-- Dynamically appending entries -->
      	</div>
      	<div class="col-md-12">
      		<button type="button" class="btn btn-primary" id="add_building">+Add An Building Entry</button>
      	</div>


      	<div class="col-md-12" role="owners-titlebar"  id="role-owners-titlebar">
      		<div class="section-title"><h3>4. Owners</h3></div>
    	</div>
    	<div class="col-md-12" role="owners" id="role-owners">
    		<div class="row col-md-12">
				<div class="form-group col-md-4">
					<label for="owner_name">Owner Name<small class="required">*</small></label>
					<input type="text" class="form-control" id="owner_name" name="owner_name" placeholder="Name" required minlength="2">
				</div> 
				<div class="form-group col-md-4">
					<label for="is_heir">Heir of an Owner?</label><br>
					<input type="radio" name="is_heir" value="1" > Yes &nbsp;&nbsp;
  					<input type="radio" name="is_heir" value="0" checked> No<br>
				</div> 
				<div class="form-group col-md-4">
					<label for="pass_away_date">Date of Passing Away (if so)</label>
					<input type="date" class="form-control" id="pass_away_date" name="pass_away_date" min="1960-01-01" max="1980-01-01">
				</div> 
				<div class="form-group col-md-4">
					<label for="purchase_price">Purchase Price</label>
					<input type="number" class="form-control" id="purchase_price" name="purchase_price" placeholder="In dollar">
				</div> 
				<div class="form-group col-md-4">
					<label for="loan_price">Loan Price</label>
					<input type="number" class="form-control" id="loan_price" name="loan_price" placeholder="In dollar">
				</div>
				<div class="form-group col-md-4">
					<label for="deed_transfer_date">Deed Transfer Date</label>
					<input type="date" class="form-control" id="deed_transfer_date" name="deed_transfer_date" min="1960-01-01" max="1980-01-01">
				</div> 
			</div>
		</div>
      	<div class="col-md-12">
      		<button type="button" class="btn btn-primary" id="add_owner">+Add An Owner Entry</button>
      	</div>

      	<div class="col-md-12" role="appraisal-titlebar"  id="role-appraisal-titlebar">
      		<div class="section-title"><h3>5. Appraisals</h3></div>
    	</div>
    	<div class="col-md-12" role="appraisal" id="role-appraisal">
    		<div class="row col-md-12 appraisal">
				<div class="form-group col-md-4">
					<label for="appraiser_name_1">Appraiser Name 1<small class="required">*</small></label>
					<input type="text" class="form-control" id="appraiser_name_1" name="appraiser_name_1" placeholder="Name" required minlength="2">
				</div> 
				<div class="form-group col-md-3">
					<label for="imps_1">Improvements Value<small class="required">*</small></label>
					<input type="number" class="form-control" id="imps_1" name="imps_1" placeholder="In Dollar" required minlength="2">
				</div> 
				<div class="form-group col-md-3">
					<label for="land_1">Land Value<small class="required">*</small></label>
					<input type="number" class="form-control" id="land_1" name="land_1" placeholder="In Dollar" required minlength="2">
				</div> 
				<div class="form-group col-md-3">
					<label for="area_1">Area of House</label>
					<input type="number" class="form-control" id="area_1" name="area_1" placeholder="In Sq. Ft.">
				</div> 
				<div class="form-group col-md-3">
					<label for="reproduction_1">Reproduction Value</label>
					<input type="number" class="form-control" id="reproduction_1" name="reproduction_1" placeholder="In Dollar">
				</div> 
			</div>
			<div class="row col-md-12 appraisal">
				<div class="form-group col-md-4">
					<label for="appraiser_name_2">Appraiser Name 2</label>
					<input type="text" class="form-control" id="appraiser_name_2" name="appraiser_name_2" placeholder="Name">
				</div> 
			</div>
			<div class="row col-md-12 appraisal">
				<div class="form-group col-md-4">
					<label for="appraiser_name_3">Appraiser Name 3</label>
					<input type="text" class="form-control" id="appraiser_name_3" name="appraiser_name_3" placeholder="Name">
				</div> 
			</div>
			<div class="row col-md-12 appraisal">
				<div class="form-group col-md-4">
					<label for="appraiser_name_4">Appraiser Name 4</label>
					<input type="text" class="form-control" id="appraiser_name_4" name="appraiser_name_4" placeholder="Name">
				</div> 
			</div>
		</div>


      	
    </form>
    <div class="col-md-12">
    	<div class="required"> * Required</div>
    </div>
</div>

<script>
$(document).ready(function() {
	var FieldCount = 1;

    $("#add_building").click(function() {
                
        $("#role-building").append('<div class="row col-md-12 building-item"><div class="form-group col-md-12"> \
        	<div class="form-group col-md-4">\
        		<label for="st_name[]">Building Address</label>\
        		<input type="text" class="form-control" name="st_name[]" id="st_name[]" placeholder="e.g., 53 Louis Rd." /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="apt_no[]">Building Number</label>\
        		<input type="number" class="form-control" name="apt_no[]" id="apt_no[]" value='+  FieldCount +' /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="num_rooms[]">Number of Rooms</label>\
        		<input type="number" class="form-control" name="num_rooms[]" id="num_rooms[]" placeholder="" /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="area_of_building[]">Area of Building</label>\
        		<input type="number" class="form-control" name="area_of_building[]" id="area_of_building[]" placeholder="In Sq. Ft." /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="use_of_building[]">Use of Building</label>\
        		<input type="number" class="form-control" name="use_of_building[]" id="use_of_building[]" placeholder="Commercial/Residential/..." />\
        	</div></div></div>');
		FieldCount++;
        return false;
    });

	$("#add_owner").click(function() {
                
        $("#role-owners").append('<div class="row col-md-12 owner-item"><div class="form-group col-md-12"> \
        	<div class="form-group col-md-4">\
        		<label for="owner_name[]">Building Address</label>\
        		<input type="text" class="form-control" name="owner_name[]" id="owner_name[]" placeholder="Name" /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="apt_no[]">Building Number</label>\
        		<input type="number" class="form-control" name="apt_no[]" id="apt_no[]" value='+  FieldCount +' /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="num_rooms[]">Number of Rooms</label>\
        		<input type="number" class="form-control" name="num_rooms[]" id="num_rooms[]" placeholder="" /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="area_of_building[]">Area of Building</label>\
        		<input type="number" class="form-control" name="area_of_building[]" id="area_of_building[]" placeholder="In Sq. Ft." /> \
        	</div>\
        	<div class="form-group col-md-3">\
        		<label for="use_of_building[]">Use of Building</label>\
        		<input type="number" class="form-control" name="use_of_building[]" id="use_of_building[]" placeholder="Commercial/Residential/..." />\
        	</div></div></div>');
		FieldCount++;
        return false;
    });
});
</script>

<?php

// Printing results in HTML
	// echo "<table>\n";
	// while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
	//     echo "\t<tr>\n";
	//     foreach ($line as $col_value) {
	//         echo "\t\t<td>$col_value</td>\n";
	//     }
	//     echo "\t</tr>\n";
	// }
	// echo "</table>\n";

	// // Free resultset
	// pg_free_result($result);

	// // Closing connection
	// pg_close($dbconn);

?>

</body>
</html>