<?php

//dbconnector:
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
?>
<head>
      
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
        dateFormat: "yy/mm/dd"
    });
  });
      
      $(function() {
    $( "#datepicker2" ).datepicker({
      changeMonth: true,
      changeYear: true,
        dateFormat: "yy/mm/dd"
    });
  });
  </script>
    
</head>

<h1>Opret nyt projekt</h1>
<table>
<tr>
        <td>Projekt navn:</td>
        <td><input type="text" min="2" max="40" id="projectName" name="projectName" required></td>
    </tr>
        
<tr>
        <td>Projekt Beskrivelse:</td>
    </tr>

</table>
 
<?php

?>