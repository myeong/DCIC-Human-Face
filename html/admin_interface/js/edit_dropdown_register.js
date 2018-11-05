var names = [];
var xhttp = new XMLHttpRequest();

// ajax call
xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		var result = JSON.parse(this.responseText);
		for (var i=0; i<result.length; i++) {
			names.push(result[i]['name'].trim());
		}
	}
};
xhttp.open("GET", "edit_db_access.php?action=name_request", true);
xhttp.send();

function dropdownRegister() {
	/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
	var name_cells = document.getElementsByClassName("namecell");
	for (var i=0; i<name_cells.length; i++) {
		autocomplete(name_cells[i], names);
	}
}

dropdownRegister();
