<?php 
$domain = "messages";
bindtextdomain($domain, "Locale"); 
bind_textdomain_codeset($domain, 'UTF-8');

textdomain($domain);
?>

<?php include __DIR__.'/'.'tp_header.php'; ?>

<div class="container lg-font col-md-12">
	<form id="survey_form" class="form-horizontal" style="border:0px dotted black;" action="/input/<?php echo $content['parcel_id']; ?>" method="post">
		
        <div class="col-md-12" role="address-titlebar"  id="role-address-titlebar">
            <div class="noti">You can see the current data status at <a href="/list" target='_blank'>this link</a>.</div>
        </div>

		<div class="col-md-12" role="address-titlebar"  id="role-address-titlebar">
      		<div class="section-title"><h3>1. Basic Information</h3></div>
    	</div>
    	<div class="col-md-12" role="address"  id="role-address">
      	
      		<div class="row col-md-12">
        		<div class="form-group col-md-12">        			
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
        			<div class="form-group col-md-4">
            			<label for="st_num_1">Street Number 1<small class="required">*</small></label>
            			<input type="text" class="form-control" id="st_num_1" name="st_num_1" placeholder="e.g., 467-491" required minlength="1">
        			</div> 
                    <div class="form-group col-md-6">
                        <label for="st_name_1">Street Name 1<small class="required">*</small></label>
                        <input type="text" class="form-control" id="st_name_1" name="st_name_1" placeholder="e.g., S. French Broad Ave." required minlength="1">
                    </div> 
                    <div class="form-group col-md-4">
                        <label for="st_num_2">Street Number 2</label>
                        <input type="text" class="form-control" id="st_num_2" name="st_num_2" placeholder="e.g., 467-491">
                    </div> 
                    <div class="form-group col-md-6">
                        <label for="st_name_2">Street Name 2</label>
                        <input type="text" class="form-control" id="st_name_2" name="st_name_2" placeholder="e.g., S. French Broad Ave.">
                    </div> 					         			
        			<div class="form-group col-md-4">                        
            			<label for="land_use">Land Use<small class="required">*</small></label>
                        <input type="hidden" name="land_use" value="">
            			<div class="radio">
                            <label><input type="radio" name="land_use" value="residential" required>Residential</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="land_use" value="commercial" required>Commercial</label>
                        </div>   
                        <div class="radio">
                            <label><input type="radio" name="land_use" value="other">Other</label>&nbsp;
                            <input type="text" id="land_use_other" name="land_use_other">
                        </div>                       
                        
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
                        <input type="hidden" name="event_type-1" value="">
                        <select class="form-control" name="event_type-1">
                            <option selected disabled>Choose an Event Type</option>                      
                            <?php
                                for ($i=0; $i<sizeof($content['event_types']); $i++){
                                    echo "<option value=\"" . $content['event_ids'][$i] . '">' . $content['event_types'][$i] . "</option>";
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

                    <label>People Involved</label>
                    <div class="form-group col-md-11 people">                        
                        <div class="form-group col-md-12 person-item">                        
                            <div class="form-group col-md-5">     
                                <label>Name</label>                       
                                <input type="text" class="form-control" name="person_name-1-1" /> 
                            </div>
                            <div class="form-group col-md-5">   
                                <label>Role</label>
                                <select class="form-control" name="person_role-1-1">
                                    <option selected disabled>Choose a Response</option>
                                    <option value="owner">Owner</option>
                                    <option value="tenant">Tenant</option>
                                    <option value="appraiser">Appraiser</option>
                                    <option value="heir">Heir</option>
                                    <option value="haca">HACA</option>
                                </select>
                            </div>
                        </div>
                    </div> 
                    
                    <div class="col-md-11">
                        <button type="button" class="btn btn-primary add_people">+Add a Person Entry</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <button type="button" class="btn btn-primary" id="add_event">+Add an Event Entry</button>
        </div>

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

<script>
$(document).ready(function() {
	var FieldCount = 2;
    var person_count = new Array();
    person_count[1] = 1;
    event_item = $("#role-events").clone();
    person_item = $("#role-events").find(".people").clone(); 
    
    $("#add_event").click(function(e) {
        e.preventDefault();
        
        event_item.find("#event-item-" + (FieldCount - 1).toString()).attr('id','event-item-' + FieldCount.toString());
        event_item.find("input[name=event_type-" + (FieldCount-1).toString() + "]").attr('name', 'event_type-' + FieldCount.toString());
        event_item.find("select[name=event_type-" + (FieldCount-1).toString() + "]").attr('name', 'event_type-' + FieldCount.toString());
        event_item.find("input[name=event_date-" + (FieldCount-1).toString() + "]").attr('name', 'event_date-' + FieldCount.toString());
        event_item.find("input[name=event_money-" + (FieldCount-1).toString() + "]").attr('name', 'event_money-' + FieldCount.toString());
        event_item.find("select[name=event_response-" + (FieldCount-1).toString() + "]").attr('name', 'event_response-' + FieldCount.toString());
        event_item.find("input[name=event_extra-" + (FieldCount-1).toString() + "]").attr('name', 'event_extra-' + FieldCount.toString());
        event_item.find("input[name=person_name-" + (FieldCount-1).toString() + "-1]").attr('name', 'person_name-' + FieldCount.toString() + '-1');
        event_item.find("select[name=person_role-" + (FieldCount-1).toString() + "-1]").attr('name', 'person_role-' + FieldCount.toString() + '-1');
        
        $("#role-events").append(event_item.html());
        person_count[FieldCount]= 1;
		FieldCount++;
        return false;
    });

    $(document).on('click', "button.add_people", function(e) {
        e.preventDefault();

        p_item = person_item.clone();

        // Get the current Event Item
        people_div = $(this).parent().parent();

        // The next index of person item
        person_index = people_div.find(".person-item").size() + 1;   
        
        // current Event Item ID
        item_id = people_div.attr("id");
        item_id = parseInt(item_id.split("-")[2]);

        suffix = item_id.toString() + "-" + person_index.toString();        
        
        // Assign a name of the upcoming input box based on Event Item ID and the Person Item ID.
        p_item.find("input[name=person_name-1-1]").attr('name', 'person_name-' + suffix);
        p_item.find("select[name=person_role-1-1]").attr('name', 'person_role-' + suffix);
        people_div.find(".people").append(p_item.html());
        
        return false;
    });


});
</script>


</body>
</html>