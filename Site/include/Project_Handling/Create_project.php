
<?php 
require_once("class/UpLoader.php");
// ===============================================================================
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_project']))){

if(isset($_POST['create_project']))    
{    
    $Name           = mysqli_real_escape_string($db_conn,strip_tags($_POST['proTempName']));
    $description    = mysqli_real_escape_string($db_conn,strip_tags($_POST['projectDescription']));
    $FK_CatId       = mysqli_real_escape_string($db_conn,strip_tags($_POST['FK_CatId']));
    //$Frs_file       = mysqli_real_escape_string($db_conn,strip_tags($_POST['Frs_file']));
    $AllowedFileTypeArray = array('jpg','png','pdf');
    $TargetDir = "img";
    $InputName = "Frs_fil";
    $retrun_msg = Topper_Uploade($InputName, $TargetDir, $AllowedFileTypeArray, "der skete en fejl");
// ===============================================================================
   /* if ($retrun_msg != false) {
        $sqlState   ="insert into proTemp(name, description, FK_CatId, Frs_file) values('$Name','$description','$FK_CatId','HTTP://google.dk')";
        mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));   
    }*/
    $sqlState   ="insert into proTemp(name, description, FK_CatId, Frs_file) values('$Name','$description','$FK_CatId','HTTP://google.dk')";
        mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
}
?>

<h1>Opret ny projekt skabelon</h1>

<form action="" method="post" enctype="multipart/form-data">
<table>
        <tr>
            <td>Projekt navn:</td>
            <td><input type="text" min="2" max="40" size="50" lang="da" name="proTempName" required></td>
        </tr>
        <tr>
            <td>Projekt Beskrivelse:</td>
            <td><textarea id="protemplate" cols="50" rows="5" name="projectDescription">Indtast en udførlig beskrivelse af projektet.</textarea></td>
        </tr>
    <tr>
        <td>Kategori</td>
        <td>
            <select  name="FK_CatId" required>
                <option value="">Vælg kategori</option>
                <?php
                $sql_cat_state="Select * from proTempCat";
                $sql_cat_resault = mysqli_query($db_conn, $sql_cat_state) or die (mysqli_error($db_conn));
                while ($row_cat = mysqli_fetch_assoc($sql_cat_resault)){
                 ?> <option value="<?php echo $row_cat['id'] ?>"> <?php echo $row_cat['name'];?></option><?php
                }
                
                ?>
                    
                
            </select>
        </td>
    </tr>
        <tr><td>Link til kravsspecifikation</td><td><input type="file" name="Frs_fil" required></td></tr>
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