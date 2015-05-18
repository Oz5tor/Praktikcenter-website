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
if(isset($_POST['create_user']))
{

$fName      = mysqli_real_escape_string($db_conn,strip_tags($_POST['fName']));
$lName      = mysqli_real_escape_string($db_conn,strip_tags($_POST['lName']));
$add        = mysqli_real_escape_string($db_conn,strip_tags($_POST['address']));
$bday       = mysqli_real_escape_string($db_conn,strip_tags($_POST['datepicker']));
$phone      = mysqli_real_escape_string($db_conn,strip_tags($_POST['phone']));
$email      = mysqli_real_escape_string($db_conn,strip_tags($_POST['email']));
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