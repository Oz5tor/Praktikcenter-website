<?php
// ===============================================================================
//Når brugeren har trykket på submint knappen vil denne kode blive eksekveret:
if(isset($_POST['create_user'])){
$fName      = mysqli_real_escape_string($db_conn,strip_tags($_POST['fName']));
$lName      = mysqli_real_escape_string($db_conn,strip_tags($_POST['lName']));
$add        = mysqli_real_escape_string($db_conn,strip_tags($_POST['address']));
$bday       = strtotime($_POST['datepicker']);
$inst       = mysqli_real_escape_string($db_conn,strip_tags($_POST['inst']));
$phone      = mysqli_real_escape_string($db_conn,strip_tags($_POST['phone']));
$email      = mysqli_real_escape_string($db_conn,strip_tags($_POST['email']));
$edu        = mysqli_real_escape_string($db_conn,strip_tags($_POST['edu']));
$eduEnd     = strtotime($_POST['edu_datepicker']);
$password   = hash('sha512', 'abc1234');
$maincurse  = mysqli_real_escape_string($db_conn,strip_tags($_POST['maincurse']));
$sqlState   ="insert into user(password,fName,lName,email,phone,address,bDay,edu,eduEnd,maincurse,fk_role_id) values('$password','$fName','$lName','$email',$phone,'$add','$bday',$edu,'$eduEnd','$maincurse', '1')";
mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
// ===============================================================================
$sqlState   = "select id from user where email = '$email'";
$sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
$row = mysqli_fetch_assoc($sql_result);
       $user_id= $row['id'];
// ==============================================================================
    foreach($_POST['skills'] as $key){       
        $sqlState   = "insert into userSkills(userId,skillId) values($user_id,$key)";
        mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
    }
    sleep(2);
    header("location:index.php?page=Profil&id=$user_id");
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
                        $sqlState="Select * from user where fk_role_id = '2'";
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
                <select required id="edu" name="edu">
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
                <div class="container">
                    <?php 
                $sqlState="select * from edu";
                $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                while ($row = mysqli_fetch_assoc($sql_result)){
                    $temp_eduID = $row['id'];
                ?>
                <div class="<?php echo $temp_eduID ?>">
                    <select multiple name="skills[]">
                <?php
                  $sql_edu_skill="Select * From edu_skills where fk_edu_id = $temp_eduID ";
                  $sql_edu_skill = mysqli_query($db_conn, $sql_edu_skill) or die (mysqli_error($db_conn));
                  while ($row_edu_skill = mysqli_fetch_assoc($sql_edu_skill)){
                      ?>
                    <option value="<?php echo $row_edu_skill['fk_skill_id']; ?>">
                        <?php
                            $temp_skillID = $row_edu_skill['fk_skill_id'];
                            $sql_skill="Select * From skills where id = $temp_skillID ";
                            $sql_skill = mysqli_query($db_conn, $sql_skill) or die (mysqli_error($db_conn));
                            while ($row_skill = mysqli_fetch_assoc($sql_skill)){
                                echo $row_skill['skill'];
                            }
                        ?>
                    </option>
                    <?php
                  }
                ?>
                    </select>
                </div>
                <?php
                }
                ?>
                </div>
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
<script type="text/javascript">
    $(document).ready(function() {
    $('#edu').bind('change', function() {
        var elements = $('div.container').children().hide(); // hide all the elements
        var value = $(this).val();

        if (value.length) { // if somethings' selected
            elements.filter('.' + value).show(); // show the ones we want
        }
    }).trigger('change');
});
</script>