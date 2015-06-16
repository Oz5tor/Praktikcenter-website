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
                Where user.id = '$user' Order By roleRank ASC";
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
        <li id="profile_img" class="user">
            <img src="img/profile/<?php echo $user_row['pic']; ?>" />
        </li>
        <li class="user"><a href="?page=Profil&id=<?php echo $_SESSION['user']; ?>"><img src="img/icons/003w.png" />&nbsp;Min Profil</a></li>
        <li class="user"><img src="img/icons/003w.png" />&nbsp;Projekter
            <ul>
                <li><a href="index.php?administration=Projekt Oversigt">Projekt Oversigt</a></li>
                <?php
                if(isset($_SESSION['create_project']) == 1){
                ?>
                <li><a href="index.php?administration=Opret nyt projekt">Opret nyt projekt</a></li>
                <li><a href="index.php?administration=Projekt Skabeloner">Projekt Skabeloner</a></li>
                <?php 
                }
                ?>
            </ul>
        </li>
        <?php 
        if(isset($_SESSION['create_user']) == 1){
        ?>
        <li class="user"><img src="img/icons/003w.png" />&nbsp;Brugere
            <ul>
                <li><a href="index.php?administration=Opret Elev">Opret Elev</a></li>
                <li><a href="index.php?administration=Opret Instruktør">Opret Instruktør</a></li>
                <li><a href="index.php?administration=Opret Værkføre">Opret Værkføre</a></li>
            </ul>
        </li>
        <?php
        }
        ?>
        
        <li class="user"><img src="img/icons/003w.png" />&nbsp;Administration
            <ul>
                <li><a href="index.php?administration=Nyhed">Nyheds administartion</a></li>
                <li><a href="index.php?administration=menu">Menu Admin "WIP"</a></li>
            </ul>
        </li>
    <a href="index.php?page=Udstyrs Liste">Udstyrs Liste</a><br>
        <li>
            <form action="" method="post">
                <input type="submit" class="logout" name="logud" value="Log ud" />
            </form>
        </li>
    </ul>
</li>