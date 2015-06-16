<div>
<table id="kategorier" cellspacing="0">
  <tr>
  	
    <td colspan="2" class="head2_1" style="width:450px">&nbsp;<h3>General</h3></td>
    <td class="head2" style="width:250px">Nyeste tr&aring;d</td>
    <td class="head2" style="width:75px">Antal tr&aring;de</td>
  </tr>
  
  <?php
  
// ================================================================
// ================================================================
$sql = "Select * From forum_kat Where forum_kat.fk_stik_id = '2' AND fk_afdeling_id = '3' Order By fk_last_traad_ind_date Desc";
	$Result = mysql_query ($sql) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	 echo '<tr><td style="width:35px;" class="item2"><img src="include/forum/icons/paperstar32.png" /></td><td class="item2">';
	 ?>
  <a href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['kat_id'] ?>"><?php echo $row['kat_navn'];?></a>
  <?php
	 if (isset($_SESSION['Forum kategori mod']) == 1)
	  {?>
      <br />
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil fjerene sticky');" href="index.php?p=<?php echo $side; ?>&custik=<?php echo $row['kat_id']; ?>">Uvigtig kategori</a>&nbsp;|&nbsp;
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil rette denne kategori');" href="index.php?p=<?php echo $side; ?>&r_kat=<?php echo $row['kat_id']; ?>">Ret kategori</a>&nbsp;|&nbsp;
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne kategori, og der ved alt derer i den');" href="index.php?p=<?php echo $side; ?>&c_slet=<?php echo $row['kat_id']; ?>">Slet kategori</a>
<?php }?>
  	
    <td align="center" class="item2"><?php
	 $kkat_id = $row['kat_id'];
	 $last_reply = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Where forum_traad.fk_kat_id = '$kkat_id' Order By forum_traad.traad_id Desc Limit 1";
	 $last_result = mysql_query ($last_reply) or die (mysql_error());
	while ($last = mysql_fetch_assoc($last_result))
	  {
  echo '<a href="index.php?p='.$side.'&ind='.$last['traad_id'].'">'.$last['username'].' '.date('d/m-Y',$last['ind_date']).'</a>';
	  }
	 ?>
    <?php
     echo '</td>';
	 echo '<td align="center" class="item2 last_item">';
	 	$traad = "SELECT * FROM forum_traad WHERE fk_kat_id = '$row[kat_id]'";
	 	$traad_re = mysql_query ($traad) or die (mysql_error());
	 	$traad_tal = mysql_num_rows($traad_re);
	 	echo $traad_tal;
	 echo '</td></tr>';
  }
// ================================================================
// ================================================================
$sql = "Select * From forum_kat Where forum_kat.fk_stik_id = '1' AND fk_afdeling_id = '3' Order By fk_last_traad_ind_date Desc";
	$Result = mysql_query ($sql) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	 echo '<tr><td style="width:35px;" class="item"><img src="include/forum/icons/note32.png" /><td class="item">';
	 ?>
    <a href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['kat_id'] ?>"><?php echo $row['kat_navn'];?></a>
    <?php
	 if (isset($_SESSION['Forum kategori mod']) == 1)
				{
					?>
    <br />
    <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil g&oslash;re denne kategori sticky');" href="index.php?p=<?php echo $side; ?>&cstik=<?php echo $row['kat_id']; ?>">vigtig kategori</a>&nbsp;|&nbsp;
    <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil rette denne kategori');" href="index.php?p=<?php echo $side; ?>&r_kat=<?php echo $row['kat_id']; ?>">Ret kategori</a>&nbsp;|&nbsp;
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne kategori, og der ved alt derer i den');" href="index.php?p=<?php echo $side; ?>&c_slet=<?php echo $row['kat_id']; ?>">Slet kategori</a>
    <?php
				}
				?>
    <td align="center" class="item"><?php
	 $kkat_id = $row['kat_id'];
	 $last_reply = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Where forum_traad.fk_kat_id = '$kkat_id' Order By forum_traad.traad_id Desc Limit 1";
	 $last_result = mysql_query ($last_reply) or die (mysql_error());
while ($last = mysql_fetch_assoc($last_result))
  {
echo '<a href="index.php?p='.$side.'&ind='.$last['traad_id'].'">'.$last['username'].' '.date('d/m-Y',$last['ind_date']).'</a>';
  }
	 ?></td>
    <?php
     echo '</td>';
	 echo '<td align="center" class="item last_item">';
	 	$traad = "SELECT * FROM forum_traad WHERE fk_kat_id = '$row[kat_id]'";
	 	$traad_re = mysql_query ($traad) or die (mysql_error());
	 	$traad_tal = mysql_num_rows($traad_re);
	 	echo $traad_tal;
	 echo '</td></tr>';
  }

?>
</table>
<br />
</div>

<!-- ======================================================================== -->
<?php
	if(isset($_SESSION['afdelinger']))
	{
		$matches = implode(',', $_SESSION['afdelinger']);
	}
	else
	{
		$matches= 0;
	}

