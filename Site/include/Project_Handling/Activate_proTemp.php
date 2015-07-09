<?php
//Henter id fra url:
$proTempId = $_GET['proTempId'];
//Henter instruktør id fra sessionsvariabel:
$instId   = $_SESSION['user'];
//Henter instruktør navn fra databasen:
$proTemp_sql_state = "select * from user where id = $instId";
$proTemp_sql_result = mysqli_query($db_conn, $proTemp_sql_state) or die (mysqli_error($db_conn));

while ($row = mysqli_fetch_assoc($proTemp_sql_result)){
    $instName = $row['fName']." ".$row['lName'];
}

//laver dataudtræk fra database til senere brug
$proTemp_sql_state = "select * from proTemp where id = $proTempId";
$proTemp_sql_result = mysqli_query($db_conn, $proTemp_sql_state) or die (mysqli_error($db_conn));

while ($row = mysqli_fetch_assoc($proTemp_sql_result)){
$proTempName= $row['name'];
$proTempDescription= $row['description'];
$proTempId = $row['id'];
}

//Indsætter nyaktiveret projekt ind i databasen
if(isset($_POST['activateProject'])){    
    $proLeader      = mysqli_real_escape_string($db_conn,strip_tags($_POST['proLeader'])); 
    $start          = mysqli_real_escape_string($db_conn,strip_tags($_POST['projektStart'])); 
    $slut           = mysqli_real_escape_string($db_conn,strip_tags($_POST['projektSlut'])); 
    $proLeader      = mysqli_real_escape_string($db_conn,strip_tags($_POST['proLeader'])); 
    $proStart       = strtotime($start);
    $proSlut        = strtotime($slut);
    // ===============================================================================
    $sqlState   ="insert into project(name, leaderId, inst, start, end,FK_Protemp) 
                    values('$proTempName','$proLeader','$instId','$proStart','$proSlut','$proTempId');";
    mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
    
    $temp_sql = "SELECT * FROM project ORDER by id DESC limit 1";
    $temp_reslut = mysqli_query($db_conn, $temp_sql) or die(mysqli_error($db_conn));
    $temp_row = mysqli_fetch_assoc($temp_reslut);
    $last_id = $temp_row['id'];
    
    foreach($_POST['members'] as $member){
        $add_member = "INSERT INTO userProject (userId, projectId) values('$member','$last_id')";
        mysqli_query($db_conn, $add_member) or die(mysqli_error($db_conn));
    }
    
}
?>
<h1><?php echo $proTempName;?></h1>
<form method="post" action="">
    <table border="1">
        <tr>
            <td>
                <b>Instruktør: </b>
            </td>
            <td><?php echo $instName; ?></td>
            <td colspan="2"><b>Besrivelse: </b></td>
        </tr>
        <tr>
            <td><b>Projektleder: </b></td>
            <td> <select required name="proLeader">
                    <option selected name="proLeader" value="proLeader">Vælg projektleder</option>
                    <?php 
                        $sqlState="select * from user Where fk_role_id = 1";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['fName']." ".$row['lName']."</option>";
                        }
                    ?>
                </select>
            </td>
            <td colspan="10"><?php echo $proTempDescription; ?></td>
        </tr>
        <tr>
            <td><b>Elever:</b></td>
            <td colspan="3">
                <section class="container">
                    <div>
                        <!-- List of students start -->
                        <select id="leftValues" size="4" multiple>
                        <?php 
                            $students_sql = "Select * From user Where fk_role_id = 1";
                            $students_result = mysqli_query($db_conn, $students_sql) or die (mysqli_error($db_conn));
                            while ($students_row = mysqli_fetch_assoc($students_result)){
                            ?>
                            <option value="<?php echo $students_row['id']; ?>">
                                <?php echo $students_row['fName'].' '.$students_row['lName'] ?>
                            </option>
                            <?php
                            }
                        ?>
                        </select>
                        <!-- List of students end -->
                    </div>
                    <div>
                        <input type="button" id="btnLeft" value="&lt;&lt;" />
                        <input type="button" id="btnRight" value="&gt;&gt;" />
                    </div>
                    <div>
                        <select id="rightValues" name="members[]" size="4" multiple></select>
                    </div>
                </section>
            </td>
        </tr>
        <tr>
            <td><b>Start på projekt:</b></td>
            <td><input type="text" id="datepicker" name="projektStart" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required></td>
            <td><b>Afslutning af projekt: </b></td>
            <td><input type="text" id="datepicker2" name="projektSlut" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required></td>
        </tr>
        
    </table>
 <input type="submit"  name="activateProject" value="Aktiver Projektet">
</form>


<script type="text/javascript"> 
    $("#btnRight").click(function () {
    var selectedItem = $("#leftValues option:selected");
    $("#rightValues").append(selectedItem);
});

$("#btnLeft").click(function () {
    var selectedItem = $("#rightValues option:selected");
    $("#leftValues").append(selectedItem);
});
</script>