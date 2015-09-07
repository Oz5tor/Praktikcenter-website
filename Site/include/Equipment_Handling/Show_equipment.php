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

<?php
if(isset($_POST['create_item'])){
    header("location:?administration=Opret udstyr");
}

function countEquipment($Equip_result,$db_conn,$Equip_sql)
{
    ?>
<hr>
    <table border="0" width="755">
        <tr class="uneven">
            <th align="center">Antal</th>
            <th align="center">Type</th>
            <th align="center">Producent</th>
            <th align="center">Beskrivelse</th>
            <th align="center">Produkt navn</th>
        </tr>
        <?php
    //Counting equipment
    $temp_counter=1;
        $type=array();
        $producent=array();
        $spec=array();
        $unique_name = 0;
        $name2_temp=array();
        $name2_count=array();
        while($Equip_row = mysqli_fetch_assoc($Equip_result))
        {
            if($unique_name==0)
            { 
                array_unshift($name2_temp,$Equip_row['name2']);
                array_unshift($type,$Equip_row['name']);
                array_unshift($producent,$Equip_row['name1']);
                array_unshift($spec,$Equip_row['spec']);
                $unique_name++;
                array_unshift($name2_count,1);
            }
            else
            {
                $count=0;
                foreach($name2_temp as $value)
                {
                    if($Equip_row['name2']==$value)
                    {
                        $name2_count[$count]++;
                        break;
                    }
                    else
                    {
                        array_unshift($type,$Equip_row['name']);
                        array_unshift($producent,$Equip_row['name1']);
                        array_unshift($spec,$Equip_row['spec']);
                        array_unshift($name2_temp,$Equip_row['name2']);
                        $unique_name++;
                        array_unshift($name2_count,1);
                        break;
                    }
                    $count++;
                }
            }
        }

        $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
        $count=0;
        foreach($name2_temp as $values)
        {
            
            if($temp_counter%2 == 0){
                $even_uneven = "uneven";
            }else{
                $even_uneven = "even";
            }
        ?>
        <tr class="<?php echo $even_uneven; ?>">
            <td><?php echo $name2_count[$count] ; ?></td>
            <td><?php echo $type[$count]; ?></td>
            <td><?php echo $producent[$count]; ?></td>
			<td><?php echo $spec[$count]; ?></td>
            <td><?php echo $name2_temp[$count]; ?></td>
        </tr>
        <?php
            $temp_counter++;
            $count++;
        }
        $temp_counter=1;
        //End of counting and setup
}

function searchEquipment($Equip_result,$db_conn,$Equip_sql)
{
    ?>
    <hr>
    <table border="0" width="755">
        <tr class="uneven">
            <th align="center">Type</th>
            <th align="center">Producent</th>
            <th align="center">Beskrivelse</th>
            <th align="center">Produkt navn</th>
        </tr>
        <?php
    $temp_counter = 1;
    while($Equip_row = mysqli_fetch_assoc($Equip_result)){
            
            if($temp_counter%2 == 0){
                $even_uneven = "uneven";
            }else{
                $even_uneven = "even";
            }
            if($Equip_row['name2']=="ThinkCentre M73"){
                      $hello = "woop woop";
            }
            else{
                $hello="nope";
            }
            
        ?>
        <tr class="<?php echo $even_uneven; ?>">
            <td><?php echo $Equip_row['name']; ?></td>
            <td><?php echo $Equip_row['name1']; ?></td>
			<td><?php echo $Equip_row['spec']; ?></td>
            <td><?php echo $Equip_row['name2']; ?></td>
        </tr>
        <?php
            $temp_counter++;
        
        
    }
}
?>
<div>
    <div class="centerText"><h2>Praktikcenterets udstyrs liste</h2></div>
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
        <?php
        if(isset($_SESSION['AddEquipment']) == 1)
        {
        ?>
        <form method="post">
            <input type="submit" id="create_item" name="create_item" value="Opret udstyr">  
        </form>
        <?php
        }
        ?>
    </div>
    <?php
    /*
    <hr>
    <table border="0" width="755">
        <tr class="uneven">
            <th align="center">Antal</th>
            <th align="center">Type</th>
            <th align="center">Producent</th>
            <th align="center">Beskrivelse</th>
            <th align="center">Produkt navn</th>
        </tr>*/?>
        <?php
        if  (isset($_POST['create_item'])){
            
        }
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
                                    where fk_prodId = '$producent' AND fk_eqTypeId = '$eqType'
									Order By name2 ASC, name1 ASC, sn ASC"; //WIP
                $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
                searchEquipment($Equip_result,$db_conn,$Equip_sql);
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
                                    where fk_prodId = '$producent'
									Order By name2 ASC, name1 ASC, sn ASC"; //WIP
                $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
                searchEquipment($Equip_result,$db_conn,$Equip_sql);
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
                                    where fk_eqTypeId = '$eqType'
									Order By name2 ASC, name1 ASC, sn ASC"; //WIP
                $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
                searchEquipment($Equip_result,$db_conn,$Equip_sql);
            }
			else{
            $Equip_sql = "Select  eqType.name,
                                  producent.name As name1,
                                  equipment.spec,
                                  equipment.name As name2,
                                  equipment.fk_prodId,
                                  equipment.sn From equipment
                                    Inner Join eqType On eqType.id = equipment.fk_eqTypeId 
                                    Inner Join producent On producent.id = equipment.fk_prodId
									Order By name2 ASC, name1 ASC, sn ASC";
                $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
                countEquipment($Equip_result,$db_conn,$Equip_sql);
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
                                    Inner Join producent On producent.id = equipment.fk_prodId
									Order By name2 ASC, name1 ASC, sn ASC";
            $Equip_result = mysqli_query($db_conn, $Equip_sql) or die(mysqli_error($db_conn));
            countEquipment($Equip_result,$db_conn,$Equip_sql);
        }
        ?>
    </table>
</div>