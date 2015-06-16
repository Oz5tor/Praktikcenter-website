<?php
$flyttraad = "Select * From forum_kat Inner Join forum_traad On forum_kat.kat_id = forum_traad.fk_kat_id WHERE traad_id = '$t_flyt'";
$Result = mysql_query ($flyttraad) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
{
	$fk_kat_id = "du har valgt traaden: <b>". $row['ind_head']."</b> som ligger i <b>".$row['kat_navn']."</b> hvor skal den hen nu";
}
?>
<fieldset>
<legend>Flyt trååd</legend>
<p><?php echo $fk_kat_id ?></p>
<form action="" method="post">
<select name="flyt">
<option>V&aelig;lg Kategori</option>
<?php
$kat_f_sql = "SELECT * FROM forum_kat ";
$Result = mysql_query ($kat_f_sql) or die (mysql_error());
		while ($row = mysql_fetch_assoc($Result))
		{
?>
<option value="<?php echo $row['kat_id'] ?>"><?php echo $row['kat_navn'] ?></option>
<?php
		}
?>
</select>
<input type="submit" name="flyt_traad" value="Flyt" />
</form>
</fieldset>