<img class="profilepic" src="img/profile/nopic.png"/>
        <div class="userinfo">
            <table>
                <tr>
                    <td><b>Uddannelse: </b></td>
                    <?php
                        $edu_sql = "Select * From edu where id = '$eduInt'";
                        $edu_result = mysqli_query($db_conn, $edu_sql) or die (mysqli_error($db_conn));
                        $edu_row = mysqli_fetch_assoc($edu_result); 
                    ?>
                    <td><?php echo $edu_row['name']; ?></td>
                </tr>
                <tr>
                    <td><b>Funktion: </b></td>
                    <?php 
                         $role_sql ="Select user.fk_role_id, roles.id, roles.name, user.id As id1 From user
                Inner Join roles On roles.id = user.fk_role_id
                Where user.id = '$id'";
                        $role_result = mysqli_query($db_conn, $role_sql) or die (mysqli_error($db_conn));
                        $role_row = mysqli_fetch_assoc($role_result); 
                        ?>
                    <td><?php echo $role_row['name'] ?></td>
                </tr>
                <tr>
                    <td><b>Navn: </b></td>
                    <td><?php echo $user_row['fName'].' '. $user_row['lName'] ; ?></td>
                </tr>
                <tr>
                    <?php 
                    // number of days the user has left
                    $date = date_create();
                    $currentDate = date_timestamp_get($date);
                    $dayLeft = $user_row['eduEnd'] - $currentDate;
                    $PrintDLeft = $dayLeft / 86400 % 2200;  
                    // ====================
                    ?>
                    <td><b>Tid Tilbage:</b></td>
                    <td><?php echo $PrintDLeft;?> Dage</td>
                </tr>
                <tr>
                    <td><b>Skills: </b></td>
                    <?php
                        $skill_sql = "Select * From userSkills Inner Join skills On skills.id = userSkills.skillId where userId =$id";
                        $skill_result = mysqli_query($db_conn, $skill_sql) or die (mysqli_error($db_conn)); 
                    ?>
                    <td><?php while ($skill_row = mysqli_fetch_assoc($skill_result)){echo '#'.$skill_row['skill'].' ';} ?></td>
                </tr>
            </table>
        </div>
        <span style="display:block; clear:both;"></span>