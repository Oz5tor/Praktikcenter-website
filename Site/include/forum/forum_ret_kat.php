<?php
if (isset($_SESSION['Forum kategori mod']) == 1)
{	
	$kat_ret = "SELECT * FROM forum_kat WHERE kat_id = '$r_kat'" ;
	$Result = mysql_query ($kat_ret) or die (mysql_error());
		while ($row = mysql_fetch_assoc($Result))
		{	
?>

<fieldset>
  <legend>Ret Kategori</legend>
  <table>
    <tr>
		<td><form action="" method="post"></td>      
    </tr>
    <tr>
		<td><input type="text" name="head" style="width:400px;" value="<?php echo $row['kat_navn']; ?>" /></td>
    </tr>
    <tr>
		<td><input type="submit" name="kat_ret" value="Ret Kategori" /></td>
    </tr>
    </form>
	<tr>
		<td><?php if(isset($bo2)){echo $bo2;} ?></td>
    </tr>
  </table>
</fieldset>
<?php
		}
}
?>
