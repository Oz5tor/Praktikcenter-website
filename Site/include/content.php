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
            $temp_filename = 'include/administartion/CRUD_nyhed.php';
            break;
        case 'Opret Elev':
            include_once('include/User_module/create_student.php');
            $temp_filename = 'include/User_module/create_student.php';
            break;
        case 'Opret Instruktør':
            include_once('include/User_module/create_instructor.php');
            $temp_filename = 'include/User_module/create_instructor.php';
            break;
        case 'Opret Værkføre':
            include_once('include/User_module/create_forman.php');
            $temp_filename = 'include/User_module/create_forman.php';
            break;
        case 'Opret nyt projekt':
            include_once('include/Project_Handling/Create_project.php');
            $temp_filename = 'include/Project_Handling/Create_project.php';
            break;
        case 'Opret ny opgave':
            include_once('include/Project_Handling/Create_assignment.php');
            $temp_filename = 'include/Project_Handling/Create_assignment.php';
            break;
        case 'Projekt Skabeloner':
            include_once('include/Project_Handling/ProTemp_details.php');
            $temp_filename = 'include/Project_Handling/ProTemp_details.php';
            break;
        case 'Projekt Skabeloner info':
            include_once('include/Project_Handling/Activate_proTemp.php');
            $temp_filename = 'include/Project_Handling/Activate_proTemp.php';
            break; 
        case 'Permissions':
            include_once('include/administartion/Permissions/Permissions_Administration.php');
            $temp_filename = 'include/administartion/Permissions/Permissions_Administration.php';
            break;   
        case 'Opret udstyr':
            $temp_filename = 'include/Equipment_Handling/Create_equipment.php';
            include_once("include/Equipment_Handling/Create_equipment.php");
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
            $temp_filename = 'include/Project_Handling/ProTemp_details.php';
            break;
        case 'Forum':
            $temp_filename = 'include/forum/forum_index.php';
            if(isset($_SESSION['user'])){
            include_once("include/forum/forum_index.php");
            }
            else{
                echo "<div style='text-align:center'><img src='img/pleaselogintocontinue.png' /></div>";
            };
            break;
        case 'Profil':
            $temp_filename = 'include/User_module/MyProfile.php';
            include_once("include/User_module/MyProfile.php");
            break;
        case 'Assignment_details':
            $temp_filename = 'include/Project_Handling/Assignment_details.php';
            include_once("include/Project_Handling/Assignment_details.php");
            break;
        case 'Udstyrs Liste':
            $temp_filename = 'include/Equipment_Handling/Show_equipment.php';
            include_once("include/Equipment_Handling/Show_equipment.php");
            break;
        
        case 'Projekt Oversigt':
            $temp_filename = 'include/Project_Handling/Index_project.php';
            include_once('include/Project_Handling/Index_project.php');
            break;
        default: // for dynamic pages not yet created.
            $temp_filename = 'include/edit_pages.php';
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
echo "<br />".time().'<br>';

echo $temp_filename;
?>
    <fieldset>
    <legend>Midlertidige administrations links</legend>
    <a href="index.php?page=Udstyrs Liste">Udstyrs Liste</a><br>
    <a href="index.php?administration=Permissions">Permissions <b>WIP</b></a><br>
</fieldset>
</div>
