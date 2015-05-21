<?php
// ================= Log ud ==========================================
if (isset($_POST['logud']))
{
	session_destroy();
	header ("location: index.php");
}
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
<li>
    <img src="img/icons/001w.png"> <?php echo $user_row['fName'].' '.$user_row['lName'] ?>
    <ul>
        <li class="user">
	       <div style="width:250px;" class="nav_profile">
            <img src="img/profile/<?php echo $user_row['pic']; ?>" />
            <?php echo 'Title: '.$title; ?>
            <div style="clear:both;"></div>
           </div>
           
        </li>
        <li class="user"><a href="?page=Min Profil"><img src="img/icons/003w.png" />&nbsp;Min Profil</a></li>
        <li class="user"><a><img src="img/icons/003w.png" />&nbsp;Mine projector</a></li>
        <li>
            <form action="" method="post">
                <input type="submit" class="logout" name="logud" value="Log ud" />
            </form>
        </li>
    </ul>
</li>