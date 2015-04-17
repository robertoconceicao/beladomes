<?php
	include_once 'src/db.php';
	session_start();
	
	//isset($_GET["page"]) ? intval($_GET['page']) : 1;
	$nuBotao = isset($_POST['nuBotao']) ? intval($_POST['nuBotao']) : 1;
	
	$cdConcurso = $_SESSION['cdConcurso'];
	
	/*
	 * Foi feito por sessao para evitar que algum espertinho troque o valor do cdPerfil 
	 * via console do browser e sair votando sempre na mesma boneca.
	 * Desse jeito q estamos fazendo isso não será possível pq ele nao tem acesso aos
	 * objetos da sessão, então se ele trocar la na tela o cdPerfil nao vai adiantar de 
	 * nada o voto vai ser pra mina q esta realmente no paredao, chupa .|.
	 */
	$cdPerfil = $_SESSION['perfil1']->cdPerfil;
	// Se foi o botao 2 pega o perfil2 da sessao
	if($nuBotao == 2){
		$cdPerfil = $_SESSION['perfil2']->cdPerfil;		
	}
	
	$result = array();
	
	$buscaVotos=mysqli_query($connection,
                             " SELECT qtvoto
							FROM voto 
							where cdConcurso = $cdConcurso 
							and cdPerfil = $cdPerfil ") or die(mysqli_error($connection));
	
	$obj = mysqli_fetch_object($buscaVotos);

	$qtVoto = isset($obj) ? $obj->qtvoto : 0;
	
	$query = "";
	//Insert
	if($qtVoto == 0){
		$query = "INSERT INTO voto ( cdConcurso, cdPerfil, qtvoto) VALUES ( $cdConcurso, $cdPerfil, 1 )";				
	} else {
		$qtVoto++;	
		$query = "UPDATE voto SET qtvoto = $qtVoto WHERE cdConcurso = $cdConcurso and cdPerfil = $cdPerfil";
	}
	
	mysqli_query($connection, $query) or die(mysqli_error($connection));
	
	$result = array("success" => true);
	
	echo json_encode($result);	
?>
