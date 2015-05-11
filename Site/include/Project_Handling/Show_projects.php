<?php

//dbconnector:
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
?>

<h1>Projekt oversigt</h1>
<?php

$sqlState = "select name from project";
$sql_result = $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
    
    while($row = mysqli_fetch_assoc($sql_result)){
        $proName[]= $row['name']; 
    }
        
$members ="";
foreach ($proName as $name){
    
    $sqlState="Select user.fName, user.lName From project Inner Join userProject On project.id = userProject.projectId Inner Join user On user.id = userProject.userId where       project.name ='$name'";
    
    $sql_result = mysqli_query($db_conn, $sqlState) or die (mysqli_error($db_conn));
    
    while($row = mysqli_fetch_assoc($sql_result)){
        $members.= $row['fName']." ".$row['lName'].", "; 
    }
                            
?> 
    

    <div class="Project">
        <button type="button" onclick="alert('<?php echo $members?>')">Elever</button>
        <?php echo $name ?>
    </div>

<?php
$members =""; }
unset($name); 
?>
