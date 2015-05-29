
<?php 
// ===============================================================================
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_project']))){

if(isset($_POST['create_project']))
    
{    
$Name           = mysqli_real_escape_string($db_conn,strip_tags($_POST['proTempName']));
$description    = mysqli_real_escape_string($db_conn,strip_tags($_POST['projectDescription']));
$FK_CatId       = mysqli_real_escape_string($db_conn,strip_tags($_POST['FK_CatId']));
$Frs_file       = mysqli_real_escape_string($db_conn,strip_tags($_POST['Frs_file']));
// ===============================================================================
$sqlState   ="insert into proTemp(name, description, FK_CatId, Frs_file) values('$Name','$description','$FK_CatId','$Frs_file')";
mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));

// ===============================================================================
/*
$sqlState   ="select id from proTemp where name = '$Name' AND description=$description";
                                          
$sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));     

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           $proTempId = $row['id'];
                        }*/}
    // ===============================================================================
?>

<h1>Opret ny projekt skabelon</h1>

<form action="" method="post">
<table>
        <tr>
            <td>Projekt navn:</td>
            <td><input type="text" min="2" max="40"  name="proTempName" required></td>
        </tr>
        <tr>
            <td>Projekt Beskrivelse:</td>
            <td><textarea cols="50" rows="5" name="projectDescription">Indtast en udførlig beskrivelse af projektet.</textarea></td>
        </tr>
        <tr><td>kategori</td><td><input type="text" min="2" max="40"  name="FK_CatId" required></td></tr>
        <tr><td>Link til kravsspecifikation</td><td><input type="text" min="2" max="40"  name="Frs_fil" required></td></tr>
        <tr>
            <td colspan="2">
                <input type="submit"  name="create_project" value="Opret Projekt">
            </td>
        </tr>
    
        
</table>
</form>
<?php
}

else {header('location: index.php');} 
    
// ===============================================================================
?>