<div class="textCenter">
    <h1>Projektskabeloner</h1>
    <hr>
</div>
<?php
    $pro_cat = "Select * From proTempCat";
    $procat_sql_result = mysqli_query($db_conn, $pro_cat) or die (mysqli_error($db_conn));
    while ($pro_cat_row = mysqli_fetch_assoc($procat_sql_result)){
        $procat_temp_id = $pro_cat_row['id'];
        ?>
        <div class="textCenter">
            <b><?php echo $pro_cat_row['name'] ?></b>
        </div>
        <br>
             <?php
        // udtræknins statement for skabeloner
        $proTemp_sql_state = "select * from proTemp where FK_CatID = '$procat_temp_id'";
        $proTemp_sql_result = mysqli_query($db_conn, $proTemp_sql_state) or die (mysqli_error($db_conn));
        while ($proTemp_row = mysqli_fetch_assoc($proTemp_sql_result)){
            ?>
            <div class="project_holder div_float_left">
                <div class="textCenter project_headder div_full_border_bottom div_float_left div_full_border-right">
                    <p><u><a href="?administration=Projekt Skabeloner info&proTempId=<?php echo $proTemp_row['id'];?>"><?php echo $proTemp_row['name'] ?></a></u></p>
                </div>
                <div class="textCenter project_headder div_full_border_bottom div_float_left">
                    <p><u><a target="_blank" href="<?php echo $proTemp_row['Frs_file'];?>">Kravspecifikation</a></u></p>
                </div>
                <div class="div_clear_both text_padding">
                    <p><?php echo $proTemp_row['description'] ?></p>
                </div>
            </div>
        <?php
        }
        ?>

        <span class="div_clear_both" style="display:block;"></span>
        <hr>
        <?php
    }
?>
       