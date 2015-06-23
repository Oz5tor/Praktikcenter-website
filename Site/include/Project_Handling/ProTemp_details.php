<head>
<style>
table, td, th {
    border: 1px groove gray;
}

th {
    background-color: gray;
    color: white;
}

}

    </style>
</head>
<h1>Liste over projektskabeloner:</h1>

<table>
<tr><td>Projekt navn:</td><td>Projektbeskrivelse:</td><td>Kategori</td><td>Link til opgavebeskrivelse/kravspecifikation</td></tr>
<?php
$proTemp_sql_state = "select * from proTemp";
$proTemp_sql_result = mysqli_query($db_conn, $proTemp_sql_state) or die (mysqli_error($db_conn));

 while ($row = mysqli_fetch_assoc($proTemp_sql_result)){
     $proTempId = $row['id'];
    $proTempName = $row['name'];?>                      
   <tr><td>
    <h3><a href="?administration=Projekt Skabeloner info&proTempId=<?php echo $row['id'];?>"</a></h3><?php echo $row['name'];?>
        </td>
     <?php echo"<td>".$row['description']."</td>
     <td>".$row['FK_CatId']."</td>
     <td><a href=".$row['Frs_file'].">Kravsspec</a></td></tr>";
 } 
?>
</table>