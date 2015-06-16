<div id="forum_navigation"><a href="index.php?p=Forum">Tilbage</a></div>
<div id="page">
  <h1>
  <?php
  	$sh_kat_sql = "SELECT * from forum_kat WHERE kat_id = '$kat'";
	$sh_kat_Result = mysql_query ($sh_kat_sql) or die (mysql_error());
	$sh_kat_row = mysql_fetch_assoc($sh_kat_Result);
	echo $sh_kat_row['kat_navn'];
  ?> -> Tr&aring;de
  </h1>
</div>
<table id="kategorier" cellspacing="0">
  <tr>
    <td colspan="2" align="center" class="head2"  style="width:450px;">&nbsp;</td>
    <td align="center" class="head2" style="width:250px">Sidste svar</td>
    <td align="center" class="head2" style="width:75px">Forfatter</td>
    <td align="center" class="head2">Antal ind&aelig;g</td>
  </tr>
  <?php
   // ================================================================
$sql = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Where forum_traad.fk_kat_id = '$kat' And forum_traad.fk_stik_id = '2' Order By fk_reply_date DESC";
	$Result = mysql_query ($sql) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	  if($row["reply_on_off"] == 0)
	 {
	 echo '<tr><td aling="center" style="width:35px;" class="item2"><img src="include/forum/icons/paperstar32.png" /></td><td class="item2">';
	 }
	 else
	 {
		 	 echo '<tr><td  aling="center" style="width:35px;" class="item2"><img src="include/forum/icons/paperlockstar32.png" /></td><td class="item2">';
	 }

	 ?>
  <a href="index.php?p=<?php echo $side; ?>&ind=<?php echo $row['traad_id']; ?>"><?php echo $row['ind_head'];?></a>
  <?php
	 if (isset($_SESSION['Forum traad mod']) == 1)
	 {
	 ?>
      <BR />
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil g&oslash;re denne tr&aring;d ikke sticky');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&ustik=<?php echo $row['traad_id']; ?>">Uvigtig Tr&aring;</a> |
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil flytte denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_flyt=<?php echo $row['traad_id']; ?>">Flyt Tr&aring;d</a> | 
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_slet=<?php echo $row['traad_id']; ?>">Slet Tr&aring;d</a>
  <?php } ?>
  
    <td align="center" class="item2"><?php
	 $traad_id = $row['traad_id'];
	 $last_reply = "Select * From forum_reply Inner Join user On forum_reply.fk_bruger_id = user.user_id Where forum_reply.fk_traad_id = '$traad_id' Order By forum_reply.re_id Desc Limit 1";
	 $last_result = mysql_query ($last_reply) or die (mysql_error());
while ($last = mysql_fetch_assoc($last_result))
  {
	  echo $last['frist_name'].' '.$last['last_name'].' '.date('d/m-Y',$last['re_date']);   
  }
	 ?></td>
    <?php
     echo '</td><td align="center" class="item2">'.$row['username'].'</td>';
	 echo '<td align="center" class="item2 last_item">';
	 	$reply = "SELECT * FROM forum_reply WHERE fk_traad_id = '$row[traad_id]'";
	 	$re_sult = mysql_query ($reply) or die (mysql_error());
	 	$reply_tal = mysql_num_rows($re_sult);
	 	echo $reply_tal;	  
	 echo '</td></tr>';
  }
// ================================================================
// uvigtige tråde
$sql = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Where forum_traad.fk_kat_id = '$kat' And forum_traad.fk_stik_id = '1' Order By fk_reply_date DESC";
	$Result = mysql_query ($sql) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	 if($row["reply_on_off"] == 0)
	 {
	 echo '<tr><td aling="center" style="width:35px;" class="item"><img src="include/forum/icons/linedpaper32.png" /></td><td class="item">';
	 }
	 else
	 {
		 	 echo '<tr><td  aling="center" style="width:35px;" class="item"><img src="include/forum/icons/linedpaperlock32.png" /></td><td class="item">';
	 }
	 ?>
    <a href="index.php?p=<?php echo $side; ?>&ind=<?php echo $row['traad_id']; ?>"><?php echo $row['ind_head'];?></a>
    <?php
	 if (isset($_SESSION['Forum traad mod']) == 1)
	 {
	 ?>
    <BR />
    <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil g&oslash;re denne tr&aring;d sticky');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&stik=<?php echo $row['traad_id']; ?>">vigtig Tr&aring;d</a> |
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil flytte denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_flyt=<?php echo $row['traad_id']; ?>">Flyt Tr&aring;d</a> |
      <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_slet=<?php echo $row['traad_id']; ?>">Slet Tr&aring;d</a>
    <?php
	 }
     echo '</td>';
	 ?>
    <td align="center" class="item"><?php
	 $traad_id = $row['traad_id'];
	 $last_reply = "Select * From forum_reply Inner Join user On forum_reply.fk_bruger_id = user.user_id Where forum_reply.fk_traad_id = '$traad_id' Order By forum_reply.re_id Desc Limit 1";
	 $last_result = mysql_query ($last_reply) or die (mysql_error());
while ($last = mysql_fetch_assoc($last_result))
  {
	  echo $last['frist_name'].' '.$last['last_name'].' '.date('d/m-Y',$last['re_date']);  
  }
	 ?></td>
    <?php echo '<td align="center" class="item">'.$row['username'].'</td>';
	 echo '<td align="center" class="item last_item">';
	 	$reply = "SELECT * FROM forum_reply WHERE fk_traad_id = '$row[traad_id]'";
	 	$re_sult = mysql_query ($reply) or die (mysql_error());
	 	$reply_tal = mysql_num_rows($re_sult);
	 	echo $reply_tal;	  
	 echo '</td></tr>';
  }

?>
</table>
<?php
// ================================================================
if (isset($_SESSION['Forum traad']) == 1)
	 {
		 ?>
  <table>
      <tr>
      	<td>
		    <form action="" method="post">
        </td>
      </tr>
      <tr>
      	<td><strong>Ny Tr&aring;d:</strong></td>
      </tr>
      <tr>
        <td><input type="text" name="head" required="required" style="width:723px;" maxlength="30" /></td>
      </tr>
      <tr>
        <td><textarea name="text" id="traad" rows="8" style="width:723px; max-width:723px; min-height:140px"></textarea></td>
      </tr>
      <tr>
        <td><input type="submit" name="traad_op" value="Opret Tr&aring;d" /></td>
      </tr>
    </form>
    <tr>
      <td><?php if(isset($msg)){echo $msg;} ?></td>
    </tr>
  </table>
<?php
	 }
?>
