<h1>Projekt oversigt over aktive projekter</h1>

<fieldset>
<?php
$today = getdate();

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
    ?><?php if($today[0]<$end){?>
    <div id= "Project" class="Project">
       <fieldset>
           <h3><a href="?administration=Projekt Oversigt&projectId=<?php echo $proID; ?>"><?php echo $name; ?></a></h3>
           <?php $startDate = gmdate("d-m-Y",$start); $endDate = gmdate("d-m-Y",$end); ?>
           <table border="1">
               <tr>
                <td><?php echo "Start dato: ".$startDate;?></td>
                <td rowspan="2">
                    Dage tilbage: <?php $date = date_create();
                                        $currentDate = date_timestamp_get($date);
                                        $dayLeft = $end - $currentDate;
                                        $PrintDLeft = $dayLeft / 86400 % 2200;
                                        echo $PrintDLeft; ?>
                </td>
               </tr>
               <tr>
                <td>
                    <?php echo " Slut dato: ".$endDate ?>
                   </td>
                </tr>
           </table>
        </fieldset>
    </div>    
    <?php
    // nulstiller arrayet så det er klart til næste project
    unset($members);
}}
?>
</fieldset>


<?php //kode til at vise alle medlemmer i projektet

//<?php foreach($members as $member){echo $member;} 

?>