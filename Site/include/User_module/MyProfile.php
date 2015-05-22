<?php
$user = mysqli_real_escape_string($db_conn,strip_tags($_GET['id']));
$user_sql = "Select * From user where id = '$user'";
$user_result = mysqli_query($db_conn, $user_sql) or die (mysqli_error($db_conn));
$user_row = mysqli_num_rows($user_result); 
?>

<style type="text/css">
.borderbottom {
    border-bottom:1px solid black;
}
.profilepic{
    width:120px;
    vertical-align:middle;
    margin-right:10px;
    float:left;
}
.userinfo{
    min-width:400px;
    float:left;
}


</style>

<div style="border:1px solid black; height:500px;">

    <div id="baseinfo" class="borderbottom">
        <img class="profilepic" src="img/profile/nopic.png"/>
        <div class="userinfo">
            <table>
                <tr>
                    <td>Tor Soya</td>
                    <td>Webmaster</td>
                </tr>
                <tr>
                    <td colspan="2">Datateknikker - Speciale Programmering</td>
                </tr>
                <tr>
                    <td>kage</td>
                    <td>mand</td>
                </tr>
            </table>
        </div>     
        <span style="display:block; clear:both;"></span>
    </div>
    
    <hr>
    
</div>