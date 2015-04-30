<?php
// =========================== Log Ind ===============================
if (isset($_POST['Submit']))
{
	$username= strtolower($_POST['username']);
	$pass = strtolower($_POST['password']);
	if (($username == '') or ($pass == ''))
	{
	// empty apseptere ikke 0 som et gyldit tegn så hvis man kun har er 0 som pass virker det ikke
		$bo = 'forkert brugernavn eller password';
	}	
	else
		if ((isset($username)) or (isset($pass)))
	{
		$username= mysqli_real_escape_string($db_conn,strip_tags($username));
		$pass = mysqli_real_escape_string($db_conn,strip_tags($pass));
		//$pass = md5($pass);
        $pass = hash('sha512', $pass);
		$query="SELECT * FROM user WHERE email ='$username' && password ='$pass'";
        
        //$query="SELECT * FROM user WHERE username ='$username' && pass ='$pass'";
		$result=mysqli_query($db_conn,$query) or die (mysqli_error($db_conn));
		if (mysqli_num_rows($result)==1)
		{
			$row = mysqli_fetch_assoc($result);
			$user_id = $row['id'];
			// hvis login lykkes så opretes der $_SESSION's
			$_SESSION['user']	= $user_id;
            
            $roles_sql = "Select * from userRoles WHERE userId = '$user_id'";
            $roles_result=mysqli_query ($db_conn,$roles_sql) or die (mysqli_error($db_conn));
            while ($roles_row = mysqli_fetch_assoc($roles_result))
			{
                $fk_roleId = $roles_row['roleId'];
                $perm_id_sql = "SELECT * FROM rolesPermissions WHERE rolesId = '$fk_roleId'";
                $perm_id_result = mysqli_query ($db_conn,$perm_id_sql) or die (mysqli_error($db_conn));
                while($perm_id_row = mysqli_fetch_assoc($perm_id_result))
                {
                    $perm_id = $perm_id_row['permissionsId'];
                    $perm_sql = "SELECT * FROM permissions WHERE id ='$perm_id'";
                    $perm_result = mysqli_query ($db_conn,$perm_sql) or die (mysqli_error($db_conn));
                    while($perm_row = mysqli_fetch_assoc($perm_result))
                    {
                        $_SESSION[$perm_row['perName']] = 1;
                    }
                    
                }
            }
            header("Location: index.php?page=$side");
		} else {
            $bo = 'Der findes ikke nogen bruger med det password';
        }
	}
}
// ================ Hvis ikke logget ind =============================
if (!isset($_SESSION['user']))
{
?>
<form method="post" action="">
<input name="username" type="email" id="username" value="Brugernavn" class="headerlogin_class" onfocus="if (this.value == 'Brugernavn') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Brugernavn';}"/>
<input name="password" type="password" id="password" value="Password" class="headerlogin_class"/ onfocus="if (this.value == 'Password') {this.value = '';this.type='password';}" onblur="if (this.value == '') {this.value = 'Password';this.type='password';}"/>
<input type="submit" name="Submit" value="Login" class="headerlogin_login" />
<?php if(isset ($bo)){ echo $bo;} ?>
</form>
<?php 
}
?>

