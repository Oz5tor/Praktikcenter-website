<?php
// slet Reply
if (isset($_GET['r_slet']))
{
$sql = "DELETE FROM forum_reply WHERE re_id = '$r_slet' LIMIT 1";
mysql_query($sql) or die (mysql_error());
header ("location: index.php?p=$side&ind=$ind");
}
// ==============================================================
// slet tråd & svar's
if (isset($_GET['t_slet']))
{
	$slet_all = "DELETE FROM forum_reply WHERE fk_traad_id = '$t_slet'";
	mysql_query($slet_all) or die (mysql_error());
	
	$t_sql = "DELETE FROM forum_traad WHERE traad_id = '$t_slet' LIMIT 1";
	mysql_query($t_sql) or die (mysql_error());
	
	header ("location: index.php?p=$side&kat=$kat");
}
// ===============================================================
//echo 'hoho J-DAG';
// sletter en categori && alle tråde iden && alle svar
if (isset($_GET['c_slet']))
{
	// sletter reply start
	$hen_traad = "SELECT * FROM forum_traad WHERE fk_kat_id = '$c_slet'";
	$result = mysql_query ($hen_traad) or die (mysql_error());
		while ($row = mysql_fetch_assoc($result))
		{
			
			$sql_svar = "DELETE FROM forum_reply WHERE fk_traad_id = '$row[traad_id]'";
			mysql_query($sql_svar) or die (mysql_error());
		}
		// sletter reply slut
		
		//slet Tråde
		$t_sql = "DELETE FROM forum_traad WHERE fk_kat_id = '$c_slet' ";
		mysql_query($t_sql) or die (mysql_error());
	
		// slet kategori
		$c_sql = "DELETE FROM forum_kat WHERE kat_id = '$c_slet'";
		mysql_query($c_sql) or die (mysql_error());	
		header ("location: index.php?p=$side");
}
//===============================================================
// gøre en traad til fast emne
if (isset($_GET['stik']))
{
	$stik_sql = "UPDATE forum_traad SET fk_stik_id = '2' WHERE traad_id = '$stik'";
	mysql_query($stik_sql) or die (mysql_error());
	header ("location: index.php?p=$side&kat=$kat");
}
if (isset($_GET['cstik']))
{
	$stik_sql = "UPDATE forum_kat SET fk_stik_id = '2' WHERE kat_id = '$cstik'";
	mysql_query($stik_sql) or die (mysql_error());	
	header ("location:index.php?p=$side");
}
// ==============================================================
// sætter traad til at værer et nomalt emne
if (isset($_GET['ustik']))
{
	$ustik_sql = "UPDATE forum_traad SET fk_stik_id = '1' WHERE traad_id = '$ustik'";
	mysql_query($ustik_sql) or die (mysql_error());
	header ("location: index.php?p=$side&kat=$kat");
}

