<?php

// ====================================

if (isset($_GET['ind'])){$ind = strip_tags($_GET['ind']);} else {$ind = '';}
if (isset($_GET['kat'])){$kat = strip_tags($_GET['kat']);} else {$kat = '';}
if (isset($_GET['t_flyt'])){$t_flyt = strip_tags($_GET['t_flyt']);} else {$t_flyt = '';}

//===============================================

if (isset($_GET['r_slet'])){$r_slet = strip_tags($_GET['r_slet']);} else {$r_slet = '';}
if (isset($_GET['r_ret'])){$r_ret = strip_tags($_GET['r_ret']);} else {$r_ret = '';}
if (isset($_GET['t_slet'])){$t_slet = strip_tags($_GET['t_slet']);} else {$t_slet = '';}
if (isset($_GET['t_ret'])){$t_ret = strip_tags($_GET['t_ret']);} else {$t_ret = '';}
if (isset($_GET['t_laas'])){$t_laas = strip_tags($_GET['t_laas']);} else {$t_laas = '';}
if (isset($_GET['t_ulaas'])){$t_ulaas = strip_tags($_GET['t_ulaas']);} else {$t_ulaas = '';}
if (isset($_GET['c_slet'])){$c_slet = strip_tags($_GET['c_slet']);} else {$c_slet = '';}

//===============================================

if (isset($_GET['stik'])){$stik = strip_tags($_GET['stik']);} else {$stik = '';}
if (isset($_GET['ustik'])){$ustik = strip_tags($_GET['ustik']);} else {$ustik = '';}

//===============================================

if (isset($_GET['cstik'])){$cstik = strip_tags($_GET['cstik']);} else {$cstik = '';}
if (isset($_GET['custik'])){$custik = strip_tags($_GET['custik']);} else {$custik = '';}

// ====================================

require_once("include/forum/forum_functions.php");

// ====================================

if (isset($_GET['t_flyt']))
	{
	include "include/forum/forum_flyt_traad.php";
	}
	if (!isset($_GET['kat']) && (!isset($_GET['ind'])))
	{
		include "include/forum/forum_katagorier.php";
	}
	else
	if (isset($_GET['kat']))
	{
		include "include/forum/forum_traade.php";
	}
	if (isset($_GET['ind']))
	{
		include "include/forum/forum_traad_content.php";
	}
?>