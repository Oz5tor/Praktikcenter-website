<div id="contend" align="center">
  <div id="longtextbox">
  	<?php include_once("include/random_quote.php"); ?>
  </div>

<?php 
if(isset($page) == "Forside")
{
?>
  <div id="smalltextboxwrapper">
	<?php include_once("include/tre_random_pics.php"); ?>
  </div>
<?php
}
?>
  <div id="bigtextboxes" class="bigtextboxes">
  
  <?php
// ==========================================================
    // Adminstrative pages = sider med formulare så som opret bruger mm.
    switch($admin){
        case 'Nyhed':
            include_once('include/administartion/CRUD_nyhed.php');
            break;
        case 'Opret Elev':
            include_once('include/User_module/create_student.php');
            break;
        case 'Opret Instruktør':
            include_once('include/User_module/create_instructor.php');
            break;
        case 'Opret Værkføre':
            include_once('include/User_module/create_forman.php');
            break;
        case 'Projekt Oversigt':
            include_once('include/Project_Handling/Index_project.php');
            break;
        case 'Opret nyt projekt':
            include_once('include/Project_Handling/Create_project.php');
            break;
        case 'Opret ny opgave':
            include_once('include/Project_Handling/Create_assignment.php');
            break;
        case 'Projekt Skabeloner':
            include_once('include/Project_Handling/Activate_proTemp.php');
            break;
        case 'Projekt Skabeloner info':
            include_once('include/Project_Handling/ProTemp_details.php');
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
            if(isset($_SESSION['user'])){
            include_once("include/forum/forum_index.php");
            }
            else{
                echo "<div style='text-align:center'><img src='img/pleaselogintocontinue.png' /></div>";
            };
            break;
        case 'Profil':
            include_once("include/User_module/MyProfile.php");
            break;
        case 'Assignment_details':
            include_once("include/Project_Handling/Assignment_details.php");
            break;
        case 'Udstyrs Liste':
            include_once("include/Equipment_Handling/Show_equipment.php");
            break;
        default: // for dynamic pages not yet created.
            include_once("include/edit_pages.php");
            break;
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
    <fieldset>
    <legend>Midlertidige administrations links</legend>
    <a href="index.php?administration=Nyhed">Nyheds administartion <strong>(BETA)</strong></a><br>
    <a href="index.php?administration=menu">Menu Admin</a><br>
    <a href="index.php?administration=Opret Elev">Opret Elev</a><br>
    <a href="index.php?administration=Opret Instruktør">Opret Instruktør</a><br>
    <a href="index.php?administration=Opret Værkføre">Opret Værkføre</a><br>
    <a href="index.php?administration=Projekt Oversigt">Projekt Oversigt</a><br>
    <a href="index.php?administration=Opret nyt projekt">Opret nyt projekt</a><br>
    <a href="index.php?administration=Opret ny opgave">Opret ny Opgave</a><br>
    <a href="index.php?administration=Projekt Skabeloner">Projekt Skabeloner</a><br>
    <a href="index.php?page=Udstyrs Liste">Udstyrs Liste</a><br>
</fieldset>
</div>
