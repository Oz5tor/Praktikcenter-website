<nav>
    <ul>
        <?php
            $nav_sql="SELECT * FROM main_menu_cat" ;
            $nav_result= mysqli_query($db_conn, $nav_sql) or die (mysqli_error($db_conn));
            while ($nav_row= mysqli_fetch_assoc($nav_result)) 
            {
                $nav_cat_id=$nav_row['id'];
                if($nav_row['icon']==NULL) 
                {
                    $nav_image='<img src="img/icons/003w.png" />';
                } 
                else
                {
                    $nav_image="<img src='" .$nav_row['icon']. "' />"; 
                } ?>
                <li>
                    <?php echo $nav_image.' '; echo $nav_row['menu_cat_name']; ?>
                    <?php
                    $sub_nav_sql = "select * from main_menu_subcat Where fk_menu_cat_id = '$nav_cat_id'";
                    $sub_nav_resut = mysqli_query($db_conn, $sub_nav_sql) or die (mysql_error());
                    while($sub_row = mysqli_fetch_assoc($sub_nav_resut))
                    {
                        $sub_cat_id=$sub_row['id'];
                        if($sub_row['icon']==NULL)
                        {
                            $nav_image='<img src="img/icons/003w.png" />';
                        } 
                        else
                        {
                            $nav_image="<img src='" .$sub_row['icon']. "' />"; 
                        } ?>
                        <ul>
                            <li>
                                <a href="?p=<?php echo $sub_row['menu_subcat_name']; ?>"><?php echo $nav_image.' '; echo $sub_row['menu_subcat_name']; ?></a>
                                <ul>
                                <?php
                                $sub_nav_sql = "select * from main_menu_subsubcat Where fk_menu_subcat_id = '$sub_cat_id'";
                                $sub_nav_resut = mysqli_query($db_conn, $sub_nav_sql) or die (mysql_error());
                                while($sub_row = mysqli_fetch_assoc($sub_nav_resut))
                                {?>
                                        <li>
                                            <a href="?p=<?php echo $sub_row['menu_subsubcat_name']; ?>">
                                                <?php echo $sub_row['menu_subsubcat_name']; ?>
                                            </a>
                                        </li>                
                        <?php   }
                    }?>
                                </ul>
                            </li>
                        </ul>
                </li>
<?php       }?>
    </ul>
</nav>