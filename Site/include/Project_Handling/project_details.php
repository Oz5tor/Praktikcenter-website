<head>
<style>
table, td, th {
    border: 1px groove gray;
}

th {
    background-color: gray;
    color: white;
}
    </style>
</head>

<?php 
$id = $_GET['projectId'];
$selctProjects_sql = "SELECT * from project where id=$id";
$sql_result = $sql_result = mysqli_query($db_conn, $selctProjects_sql) or die (mysqli_error($db_conn));


while($row = mysqli_fetch_assoc($sql_result)){
   // udtræk af collonner
    if($row['end'])
    $name = $row['name'];
    $start = $row['start'];
    $end = $row['end'];
    $proID = $row['id'];
    $leader = $row['leaderId'];
    $FK_ProTemp = $row['FK_ProTemp'];
    // henter deltager på projectet
    $student_sql = "Select * From userProject Inner Join user On user.id = userProject.userId where projectid = '$proID'";
    $student_sql_result = mysqli_query($db_conn, $student_sql) or die (mysqli_error($db_conn));
    while($student = mysqli_fetch_assoc($student_sql_result)){       
        $members[] = $student['fName'].' '.$student['lName'].', ';
   }}

//finder navnet der høre til et bruger id
$leaderName="test";
$findLeaderName_sql_state = "select * from user where id = $leader";
$findLeaderName_sql_result = mysqli_query($db_conn, $findLeaderName_sql_state) or die (mysqli_error($db_conn));
while($row = mysqli_fetch_assoc($findLeaderName_sql_result)){       
        $leaderName = $row['fName']." ".$row['lName'];


}
//Henter projekt beskrivelsen fra Projekt skabelon:
    
    
    $proDescTemp_sql_statement = "select * from proTemp where id = $FK_ProTemp";
    $proDescTemp_sql_result = mysqli_query($db_conn, $proDescTemp_sql_statement) or die (mysqli_error($db_conn));

    while($row = mysqli_fetch_assoc($proDescTemp_sql_result)){
        
        $ProDesc_text = $row['description'];
        
    }

// udskrivning af Projektoplysningerne    
    
echo "<h1>".$name."</h1>";   

echo "<h2>Projektbeskrivelse: </h2><br><i>".$ProDesc_text."</i><br>";
?>
<br><h2>Projekt medlemmer:</h2>

<div style="float:left;">
<table >
    <tr>
    <td>
        <b>Projekt Leder</b>
        </td>
    </tr>
    <tr>
    <td>
        <?php echo $leaderName; ?>
        </td>
    </tr>
    
    </table>
</div>

<div style="float:left;">
<table >
    <tr>
    <td><b>Projekt deltagere</b>
        </td></tr>
     <?php 
            $findProMembers_sql_state = "Select user.id, user.fName, user.lName From user Inner Join userProject On userProject.userId = user.id  where projectId = $id";
$findProMembers_sql_result = mysqli_query($db_conn, $findProMembers_sql_state) or die (mysqli_error($db_conn));

while($row = mysqli_fetch_assoc($findProMembers_sql_result)){
    ?> <tr><td><a href="?page=Profil&id=<?php echo $row["id"];?>"><?php echo ' '.$row['fName'].' '.$row['lName']; ?></a></td>
    <?php 
}
  ?>
    
    </table>

</div>
<span style="display:block; clear:both;"></span>
<br>
<h2>Projekt datoer:</h2>
    
<?php
echo "Start på projekt: ".date('d/m/Y', $start)."<br>";
echo "Slut på projekt: ".date('d/m/Y', $end)."<br><br>";
?>
<h2>Projekt Opgaver</h2>

<table>
    <tr>
        <td><b>Opgave navn</b></td><td><b>Status i %</b></td></tr>
        <?php 
            $assignment_sql_state = "select * from assignment where FK_ProId=$proID";
            $assignment_sql_result = mysqli_query($db_conn, $assignment_sql_state) or die (mysqli_error($db_conn));
            
            while($row = mysqli_fetch_assoc( $assignment_sql_result)){
                
              echo"<tr><td>"."<a href='?page=Assignment_details&id=".$row['id']."'>".$row['name']."</a></td><td>".$row['status']."</td></tr>";
            }
        ?>
    <?php if(isset($_POST['add_assignment'])){
            header("location:index.php?administration=Opret ny opgave&id=$proID");
        } ?>
    
    <form action="" method="post"> <input type="submit" name="add_assignment" value="Tilføj opgave til projektet"></form>
   
</table>

