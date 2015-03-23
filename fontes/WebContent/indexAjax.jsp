<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Bela do mês</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/bela-mes/JQuery/jquery-2.1.0.js"></script>
<link href="/bela-mes/bootstrap-3.1.1-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="/bela-mes/bootstrap-3.1.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/bela-mes/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript" src="/bela-mes/bootstrap-3.1.1-dist/jquery.isotope.min.js"></script> -->


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
    	bottom: 15;
	    right: 15;
 	}
 	 
 	.label-as-badge {
	    border-radius: 1em;
	}
	
	body {
		background: #2f3238;
		color: #fff;
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
		<div id="paredao"></div>
    </div>
</div>

<div>
	<h1>Top 20!</h1>	
	<div id="top20"></div>	
</div>

<script>

    jQuery(function(){
      	montarParedao();
	    montarTop20();
    });

    //Metodo Ajax para montar o paredao
	function montarParedao(){
		jQuery.get("./paredao", function (data){				
			jQuery("#paredao").html(data);			
		});
	}
	    
    //Metodo Ajax para montar a lista das tops
	function montarTop20(){
		jQuery.get("./top20", function (data){				
			jQuery("#top20").html(data);			
		});		
	}

    //Metodo Ajax para votar e depois do voto chama o montarParedao
	function votar(cdPerfil) {
		jQuery.post("./voto", 
			{cdPerfil: cdPerfil},
			function (data){				
				montarParedao();			
		});
	}
  </script>	
</body>
</html>