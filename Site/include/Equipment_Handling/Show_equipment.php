<?php

//dbconnector:
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
?>

<h1>Udstyrs Oversigt</h1>

<?php

    $sqlState="select * from equipment";
    $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));

?>