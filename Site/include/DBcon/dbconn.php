<?php 
    $db_host="192.168.4.10"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
    $db_conn -> set_charset("utf8");
?>  