//	var_dump($matches);

	$afdeling_sql = "SELECT * FROM afdelinger WHERE id IN ($matches)";
	$afdeling_result = mysql_query ($afdeling_sql) or die (mysql_error());
	while ($afdeling_row = mysql_fetch_assoc($afdeling_result))
  	{
		$afdeling_id = $afdeling_row['id'];
		$afdeling_navn = $afdeling_row['afdeling'];
	
?>
<Div style="float:left;">

<table id="kategorier" cellspacing="0">
  <tr>
    <td colspan="2" class="head2_1" style="width:450px">&nbsp;<h3><?php echo $afdeling_navn; ?></h3></td>
    <td class="head2" style="width:250px">Nyeste tr&aring;d</td>
    <td class="head2" style="width:75px">Antal tr&aring;de</td>
  </tr>
  <?php
  
// ================================================================
// ================================================================
$sql = "Select * From forum_kat Where forum_kat.fk_stik_id = '2' AND fk_afdeling_id = '$afdeling_id' Order By fk_last_traad_ind_date Desc";
	$Result = mysql_query ($sql) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	 echo '<tr><td style="width:35px;" class="item2"><img src="include/forum/icons/paperstar32.png" /><td class="item2">';
	 ?>
  <a href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['kat_id'] ?>"><?php echo $row['kat_navn'];?></a>
  <?php
	 if (isset($_SESSION['Forum kategori mod']) == 1)
	  {?>
      <br />
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil fjerene sticky');" href="index.php?p=<?php echo $side; ?>&custik=<?php echo $row['kat_id']; ?>">Uvigtig kategori</a>&nbsp;|&nbsp;
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil rette denne kategori');" href="index.php?p=<?php echo $side; ?>&r_kat=<?php echo $row['kat_id']; ?>">Ret kategori</a>&nbsp;|&nbsp;
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne kategori, og der ved alt derer i den');" href="index.php?p=<?php echo $side; ?>&c_slet=<?php echo $row['kat_id']; ?>">Slet kategori</a>
<?php }?>
  
    <td align="center" class="item2"><?php
	 $kkat_id = $row['kat_id'];
	 $last_reply = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Where forum_traad.fk_kat_id = '$kkat_id' Order By forum_traad.traad_id Desc Limit 1";
	 $last_result = mysql_query ($last_reply) or die (mysql_error());
	while ($last = mysql_fetch_assoc($last_result))
	  {
  echo '<a href="index.php?p='.$side.'&ind='.$last['traad_id'].'">'.$last['username'].' '.date('d/m-Y',$last['ind_date']).'</a>';
	  }
	 ?>
    <?php
     echo '</td>';
	 echo '<td align="center" class="item2 last_item">';
	 	$traad = "SELECT * FROM forum_traad WHERE fk_kat_id = '$row[kat_id]'";
	 	$traad_re = mysql_query ($traad) or die (mysql_error());
	 	$traad_tal = mysql_num_rows($traad_re);
	 	echo $traad_tal;
	 echo '</td></tr>';
  }
// ================================================================
// ================================================================
$sql = "Select * From forum_kat Where forum_kat.fk_stik_id = '1' AND fk_afdeling_id = '$afdeling_id' Order By fk_last_traad_ind_date Desc";
	$Result = mysql_query ($sql) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	 echo '<tr><td style="width:35px;" class="item"><img src="include/forum/icons/note32.png" /><td class="item">';
	 ?>
    <a href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['kat_id'] ?>"><?php echo $row['kat_navn'];?></a>
    <?php
	 if (isset($_SESSION['Forum kategori mod']) == 1)
				{
					?>
    <br />
    <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil g&oslash;re denne kategori sticky');" href="index.php?p=<?php echo $side; ?>&cstik=<?php echo $row['kat_id']; ?>">vigtig kategori</a>&nbsp;|&nbsp;
    <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil rette denne kategori');" href="index.php?p=<?php echo $side; ?>&r_kat=<?php echo $row['kat_id']; ?>">Ret kategori</a>&nbsp;|&nbsp;
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne kategori, og der ved alt derer i den');" href="index.php?p=<?php echo $side; ?>&c_slet=<?php echo $row['kat_id']; ?>">Slet kategori</a>
    <?php
				}
				?>
    <td align="center" class="item"><?php
	 $kkat_id = $row['kat_id'];
	 $last_reply = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Where forum_traad.fk_kat_id = '$kkat_id' Order By forum_traad.traad_id Desc Limit 1";
	 $last_result = mysql_query ($last_reply) or die (mysql_error());
while ($last = mysql_fetch_assoc($last_result))
  {
echo '<a href="index.php?p='.$side.'&ind='.$last['traad_id'].'">'.$last['username'].' '.date('d/m-Y',$last['ind_date']).'</a>';
  }
	 ?></td>
    <?php
     echo '</td>';
	 echo '<td align="center" class="item last_item">';
	 	$traad = "SELECT * FROM forum_traad WHERE fk_kat_id = '$row[kat_id]'";
	 	$traad_re = mysql_query ($traad) or die (mysql_error());
	 	$traad_tal = mysql_num_rows($traad_re);
	 	echo $traad_tal;
	 echo '</td></tr>';
  }

?>
</table>
<br />
</div>
<?php
	}
?>
<div style="clear:both"></div>