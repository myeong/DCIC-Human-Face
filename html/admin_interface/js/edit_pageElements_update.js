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
	} else if (id.includes("name")) {
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