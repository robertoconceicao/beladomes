<?php

	include_once 'src/db.php';
	
	//isset($_GET["page"]) ? intval($_GET['page']) : 1;
	$cdPerfil = isset($_POST['cdPerfil']) ? intval($_POST['cdPerfil']) : 0;
	$cdConcurso = 1; //TODO pegar da base cdConcurso
	$result = array();
	
	$buscaVotos=mysql_query(" SELECT qtvoto 
							FROM voto 
							where cdConcurso = $cdConcurso 
							and cdPerfil = $cdPerfil ");
	
	$obj = mysql_fetch_object($buscaVotos);		

	$qtVoto = isset($obj) ? $obj->qtvoto : 0;
	
	$query = "";
	//Insert
	if($qtVoto == 0){
		$query = "INSERT INTO voto ( cdConcurso, cdPerfil, qtvoto) VALUES ( $cdConcurso, $cdPerfil, 1 )";				
	} else {
		$qtVoto++;	
		$query = "UPDATE voto SET qtvoto = $qtVoto WHERE cdConcurso = $cdConcurso and cdPerfil = $cdPerfil";
	}
	
	mysql_query($query) or die(mysql_error());
	
	array_push($result, array("success" => true));	
	echo json_encode($result);	
?>