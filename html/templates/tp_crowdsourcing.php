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
            			<label for="st_num_1">Street Number 1<small class="required">*</small></label>
            			<input type="text" class="form-control" id="st_num_1" name="st_num_1" placeholder="e.g., 467-491" required minlength="1">
        			</div> 
                    <div class="form-group col-md-6">
                        <label for="st_name_1">Street Name 1<small class="required">*</small></label>
                        <input type="text" class="form-control" id="st_name_1" name="st_name_1" placeholder="e.g., S. French Broad Ave." required minlength="1">
                    </div> 
                    <div class="form-group col-md-6">
                        <label for="st_num_2">Street Number 2</label>
                        <input type="text" class="form-control" id="st_num_2" name="st_num_2" placeholder="e.g., 467-491">
                    </div> 
                    <div class="form-group col-md-6">
                        <label for="st_name_2">Street Name 2</label>
                        <input type="text" class="form-control" id="st_name_2" name="st_name_2" placeholder="e.g., S. French Broad Ave.">
                    </div> 					         			
        			<div class="form-group col-md-4">
            			<label for="land_use">Land Use<small class="required">*</small></label>
            			<input type="text" class="form-control" id="land_use" name="land_use" placeholder="Residential/Commercial/..." required minlength="2">
        			</div> 
        			
        		</div>
      		</div>
      	</div>


      	<div class="col-md-12" role="events-titlebar"  id="role-events-titlebar">
      		<div class="section-title"><h3>2. Important Events</h3></div>
    	</div>

        <div class="col-md-12" role="events"  id="role-events">
            <!-- Dynamically appending entries -->
            <div class="row col-md-12">
                <div class="form-group col-md-12" id="event-item-1"> 
                    <div class="form-group col-md-3">
                        <label for="event_type-1">Event Type</label>
                        <select class="form-control" name="event_type-1">
                            <option selected disabled>Choose an Event Type</option>
                            <?php
                                for ($i=0; $i<sizeof($content['event_types']); $i++){
                                    echo "<option value=\"" . $content['event_types'][$i] . '">' . $content['event_types'][$i] . "</option>";
                                }                                
                            ?>
                        </select> 
                    </div>
                    <div class="form-group col-md-3">
                        <label for="event_date-1">Event Date</label>
                        <input type="date" class="form-control" name="event_date-1" /> 
                    </div> 
                    <div class="form-group col-md-3">
                        <label for="event_money-1">Amount of Money Involved</label>
                        <input type="number" class="form-control" name="event_money-1" /> 
                    </div> 
                    <div class="form-group col-md-3">
                        <label for="event_response-1">Response (for Offer_Accepted)</label>
                        <select class="form-control" name="event_response-1">
                            <option selected disabled>Choose a Response</option>
                            <option value="accept">Accepted</option>
                            <option value="reject">Rejected</option>
                            <option value="complicated">Complicated</option>
                        </select>
                    </div> 
                    
                    <div class="form-group col-md-11">
                        <label for="event_extra-1">Note (e.g., unsual stories)</label>
                        <input class="form-control" name="event_extra-1" type="text" /> 
                    </div> 
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <button type="button" class="btn btn-primary" id="add_event">+Add An Event Entry</button>
        </div>
      
      	
    </form>
    <div class="col-md-12">
    	<div class="required"> * Required</div>
    </div>
</div>

<script>
$(document).ready(function() {
	var FieldCount = 2;
    event_item = $("#role-events").clone();
    
    $("#add_event").click(function(e) {
        e.preventDefault();
        
        event_item.find("#event-item-" + (FieldCount - 1).toString()).attr('id','event-item-' + FieldCount.toString());
        event_item.find("select[name=event_type-" + (FieldCount-1).toString() + "]").attr('name', 'event_type-' + FieldCount.toString());
        event_item.find("input[name=event_date-" + (FieldCount-1).toString() + "]").attr('name', 'event_date-' + FieldCount.toString());
        event_item.find("input[name=event_money-" + (FieldCount-1).toString() + "]").attr('name', 'event_money-' + FieldCount.toString());
        event_item.find("select[name=event_response-" + (FieldCount-1).toString() + "]").attr('name', 'event_response-' + FieldCount.toString());
        event_item.find("input[name=event_extra-" + (FieldCount-1).toString() + "]").attr('name', 'event_extra-' + FieldCount.toString());
        
        $("#role-events").append(event_item.html());
		FieldCount++;
        return false;
    });

	// $("#add_owner").click(function() {
                
 //        $("#role-owners").append('<div class="row col-md-12 owner-item"><div class="form-group col-md-12"> \
 //        	<div class="form-group col-md-4">\
 //        		<label for="owner_name[]">Building Address</label>\
 //        		<input type="text" class="form-control" name="owner_name[]" id="owner_name[]" placeholder="Name" /> \
 //        	</div>\
 //        	<div class="form-group col-md-3">\
 //        		<label for="apt_no[]">Building Number</label>\
 //        		<input type="number" class="form-control" name="apt_no[]" id="apt_no[]" value='+  FieldCount +' /> \
 //        	</div>\
 //        	<div class="form-group col-md-3">\
 //        		<label for="num_rooms[]">Number of Rooms</label>\
 //        		<input type="number" class="form-control" name="num_rooms[]" id="num_rooms[]" placeholder="" /> \
 //        	</div>\
 //        	<div class="form-group col-md-3">\
 //        		<label for="area_of_building[]">Area of Building</label>\
 //        		<input type="number" class="form-control" name="area_of_building[]" id="area_of_building[]" placeholder="In Sq. Ft." /> \
 //        	</div>\
 //        	<div class="form-group col-md-3">\
 //        		<label for="use_of_building[]">Use of Building</label>\
 //        		<input type="number" class="form-control" name="use_of_building[]" id="use_of_building[]" placeholder="Commercial/Residential/..." />\
 //        	</div></div></div>');
	// 	FieldCount++;
 //        return false;
 //    });
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