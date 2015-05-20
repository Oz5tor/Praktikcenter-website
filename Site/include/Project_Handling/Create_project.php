
<?php 
// ===============================================================================
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_project']))){
    
}
    else {header('location: index.php');} 
// ===============================================================================
if(isset($_POST['create_project']))
    
{
$Name           = mysqli_real_escape_string($db_conn,strip_tags($_POST['projectName']));
$leader         = mysqli_real_escape_string($db_conn,strip_tags($_POST['leader']));
$inst           = mysqli_real_escape_string($db_conn,strip_tags($_POST['inst']));
$description    = mysqli_real_escape_string($db_conn,strip_tags($_POST['projectDescription']));
$startDate      = strtotime(mysqli_real_escape_string($db_conn,strip_tags($_POST['startDate'])));
$endDate        = strtotime(mysqli_real_escape_string($db_conn,strip_tags($_POST['endDate'])));
// ===============================================================================
    
 

$sqlState   ="insert into project(name,description,leaderId,inst,start,end) values('$Name','$description',$leader,$inst,$startDate,$endDate)";
mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));

// ===============================================================================

$sqlState   ="select id from project where name = '$Name' AND leaderId=$leader";
                                          
$sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           $projectId = $row['id'];
                        }

// ===============================================================================

$sqlState   ="insert into userProject(userId,projectId) values($leader,$projectId)";
mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
}
?>



<h1>Opret nyt projekt</h1>

<form action="" method="post">
<table>
        <tr>
            <td>Projekt navn:</td>
            <td><input type="text" min="2" max="40" id="projectName" name="projectName" required></td>
        </tr>
        
        <tr>
            <td>Projektleder: </td>
            <td><select required name="leader" style="width: 175px">
                    <option selected value="" >V&aelig;lg Projektleder: </option>
                   
                    <?php 
                        $sqlState="Select user.fName, user.lName, user.id From roles Inner Join userRoles On roles.id = userRoles.roleId Inner Join user On user.id = userRoles.userId where roles.id = 1";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['fName']." ".$row['lName']."</option>";
                        }
                    ?>
                </select></td>
        </tr>
    
          <tr>
             <td>Instruktør på projektet: </td>
            <td>
                <select required name="inst" style="width: 175px">
                    <option selected value="" >V&aelig;lg Instuktør</option>
                   
                    <?php 
                        $sqlState="Select user.fName, user.lName, user.id From roles Inner Join userRoles On roles.id = userRoles.roleId Inner Join user On user.id = userRoles.userId where roles.id = 2";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['fName']." ".$row['lName']."</option>";
                        }
                    ?>
                </select>
            </td>            
        </tr>
        
        <tr>
            <td>Dato for projektstart:</td>
            <td><input type="text" id="datepicker2" name="startDate" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required></td>
        </tr>
    
        <tr>
            <td>Dato for projektafslutning:</td>
            <td><input type="text" id="datepicker" name="endDate" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required></td>
        </tr>
    
        <tr>
            <td>Projekt Beskrivelse:</td>
            <td><textarea cols="50" rows="5" name="projectDescription">Indtast en udførlig beskrivelse af projektet.</textarea></td>
        </tr>
    
        <tr>
            <td colspan="2">
                <input type="submit" id="create_user" name="create_project" value="Opret Projekt">
            </td>
        </tr>
    
        
</table>
</form>
<?php

?>