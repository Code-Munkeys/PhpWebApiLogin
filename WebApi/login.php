<?php
require('db.php');

$username=$_POST[z1];
$password=md5($_POST[z2]);

$res=db_select("select * from user where LOWER(username)=LOWER('$username') and password='$password'");
$z=mysql_num_rows($res);
$row=mysql_fetch_array($res);

if ($z!=''){
	$info[]=array("status"=>1, "userid"=>$row[id], "username"=>$row[username], "firstname"=>$row[firstname], "surname"=>$row[surname], "email"=>$row[email], "phonenumber"=>$row[phonenumber], "photo"=>$row[photo], "latitude"=>$row[latitude], "longitude"=>$row[longitude], "radius"=>$row[radius], "unit"=>$row[unit]);
	echo json_encode($info);
} else {
	$info[]=array("status"=>0, "sms"=>"Invalid username or password", "username"=>$_POST[z1], "password"=>$_POST[z2]);
	echo json_encode($info);
}
?>