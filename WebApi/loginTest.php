<?php

$dbhost = 'localhost';
$dbuser = 'phpwebapilogin';
$dbpass = 'L3tm31n.';
$dbname = 'phpwebapilogin';

$username="guestuser";
$password=md5("letmein");

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

if (!$conn) 
	{
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
	}

$sql="select * from user where LOWER(username)=LOWER('$username') and password='$password'";

$result = $conn->query($sql);

if ($result->num_rows > 0) 
{
  // output data of each row
  while($row = $result->fetch_assoc()) 
  {
    $info[]=array("status"=>1, "userid"=>$row[id], "username"=>$row[username], "firstname"=>$row[firstname], "surname"=>$row[surname], "email"=>$row[email], "phonenumber"=>$row[phonenumber], "photo"=>$row[photo], "latitude"=>$row[latitude], "longitude"=>$row[longitude], "radius"=>$row[radius], "unit"=>$row[unit]);
	
	echo json_encode($info);
  }
} 
else 
{
  $info[]=array("status"=>0, "sms"=>"Invalid username or password");
echo json_encode($info);
}

mysqli_close($conn);

// Developed by Franz Ayestaran on 10/6/15.
// Copyright (c) 2022 CodeMunkeys All rights reserved.
 
// You may use this code in your own projects and upon doing so, you the programmer are solely
// responsible for determining it's worthiness for any given application or task. Here clearly
// states that the code is for learning purposes only and is not guaranteed to conform to any
// programming style, standard, or be an adequate answer for any given problem.
?>