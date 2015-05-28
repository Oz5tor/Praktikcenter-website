
<?php 
// ===============================================================================
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_project']))){
    
}
    else {header('location: index.php');} 
// ===============================================================================
if(isset($_POST['create_project']))
    
{
$Name           = mysqli_real_escape_string($db_conn,strip_tags($_POST['projectName']));
$description    = mysqli_real_escape_string($db_conn,strip_tags($_POST['projectDescription']));
$FK_CatId       = mysqli_real_escape_string($db_conn,strip_tags($_POST['FK_CatId']));
$Frs_file       = mysqli_real_escape_string($db_conn,strip_tags($_POST['Frs_file']));
// ===============================================================================
    
 

$sqlState   ="insert into proTemp(name,description,FK_CatId, Frs_file) values('$Name','$description',$FK_CatId, $Frs_file)";
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



<h1>Opret nyt projekt skabelon</h1>

<form action="" method="post">
<table>
        <tr>
            <td>Projekt navn:</td>
            <td><input type="text" min="2" max="40" id="projectName" name="projectName" required></td>
        </tr>
        
        
    
          
       
        <tr>
            <td colspan="2">
                <input type="submit" name="create_project" value="Opret Projekt">
            </td>
        </tr>
    
        
</table>
</form>
<?php

?>