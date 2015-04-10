<?php
	include_once 'src/db.php';
	session_start();
	//Situacao = [1 - em andamento, 2 - finalizado]
	$query=mysql_query("SELECT cdConcurso FROM concurso where situacao = 1") or die(mysql_error());
					
	# retorna o codigo do concurso que esta em andamento
	# só pode haver um concurso em andamento
	$concurso = mysql_fetch_object($query);
	
	$_SESSION['cdConcurso'] = $concurso->cdConcurso;	
?>