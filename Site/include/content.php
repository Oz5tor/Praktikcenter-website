<div id="contend" align="center">
  <div id="longtextbox">
  	<?php include_once("include/random_quote.php"); ?>
  </div>

  <div id="smalltextboxwrapper">
	 <?php include_once("include/tre_random_pics.php"); ?>
  </div>
  
  <div id="bigtextboxes" class="bigtextboxes">
  
  <?php
// ==========================================================
    // Admionistration pages
    switch($admin){
        case 'Nyhed':
            include_once('include/administartion/CRUD_nyhed.php');
        break;
    }
// ==========================================================
    // Public pages
    if(!isset($page)){
    }
    else {
        switch($page) {
        case 'Forside':
            include_once("include/news.php");
            break;
        case 'Forum':
            if(isset($_SESSION['user']))
            {
            include_once("include/forum/forum_index.php");
            }
            else
            {
                echo "<div style='text-align:center'><img src='img/pleaselogintocontinue.png' /></div>";
            };
            break;
          /*default: // for dynamic pages not yet created.
            include_once("include/news.php");
            break;*/
        }
    }
    ?>
  </div>
  <?php 
echo "<pre>";
print_r($_SESSION);
echo "</pre>";
echo "<br />".time();
?>
</div>
