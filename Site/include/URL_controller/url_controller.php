<?php
// ======================================================================
// page // hvilken side er det man står på
if(isset($_GET['page']))
{
	$page = mysqli_real_escape_string($db_conn,strip_tags($_GET['page']));
}
else
{
	$page = 'Forside';
}
// ======================================================================
// subpage // hvilken subside er det man står på eller om man ikke er på en.
if(isset($_GET['subpage']))
{
	$subpage = mysqli_real_escape_string($db_conn,strip_tags($_GET['subpage']));
}
else
{
	$subpage = '';
}
// ======================================================================
// adminnistration // hvilken admin side er man på
if(isset($_GET['administration']))
{
	$admin = mysqli_real_escape_string($db_conn,strip_tags($_GET['administration']));
}
else {
    $admin = '';
}
// ======================================================================
// action // hvad skal der ske
if(isset($_GET['action']))
{
	$action = mysqli_real_escape_string($db_conn,strip_tags($_GET['action']));
}
?>