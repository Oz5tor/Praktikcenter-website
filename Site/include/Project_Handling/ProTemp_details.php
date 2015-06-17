



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
        <tr><td><b>Instruktør: </b></td><td><?php echo $instName; ?></td><td><b>Besrivelse: </b></td></tr>
        <tr><td><b>Projektleder: </b></td><td> <select required name="proLeader">
                    <option selected name="proLeader" value="proLeader">Vælg projektleder</option>
                   
                    <?php 
                        $sqlState="select * from user";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['fName']." ".$row['lName']."</option>";
                        }
                    ?>
                    
                </select></td><td></td><td colspan="10"><?php echo $proTempDescription; ?></td></tr>
    </table>
 <input type="submit"  name="create_project" value="Aktiver Projektet">

</form>
