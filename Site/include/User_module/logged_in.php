<?php 
// ================= Log ud ==========================================
if (isset($_POST['logud']))
{
	session_destroy();
	header ("location: index.php?side=$side");
}
// =========== hvis logget ind =======================================

	$user = $_SESSION['user'];
	$user_sql = "Select * From user WHERE id = '$user'";
	$user_result = mysqli_query($db_conn,$user_sql) or die (mysqli_error($db_conn));
	$user_row = mysqli_fetch_assoc($user_result);

	$title_sql = "Select * From userRoles
                    Inner Join roles On roles.id = userRoles.roleId
                    Inner Join user On user.id = userRoles.userId
                    Where user.id = '$user' Order By userRoles.roleId DESC";
	$title_result = mysqli_query($db_conn,$title_sql) or die (mysqli_error($db_conn));
	$user_title = mysqli_fetch_assoc($title_result);
	
	if ($user_title['name'] == '')
	{
		$title = "Elev";
	}
	else
	{
		$title = $user_title['name'];
	}
	
?>
<div>
<div class="profile_image" style=" padding-right:5px; float:left;height:75px; width:75px;">
	<img height="75" src="img/profile/<?php echo $user_row['pic']; ?>" />
</div>
<div style="float:left">
<table>
	<tr>
    	<td>Navn:</td>
        <td><?php echo $user_row['fName'].' '.$user_row['lName']; ?> | </td>
    	<td>Title:</td>
        <td><?php echo $title; ?></td>
    </tr>
</table>
</div>
<div style="float:left">
<a href="index.php?a=Nyhed">Nyheds administartion <strong>(BETA)</strong></a>
    <a href="index.php?a=menu">Menu Admin</a>
<!--<a href="index.php?side=a_menu">Nyheds administartion <strong>(BETA)</strong></a>-->
</div>

<form action="" method="post">
<input type="submit" name="logud" value="log ud" />
</form>
</div>