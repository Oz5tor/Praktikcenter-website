<?php 
//indlæsning af data fra database:

$assignmentId           = $_GET['id'];//Henter opgave id fra url'en, som skal bruges til at finde den data der er om denne opgave

$assignment_sql_state   = "select * from assignment where id=$assignmentId";
$assignment_sql_result  = mysqli_query($db_conn, $assignment_sql_state) or die (mysqli_error($db_conn));

while ($row = mysqli_fetch_assoc($assignment_sql_result)){
                          
    
    $assignmentName         = $row['name'];
    $assignmentDescription  = $row['description'];
    $assignmentStatus       = $row['status']."%";
    
                        }




?>


<h1><?php echo $assignmentName;?></h1>

<h3>Opgave beskrivelse:</h3>
<p><i><?php echo $assignmentDescription ?></i></p>

<h3>Status: </h3>

<p><?php echo $assignmentStatus ?></p>