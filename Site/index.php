<?php
ob_start();
session_start();
require_once("/DBcon/dbconn.php");
include_once("/Login/login.php");
echo '<pre>';
echo print_r($_SESSION);
echo '</pre>';

?>