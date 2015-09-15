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
if(isset($_POST['create_eq'])){
    $producent      = mysqli_real_escape_string($db_conn,strip_tags($_POST['producent']));
    $eqType      = mysqli_real_escape_string($db_conn,strip_tags($_POST['eqType']));
    $eqDescription      = mysqli_real_escape_string($db_conn,strip_tags($_POST['eqDescription']));
    $serialNumber      = mysqli_real_escape_string($db_conn,strip_tags($_POST['serialNumber']));
    $name      = mysqli_real_escape_string($db_conn,strip_tags($_POST['name']));
    $sqlState   ="insert into equipment(name,sn,fk_prodId,fk_eqTypeId,spec) values('$name','$serialNumber','$producent','$eqType','$eqDescription')";
    mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
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
        // Fetch all locations
        $sql_location="select * from departments";
        $location_result=mysqli_query($db_conn, $sql_location) or die (mysqli_error($db_conn));
        // ===============================================================
    ?>
    <div class="centerText">
        <form method="post">
        <table align="center">
            <tr>
                <td>Producent: </td>
                <td><select required name="producent">
                    <option selected name="producent" value="producent">V&aelig;lg</option>
                    <?php 
                        while ($producent_list_row = mysqli_fetch_assoc($producent_result)){
                        echo "<option value='".$producent_list_row['id']."'>".$producent_list_row['name']."</option>";
                        }
                    ?>
                </select></td>
            </tr>
            <tr>
                <td>Type: </td>
                <td><select required name="eqType">
                    <option selected name="eqType" value="eqType">V&aelig;lg</option>
                    <?php
                        while ($equipment_type = mysqli_fetch_assoc($equipment_type_result)){
                        echo "<option value='".$equipment_type['id']."'>".$equipment_type['name']."</option>";
                        }
                    ?>
                </select></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input required type="text" id="name" name="name"></td>
            </tr>
            <tr>
                <td>Beskrivelse:</td>
                <td><input required type="text" id="eqDescription" name="eqDescription"></td>
            </tr>
            <tr>
                <td>Serie nummer:</td>
                <td><input required type="text" id="serialNumber" name="serialNumber"></td>
            </tr>
            <tr>
                <td>Lokation:</td>
                <td><select required name="location">
                    <option selected name="location" value="location">V&aelig;lg</option>
                    <?php 
                        while ($location_list_row = mysqli_fetch_assoc($location_result)){
                        echo "<option value='".$location_list_row['id']."'>".$location_list_row['name']."</option>";
                        }
                    ?>
                </select>
            </tr>
            <tr>
            <td><input type="submit" id="create_eq" name="create_eq" value="Opret"></td>
            </tr>
            </table>
            </form>
    </div>
</div>