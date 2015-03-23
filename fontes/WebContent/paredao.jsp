<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title></title>

<script src="/bela-mes/JQuery/jquery-2.1.0.js"></script>

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

</head>
<body>
	<div class="col-sm-2"></div>
	
	<div class="row">	
		<form method="post">
		  <div class="col-sm-6 col-md-3">
		    <div class="thumbnail">
		      <img src="data:image/png;base64,${perfil0.byteArrayString}" alt="" class="photoParedao"/>
		      <div class="caption photoDescricao">
		        <h3>${perfil0.nmUsuario}</h3>
		        <p>${perfil0.idade}, ${perfil0.cidade}</p>
					
					<input type="hidden" size="0" name="cdPerfil0" id="cdPerfil0" value="${perfil0.cdPerfil}">

		        <p>
		        	<input type="button" class="btn btn-primary" name="cdPerfil0" 
		        		value="Votar" onclick="votar(${perfil0.cdPerfil});"> 
		        </p> 
		        
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-sm-1"></div>
 
		  <div class="col-sm-6 col-md-3">
		    <div class="thumbnail">
		      <img src="data:image/png;base64,${perfil1.byteArrayString}" alt=" " class="photoParedao"/>
		      <div class="caption photoDescricao">
		        <h3>${perfil1.nmUsuario}</h3>
		        <p>20, Florianópolis</p>
		       
		        <input type="hidden" size="0" name="cdPerfil1" id="cdPerfil1" value="${perfil1.cdPerfil}">

		        <p>
		        	<input type="button" class="btn btn-primary" name="cdPerfil1" 
		        		value="Votar" onclick="votar(${perfil1.cdPerfil});"> 
		        </p>
		         
		      </div>
		    </div>
		  </div>
		</form>
	</div>
</body>
</html>