<?php
if(isset($_SESSION['CreateNews'])== 1)
{
// opret Nyhed
if(isset($_POST['opret_news']))
{
	$title = $_POST['title'];
	$title = strip_tags($title);
	$title = mysqli_real_escape_string($db_conn, $title);
	$txt = $_POST['textarea'];
    $txt = mysqli_real_escape_string($db_conn, $txt);
	$date = time();
	$new_sql = "INSERT INTO news (txt, date, titel) VALUES ('$txt', '$date', '$title')";
	mysqli_query($db_conn,$new_sql) or die (mysqli_error($db_conn));
	header("location:index.php");
}
// ret Nyhed
if(isset($_POST['ret_agenda']))
{
	$title = $_POST['ret_title'];
	$title = strip_tags($title);
	$title = mysqli_real_escape_string($db_conn,$title);
	$id = $_POST['id'];
	$txt = $_POST['text'];
    $txt = mysqli_real_escape_string($db_conn, $txt);
	$new_sql = "UPDATE news SET txt = '$txt', titel = '$title' WHERE id = '$id'";
	mysqli_query($db_conn,$new_sql) or die (mysqli_error($db_conn));
	header("location:index.php");
}
// slet Nyhed
if(isset($_POST['slet_event']))
{
	$id = $_POST['agenda'];
	
	$slet_sql = "DELETE FROM news WHERE id = '$id'";
	mysqli_query($db_conn,$slet_sql) or die (mysqli_error($db_conn));
	header("location:index.php?p=$side");
}
?>
<!-- opret agenda -->
<?php if(!isset($_POST['select_event'])) { ?>
<fieldset>
<legend>Opret Nyhed</legend>
<form action="" method="post" enctype="multipart/form-data">
<p>title: <input type="text" name="title" style="min-width:700px; border:#000 solid 1px;" required="required" /></p>
<textarea id="nyhed" name="textarea" required="required"></textarea>
<input type="submit" name="opret_news" value="Opret" />
</form>
</fieldset>
<?php } ?>
<!-- ret agenda -->
<?php if(!isset($_POST['select_event'])) { ?>
	<fieldset>
	<legend>Ret Nyhed</legend>
		<form action="" method="post">
			<select name="agenda"  style="max-width:700px;">
				<option>V&aelig;lg Nyhed</option>
				<?php
					$ret_agenda_sql = "SELECT * FROM news ORDER BY id DESC";
					$ret_agenda_result = mysqli_query($db_conn,$ret_agenda_sql) or die (mysqli_error($db_conn));
					while ($ret_agenda_row = mysqli_fetch_assoc($ret_agenda_result))
					{
						?>
						<option value="<?php echo $ret_agenda_row['id']; ?>"><?php echo date('j.F Y | H:i', $ret_agenda_row['date']); ?></option>
						<?php
					}	
					?>
			</select>
			<input type="submit" name="select_event" value="V&aelig;lg" />
		</form>
	</fieldset>
	<?php } else if(isset($_POST['select_event'])) { 
	
	$id = $_POST['agenda'];
	
	$up_agenda_sql = "SELECT * FROM news WHERE id = '$id'";
	$up_agenda_result = mysqli_query($db_conn,$up_agenda_sql) or die (mysqli_error($db_conn));
	$up_agenda_row = mysqli_fetch_assoc($up_agenda_result);
	?>
    <fieldset>
    <legend>Ret Nyhed</legend>
    <form action="" method="post" enctype="multipart/form-data">
    <p>title: <input type="text" value="<?php echo $up_agenda_row['titel']; ?>" name="ret_title"  style="min-width:700px; border:#000 solid 1px;" required="required"/></p>
    <textarea id="nyhed" name="text"><?php echo $up_agenda_row['txt']; ?></textarea>
    <input type="hidden" value="<?php echo $id ?>" name="id" />
    <input type="submit" name="ret_agenda" value="Ret" />
    </form>
    </fieldset>
    <?php	
}
?>
<!-- slet agenda -->
<fieldset>
<legend>Slet Nyhed</legend>
    <form action="" method="post">
        <select name="agenda" style="max-width:700px;">
            <option>V&aelig;lg Nyhed</option>
            <?php
                
                $ret_agenda_sql = "SELECT * FROM news ORDER BY id DESC";
                $ret_agenda_result = mysqli_query($db_conn,$ret_agenda_sql) or die (mysqli_error($db_conn));
                while ($ret_agenda_row = mysqli_fetch_assoc($ret_agenda_result))
                {
                    ?>
                    <option value="<?php echo $ret_agenda_row['id']; ?>"><?php echo $ret_agenda_row['titel']; ?></option>
                    <?php
                }	
                ?>
        </select>
        <input type="submit" name="slet_event" onclick="return confirm('Er du sikker p&aring; at du vil slette?');" value="Slet" />
    </form>
</fieldset>
    <?php
}else{
    header('location:index.php');
}?>
