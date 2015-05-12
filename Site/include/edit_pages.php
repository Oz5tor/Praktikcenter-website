<?php
if(isset($_SESSION['DynamicEditPages']) == 1)
{
  if (isset($_POST['submit']))
  {
    $temp_userid = $_SESSION['user'];
    $temp_time = time();
    $new_txt = mysqli_real_escape_string($db_conn,$_POST['textarea']);
    if($new_txt == ''){
        $new_txt = 'Denne side har endnu ikke nogen tekst';
    }
	if($page !='Forside' && $subpage =='')
	{
		$page_txt_sql = "SELECT * FROM dynamicPages WHERE fk_subcat_name = '$page'";
		$page_txt_result = mysqli_query($db_conn ,$page_txt_sql) or die (mysqli_error($db_conn));
		$page_txt_row = mysqli_num_rows($page_txt_result);
		if($page_txt_row >= 1)
		{
			//$new_txt = $_POST['textarea'];
			$page_update_sql = "UPDATE dynamicPages	SET
				text = '$new_txt', fk_userID_lastEdit = '$temp_userid', lastEdited = '$temp_time'  WHERE fk_subcat_name = '$page'";
			mysqli_query($db_conn,$page_update_sql) or die (mysqli_error($db_conn));
			header("location:index.php?page=$page");
		}
		else
		if($page_txt_row <= 1)
		{
			//$new_txt = $_POST['textarea'];
			$page_update_sql = "INSERT INTO dynamicPages 
			(text, fk_subcat_name, fk_userID_lastEdit, lastEdited)
	 VALUES ('$new_txt', '$page', '$temp_userid', '$temp_time')";
			mysqli_query($db_conn,$page_update_sql) or die (mysqli_error($db_conn));
			header("location:index.php?page=$page");
		}
	}else
	if($subpage != '')
	{
		$page_txt_sql = "SELECT * FROM dynamicPages WHERE fk_subsubcat_name = '$subpage'";
		$page_txt_result = mysqli_query($db_conn,$page_txt_sql) or die (mysqli_error($db_conn));
		$page_txt_row = mysqli_num_rows($page_txt_result);
		if($page_txt_row >= 1)
		{
			//$new_txt = $_POST['textarea'];
			$page_update_sql = "UPDATE dynamicPages	SET
				text = '$new_txt', fk_userID_lastEdit = '$temp_userid', lastEdited = '$temp_time' WHERE fk_subsubcat_name = '$subpage'";
			mysqli_query($db_conn,$page_update_sql) or die (mysqli_error($db_conn));
			header("location:index.php?page=$page&subpage=$subpage");
		}
		else
		if($page_txt_row <= 1)
		{
			//$new_txt = $_POST['textarea'];
			$page_update_sql = "INSERT INTO dynamicPages 
			(text, fk_subsubcat_name, fk_userID_lastEdit, lastEdited)
	 VALUES ('$new_txt', '$subpage', '$temp_userid', '$temp_time')";
			mysqli_query($db_conn,$page_update_sql) or die (mysqli_error($db_conn));
			header("location:index.php?page=$page&subpage=$subpage");	
		}
	}
  }  
}


?>
<?php
// side_text admin
if((isset($_SESSION['DynamicEditPages']) == 1) && (isset($action) == 'Edit'))
{
?>
<form action="" method="post" enctype="multipart/form-data">
<textarea id="nyhed" name="textarea">
<?php
	if($page != 'Forside' && $subpage == '')
	{
		$page_txt_sql = "SELECT text FROM dynamicPages WHERE fk_subcat_name = '$page'";
		$page_txt_result = mysqli_query($db_conn,$page_txt_sql) or die (mysqli_error($db_conn));
		$page_txt_row = mysqli_fetch_assoc($page_txt_result);
		echo $page_txt_row['text'];
	}
	else
	if($subpage != '')
	{
		$page_txt_sql = "SELECT text FROM dynamicPages WHERE fk_subsubcat_name = '$subpage'";
		$page_txt_result = mysqli_query($db_conn,$page_txt_sql) or die (mysqli_error($db_conn));
		$page_txt_row = mysqli_fetch_assoc($page_txt_result);
		echo $page_txt_row['text'];
	}
?>
</textarea>
    <br>
<input type="submit" name="submit" value="opdater" />
</form>
<?php
}
// side_text admin slut 
else
{
	if($page != 'Forside' && $subpage == '')
	{
		$page_txt_sql = "SELECT text FROM dynamicPages WHERE fk_subcat_name = '$page'";
		$page_txt_result = mysqli_query($db_conn,$page_txt_sql) or die (mysqli_error($db_conn));
		$page_txt_row = mysqli_fetch_assoc($page_txt_result);
		echo $page_txt_row['text'];
        if(isset($_SESSION['DynamicEditPages']) == 1)
        {
            echo "<hr><b><a href='index.php?page=$page&action=Edit'>Ret Denne Side</a></b>";
        }
	}
	else
	if($subpage != '')
	{
		$page_txt_sql = "SELECT text FROM dynamicPages WHERE fk_subsubcat_name = '$subpage'";
		$page_txt_result = mysqli_query($db_conn,$page_txt_sql) or die (mysqli_error($db_conn));
		$page_txt_row = mysqli_fetch_assoc($page_txt_result);
		echo $page_txt_row['text'];
        if(isset($_SESSION['DynamicEditPages']) == 1)
        {
            echo "<hr><b><a href='index.php?page=$page&subpage=$subpage&action=Edit'>Ret Denne Side</a></b>";
        }
	}
}
?>