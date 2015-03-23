<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title></title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="/bela-mes/bootstrap-3.1.1-dist/jquery.isotope.min.js"></script>

<script type="text/javascript">
	$(function(){
    	var $container = $('#container');
    
    	$container.isotope({
      		masonry : {
        		columnWidth : 20
      		}
    	});
  });
</script>

<style type="text/css">
	.imgpos {
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-200px;
		margin-top:-300px;			
		height: 400px;
		width: 600px;
		border: 1px solid white;	
	}
	
	.close {	
		font-weight: 50;
		position:inherit;	
		left:100%;
		cursor: pointer;
		font-size: 2em;
		line-height: 0.6;
		color: white;
	}
</style>

</head>
	<div class="row" id="container" style="margin: 20px; margin-left: 100px;">	
		<c:forEach var="perfil" items="${listaPerfil}" varStatus="indice">
		  
		   <div>
		    <div class="element thumbnail">		    
			    <div style="height: auto; max-width: 100%;" align="center" data-toggle="tooltip" title="${perfil.nmUsuario}" 
			   		 data-placement="bottom" id="foto${indice.index}">
			   		
			   		<img src="data:image/png;base64,${perfil.byteArrayString}" style="height: auto; max-width: 100%; cursor: pointer;" name="bela${indice.index}"
			   			onclick="aumenta(${indice.index})" id="img${indice.index}">
			   				
			   		<div style="font-size: 36px"> 
				    	<span class="foo label label-success label-as-badge">${indice.index + 1}º</span>
				    </div>
				    
			    </div>
		    </div>
		  </div>	
		  
		</c:forEach>		
	</div>
		
	<div class="imgpos" hidden="true" id="imgpos">
		<span class="close" onclick="diminui()">x</span>
		<img src="#" alt="" id="imgLoad" style="height: auto; max-width: 100%;"/>
	</div>	 
</html>