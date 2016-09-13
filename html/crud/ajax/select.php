<?php
header('content-type: application/json; charset=utf-8');
include('../class/mysql_crud.php');
$db = new Database();
$db->connect();
$db->select('CRUDClass','name'); // Table name, Column Names, WHERE conditions, ORDER BY conditions
$res = $db->getResult();
echo json_encode($res);

