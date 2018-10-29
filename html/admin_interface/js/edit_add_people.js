var index=0;
function addPeople(num, event_id){
	var extra_row = 
	"<div class='col-md-3'>" + 
		"<label>role<small class='required'>*</small></label>" +
			"<select required class='form-control' id=extra_people_role" + index + " event_id='" + event_id + "' event_asso_id='' value='' onblur='pageUpdate(id)'>" +
				"<option disabled selected>Select One</option>" +
				"<option value='owner'>Owner</option>" +
				"<option value='tenant'>Tenant</option>" +
				"<option value='haca'>HACA</option>" + 
				"<option value='purchaser'>Purchaser</option>" +
				"<option value='other'>Other</option>" +
				"<option value='heir'>Heir</option>" +
				"<option value='appraiser'>Appraiser</option>" +
				"<option value='trustee'>Trustee</option>" +
			"</select>" +	
	"</div>" + 
	"<div class='col-md-9'>" +
		"<label>name<small class='required'>*</small></label><br>" +
		"<div class='autocomplete container-fluid'>" +
    		"<input class='namecell' type='text' id=extra_people_name" + index + " person_id='' value='' onblur='pageUpdate(id)'>" +
		"</div>" +
   	"</div>";
   	
	$( "#ext-people" + num ).append(extra_row);

	index++;
}