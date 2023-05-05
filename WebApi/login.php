<?php
$dbhost = 'localhost';
$dbuser = 'phpwebapilogin';
$dbpass = 'L3tm31n.';
$dbname = 'phpwebapilogin';

//$username=$_GET['z1'];
//$password=$_GET['z2'];

$username=$_POST['z1'];
$password=md5($_POST['z2']);

//$username="guestuser";
//$password=md5("letmein");

$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);

if ($conn -> connect_errno) {
  echo "Failed to connect to MySQL: " . $conn -> connect_error;
  exit();
}

$sql="select * from user where LOWER(username)=LOWER('$username') and password='$password'";

$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
  // output data of each row
  while($row = $result->fetch_assoc()) 
  {
    $info[]=array("status"=>1, "userid"=>$row["id"], "username"=>$row["username"], "firstname"=>$row["firstname"], "surname"=>$row["surname"], "email"=>$row["email"], "phonenumber"=>$row["phonenumber"], "photo"=>$row["photo"], "latitude"=>$row["latitude"], "longitude"=>$row["longitude"], "radius"=>$row["radius"], "unit"=>$row["unit"]);
	echo json_encode($info);
  }
} 
else 
{
  $info[]=array("status"=>0, "sms"=>"Invalid username or password");
echo json_encode($info);
}

$conn -> close();

// Developed by Franz Ayestaran on 10/6/15.
// Copyright (c) 2022 CodeMunkeys All rights reserved.
 
// You may use this code in your own projects and upon doing so, you the programmer are solely
// responsible for determining it's worthiness for any given application or task. Here clearly
// states that the code is for learning purposes only and is not guaranteed to conform to any
// programming style, standard, or be an adequate answer for any given problem.

//https://secure.codemunkeys.co.uk/phpwebapilogin/login.php?z1=guestuser&z2=0d107d09f5bbe40cade3de5c71e9e9b7
?>