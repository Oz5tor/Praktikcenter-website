<?php 
    $db_host="192.168.0.4"; // Host name
    $db_username="c1root"; // Mysql username
    $db_password="A123linux2013"; // Mysql password
    $db_name="c1praktikcenter"; // Database name
    $db_conn = mysqli_connect("$db_host","$db_username","$db_password","$db_name");
    $db_conn -> set_charset("utf8");
?>  

<?php
if (isset($_POST['submit_mail']))
{	
	$contat_array = array();
	//		er email valid start
	if (isset($_POST['email']) == true && empty($_POST['email' == false]))
	{
		$email = $_POST['email'];
		if (filter_var($email, FILTER_VALIDATE_EMAIL) == true)
		{
			$contat_array[] = 0;
			$email = $_POST['email'];
		}
		else
		{
			$contat_array[] = 1;
			$email = $_POST['email'];
			$faill_email = '<strong><p class="public_contact_faill">&lowast; Din mail er ikke gyldig.</p></strong>';
		}
	}
	//		er email valid Slut
	
	//		er tlf valid start
	if (isset($_POST['tlf']) == true && empty($_POST['tlf' == false]))
	{
		$phone = $_POST['tlf'];
		
		$formats = array('###-###-####',
		'####-###-###',
		'(###) ###-###',
		'####-####-####',
		'##-###-####-####',
		'####-####',
		'###-###-###',
		'#####-###-###',
		'##########',
		'####-##-##-##',
		'## ## ## ##',
		'########',
		'+## ########',
		'+## ## ## ## ##'
		);
		$format = trim(preg_replace("/[0-9]/", "#", $phone));	
		
		if(in_array($format, $formats) == true)
		{
			$contat_array[] = 0;
			$phone = $_POST['tlf'];
		}
		else
		{
			$contat_array[] = 1;
			$phone = $_POST['tlf'];
			$faill_phone = '<strong><p class="public_contact_faill">&lowast; Dit telefon nummer er ikke gyldig.</p></strong>';
		}	
	}
	//		er tlf valid Slut
	
	//		er navn valid start
	if (isset($_POST['navn']) == true && empty($_POST['navn' == false]))
	{
		$navn = $_POST['navn'];
		$navn = utf8_encode($navn);
		if(preg_match("/^[a-åA-Å]{2}/", $navn) == true)
		{
			$contat_array[] = 0;
			$navn = $_POST['navn'];
		}
		else
		{
			$contat_array[] = 1;
			$navn = $_POST['navn'];
			$faill_navn = '<strong><p class="public_contact_faill">&lowast; Dit navn skal mindst v&aelig;re p&aring; 2 tegn.</p></strong>';
		}	
	}
	//		er navn valid Slut
	
	//		er emne valid start
	if (isset($_POST['emne']) == true && empty($_POST['emne' == false]))
	{
		$emne = $_POST['emne'];
		$emne = utf8_encode($emne);
		if(preg_match('/^[a-åA-Å0-9]{5}/', $emne) == true)
		{
			$contat_array[] = 0;
			$emne = $_POST['emne'];
		}
		else
		{
			$contat_array[] = 1;
			$emne = $_POST['emne'];
			$faill_emne = '<strong><p class="public_contact_faill">&lowast; Dit emne skal v&aelig;re p&aring; mindst 5 tegn.</p></strong>';
		}	
	}
	//		er emne valid Slut	
	
	//		er besked valid start
	if (isset($_POST['besked']) == true && empty($_POST['besked' == false]))
	{
		$besked = $_POST['besked'];
		if((strlen($besked) > 30))
		{
			$contat_array[] = 0;
			$besked = $_POST['besked'];
			$besked = str_replace(array("\r\n", "\r", "\n"), "", $besked);
		}
		else
		{
			$contat_array[] = 1;
			$besked = $_POST['besked'];
			$faill_besked = '<strong><p class="public_contact_faill">&lowast; Din tekst skal v&aelig;re p&aring; min 255 tegn.</p></strong>';
		}
	}
	//		er besked valid Slut	
	if (isset($contat_array))
	{
		if(in_array(1, $contat_array))
		{
			//echo 'Der er fejl i udfyldningen';
		}
		else
		{
			//echo 'Der er ingen fejl i udfyldningen';
			
			//$besked	=	strip_tags($besked);
			$emne	=	strip_tags($emne);
			$navn	=	strip_tags($navn);
			$phone	=	strip_tags($phone);
			$email	=	strip_tags($email);
			
			$besked	=	mysqli_real_escape_string($db_conn,$besked);
			$emne	=	mysqli_real_escape_string($db_conn,$emne);
			$navn	=	mysqli_real_escape_string($db_conn,$navn);
			$phone	=	mysqli_real_escape_string($db_conn,$phone);
			$email	=	mysqli_real_escape_string($db_conn,$email);
			
			/*$afdeling = $_POST['afdeling'];*/
				
			/*$sql = "SELECT * FROM afdelinger WHERE id = '$afdeling'";
			$result = mysql_query($sql) or die (mysql_error());
			$afdeling_row = mysql_fetch_assoc($result);*/
			
			
			$ToEmail = /*$afdeling_row['mail'] /**/'Torsoya@gmail.com';  
			$EmailSubject = $emne;
			$mailheader = "From:$navn <$email>"."\n"; 
			$mailheader .= "Reply-To: ".$email."\n"; 
			$mailheader .= "Content-type: text/html; charset=iso-8859-1\n";
			$MESSAGE_BODY = "Navn: ".$navn."<br />";
			$MESSAGE_BODY .= "Telefon: ".$phone."<br />"; 
			$MESSAGE_BODY .= "emne: ".$emne."\n<br />";
			$MESSAGE_BODY .= "Vedr&oslash;rende: <br />".$besked."<br />";  
			//echo '<br />'. $ToEmail, $EmailSubject, $mailheader, $MESSAGE_BODY;
			mail($ToEmail, $EmailSubject, $MESSAGE_BODY, $mailheader) or die (mysqli_error($db_conn));	
			$success = 1;
		}
	}
}
?>      



