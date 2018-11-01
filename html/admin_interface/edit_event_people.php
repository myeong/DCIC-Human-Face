<?php
function people_names($event_id) {
	ini_set('display_errors', 1);

	$connect = pg_connect('host=' . DBHOST . ' dbname=' . DBNAME . ' user=' . DBUSER . ' password=' . DBPASS);
	if (!$connect){
		die("Error in connection!");
	}

	$q = "SELECT e.event_id, epa.id as event_asso_id, epa.role, peo.person_id, peo.name
			FROM humanface.events e
            JOIN humanface.event_people_assoc epa on e.event_id = epa.event_id
            JOIN humanface.people peo on epa.person_id = peo.person_id
 			WHERE e.event_id=" . $event_id . "
			ORDER BY e.event_id, event_asso_id, peo.person_id;";

	$result = pg_query($connect, $q);
	if(!$result){
		die("Error in SQL query: " . pg_last_error());
	}

	while ($row = pg_fetch_array($result)) {
			$data = array(
				"event_id" => $row["event_id"],
				"event_asso_id" => $row["event_asso_id"],
				"role" => $row["role"],
				"person_id" => $row["person_id"],
				"name" => $row["name"]
			);
			$datas[] = $data;
	}
	return $datas;

	pg_free_result($result);
	pg_close($connect);
}
?>