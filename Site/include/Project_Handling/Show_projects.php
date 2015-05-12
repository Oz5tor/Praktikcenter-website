
<?php

//dbconnector:
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
?>

<h1>Projekt oversigt</h1>

<fieldset>
<?php


$selctProjects_sql = "SELECT * from project";
$sql_result = $sql_result = mysqli_query($db_conn, $selctProjects_sql) or die (mysqli_error($db_conn));
while($row = mysqli_fetch_assoc($sql_result)){
   // udtræk af collonner
    $name = $row['name'];
    $start = $row['start'];
    $end = $row['end'];
    $proID = $row['id'];
    // henter deltager på projectet
    $student_sql = "Select * From userProject Inner Join user On user.id = userProject.userId where projectid = '$proID'";
    $student_sql_result = mysqli_query($db_conn, $student_sql) or die (mysqli_error($db_conn));
    while($student = mysqli_fetch_assoc($student_sql_result)){       
        $members[] = $student['fName'].' '.$student['lName'].', ';
    }
    // udskrivning af selve projecterne
    ?>
    <div id= "Project" class="Project" onmouseover="DisplayMessage(<?php foreach($members as $member){echo $member;} ?> onmouseout="UndisplayMessage()">
       <fieldset>
        
        
           <?php echo $name; ?> <?php $length = $end - $start; echo $length; ?></fieldset>
    </div>    
    <?php
    // nulstiller arrayet så det er klart til næste project
    unset($members);
}
?>
</fieldset>


<?php //kode til at vise alle medlemmer i projektet

//<?php foreach($members as $member){echo $member;} 

?>