<div id="contat">
<?php if(!isset($success)== 1){ ?>
<form action="" method="post">
<table style="width: 378px;" id="form">

<tr>
<td valign="top">Navn:</td>
<td><input name="navn" required="required" min="2" type="text" id="navn" value="<?php if(isset($navn)) {echo $navn;}?>" style="width: 374px; font-size: 12px; padding:2px; border:1px solid #000;">
<?php if(isset($faill_navn)) {echo $faill_navn;}?>
</td>
</tr>
<tr>
<td valign="top">Telefon:</td>
<td><input name="tlf" type="text" required="required" id="telefon" value="<?php if(isset($phone)) {echo $phone;}?>" style="width: 374px; font-size: 12px; padding:2px; border:1px solid #000;"><?php if(isset($faill_phone)) {echo $faill_phone;}?></td>
</tr>
<tr>
<td valign="top">Email:</td>
<td><input name="email" type="email" required="required" id="email" value="<?php if(isset($email)) {echo $email;}?>" style="width: 374px; font-size: 12px; padding:2px; border:1px solid #000;"><?php if(isset($faill_email)) {echo $faill_email;}?></td>
</tr>
<tr>
<td valign="top">Emne:</td>
<td><input name="emne" type="text" required="required" min="5" value="<?php if(isset($emne)) {echo $emne;}?>" id="emne" style="width: 374px; font-size: 12px; padding:2px; border:1px solid #000;"><?php if(isset($faill_emne)) {echo $faill_emne;}?></td>
</tr>
<tr>
<td valign="top">Besked:</td>
<td><textarea id="p_contact" name="besked" required="required"  style=" width:375px;font-size: 12px; padding:2px; border:1px solid #000;" id="vedr"><?php if(isset($besked)) {echo $besked;}?></textarea><?php if(isset($faill_besked)) {echo $faill_besked;}?></td>
</tr>
<tr>
<td></td>
<td align="left" valign="top">
<input type="submit" name="submit_mail" value="Send Email" />
</td>
</tr>
</table>
</form>
<?php 
}
else
{ ?>

<p><strong>Du har sendt beskeden</strong></p>
<p><strong>Til: </strong><?php echo $afdeling_row['mail']; ?></p>
<p><strong>Emne: </strong><?php echo $emne;?></p>
<p><strong>Besked:</strong><?php echo $besked; ?></p>
<meta http-equiv="refresh" content="3; index.php">



<?php 
}
?>
</div>