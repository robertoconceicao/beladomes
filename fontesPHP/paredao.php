<!DOCTYPE html>

<style type="text/css">
	
	.photoParedao{
		height: 265px;
		width : 250px;
	}
	.photoDescricao{
		height: 150px;
		width : 250px;
	}
</style>

<?php
	include_once 'src/db.php';
	session_start();
	
	$query=mysql_query(" SELECT cdPerfil, nmUsuario, urlPerfil, urlFoto, cidade, idade, genero, foto FROM perfil ORDER BY RAND() LIMIT 2 ") or die(mysql_error());
					
	# retorna as duas participantes do paredao
	$perfil1 = mysql_fetch_object($query); //mysql_fetch_array($query);
	$perfil2 = mysql_fetch_object($query);
	
	$_SESSION['perfil1'] = $perfil1;
	$_SESSION['perfil2'] = $perfil2;
	
	echo "[DEBUG] - Perfil1: {$_SESSION['perfil1']->cdPerfil} <br />";
	echo "[DEBUG] - Perfil2: {$_SESSION['perfil2']->cdPerfil} <br />";
?>

<div class="col-sm-2"></div>

<div class="row">	
	<form action="votar.php" method="post">
	  <div class="col-sm-6 col-md-3">
	    <div class="thumbnail">
	      <img src="data:image/png;base64,<?php echo base64_encode($_SESSION['perfil1']->foto);?>" alt="" class="photoParedao fotoClass1" />
	      
	      <div class="caption photoDescricao">
	        <h3><?php echo $_SESSION['perfil1']->nmUsuario; ?></h3>
	        <p><?php echo $_SESSION['perfil1']->idade . ', '.$_SESSION['perfil1']->cidade; ?></p>					
				<input type="hidden" size="0" name="cdPerfil1" id="cdPerfil1" value="<?php echo $_SESSION['perfil1']->cdPerfil;?>">
	        <p>
	        	<input type="button" class="btn btn-primary" name="cdPerfil1" 
	        		value="Votar" onclick="votar(1);"> 
		        </p> 
		        
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-sm-1"></div>
 
		  <div class="col-sm-6 col-md-3">
		    <div class="thumbnail">
		      <img src="data:image/png;base64,<?php echo base64_encode($_SESSION['perfil2']->foto);?>" alt="" class="photoParedao fotoClass2"/>		      
	      <div class="caption photoDescricao">
	        <h3><?php echo $_SESSION['perfil2']->nmUsuario; ?></h3>
	        <p><?php echo $_SESSION['perfil2']->idade . ', '.$_SESSION['perfil2']->cidade; ?></p>					
				<input type="hidden" size="0" name="cdPerfil2" id="cdPerfil2" value="<?php echo $_SESSION['perfil2']->cdPerfil;?>">
	        <p>
	        	<input type="button" class="btn btn-primary" name="cdPerfil2" 
	        		value="Votar" onclick="votar(2);"> 
	        </p>		        
	      </div>
	    </div>
	  </div>
	</form>
</div>