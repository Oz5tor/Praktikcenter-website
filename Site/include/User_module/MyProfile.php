<?php
$id = mysqli_real_escape_string($db_conn,strip_tags($_GET['id']));
$user_sql = "Select * From user where id='$id'";
$user_result = mysqli_query($db_conn, $user_sql) or die (mysqli_error($db_conn));
$user_row = mysqli_fetch_assoc($user_result);
$eduInt = $user_row['edu'];
$tempt_time = time();
// ====================
?>

<style type="text/css">
.borderbottom {
    border-bottom:1px solid black;
}
.profilepic{
    width:120px;
    vertical-align:middle;
    margin-right:10px;
    float:left;
}
.userinfo{
    min-width:400px;
    max-width:620px;
    float:left;
}
#projectsholder{
    margin-left:5px;
    margin-right:5px;
    margin-bottom:5px;
    width:365px; 
    border:1px solid black;
    float:left;
}
.projectStartEnd {
    float:left; 
    border-right:1px solid black;
    padding:5px;
}
.daysleft{
    float:left;
    padding:5px;
    width:45%;
    height:45px;
    vertical-align:middle;
}
.textCenter{
    text-align:center;
}


</style>
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