function deletePeople(div_id, event_asso_id){
	if (div_id.includes("db")) {
		var people = new Object({action: 'delete'});

		people.event_assoc = [];
		people.event_assoc.push({event_asso_id: event_asso_id});

		$.post("edit_db_update.php", people);
	}
	$( "#" + div_id ).remove();
}