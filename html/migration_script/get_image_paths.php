<?php

$path = "images/properties";
$data = array();

if ($handle = opendir($path)) {
	$i = 0;
    while (false !== ($file = readdir($handle))) {
        if ('.' === $file) continue;
        if ('..' === $file) continue;

        $data[$i] = basename($file);
        $i++;
    }
    closedir($handle);
}

echo json_encode($data);			

?>
