<?php
include('crud/class/mysql_crud.php');

function get_buildings($st_name = null, $st_num = null, $apt_num = null, $land_use = null, 
						$tenant_name = null, $owner_name = null){

	$db = new Database();
	$db->connect();
	$db->select('buildings'); // Table name
	$res = $db->getResult();
	return $res;
}

function insert_building($st_name, $st_num = null, $apt_num = null, $land_use = null, 
						$tenant_name = null, $area_of_imps=null, $owner_name = null,
						$case_id, $tenants_id, $owner_id){
	$db = new Database();
	$db->connect();
	$data = $db->escapeString($st_name); // Escape any input before insert
	$db->insert('buildings',array(
		'st_name'=>$st_name,
		'st_num'=>$st_num,
		'apt_num'=>$apt_num,
		'land_use'=>$land_use,
		'area_of_imps'=>$area_of_imps,
		'case_id'=>$case_id, 
		'tenants_id'=>$tenants_id, 
		'owner_id'=>$owner_id
		));  
	$res = $db->getResult();  	
}

function insert_case($concurred_price, $date_concurred, $date_prel_title_search,
					$date_offer_made, $date_offer_accepted, $date_condemn_approval,
					$date_assigned_to_attorney, $date_petition_filed, 
					$date_commis_hearing, $date_order_vesting_title,
					$date_final_title_certi, $block_num, $parcel_num, $ward_num){

}