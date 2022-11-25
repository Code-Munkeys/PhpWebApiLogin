<?php
require('db.php');

$username=$_POST[z1];
$password=md5($_POST[z2]);

$sql="select * from user where LOWER(username)=LOWER('$username') and password='$password'";

$res=db_select($sql);
$z=mysqli_num_rows($res);
$row=mysqli_fetch_array($res);

if ($z!=''){
	$info[]=array("status"=>1, "userid"=>$row[id], "username"=>$row[username], "firstname"=>$row[firstname], "surname"=>$row[surname], "email"=>$row[email], "phonenumber"=>$row[phonenumber], "photo"=>$row[photo], "latitude"=>$row[latitude], "longitude"=>$row[longitude], "radius"=>$row[radius], "unit"=>$row[unit]);
	echo json_encode($info);
} else {
	$info[]=array("status"=>0, "sms"=>"Invalid username or password", "username"=>$_POST[z1], "password"=>$_POST[z2]);
	echo json_encode($info);
}

// Developed by Franz Ayestaran on 10/6/15.
// Copyright (c) 2022 CodeMunkeys All rights reserved.
 
// You may use this code in your own projects and upon doing so, you the programmer are solely
// responsible for determining it's worthiness for any given application or task. Here clearly
// states that the code is for learning purposes only and is not guaranteed to conform to any
// programming style, standard, or be an adequate answer for any given problem.

//https://secure.virtual-private-server.net/phpwebapilogin/login.php?username=guestuser&password=0d107d09f5bbe40cade3de5c71e9e9b7
?>