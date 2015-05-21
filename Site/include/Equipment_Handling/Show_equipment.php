<?php

//dbconnector:
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
?>

<?php

    $sqlState="select * from equipment";
    $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
?>

<h1>Udstyrs Oversigt</h1>
<form action="" method="post">
    <table>
        <tr>
            <td>Type Udstyr: </td>
            <td>
                <select required name="eqType">
                    <option selected name="eqType" value="eqType">V&aelig;lg</option>
                   
                    <?php 
                        $sqlState="select * from eqType";
                        $sql_tyOption = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_tyOption)){
                           echo "<option value='".$row['id']."'>".$row['name']."</option>";
                        }
                    ?>
                    
                </select>
                
            </td>
        </tr>
        <tr>
            <td>Producent: </td>
            <td>
                <select required name="producent">
                    <option selected name="producent" value="producent">V&aelig;lg</option>
                   
                    <?php 
                        $sqlState="select * from producent";
                        $sql_proOption = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_proOption)){
                           echo "<option value='".$row['id']."'>".$row['name']."</option>";
                        }
                    ?>
                    
                </select>
                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="show_info" name="show_info" value="Find">
            </td>
        </tr>
    </table>
</form>
    <?php 
    
if(isset($_POST['show_info'])){
        $eqType = $_POST['eqType'];
        $producent = $_POST['producent'];
    
    if ($eqType == 'eqType'){
        $sqlState="select * from equipment where fk_prodId = '$producent'"; //WIP
        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
        $sql_row = mysqli_num_rows($sql_result);
    } 
    elseif ($producent == 'producent') {
        $sqlState="select * from equipment where fk_eqTypeId = '$eqType'"; //WIP
        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
        $sql_row = mysqli_num_rows($sql_result);
    } 
    else{
        $sqlState="select * from equipment where fk_prodId = '$producent' AND fk_eqTypeId = '$eqType'"; //WIP
        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
        $sql_row = mysqli_num_rows($sql_result);
    }
    if ($sql_row >=1)
    {
    ?>
        <table border="1">
        <tr> 
            <td style="padding:10px; text-align:center">Navn </td>
            <td style="padding:10px; text-align:center">SN</td>
            <td style="padding:10px; text-align:center">Producent</td>
            <td style="padding:10px; text-align:center">Type</td>
            <td style="padding:10px; text-align:center">Specs</td>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($sql_result))
        {
        ?>
            <tr>   
            <td>
            <?php echo $row['name']; ?>
            </td>
            <td>
            <?php echo $row['sn']; ?>
            </td>
            <td>
            <?php 
            $proId = $row['fk_prodId'];
            $prod_sqlState="select * from producent where id = '$proId'";
            $prod_sql_proId = mysqli_query($db_conn, $prod_sqlState) or die (mysqli_error($db_conn));
            $prod_row = mysqli_fetch_assoc($prod_sql_proId);
            echo $prod_row['name']; ?>
            </td>
            <td>
            <?php
            $tyId = $row['fk_eqTypeId'];
            $ty_sqlState="select * from eqType where id = '$tyId'";
            $ty_sql_tyId = mysqli_query($db_conn, $ty_sqlState) or die (mysqli_error($db_conn));
            $ty_row = mysqli_fetch_assoc($ty_sql_tyId);
            echo $ty_row['name']; ?>
            </td>
            <td>
            <?php echo $row['spec']; ?>
            </td>
            </tr>
        <?php
          }   ?>
        </table>
    <?php
    }  else{   ?>
    <tr>
        <td>Søgningen gav ingen resultater...</td>
    </tr>
    <?php
    }   
}
        
?>
<?php
echo '<pre>';
print_r($_POST);
echo '</pre>';
?>