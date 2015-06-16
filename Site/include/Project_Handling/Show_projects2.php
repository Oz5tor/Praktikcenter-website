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
<div class="textCenter"><h1>Projekt oversigt over aktive projekter</h1></div>

<hr>
<?php
        $projects_sql = "SELECT * from project";
        $projects_result = mysqli_query($db_conn, $projects_sql) or die (mysqli_error($db_conn));
        $temp_any = mysqli_num_rows($projects_result);


if($temp_any >= 1){
    while ($projects_row = mysqli_fetch_assoc($projects_result)){
            $name = $projects_row['name'];
            $start = $projects_row['start'];
            $end = $projects_row['end'];
            $proID = $projects_row['id'];
        ?>
        <a href="?page=Projekt Oversigt&projectId=<?php echo $proID; ?>">
            <div id="projectsholder">
                <div class="textCenter borderbottom"><b><p><?php echo $name; ?></p></b></div>
                <div>
                    <div class="projectStartEnd">
                        <div style="float:left;">
                            <table>
                                <tr>
                                    <td>
                                        <?php $startDate = gmdate("d-m-Y",$start); $endDate = gmdate("d-m-Y",$end); ?>
                                        <?php echo "Start dato: "?>
                                    </td>
                                    <td><?php echo $startDate;?></td>
                                </tr>
                                <tr>
                                    <td>
                                        <?php echo "Slut dato: "?>
                                    </td>
                                    <td>
                                        <?php echo $endDate?>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="daysleft">
                        <table>
                            <tr>
                                <td>
                                    Dage tilbage: <?php $date = date_create();
                                    $currentDate = date_timestamp_get($date);
                                    $dayLeft = $end - $currentDate;
                                    $PrintDLeft = $dayLeft / 86400 % 2200;
                                    echo $PrintDLeft; ?>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </a>
        <?php
        }
        ?>
    <span style="display:block; clear:both;"></span>
<?php
}
?>