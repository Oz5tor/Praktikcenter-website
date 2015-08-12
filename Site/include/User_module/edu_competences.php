<div class="textCenter"><h1>Uddannelserne og Deres Kompetancer</h1></div>
<hr>
<form>
    <select name="eud" id="edu">
        <option>Vælg Uddanelse</option>
        <?php
        $edu_sql = "Select * From edu";
        $edu_result = mysqli_query($db_conn, $edu_sql) or die (mysqli_error($db_conn));
        while ($edu_row = mysqli_fetch_assoc($edu_result)){
        ?>
        <option value="<?php echo $edu_row["id"]; ?>"><?php echo $edu_row["name"]; ?></option>
        <?php
        }
        ?>
    </select>
    
<section class="container">
    <?php 
        $edu_sql = "Select * From edu";
        $edu_result = mysqli_query($db_conn, $edu_sql) or die (mysqli_error($db_conn));
        while ($edu_row = mysqli_fetch_assoc($edu_result)){
            if(isset($SkillsOnEdu_array)){unset($SkillsOnEdu_array);}
            if(isset($AllSkills_array)){unset($AllSkills_array);}
            echo $edu = $edu_row['id'];
        ?>
        <div id="<?php echo $edu;?>">
        <!-- List of skills start -->
        <select id="leftValues" size="15" multiple>
            <?php 
            // ============ LIST OF ALL SKILLS =========================================
                $AllSkills_sql = "select * from skills";
                $AllSkills_result = mysqli_query($db_conn, $AllSkills_sql) or die (mysqli_error($db_conn));
                while ($AllSkills_row = mysqli_fetch_assoc($AllSkills_result)){
                    $AllSkills_array[]   = $AllSkills_row['skill'];
                }
            // ============ what skills do the edu have ================================
                $SkillsOnEdu_sql = "Select * From edu_skills Inner Join skills On skills.id = edu_skills.fk_skill_id Where fk_edu_id = '$edu'";
                $SkillsOnEdu_result = mysqli_query($db_conn, $SkillsOnEdu_sql) or die (mysqli_error($db_conn));
                while ($SkillsOnEdu_row = mysqli_fetch_assoc($SkillsOnEdu_result)){
                    $SkillsOnEdu_array[] = $SkillsOnEdu_row['skill'];
                    $temp_usedSkill = $SkillsOnEdu_row['skill'];
                } 
            $i = 0;
            foreach($AllSkills_array as $skill)
            {
                foreach($SkillsOnEdu_array as $key){
                    if($skill == $key)
                    {
                        unset($AllSkills_array[$i]);
                    }
                }
            $i++;
            }
            foreach($AllSkills_array as $skill){
                ?>
                <option value="<?php  ;?>"><?php echo $skill; ?></option>
                <?php
            }
            ?>
        </select>
        <!-- List of skills end -->
        </div>
        <div>
            <input type="button" id="btnLeft" value="&lt;&lt;" />
            <input type="button" id="btnRight" value="&gt;&gt;" />
        </div>
        <div>
            <select id="rightValues" name="members[]" size="4" multiple></select>
        </div>
        <?php
        }
        ?>
</section>
</form>



<script type="text/javascript">
    $(document).ready(function() {
    $('#edu').bind('change', function() {
        var elements = $('div.container').children().hide(); // hide all the elements
        var value = $(this).val();

        if (value.length) { // if somethings' selected
            elements.filter('.' + value).show(); // show the ones we want
        }
    }).trigger('change');
});
</script>