<?php
include('class/mysql_crud.php');
$db = new Database();
$db->connect();
$db->select('CRUDClass','CRUDClass.id,CRUDClass.name,CRUDClassChild.name','CRUDClassChild ON CRUDClass.id = parentId','CRUDClass.name="Name 1"','id DESC'); // Table name, Column Names, JOIN, WHERE conditions, ORDER BY conditions
$res = $db->getResult();
print_r($res);
