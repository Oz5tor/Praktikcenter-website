<style type="text/css">
.centerText{
    text-align: center;
}
.even{
    background-color:lightgray;
}
.uneven{
    background-color:darkgray;
}
</style>
<div>
    <div class="centerText"><h2>Praktikcenterts udstyrs liste</h2></div>
    <hr>
    <?php
        // Fetch all equipment types
        $sql_equipment_type="select * from eqType";
        $equipment_type_result = mysqli_query($db_conn, $sql_equipment_type) or die (mysqli_error($db_conn));
        // Fetch all producents
        $sql_producent="select * from producent ";
        $producent_result = mysqli_query($db_conn, $sql_producent) or die (mysqli_error($db_conn));
        // ===============================================================
    ?>
    <div class="centerText">
        <form method="post">
        Type: 
        <select required name="eqType">
            <option selected name="eqType" value="eqType">V&aelig;lg</option>
            <?php
                while ($equipment_type = mysqli_fetch_assoc($equipment_type_result)){
                   echo "<option value='".$equipment_type['id']."'>".$equipment_type['name']."</option>";
                }
            ?>
        </select>
        Producent: 
        <select required name="producent">
            <option selected name="producent" value="producent">V&aelig;lg</option>
            <?php 
                while ($producent_list_row = mysqli_fetch_assoc($producent_result)){
                   echo "<option value='".$producent_list_row['id']."'>".$producent_list_row['name']."</option>";
                }
            ?>
        </select>
        <input type="submit" id="show_info" name="show_info" value="Find">  
    </form>
    </div>
    <hr>
    <table border="0" width="755">
        <tr class="uneven">
        <th align="center">SN</th>
        <th align="center">Producent</th>
        <th align="center">Type</th>
        <th align="center">Beskrivelse</th>
        <th align="center">Lokation</th>
        </tr>
        <?php
        if(isset($_POST['show_info'])){
            $eqType = $_POST['eqType'];
            $producent = $_POST['producent'];
            // if producent and priduct type isset
            if ($producent != 'producent' && $eqType != 'eqType'){
                $Equip_sql="select eqType.name,
                                  producent.name As name1,
                                  equipment.spec,
                                  equipment.name As name2,
                                  equipment.fk_prodId,
                                  equipment.sn From equipment
                                    Inner Join eqType On eqType.id = equipment.fk_eqTypeId 
                                    Inner Join producent On producent.id = equipment.fk_prodId
                                    where fk_prodId = '$producent' AND fk_eqTypeId = '$eqType'"; //WIP
            } 
            // if producent isset
            elseif ($producent != 'producent') {
                $Equip_sql="select eqType.name,
                                  producent.name As name1,
                                  equipment.spec,
                                  equipment.name As name2,
                                  equipment.fk_prodId,
                                  equipment.sn From equipment
                                    Inner Join eqType On eqType.id = equipment.fk_eqTypeId 
                                    Inner Join producent On producent.id = equipment.fk_prodId
                                    where fk_prodId = '$producent'"; //WIP
            }
            // if product type isset
            elseif($eqType != 'eqType'){
                $Equip_sql="select eqType.name,
                                  producent.name As name1,
                                  equipment.spec,
                                  equipment.name As name2,
                                  equipment.fk_prodId,
                                  equipment.sn From equipment
                                    Inner Join eqType On eqType.id = equipment.fk_eqTypeId 
                                    Inner Join producent On producent.id = equipment.fk_prodId
                                    where fk_eqTypeId = '$eqType'"; //WIP
            }
        }
        else{
            $Equip_sql = "Select  eqType.name,
                                  producent.name As name1,
                                  equipment.spec,
                                  equipment.name As name2,
                                  equipment.fk_prodId,
                                  equipment.sn From equipment
                                    Inner Join eqType On eqType.id = equipment.fk_eqTypeId 
                                    Inner Join producent On producent.id = equipment.fk_prodId";
        }
        $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
        $temp_counter = 1;
        while($Equip_row = mysqli_fetch_assoc($Equip_result)){
            
            if($temp_counter%2 == 0){
                $even_uneven = "uneven";
            }else{
                $even_uneven = "even";
            }
        ?>
        <tr class="<?php echo $even_uneven; ?>">
            <td><?php echo $Equip_row['sn']; ?></td>
            <td><?php echo $Equip_row['name1']; ?></td>
            <td><?php echo $Equip_row['name']; ?></td>
            <td><?php echo $Equip_row['spec']; ?></td>
            <td><?php //echo $Equip_row['']; ?></td>
        </tr>
        <?php
            $temp_counter++;
        }
        ?>
    </table>
</div>