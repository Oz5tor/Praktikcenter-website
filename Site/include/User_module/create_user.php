<?php
session_start();
//dbconnector:
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");

 
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
        dateFormat: "dd-mm-yy"
    });
  });
  </script>
    
</head>
<?php 
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_user']))){
    
}
    else {header('location: ../../index.php');} 
?>

<h1>Opret ny Elev</h1>
<form action="#" method="get">
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
                <input type="text" id="datepicker" name="datepicker" required pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" required>
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
            <td>Kompetancer: </td>
            <td>
                <select required multiple name="skills">
                   
                   
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
<?php
echo '<pre>'; print_r($_GET); echo '</pre>';
echo '<pre>'; print_r($_SESSION); echo '</pre>'; 

$fName      = $_GET['fName'];
$lName      = $_GET['lName'];
$add        = $_GET['address'];
$bday       = $_GET['datepicker'];
$inst       = $_GET['inst'];
$phone      = $_GET['phone'];
$email      = $_GET['email'];
$edu        = $_GET['edu'];
$username   = strtolower(substr($fName,0,2).substr($lName,0,2));
$password   = "abc1234";
$sqlState   ="insert into user(username,password,fName,lName,email,phone,address,bDay,edu) values('$username','$password','$fName','$lName','$email',$phone,'$add','$bday',$edu)";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
?>