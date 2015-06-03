<?php
// ===============================================================================
//Når brugeren har trykket på submint knappen vil denne kode blive eksekveret:
if(isset($_POST['create_user'])){
$fName      = mysqli_real_escape_string($db_conn,strip_tags($_POST['fName']));
$lName      = mysqli_real_escape_string($db_conn,strip_tags($_POST['lName']));
$add        = mysqli_real_escape_string($db_conn,strip_tags($_POST['address']));
$bday       = mysqli_real_escape_string($db_conn,strip_tags($_POST['datepicker']));
$inst       = mysqli_real_escape_string($db_conn,strip_tags($_POST['inst']));
$phone      = mysqli_real_escape_string($db_conn,strip_tags($_POST['phone']));
$email      = mysqli_real_escape_string($db_conn,strip_tags($_POST['email']));
$edu        = mysqli_real_escape_string($db_conn,strip_tags($_POST['edu']));
$eduEnd     = mysqli_real_escape_string($db_conn,strip_tags($_POST['eduEnd']));
$password   = hash('sha512', 'abc1234');
$maincurse  = mysqli_real_escape_string($db_conn,strip_tags($_POST['maincurse']));

$sqlState   ="insert into user(password,fName,lName,email,phone,address,bDay,edu,eduEnd,maincurse) values('$password','$fName','$lName','$email',$phone,'$add','$bday',$edu,'$eduEnd','$maincurse')";
mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
// ===============================================================================
$sqlState   = "select id from user where email = '$email'";
$sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
$row = mysqli_fetch_assoc($sql_result);
       $user_id= $row['id'];
// ===============================================================================
$sqlState   ="insert into userRoles values('$user_id',1)";
mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
// ==============================================================================
    foreach(mysqli_real_escape_string($db_conn,strip_tags($_POST['skills'])) as $key){       
        $sqlState   = "insert into userSkills(userId,skillId) values($user_id,$key)";
        mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
    }
}
// ===============================================================================
?>
<?php 
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_user']))){
?>
<h1>Opret ny Elev</h1>
<form action="" method="post">
    <table>
        <tr>
            <td>Fornavn: </td>
            <td><input type="text" min="2" max="40" id="fName" name="fName" required></td>
            <td>Efternavn: </td>
            <td><input type="text" min="2" max="50" id="lName" name="lName" required></td>
        </tr>
        <tr>
            
        </tr>
        <tr>
            <td>F&oslash;selsdag: </td>
            <td><input type="text" id="birthdayPicker" name="datepicker" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required></td>
            <td>Telefon: </td>
            <td><input type="tel" id="phone" name="phone" min="8" max="8" pattern="[0-9]{8}" required></td>
        </tr>
        <tr>
            <td>Addresse: </td>
            <td><input type="text" id="address" name="address" max="100" required></td>
            <td>Email: </td>
            <td><input type="email" id="email" name="email" max="35" required></td>
        </tr>
        <tr>
            <td>Afslutning af uddannelse: </td>
            <td><input type="text" id="eduEnd" name="edu_datepicker" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required></td>
            <td>Instruktør: </td>
            <td>
                <select required name="inst">
                    <option selected value="" >V&aelig;lg Instuktør</option>       
                    <?php 
                        $sqlState="Select user.fName, user.lName, user.id From roles
                                    Inner Join userRoles On roles.id = userRoles.roleId 
                                    Inner Join user On user.id = userRoles.userId where roles.id = 2";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['fName']." ".$row['lName']."</option>";
                        }
                    ?>
                </select>
            </td>
        </tr>
        <tr>
            <td>Udannelses: </td>
            <td colspan="3">
                <select required name="edu">
                    <option selected name="edu" value="edu">V&aelig;lg Udannelse</option>
                    <?php 
                        $sqlState="select * from edu";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['name']."</option>";
                        }
                    ?>                    
                </select>
            </td>
        </tr>
        <tr>
            <td>Hovedforløb: </td>
             <td>
                <select required name="maincurse">
                    <option selected value="" >V&aelig;lg Hovedforløb</option>
                        <option value=1>Hovedforløb 1</option>;
                        <option value=2>Hovedforløb 2</option>;
                        <option value=3>Hovedforløb 3</option>;
                        <option value=4>Hovedforløb 4</option>;
                        <option value=5>Hovedforløb 5</option>;
                        <option value=6>Hovedforløb 6</option>;                       
                </select>
             </td>
            <td>Kompetancer: </td>
            <td rowspan="9">
                <select size="8" multiple name="skills[]">  
                    <?php 
                        $sqlState="select * from skills";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                        while ($row = mysqli_fetch_assoc($sql_result)){?>
                         <option value="<?php echo $row['id']; ?>"> <?php echo $row['skill']; ?></option><?php
                        }
                   ?>
                </select>
              </td> 
        </tr>
        <tr>
            <td colspan="2"><input type="submit" id="create_user" name="create_user" value="Opret bruger"></td>
        </tr>
    </table>
</form>
<?php
}else {header('location: index.php');} 
?>
