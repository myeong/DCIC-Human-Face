function updateDB(){
	var property = new Object();

	// var ids = ["parcel", "address", "event", "people", "extra"];
	var ids = ["extra"];
	for (var i=0; i<ids.length; i++) {
		var input_tags = $( "input[id^='" + ids[i] + "'], select[id^='" + ids[i] + "']");

		// for (var j=0; j<input_tags.length; j++) {
		// 	console.log(input_tags[j]);
		// }

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

		} 
		else if (ids[i] == "address") {
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
			for (var k=0; k<input_tags.length; k+=5){
				var evt_id = input_tags[k].getAttribute("event_id");
				var response = input_tags[k].getAttribute("value");
				var extra_information = input_tags[k+1].getAttribute("value");
				var date = input_tags[k+2].getAttribute("value");
				var price = input_tags[k+3].getAttribute("value");
				var evt_type_id = input_tags[k+4].getAttribute("event_type_id");
				var evt_type = input_tags[k+4].getAttribute("value");
				
				var evnt =
				{
					event_id: evt_id,
					response: response,
					extra_information: extra_information,
					date: date,
					price: price,
					event_type_id: evt_type_id,
					event_type: evt_type,
				}

				property.events.push(evnt);
			}
		} else if (ids[i] == "people") {
			property.people = [];
			for (var k=0; k<input_tags.length; k+=2){
				var evt_asso_id = input_tags[k].getAttribute("event_asso_id");
				var role = input_tags[k].getAttribute("value");
				var per_id = input_tags[k+1].getAttribute("person_id");
				var name = input_tags[k+1].getAttribute("value");

				var peo =
				{
					event_asso_id: evt_asso_id,
					role: role,
					person_id: per_id,
					name: name
				}

				property.people.push(peo);
			}
		} else if (ids[i] == "extra") {
			property.extra = [];
			for (var k=0; k<input_tags.length; k+=2){
				var evt_id = input_tags[k].getAttribute("event_id");
				var new_role = input_tags[k].getAttribute("value");
				var new_name = input_tags[k+1].getAttribute("value");

				if (input_tags[k+1].getAttribute("person_id") != "") {
					var new_person_id = input_tags[k+1].getAttribute("person_id");

					var extra = 
					{
						event_id: evt_id,
						role: new_role,
						person_id: new_person_id,
						name: new_name
					}
				} else {
					var extra = 
					{
						event_id: evt_id,
						role: new_role,
						name: new_name
					}
				}

				property.extra.push(extra);
			}
		}
	}

	// console.log(property);

	$.post("edit_db_update.php", property).done(function(data){
		console.log( data );
	}, "string");
}