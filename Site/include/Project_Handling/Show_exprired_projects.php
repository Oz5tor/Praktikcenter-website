<?php
        $temp_now = time();
        $projects_sql = "SELECT * from project Where end < '$temp_now'";
        $projects_result = mysqli_query($db_conn, $projects_sql) or die (mysqli_error($db_conn));
        $total_records = mysqli_num_rows($projects_result); // toplam veri sayisi
        $scroll_page = 10; // kaydirilacak sayfa sayisi
        $per_page = 6; // her sayafa gösterilecek sayfa sayisi


if(isset($_GET['acpage']))
	{
		$current_page = strip_tags($_GET['acpage']); // bulunulan sayfa
	}
	else
	{
		$current_page = 1;
	}
	$pager_url = "index.php?page=$page&acpage="; // sayfalamanin yapildigi adres
	$inactive_page_tag = 'id="current_page"'; // aktif olmayan sayfa linki için biçim
	$previous_page_text = '&nbsp;<img style="vertical-align:bottom;" src="img/a2-prev.png" />&nbsp;'; // önceki sayfa metni (resim de olabilir <img src="... gibi)
	$next_page_text = '<img src="img/a3-next.png" style="vertical-align:bottom;" />&nbsp; '; // sonraki sayfa metni (resim de olabilir <img src="... gibi)
	$first_page_text = '<img src="img/a1-first.png" style="vertical-align:bottom;" />'; // ilk sayfa metni (resim de olabilir <img src="... gibi)
	$last_page_text = '<img src="img/a4-last.png" style="vertical-align:bottom;" />'; // son sayfa metni (resim de olabilir <img src="... gibi)
	$pager_url_last = ' ';
    
	$kgPagerOBJ = new kgPager();
	$kgPagerOBJ -> pager_set($pager_url , $total_records , $scroll_page , $per_page , $current_page , $inactive_page_tag , $previous_page_text , $next_page_text , $first_page_text , $last_page_text , $pager_url_last);
	$albums_result = mysqli_query($db_conn,$projects_sql." ORDER BY end ASC LIMIT ".$kgPagerOBJ -> start.", ".$kgPagerOBJ -> per_page."");
	
	if($total_records >= 1)
    {
        while ($projects_row = mysqli_fetch_assoc($albums_result))
	    {    
        
        $name = $projects_row['name'];
        $start = $projects_row['start'];
        $end = $projects_row['end'];
        $proID = $projects_row['id'];
            ?>
            <a href="?page=Projekt Oversigt&projectId=<?php echo $proID; ?>">
                <div id="projectsholder">
                    <div class="textCenter borderbottom"><b><p><?php echo $name; ?></p></b></div>
                    <div>
                        <div class="projectStartEnd">
                            <div style="float:left;">
                                <table>
                                    <tr>
                                        <td>
                                            <?php $startDate = gmdate("d-m-Y",$start); $endDate = gmdate("d-m-Y",$end); ?>
                                            <?php echo "Start dato: "?>
                                        </td>
                                        <td><?php echo $startDate;?></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <?php echo "Slut dato: "?>
                                        </td>
                                        <td>
                                            <?php echo $endDate?>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="daysleft">
                            <table>
                                <tr>
                                    <td>
                                        Dage tilbage: <?php $date = date_create();
                                        $currentDate = date_timestamp_get($date);
                                        $dayLeft = $end - $currentDate;
                                        $PrintDLeft = $dayLeft / 86400 % 2200;
                                        echo $PrintDLeft; ?>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </a>
            <?php
            }
            ?>
        <span style="display:block; clear:both;"></span>
        <hr>
    <?php
    }else {
        echo "<div class='textCenter'><b>Der er ingen aktive Projekter</b></div>";
        echo '<hr>';
    } // end of content to pagenation

if($total_records >= 1)
{
    echo '<div class="textCenter">';
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
    echo '</div>';
}
?>