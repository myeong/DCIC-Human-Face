<html>
<?php include __DIR__.'/'.'tp_header.php'; ?>

<div class="container lg-font col-md-12">
	<form id="survey_form" class="form-horizontal" style="border:0px dotted black;" action="/input/<?php echo $content['parcel_id']; ?>" method="post">
		<div class="col-md-12" role="address-titlebar"  id="role-address-titlebar">
      		<div class="section-title"><h3>1. Address</h3></div>
    	</div>

    	<div class="col-md-12" role="address"  id="role-address">
      	
      		<div class="row col-md-12">
        		<div class="form-group col-md-12">
          			<div class="form-group col-md-10">
            			<label for="blk_number">Block Number<small class="required">*</small></label>
            			<input type="text" class="form-control" id="blk_number" name="blk_number" placeholder="" required minlength="2">
        			</div>
        		</div>
      		</div>
      	</div>

    </form>
</div>

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