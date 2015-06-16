
<?php	
include("include/forum/forum_kategori_list.php");
// ================================================================
if (isset($_SESSION['Forum kategori mod']) == 1)
{
	if(!isset($_GET['r_kat']))
	{
	?>
	<div style="clear:both;">&nbsp;</div>
	<fieldset>
	  <legend>Opret Kategori</legend>
		<form action="" name="myform" onsubmit="return validateForm()" method="post">
			<input type="text" id="head" name="head" min="2" required="required" maxlength="35" style="width:400px;" />
            <select name="afdeling" required>
            <option value="">V&aelig;lg afdeling</option>
                <?php
				$kats_kat_sql = "SELECT * FROM afdelinger";
				$kats_Result = mysql_query ($kats_kat_sql) or die (mysql_error());
				while ($kats_row = mysql_fetch_assoc($kats_Result))
				{
					?>
                    <option value="<?php echo $kats_row['id']; ?>"><?php echo $kats_row['afdeling']; ?></option>
                    <?php
				}
				?>
            </select>
			<input type="submit" name="kat_op" value="Opret Kategori" />
		</form>
	</fieldset>
	<?php
	}
}

if (isset($_SESSION['Forum kategori mod']) == 1)
{
	if(isset($_GET['r_kat']))
	{
		include "include/forum/forum_ret_kat.php";
	}
}
?>
