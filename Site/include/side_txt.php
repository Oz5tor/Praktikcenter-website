<?php

if (isset($_POST['submit']))
{
	if(intval($side) && $sub_side == '')
	{
		$page_txt_sql = "SELECT * FROM page WHERE fk_menu_id = '$side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_num_rows($page_txt_result);
		if($page_txt_row >= 1)
		{
			$new_txt = $_POST['textarea'];
			$page_update_sql = "UPDATE page	SET
				text = '$new_txt' WHERE fk_menu_id = '$side'";
			mysql_query($page_update_sql) or die (mysql_error());
			header("location:index.php?side=$side");
		}
		else
		if($page_txt_row <= 1)
		{
			$new_txt = $_POST['textarea'];
			$page_update_sql = "INSERT INTO page 
			(text, fk_menu_id)
	 VALUES ('$new_txt', '$side')";
			mysql_query($page_update_sql) or die (mysql_error());
			header("location:index.php?side=$side");	
		}
	}
	else
	if(!intval($side))
	{
		$page_txt_sql = "SELECT * FROM page WHERE static_menu = '$side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_num_rows($page_txt_result);
		if($page_txt_row >= 1)
		{
			$new_txt = $_POST['textarea'];
			$page_update_sql = "UPDATE page	SET
				text = '$new_txt' WHERE static_menu = '$side'";
			mysql_query($page_update_sql) or die (mysql_error());
			header("location:index.php?side=$side");
		}
		else
		if($page_txt_row <= 1)
		{
			$new_txt = $_POST['textarea'];
			$page_update_sql = "INSERT INTO page 
			(text, static_menu)
	 VALUES ('$new_txt', '$side')";
			mysql_query($page_update_sql) or die (mysql_error());
			header("location:index.php?side=$side");	
		}
	}
	else
	if($sub_side != '')
	{
		$page_txt_sql = "SELECT * FROM page WHERE fk_submenu_id = '$sub_side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_num_rows($page_txt_result);
		if($page_txt_row >= 1)
		{
			$new_txt = $_POST['textarea'];
			$page_update_sql = "UPDATE page	SET
				text = '$new_txt' WHERE fk_submenu_id = '$sub_side'";
			mysql_query($page_update_sql) or die (mysql_error());
			header("location:index.php?side=$side&sub=$sub_side");
		}
		else
		if($page_txt_row <= 1)
		{
			$new_txt = $_POST['textarea'];
			$page_update_sql = "INSERT INTO page 
			(text, fk_submenu_id)
	 VALUES ('$new_txt', '$sub_side')";
			mysql_query($page_update_sql) or die (mysql_error());
			header("location:index.php?side=$side&sub=$sub_side");	
		}
	}
}
?>
<?php
// side_text admin
if($_SESSION['Admin'] == 1)
{
?>
<form action="" method="post" enctype="multipart/form-data">
<textarea name="textarea">
<?php
	
	if(intval($side) && $sub_side == '')
	{
		$page_txt_sql = "SELECT text FROM page WHERE fk_menu_id = '$side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_fetch_assoc($page_txt_result);
		
		echo $page_txt_row['text'];
		
	}
	else
	if($sub_side != '')
	{
		$page_txt_sql = "SELECT text FROM page WHERE fk_submenu_id = '$sub_side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_fetch_assoc($page_txt_result);
		
		echo $page_txt_row['text'];
	}
	else
	if(!intval($side))
	{
		$page_txt_sql = "SELECT text FROM page WHERE static_menu = '$side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_fetch_assoc($page_txt_result);
		
		echo $page_txt_row['text'];
	}
?>
</textarea><script type="text/javascript">CKEDITOR.replace( 'textarea' );</script> 
<input type="submit" name="submit" value="opdater" />
</form>
<script type="text/javascript">CKEDITOR.replace( 'textarea' );</script> 
<?php
}
// side_text admin slut 
else
{
	if(intval($side) && $sub_side == '')
	{
		$page_txt_sql = "SELECT text FROM page WHERE fk_menu_id = '$side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_fetch_assoc($page_txt_result);
		
		echo $page_txt_row['text'];
		
	}
	else
	if($sub_side != '')

	{
		$page_txt_sql = "SELECT text FROM page WHERE fk_submenu_id = '$sub_side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_fetch_assoc($page_txt_result);
		
		echo $page_txt_row['text'];
	}
	else
	if(!intval($side))
	{
		$page_txt_sql = "SELECT text FROM page WHERE static_menu = '$side'";
		$page_txt_result = mysql_query($page_txt_sql) or die (mysql_error());
		$page_txt_row = mysql_fetch_assoc($page_txt_result);
		
		echo $page_txt_row['text'];
	}
}

?>