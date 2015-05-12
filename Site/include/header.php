<div id="header">
  <div id="headerwrap">
    <div id="headertopspace"></div>
    <div id="headerteclogo"> <a href="index.php"><img src="img/tec_logo.png" alt="TEC-PC.dk - klik for at komme til forsiden" border="0"></a><strong>
      <h5>Teknisk Erhvervsskole Center - Pratik Center</h5>
      </strong></a> </div>
    <div style="height:70px; width:500px; float:left; margin-bottom:14px;">
    <?php 
	  if (isset($_SESSION['user']))
		{
			include_once("include/User_module/logged_in.php");
		}
	?>	
    </div>
    <div id="headerlogin" align="left">
	<?php 
	  if (!isset($_SESSION['user']))
		{
			include_once("include/User_module/login.php");
		}
	?>
    </div>
    <div id="navbox">
      <?php include_once("include/Navigation/navbox.php") ?>
    </div>
    <!-- end navbox --> 
  </div>
  <!-- end headerwrap --> 
</div>
