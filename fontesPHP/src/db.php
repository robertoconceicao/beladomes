<?php 
define('DB_SERVER', 'mysql.hostinger.com.br');
define('DB_USERNAME', 'u749850328_bob');
define('DB_PASSWORD', 'A1im0k8Kll');
define('DB_DATABASE', 'u749850328_bela');
$connection = mysql_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD) or die(mysql_error());
$database = mysql_select_db(DB_DATABASE) or die(mysql_error());
?>