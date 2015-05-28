<?php
$id = mysqli_real_escape_string($db_conn,strip_tags($_GET['id']));
$user_sql = "Select * From user where id='$id'";
$user_result = mysqli_query($db_conn, $user_sql) or die (mysqli_error($db_conn));
$user_row = mysqli_fetch_assoc($user_result);
$eduInt = $user_row['edu'];
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


</style>
<div>
    <div id="baseinfo" class="borderbottom">
        <?php include_once('include/User_module/UserBaseInfo.php'); ?>
    </div>
    <br>
    
        <?php
        $projects_sql = "Select * From userProject Inner Join project On project.id = userProject.projectId where userId = $id order by start ASC";
        $projects_result = mysqli_query($db_conn, $projects_sql) or die (mysqli_error($db_conn));
        while ($projects_row = mysqli_fetch_assoc($projects_result)){
            $name = $projects_row['name'];
            $start = $projects_row['start'];
            $end = $projects_row['end'];
            $proID = $projects_row['id'];
        ?>
            <div style="margin-left:5px;margin-right:5px; margin-bottom:5px;width:365px; border: 1px solid black; float:left;">
                <a href="?administration=Projekt Oversigt&projectId=<?php echo $proID; ?>"><?php echo $name; ?></a><hr>
                <div>
                    <div style="float:left; border-right:1px solid black; padding:5px;">
                        <div style="float:left;">
                            <?php $startDate = gmdate("d-m-Y",$start); $endDate = gmdate("d-m-Y",$end); ?>
                            <?php echo "Start dato: ".$startDate;?>
                        </div>
                        <div>
                            <?php echo " Slut dato: ".$endDate?>
                        </div>
                    </div>
                    <div style="float:right; padding:5px;">
                        Dage tilbage: <?php $date = date_create();
                        $currentDate = date_timestamp_get($date);
                        $dayLeft = $end - $currentDate;
                        $PrintDLeft = $dayLeft / 86400 % 2200;
                        echo $PrintDLeft; ?>
                    </div>
                    
                </div>
    </div>
        <?php
        }
        ?>
    <span style="display:block; clear:both;"></span>
</div>