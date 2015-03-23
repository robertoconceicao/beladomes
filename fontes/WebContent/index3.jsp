<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Sign in with Facebook example</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/bela-mes/JQuery/jquery-2.1.0.js"></script>
<link href="/bela-mes/bootstrap-3.1.1-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="/bela-mes/bootstrap-3.1.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/bela-mes/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/bela-mes/bootstrap-3.1.1-dist/jquery.isotope.min.js"></script>


<link rel="stylesheet" type="text/css" href="css/base-ltr.153.css"/>
<link rel="stylesheet" type="text/css" href="css/page.search-ltr.19.css"/>
<link rel="stylesheet" type="text/css" href="css/popup.messenger-ltr.69.css"/>


<style>
	h1 {
	    font-size: 120px;
	     color: white; 
	}
	
	h2 {
	    font-size: 20px;
	     color: white; 
	}
	
	.foo {
    	position: absolute;
    	bottom: 25;
	    right: 5;
 	}
 	 
 	.label-as-badge {
	    border-radius: 1em;
	}
	
	body {
		background: #2f3238;
/* 		color: #fff; */
 		font-weight: 400; 
 		font-size: 1em; 
 		font-family: 'Raleway', Arial, sans-serif;
	}
	
</style>	

</head>
<body>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1404595923181238',
      xfbml      : true,
      version    : 'v2.2'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

   $(function () {
	  $('[data-toggle="tooltip"]').tooltip();
	});
	
  	function votar(idbotao) {
		form = document.forms[0];
		
		form.action = "./voto?action="+idbotao;				
		form.submit();
	}	

  	$('#myModal').on('shown.bs.modal', function () {
  	  $('#myInput').focus();
  	})
</script>


<tag:notloggedin>
  <a href="signin">Sign in with Facebook</a>
  
  
</tag:notloggedin>
<tag:loggedin>
  <h1>Welcome ${facebook.name} (${facebook.id})</h1>
    
  Nome: ${facebook.me.name} <br>
  Id: ${facebook.me.id} <br>
  FirstName: ${facebook.me.firstName} <br>  
  MiddleName: ${facebook.me.middleName} <br>
  LastName: ${facebook.me.lastName} <br>
  Gender: ${facebook.me.gender} <br>
  Locale: ${facebook.me.locale} <br>
  Link: ${facebook.me.link} <br>
  Username: ${facebook.me.username} <br>
  ThirdPartyId: ${facebook.me.thirdPartyId} <br>
  Birthday: ${facebook.me.birthday} <br>
  Email: ${facebook.me.email} <br>
  Picture: <img src="${facebook.pictureURL}" /> <br>
  RelationshipStatus: ${facebook.me.relationshipStatus} <br>
  Religion: ${facebook.me.religion} <br>
    
  <form action="./post" method="post">
    <textarea cols="80" rows="2" name="message"></textarea>
    <input type="submit" name="post" value="statuses" />
  </form>
<a href="./logout">logout</a>
</tag:loggedin>

<p>
	<div 
	  class="fb-like"
	  data-share="true"
	  data-width="450"
	  data-show-faces="true">
	</div>
</p>

<div class="bs-docs-header" id="content" tabindex="-1" align="center">
      <div class="container" align="center">
    	<img src="/bela-mes/bela-mes-fotos/concursoLogo.png" style="height: auto; width:600px; height:200px;" align="top">
      </div>
    </div>


<div>
	
	<div class="container" >
	
		<br><br>
	
		<div class="col-sm-2"></div>
		
		<div class="row">
		
			<form method="post">
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail">
			      <img src="data:image/png;base64,${perfil0.byteArrayString}" alt=" "/>
			      <div class="caption">
			        <h3>${perfil0.nmUsuario}</h3>
			        <p>${perfil0.idade}, ${perfil0.cidade}</p>
						
						<input type="hidden" size="0" name="cdPerfil0" id="cdPerfil0" value="${perfil0.cdPerfil}">

			        <p>
			        	<input type="button" class="btn btn-primary" name="cdPerfil0" 
			        		value="Votar" onclick="votar(0);"> 
			        </p> 
			        
			      </div>
			    </div>
			  </div>
			  
			  <div class="col-sm-1"></div>
	 
			  <div class="col-sm-6 col-md-3">
			    <div class="thumbnail">
			      <img src="data:image/png;base64,${perfil1.byteArrayString}" alt=" "/>
			      <div class="caption">
			        <h3>${perfil1.nmUsuario}</h3>
			        <p>20, Florianópolis</p>
			       
			        <input type="hidden" size="0" name="cdPerfil1" id="cdPerfil1" value="${perfil1.cdPerfil}">

			        <p>
			        	<input type="button" class="btn btn-primary" name="cdPerfil1" 
			        		value="Votar" onclick="votar(1);"> 
			        </p>
			         
			      </div>
			    </div>
			  </div>
			</form>
		</div>
</div>

</div>

<div>

	<h1>Top 20!</h1>	

	<div class="row" id="container" style="margin: 20px; margin-left: 100px">
	
		<c:forEach var="perfil" items="${listaPerfil}" varStatus="indice">
		   <div>
			    <div class="element thumbnail">		    
						<div class="user-card__user-photo female">    
							<img src="data:image/png;base64,${perfil.byteArrayString}" 
								class="photo">
								 
							<span class="photo-counter-badge tr"><i class="ico ico--xsm ico--white ico--camera"></i>${indice.index + 1}º</span> 
						</div> 
						<div class="user-card__section"> 
							<div class="user-card__attr">							 
								<span class="user-name app">${perfil.nmUsuario}</span>
								
							    <div class="badge__marks">								 
									<div class="intr">									 
										<i class="ico ico-interest ico--xsm ico--grey               ico--thumbup "></i> 
										<span class="intr-txt"><b>Idade: </b> ${perfil.idade}</span>    
										<span class="blocker"></span> 
									</div>
									<div class="intr">									 
										<i class="ico ico-interest ico--xsm ico--grey               ico--thumbup "></i> 
										<span class="intr-txt"><b>Cidade: </b> ${perfil.cidade}</span>    
										<span class="blocker"></span> 
									</div>
									<div class="intr">									 
										<i class="ico ico-interest ico--xsm ico--grey               ico--thumbup "></i> 
										<span class="intr-txt"><b>Votos: </b> ${perfil.qtVoto}</span>    
										<span class="blocker"></span> 
									</div>
								</div>  
							</div>
						</div>
				    </div>
			  </div>
		 
		</c:forEach>
		
	</div>
</div>

<script>
    $(function(){      
      var $container = $('#container');
      
      $container.isotope({
        //itemSelector : '.element',
        masonry : {
          columnWidth : 20
        }
   	  	//masonryHorizontal: {
   		 //   rowHeight: 360
   		 // }

      });      
    });    
  </script>

</body>
</html>