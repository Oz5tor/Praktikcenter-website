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
        <li>
	       <img class="nav_profile_img" src="img/profile/<?php echo $user_row['pic']; ?>" />&nbsp;
            <?php echo 'Title: '.$title; ?>
        </li>
        <li>
            <form action="" method="post">
                <input type="submit" class="logout" name="logud" value="log ud" />
            </form>
        </li>
    </ul>
</li>