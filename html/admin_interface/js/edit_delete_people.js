function deletePeople(row_id, role_div_id, people_div_id){
	if (row_id.includes("db")) {
		
		$( "#" + role_div_id).attr("id", "deleted_" + role_div_id);
		$( "#" + people_div_id).attr("id", "deleted_" + people_div_id);

	}
	$( "#" + row_id ).hide();
}
