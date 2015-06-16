<?php 
	$news_sql = "Select * From
				  forum_reply Inner Join
				  user On forum_reply.fk_bruger_id =
				  user.user_id Inner Join
				  user_roller On user_roller.fk_user_id =
				  user.user_id Inner Join
				  roller On roller.rolle_id = 
				  user_roller.fk_rolle_id 
				  Where forum_reply.fk_traad_id = '$ind'";
	
	
	
	$news_result = mysql_query($news_sql) or die (mysql_error());
	
	$total_records = mysql_num_rows($news_result); // toplam veri sayisi
	$scroll_page = 10; // kaydirilacak sayfa sayisi
	$per_page = 10; // her sayafa gösterilecek sayfa sayisi
	
	if(isset($_GET['page']))
	{
		$current_page = strip_tags($_GET['page']); // bulunulan sayfa
	}
	else
	{
		$current_page = 1;
	}
	$pager_url = "index.php?p=$side&ind=$ind&page="; // sayfalamanin yapildigi adres
	$inactive_page_tag = 'id="current_page"'; // aktif olmayan sayfa linki için biçim
	$previous_page_text = '&nbsp;<img style="vertical-align:bottom;" src="img/a2-prev.png" />&nbsp;'; // önceki sayfa metni (resim de olabilir <img src="... gibi)
	$next_page_text = '<img src="img/a3-next.png" style="vertical-align:bottom;" />&nbsp; '; // sonraki sayfa metni (resim de olabilir <img src="... gibi)
	$first_page_text = '<img src="img/a1-first.png" style="vertical-align:bottom;" />'; // ilk sayfa metni (resim de olabilir <img src="... gibi)
	$last_page_text = '<img src="img/a4-last.png" style="vertical-align:bottom;" />'; // son sayfa metni (resim de olabilir <img src="... gibi)
	$pager_url_last = ' ';
	
	$kgPagerOBJ = new kgPager();
	$kgPagerOBJ -> pager_set($pager_url , $total_records , $scroll_page , $per_page , $current_page , $inactive_page_tag , $previous_page_text , $next_page_text , $first_page_text , $last_page_text , $pager_url_last);
	$albums_result = mysql_query($news_sql." ORDER BY forum_reply.re_id DESC LIMIT ".$kgPagerOBJ -> start.", ".$kgPagerOBJ -> per_page."");
// ======================================================================

// ======================== Skift ud fra her =========================================
while ($news_row = mysql_fetch_assoc($albums_result))
{  
	?>         
    <div class="Traad_original" style="min-height:200px; border-top:#000 2px solid;">
        <div style="float:left; width:120px;">
            <div class="profil_image">
            <br />
                <?php 
                if ($news_row['image'] == 'nopic.png')
                {
                    echo '<img src="img/profile/nopic.png" style="border:2px #000000 solid" width="100" height="100" />';
                } else {  }
                ?>
            </div>
                <div id="user_traad_info">
                    <strong><?php echo $news_row['rolle_navn'] ?></strong>
                    <br />
                    <strong><?php echo $news_row['frist_name'].' '.$news_row['last_name']; ?></strong>
                </div>         
            </div>
        
            <div class="head" style="float:left; padding-left:5px; border-left:#000 2px solid; width:626px;">
                <div style="clear:both; float:left; padding-top:7px; width:100%">
	                <div style="float:left; min-height:25px;"><strong class="info">#<?php echo $news_row['re_nr'];?></strong></div>
                    <div id="forum_navigation" style="float:left; padding-bottom:2px; min-height:25px;"> &nbsp;
						<?php 
						// ================== inprogress ==========================
						if(isset($_SESSION['user']))
						{
							if( ($news_row['user_id'] == $_SESSION['user']) && ( (time() - 600) <= $news_row['re_date'] ) )
							{
								?>
                                | <a id="navigation" class="btn_ret_reply" onclick="return confirm('Er du sikker p&aring; at du vil Rette tid svar svar');" href="	<?php echo 'index.php?p='.$side.'&ind='.$ind.'&r_ret='.$news_row['re_id']?>"></a> 
                                <?php
							}
						}
						// ============================================
						
                        if ( (isset($_SESSION['Forum svar mod']) == 1) || ($news_row['user_id'] == (isset($_SESSION['user'])))  )
                        { ?>
							| <a id="navigation" class="btn_slet_reply" onclick="return confirm('Er du sikker p&aring; at du vil slette dette svar');" href="<?php echo 'index.php?p='.$side.'&ind='.$ind.'&r_slet='.$news_row['re_id']?>"></a> |
                        <?php
                        }
                        ?>
		            </div>
                    <div style="float:right;"><strong style="color:Maroon; float:right;"><?php echo 'Dato: '.date('d/m-Y',$news_row['re_date']);?></strong></div>
                </div>
            </div>
        
            <div id="traad_txt" class="imgmax" style="float:left; border-left:solid 2px black; min-height:171px; padding-left:5px; padding-right:5px; max-width:626px;">
             <?php
			 if($r_ret == $news_row['re_id'])
			 {
				 include("include/forum/forum_reply_ret.php");
			 }
			 else
			 {
			 	echo $news_row['re_text'];
				echo '<div style="clear:both;"></div>';
			 }?>
                
            </div>
            
        </div>   
        <div style="clear:both;"></div>
    <?php } ?> <div style="border-top:2px #000 solid;">&nbsp;</div>

<?php
// ============================ Skift ud Til Her ==================================================

	echo '<br />';
	echo '<center><div style="clear:both; height:15px; width:700px;">';
	

      if($current_page > 1)
	  {
		  echo '<p style="display:inline; ">'.$kgPagerOBJ -> first_page.'</p>' ;
		  echo '<p style="display:inline; ">'.$kgPagerOBJ -> previous_page.'</p>' ;
	  }
	  else
	  {
		  echo '<p style="display:inline;">&nbsp;<img style="vertical-align:bottom;" src="img/d1-first.png" />&nbsp;</p>';
		  echo '<p style="display:inline;"><img src="img/d2-prev.png" style="vertical-align:bottom;" />&nbsp;</p>';
	  }
	  echo '<p style="display:inline; line-height: 22px; ">'.$kgPagerOBJ -> page_links.'</p>' ;
	  if($current_page >= $kgPagerOBJ -> total_pages)
	  {
		  echo '<p style="display:inline;">&nbsp;<img src="img/d3-next.png" style="vertical-align:bottom;" />&nbsp;</p>';
		  echo '<p style="display:inline;"><img src="img/d4-last.png" style="vertical-align:bottom;" />&nbsp;</p>';
	  }
	  else
	  {
		  echo '<p style="display:inline;">'.$kgPagerOBJ -> next_page.'</p>' ;
		  echo '<p style="display:inline;">'.$kgPagerOBJ -> last_page.'</p>' ;
	  }
      echo '</div></center>';
	 ?>
	 <br />