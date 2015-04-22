<div id="contend" align="center">
  <div id="longtextbox">
  	<?php include_once("include/random_quote.php"); ?>
  </div>

  <div id="smalltextboxwrapper">
	 <?php include_once("include/tre_random_pics.php"); ?>
  </div>
  
  <div id="bigtextboxes" class="bigtextboxes">
  
  <?php 
    if($side == 'Forum')
	{
		if(isset($_SESSION['user']))
		{
		include_once("include/forum/forum_index.php");
		}
		else
		{
			echo "<div style='text-align:center'><img src='img/pleaselogintocontinue.png' /></div>";
		};
	}
	else
	if($side == 'Forside') 
	{
		include_once("include/news.php");
	}
	else
	if($side == 'Contact')
	{
		include_once("include/public_contact.php");
	}
	else
	if($admin == 'Nyhed')
	{
		include_once("include/administartion/opret_ret_slet_nyhed.php");
	}
    else  
    if($admin == 'Menu')
	{
		include_once("include/administartion/opret_ret_slet_nyhed.php");
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
