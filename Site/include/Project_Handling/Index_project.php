<?php 
if(isset($_GET['projectId'])){
    include('include/Project_Handling/project_details.php');
    }
else{
    include('include/Project_Handling/Show_currunt_projects.php');
    include('include/Project_Handling/Show_exprired_projects.php');
}
?>