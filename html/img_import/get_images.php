<?php

ini_set('display_errors', 1);
require '../credentials.inc.php';
$conn = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);

if (!$conn){
	die("Error in connection!");
}

// A function to get corresponding parcel_id.
function get_parcel_id($conn, $block_num, $parcel_num){

	$query = "SELECT parcel_id FROM humanface.parcels WHERE parcel_no='$parcel_num' AND block_no='$block_num';";

	$result = pg_query($conn, $query);

	if (pg_num_rows($result) > 0) {
    	while($row = pg_fetch_assoc($result)) {
    		$id = $row["parcel_id"];
    	}
	} else {
		$insert_query = "INSERT INTO humanface.parcels (block_no, parcel_no) VALUES ('$block_num', '$parcel_num') RETURNING parcel_id;";

		$r = pg_query($conn, $insert_query);
		$row = pg_fetch_row($r);

		//write array to variable $user_id
		return $row[0];
	}
	return $id;
}

// A function to insert image path.
function insert_img_path($conn, $img_path, $parcel_id){
	$img_query = "INSERT INTO humanface.image_paths (img_path, parcel_id) VALUES ($img_path, $parcel_id);";

	pg_query($conn, $img_query);
}

// Code starts here.
$dir_path = "/var/www/html/images/properties/";

$files = scandir($dir_path);

foreach ($files as $file){
	if (strlen($file) > 2 && pathinfo($file)['extension'] == "png"){
		$prop = explode(".", $file);

		if (!$prop[0]){
			continue;
		}

		// extract the block number.
		$block_info = split('[_]', $prop[0])[0];

		// handle when block number contains a letter
		if (substr($block_info, -1) == "A" || substr($block_info, -1) == "B"){
			$block_info = substr($block_info, 0, strlen($block_info)-1);
		}	
		$block_num = substr($block_info, 1);

		// extract the parcel number.
		$parcel_info = split('[_&]', $prop[0])[1];
		if (substr($parcel_info, -1) == "A" || substr($parcel_info, -1) == "B"
			|| substr($parcel_info, -1) == "C"){
			$parcel_info = substr($parcel_info, 0, strlen($parcel_info)-1);
		}
		$parcel_num = substr($parcel_info, 1);

		// get image_paths table properties.
		// get corresponding parcel id.
		$parcel_id_fk = get_parcel_id($conn, strval($block_num),  strval($parcel_num));

		// get corresponding image path.
		$img_path = "'images/properties/" . $file . "'";

		echo "Block: " . $block_num . ", " . "Parcel: " . $parcel_num . "\n";
		echo "Parcel ID: " . $parcel_id_fk . "\n";

		// inserting the path.
		insert_img_path($conn, $img_path, $parcel_id_fk);
	}
}

echo "Successful";

pg_close($conn);
?>
