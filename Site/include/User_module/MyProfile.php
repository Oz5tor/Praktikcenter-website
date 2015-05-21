<?php
$user = $_SESSION['user'];
$user_sql = "Select * From user where id = '$user'";
$user_result = mysqli_query($db_conn, $user_sql) or die (mysqli_error($db_conn));
$user_row = mysqli_num_rows($user_result); 
?>

<div style="border:1px solid black; height:500px;">

</div>