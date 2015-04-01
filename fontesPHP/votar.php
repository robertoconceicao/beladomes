<?php

	include_once 'src/db.php';
	
	//isset($_GET["page"]) ? intval($_GET['page']) : 1;
	$nuBotao = isset($_POST['nuBotao']) ? intval($_POST['nuBotao']) : 1;
	
	/*
	 * Foi feito por sessao para evitar que algum espertinho troque o valor do cdPerfil 
	 * via console do browser e sair votando sempre na mesma boneca.
	 * Desse jeito q estamos fazendo isso não será possível pq ele nao tem acesso aos
	 * objetos da sessão, então se ele trocar la na tela o cdPerfil nao vai adiantar de 
	 * nada o voto vai ser pra mina q esta realmente no paredao, chupa .|.
	 */
	$cdPerfil = $cdPerfil = $_SESSION['perfil1']->cdPerfil;
	// Se foi o botao 2 pega o perfil2 da sessao
	if($nuBotao == 2){
		$cdPerfil = $_SESSION['perfil2']->cdPerfil;		
	} 
	
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