<?php
//session_start();
//dbconnector:
  //  $db_host="192.168.0.4"; // Host name
//    $db_username="c1root"; // Mysql username
  //  $db_password="A123linux2013"; // Mysql password
   // $db_name="c1praktikcenter"; // Database name
    //$db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");

echo '<pre>'; print_r($_POST); echo '</pre>';
//echo '<pre>'; print_r($_SESSION); echo '</pre>'; 
 foreach($_POST['skills'] as $key)
         echo $key."\n";
    
// ===============================================================================
if(isset($_POST['create_user']))
{
$fName      = $_POST['fName'];
$lName      = $_POST['lName'];
$add        = $_POST['address'];
$bday       = $_POST['datepicker'];
$inst       = $_POST['inst'];
$phone      = $_POST['phone'];
$email      = $_POST['email'];
$edu        = $_POST['edu'];
$eduEnd     = $_POST['edu_datepicker'];
$password   = hash('sha512', 'abc1234');
//$skills     = $_POST['skills'];
$maincurse  = $_POST['maincurse'];

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
}
// ===============================================================================
    
        foreach($_POST['skills'] as $key){
               
            $sqlState   = "insert into userSkills(userId,skillId) values($user_id,$key)";
                mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                }
?>


<head>
    <!--
 <link rel="stylesheet"href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
-->
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
        dateFormat: "yy/mm/dd"
    });
  });
      
      $(function() {
    $( "#datepicker2" ).datepicker({
      changeMonth: true,
      changeYear: true,
        dateFormat: "yy/mm/dd"
    });
  });
  </script>
    
</head>
<?php 
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_user']))){
    
}
    else {header('location: index.php');} 
?>

<h1>Opret ny Elev</h1>
<form action="" method="post">
    <table>
        <tr>
            <td>Fornavn: </td>
            <td>
                <input type="text" min="2" max="40" id="fName" name="fName" required>
            </td>
        </tr>
        <tr>
            <td>Efternavn: </td>
            <td>
                <input type="text" min="2" max="50" id="lName" name="lName" required>
            </td>
        </tr>
       
        <tr>
            <td>F&oslash;selsdag: </td>
            <td>
                <input type="text" id="datepicker" name="datepicker" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required>
            </td>
        </tr>
        
        <tr>
            <td>Udannelses: </td>
            <td>
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
            <td>Afslutning af uddannelse: </td>
            <td>
                <input type="text" id="datepicker2" name="edu_datepicker" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}" required>
            </td>
        </tr>
           
        
            <tr>
             <td>Instruktør: </td>
            <td>
                <select required name="inst">
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
        </tr>
        
        
           <tr>
            <td>Kompetancer: </td>
            <td>
                <select required multiple name="skills[]">
                   
                   
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
            <td>Addresse: </td>
            <td>
                <input type="text" id="address" name="address" max="100" required>
            </td>
        </tr>
        <tr>
            <td>Email: </td>
            <td>
                <input type="email" id="email" name="email" max="35" required>
            </td>
        </tr>
        <tr>
            <td>Telefon: </td>
            <td>
                <input type="tel" id="phone" name="phone" min="8" max="8" pattern="[0-9]{8}" required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="create_user" name="create_user" value="Opret bruger">
            </td>
        </tr>
    </table>
</form>