<?php
$tilbage = "SELECT * FROM forum_traad WHERE traad_id = '$ind'";
$Result = mysql_query ($tilbage) or die (mysql_error());
while ($row = mysql_fetch_assoc($Result))
  {
	  $back = $row['fk_kat_id'];
  }


// ================================================================
if (isset($_GET['ind']) == $ind)
	{
		$sql = "Select * From forum_traad Inner Join user On forum_traad.fk_bruger_id = user.user_id Inner Join user_roller On user.user_id = user_roller.fk_user_id Inner Join roller On roller.rolle_id = user_roller.fk_rolle_id Where forum_traad.traad_id = '$ind'";
		$Result = mysql_query ($sql) or die (mysql_error());
		while ($row = mysql_fetch_assoc($Result))
  		{
			?>


<div id="Traad_original" style="min-height:200px; border-bottom:#000 2px solid;">
	<div style="float:left; min-height:200px; width:120px;">
    	<!-- traad owner info -->
        <div class="profil_image">
        	<?php 
			if ($row['image'] == 'nopic.png')
			{
				echo '<img src="img/profile/nopic.png" style="border:2px #000000 solid" width="100" height="100" />';
			}
			else
			{
				
			}
        	?>
        </div>
        <div id="user_traad_info" st>
        	<strong><?php echo $row['rolle_navn'] ?></strong>
            <br />
            <strong><?php echo $row['frist_name'].' '.$row['last_name']; ?></strong>
        </div>
        <!-- ======================= -->
    </div>
    
    <div class="head" style="float:left; padding-left:5px; width:626px; border-left:#000 2px solid;">
	    <div>
        	<div id="forum_navigation" style="float:left;">
            	<a href="index.php?p=Forum&kat=<?php echo $back; ?>">Tilbage</a>
            </div>
            
			<div id="forum_navigation" style="float:right;">
            <?php
				// ret traad
				if(isset($_SESSION['user']))
				{
					if(($row['fk_bruger_id'] == $_SESSION['user']) && ($t_ret == ''))
					{
						?>
						| <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil rette din tr&aring;d');" href="index.php?p=<?php echo $side; ?>&ind=<?php echo $row['traad_id']; ?>&t_ret=<?php echo $row['traad_id']; ?>">Ret Tr&aring;d</a>
						<?php
					}
				}
				// hvis forum mod
				if (isset($_SESSION['Forum traad mod']) == 1)
            	{?>
                        |
                        <?php 
						// u/laas traad 
                        if($row['reply_on_off'] == '0')
                        {
                        ?>
                        <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil L&Aring;se denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_laas=<?php echo $row['traad_id']; ?>">L&aring;s Tr&aring;d</a>
                        <?php
                        }
                        else
                        {
                        ?>
                        <a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil &Aring;bne denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_ulaas=<?php echo $row['traad_id']; ?>">L&aring;s Tr&aring;d Op</a>
                        <?php
                        }
                        ?>
            			|
            			<a id="navigation" onclick="return confirm('Er du sikker p&aring; at du vil slette denne tr&aring;d');" href="index.php?p=<?php echo $side; ?>&kat=<?php echo $row['fk_kat_id']; ?>&t_slet=<?php echo $row['traad_id']; ?>">Slet Tr&aring;d</a> |
            

<?php 			}?></div>
            <div>
                <div style="clear:both; float:left;">
                    <p class="info"><strong>Tr&aring;d: <?php echo $row['ind_head'];?></strong></p>
                </div>
	            <div style="float:right;">
                	<p class="info">
                    	<strong><?php echo 'Oprettet '.date('d/m-Y',$row['ind_date']);?></strong>
                    </p>
                </div>
            </div>
        </div>
    </div>
    
    <div id="traad_txt" class="imgmax" style="float:left; min-height:200px; height:auto; padding-left:5px; padding-right:5px; border-left:#000 2px solid; max-width:626px;">
        <?php 
			if($t_ret == '')
			{
				echo $row['ind_text'];
			}
			else
			{
				include("include/forum/forum_ret_traad.php");
			}
			?>
    </div>
    <div style="clear:both;"></div>
    
</div>
	
<?php
  		}
		?>
        <div style="clear:both;"></div>
        <br  />
<?php
	}
	
	include_once "include/forum/forum_traad_content_2.php"; // svarene på tråden
// ============= Reply ==========================================================
 if (isset($_SESSION['Forum reply']) == '1') {
	$tilbage = "SELECT * FROM forum_traad WHERE traad_id = '$ind'";
	$Result = mysql_query ($tilbage) or die (mysql_error());
	$row = mysql_fetch_assoc($Result);
	if($row['reply_on_off'] == 0)
	{
	?>
	<div>
	  <table>
		  <tr>
			<td>
				<form action="" method="post">
			</td>
		  </tr>
		  <tr>
			<td>
				<textarea name="text" id="traad" rows="8" style="width:600px;"></textarea>
			</td>
		  </tr>
		  <tr>
			<td align="center"><input type="submit" name="reply" value="svar" /></td>
		  </tr>
		</form>
		  <tr>
			<td><?php if(isset($msg)){echo $msg;} ?></td>
		  </tr>
	  </table>
	</div>
	<?php
	}
	else {echo '<center><strong>DENNE TR&Aring;D ER L&Aring;ST</strong></center>';}
}
?>
