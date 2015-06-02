<?php
$id = mysqli_real_escape_string($db_conn,strip_tags($_GET['id']));
$user_sql = "Select * From user where id='$id'";
$user_result = mysqli_query($db_conn, $user_sql) or die (mysqli_error($db_conn));
$user_row = mysqli_fetch_assoc($user_result);
$eduInt = $user_row['edu'];
$tempt_time = time();
// ====================
?>
<div>
    <div id="baseinfo" class="">
        <?php include_once('include/User_module/UserBaseInfo.php'); ?>
    </div>
    <hr>
    <?php include_once('include/User_module/currunt_projects.php'); ?>
    <hr>
    <?php include_once('include/User_module/expride_projects.php'); ?>
    <hr>
</div>