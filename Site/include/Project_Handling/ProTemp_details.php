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

//laver dataudtræk fra database:

$proTemp_sql_state = "select * from proTemp";
$proTemp_sql_result = mysqli_query($db_conn, $proTemp_sql_state) or die (mysqli_error($db_conn));

while ($row = mysqli_fetch_assoc($proTemp_sql_result)){
$proTempName= $row['name'];
$proTempDescription= $row['description'] ;
}
?>
<h1><?php echo $proTempName;?></h1>
<form>
    <table border="1">
        <tr>
            <td>
                <b>Instruktør: </b>
            </td>
            <td><?php echo $instName; ?></td>
            <td><b>Besrivelse: </b></td>
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
            <td colspan="2">
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
                        <select id="rightValues" size="4" multiple></select>
                    </div>
                </section>
            </td>
        </tr>
    </table>
 <input type="submit"  name="create_project" value="Aktiver Projektet">
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