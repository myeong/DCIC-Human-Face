<?php
include('class/mysql_crud.php');
$db = new Database();
$db->connect();
$data = $db->escapeString("name5@email.com"); // Escape any input before insert
$db->insert('CRUDClass',array('name'=>'Name 5','email'=>$data));  // Table name, column names and respective values
$res = $db->getResult();  
print_r($res);