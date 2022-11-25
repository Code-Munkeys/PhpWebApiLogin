<?php 
 $db_connection;
 $db_options['host'] = 'localhost';
 $db_options['user'] = 'phpwebapilogin';
 $db_options['password'] = 'L3tm31n.';
 $db_options['database'] = 'phpwebapilogin';

function db_stat()
{
    return "Queries: ".$GLOBALS['query_count']." db_connections: ".$GLOBALS['conn_count'];
}

function db_connect()
{
    global $db_options;
    global $db_connection;

    $db_connection = mysqli_connect($db_options['host'], $db_options['user'], $db_options['password'], $db_options['database']);

    if (!$db_connection) 
    {
        echo "Error: Unable to connect to MySQL." . PHP_EOL;
        echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
        echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
        exit;
    }

    $GLOBALS['conn_count']++;
}

function db_select($sql)
 {
    global $db_connection;

     if(!$db_connection)
         {
             db_connect();
         }

    $result = $db_connection -> query($sql);

    $GLOBALS['query_count']++;

    return $result;
 }

function clear($zip){
	$zip=str_replace("'", "&apos;", $zip);
	$zip=str_replace('"', '&quot;', $zip);
	$zip=strip_tags($zip);
	return $zip;
}

function dlina($text, $lenght){
	$text=strip_tags(htmlspecialchars_decode($text));
    $arr_str = explode(" ", $text);

	$arr = array_slice($arr_str, 0, $lenght);

	$new_str = implode(" ", $arr);
	 
	if (count($arr_str) > 2) 
	{
	   $new_str .= '...';
	} 
	return $new_str;
}

// Developed by Franz Ayestaran on 10/6/15.
// Copyright (c) 2022 CodeMunkeys All rights reserved.
 
// You may use this code in your own projects and upon doing so, you the programmer are solely
// responsible for determining it's worthiness for any given application or task. Here clearly
// states that the code is for learning purposes only and is not guaranteed to conform to any
// programming style, standard, or be an adequate answer for any given problem.

?>
