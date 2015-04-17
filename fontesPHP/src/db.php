<?php 
define('DB_SERVER', 'mysql.hostinger.com.br');
define('DB_USERNAME', 'u749850328_bob');
define('DB_PASSWORD', 'A1im0k8Kll');
define('DB_DATABASE', 'u749850328_bela');
$connection = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD) or die(mysqli_error($connection));
$database = mysqli_select_db($connection, DB_DATABASE) or die(mysqli_error($connection));
?>
