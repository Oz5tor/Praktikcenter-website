<?php 
	$news_sql = "SELECT * FROM news";
	$news_result = mysqli_query($db_conn, $news_sql) or die (mysqli_error($db_conn));
	$total_records = mysqli_num_rows($news_result); // toplam veri sayisi
	$scroll_page = 10; // kaydirilacak sayfa sayisi
	$per_page = 5; // her sayafa gösterilecek sayfa sayisi
	
	if(isset($_GET['npage']))
	{
		$current_page = strip_tags($_GET['npage']); // bulunulan sayfa
	}
	else
	{
		$current_page = 1;
	}
	$pager_url = "index.php?page=$page&npage="; // sayfalamanin yapildigi adres
	$inactive_page_tag = 'id="current_page"'; // aktif olmayan sayfa linki için biçim
	$previous_page_text = '&nbsp;<img style="vertical-align:bottom;" src="img/a2-prev.png" />&nbsp;'; // önceki sayfa metni (resim de olabilir <img src="... gibi)
	$next_page_text = '<img src="img/a3-next.png" style="vertical-align:bottom;" />&nbsp; '; // sonraki sayfa metni (resim de olabilir <img src="... gibi)
	$first_page_text = '<img src="img/a1-first.png" style="vertical-align:bottom;" />'; // ilk sayfa metni (resim de olabilir <img src="... gibi)
	$last_page_text = '<img src="img/a4-last.png" style="vertical-align:bottom;" />'; // son sayfa metni (resim de olabilir <img src="... gibi)
	$pager_url_last = ' ';
	
	$kgPagerOBJ = new kgPager();
	$kgPagerOBJ -> pager_set($pager_url , $total_records , $scroll_page , $per_page , $current_page , $inactive_page_tag , $previous_page_text , $next_page_text , $first_page_text , $last_page_text , $pager_url_last);
	$albums_result = mysqli_query($db_conn,$news_sql." ORDER BY id DESC LIMIT ".$kgPagerOBJ -> start.", ".$kgPagerOBJ -> per_page."");
	
	while ($news_row = mysqli_fetch_assoc($albums_result))
	{
?>   
    
    <div class="drop_shadow" id="news_text">
		<?php echo '<h2>'.$news_row['titel'].' </h2>'; ?>
		<?php echo '<p>'.$news_row['txt'].'</p>'; ?>
        <hr style="clear:both;"/>
    </div>
    <?php }

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