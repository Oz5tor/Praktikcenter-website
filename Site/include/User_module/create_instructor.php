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

<h1>Opret ny Instruktør</h1>
<form action="#" method="post">
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
            <td>Addresse: </td>
            <td>
                <input type="text" id="address" min="9" name="address" max="100" required>
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
// ===============================================================================
echo '<pre>'; print_r($_POST); echo '</pre>';
echo '<pre>'; print_r($_SESSION); echo '</pre>'; 
// ===============================================================================
if(isset($_POST['create_user']))
{
$fName      = $_POST['fName'];
$lName      = $_POST['lName'];
$add        = $_POST['address'];
$bday       = $_POST['datepicker'];
$phone      = $_POST['phone'];
$email      = $_POST['email'];
$password   = hash('sha512', 'abc1234');

$sqlState   ="insert into user(password,fName,lName,email,phone,address,bDay) values('$password','$fName','$lName','$email',$phone,'$add','$bday')";
    mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
// ===============================================================================
$sqlState   = "select id from user where email = '$email'";

$sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
// ===============================================================================                     
$row = mysqli_fetch_assoc($sql_result);
    
       $user_id= $row['id'];
        
$sqlState   ="insert into userRoles values('$user_id',2)";
    mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
}
// ===============================================================================
?>