if (isset($_GET['custik']))
{
	$ustik_sql = "UPDATE forum_kat SET fk_stik_id = '1' WHERE kat_id = '$custik'";
	mysql_query($ustik_sql) or die (mysql_error());
	header ("location: index.php?p=$side");
}
// ==============================================================
// flyt traad
if (isset($_POST['flyt_traad']))
{
	$kat = $_POST['flyt'];
	$flyt_sql = "UPDATE forum_traad SET fk_kat_id = '$kat' WHERE traad_id = '$t_flyt'";
	mysql_query($flyt_sql) or die (mysql_error());	
	header ("location: index.php?p=$side&kat=$kat");
}
// ==============================================================
// opret kategori
if(isset($_SESSION['Forum kategori mod']) == 1)
{
	if (isset($_POST['kat_op']))
	{
		if ($_POST['head'] == '')
		{
			$bo = 'udfyld alle felterne';
		}
		else
		{
			$navn_head = $_POST['head'];
			$afdeling = $_POST['afdeling'];
			$navn_head = strip_tags ($navn_head);
			$sql_head = "INSERT INTO forum_kat VALUES ('','$navn_head', '1', '0' ,'$afdeling')";
			mysql_query($sql_head) or die (mysql_error());
			$new_kat = mysql_insert_id();
			header ("location: index.php?p=$side&kat=$new_kat");
		}
	}
}
// ==============================================================
//ret kategori
if (isset($_SESSION['Forum kategori mod']) == 1)
{
	if(isset($_GET['r_kat']))
	{
		$r_kat = $_GET['r_kat'];
		
		if (isset($_POST['kat_ret']))
		{
			if ($_POST['head'] == '')
			{
				$bo2 = 'udfyld alle felterne';
			}
			else
			{
				$navn = $_POST['head'];
				$navn = strip_tags ($navn);
				$sql = "UPDATE forum_kat SET kat_navn = '$navn' WHERE kat_id = '$r_kat' ";
				mysql_query($sql) or die (mysql_error());
				header ("location: index.php?p=$side");
			}
		}
	}
}
// ==============================================================
//opret traad
if (isset($_POST['traad_op']))
{
	if ($_POST['head'] == '' || $_POST['text'] == '')
{
	$msg = 'udfyld alle felterne';
}
	else
	{
		$head = $_POST['head'];
		$head = strip_tags($head);
		$text = $_POST['text'];
		$text = mysql_real_escape_string($text);
		$date = time();
		if (isset($_SESSION['user']))
		{
			$user = $_SESSION['user'];;
		}
		$sql = "INSERT INTO forum_traad VALUES ('', '$user', '$head', '$text', '$date', '$kat', '1', '0', '0')";
		$last_kat_sql = "UPDATE forum_kat SET fk_last_traad_ind_date = '$date' WHERE kat_id = '$kat' ";
		mysql_query($last_kat_sql) or die (mysql_error());
		mysql_query($sql) or die (mysql_error());
		$new_traad = mysql_insert_id();
		header ("location: index.php?p=$side&ind=$new_traad");
	}
}
// ==============================================================
// laas traad
if (isset($_GET['t_laas']))
{
	$lass_sql = "UPDATE forum_traad SET reply_on_off = '1' WHERE traad_id = '$t_laas'";
	mysql_query($lass_sql) or die (mysql_error());
	header ("location: index.php?p=$side&ind=$t_laas");
}

if (isset($_GET['t_ulaas']))
{
	$lass_sql = "UPDATE forum_traad SET reply_on_off = '0' WHERE traad_id = '$t_ulaas'";
	mysql_query($lass_sql) or die (mysql_error());
	header ("location: index.php?p=$side&ind=$t_ulaas");
}
// ==============================================================
// ret traad
if(isset($_POST['t_ret_update']))
{
	$text = $_POST['text'];
	$traad_update_sql = "UPDATE forum_traad SET ind_text = '$text' WHERE traad_id = '$ind'";
	mysql_query($traad_update_sql) or die (mysql_error());
	header("location:index.php?p=$side&ind=$ind");
	
}
// ==============================================================
// ret reply
if(isset($_POST['r_ret_update']))
{
	$text = $_POST['text'];	
	$traad_update_sql = "UPDATE forum_reply SET re_text = '$text' WHERE re_id = '$r_ret'";
	mysql_query($traad_update_sql) or die (mysql_error());
	header("location:index.php?p=$side&ind=$ind");	
}
// =============================================================
// opret reply
if (isset($_POST['reply']))
{
	if ($_POST['text'] == '')
	{
		$msg = 'udfyld alle felterne';
	}
	else
	{
	$text = $_POST['text'];
	$date = time();
	if (isset($_SESSION['user']))
	{
		$user = $_SESSION['user'];;
	}
$last_reply_sql = "UPDATE forum_traad SET fk_reply_date = '$date' WHERE traad_id = '$ind' ";
mysql_query($last_reply_sql) or die (mysql_error());
// === nr. på reply
$what_reply_nr = "SELECT re_id from forum_reply WHERE fk_traad_id = '$ind'";
$what_reply_nr_result = mysql_query($what_reply_nr) or die (mysql_error());
$what_reply_nr_records = mysql_num_rows($what_reply_nr_result);	
$new_reply_nr = $what_reply_nr_records +1;	
$sql = "INSERT INTO forum_reply VALUES ('', '$ind', '$user', '$text', '$date', '$new_reply_nr')";
mysql_query($sql) or die (mysql_error());
header ("location: index.php?p=$side&ind=$ind");
	}
}
?>