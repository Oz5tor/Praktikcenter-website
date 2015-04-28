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
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>

</head>
<?php 
if((isset ($_SESSION['user'])) && (isset($_SESSION['create_user']))){
    
}
    else {header('location: ../../index.php');} 
?>
<form action="#" method="get">
    <table>
        <tr>
            <td>Fornavn: </td>
            <td>
                <input type="text" min="2" max="40" id="fName" required>
            </td>
        </tr>
        <tr>
            <td>Efternavn: </td>
            <td>
                <input type="text" min="2" max="50" id="lName" required>
            </td>
        </tr>
        <tr>
            <td>F&oslash;selsdag: </td>
            <td>
                <input type="text" id="datepicker" required>
            </td>
        </tr>
        <tr>
            <td>Udannelses: </td>
            <td>
                <select required>
                    <option selected value="">V&aelig;lg Udannelse</option>
                   
                    <?php 
                        $sqlState="select * from edu";
                        $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
                       

                        while ($row = mysqli_fetch_assoc($sql_result)){
                           echo "<option value='".$row['id']."'>".$row['name']."</option>";
                        }
                    ?>
                    
                    
                    <!--
                    <option value="1">Datateknikker specalisering i programmering</option>
                    <option value="1">Datateknikker specalisering i infrastruktur</option>
                    <option value="1">It-Supporter</option>
                    -->
                </select>
            </td>
        </tr>
        <tr>
            <td>Addresse: </td>
            <td>
                <input type="text" id="address" max="100" required>
            </td>
        </tr>
        <tr>
            <td>Email: </td>
            <td>
                <input type="email" id="email" max="35" required>
            </td>
        </tr>
        <tr>
            <td>Telefon: </td>
            <td>
                <input type="tel" id="phone" min="8" max="8" pattern="[0-9]{8}" required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="create_user" value="Opret bruger">
            </td>
        </tr>
    </table>
</form>
<?php
echo '<pre>'; print_r($_POST); echo '</pre>'; 
echo '<pre>'; print_r($_SESSION); echo '</pre>'; 
?>