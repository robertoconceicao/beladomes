<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Bela do mês</title>

<script src="JQuery/jquery-2.1.0.js"></script>
<link href="bootstrap-3.1.1-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="bootstrap-3.1.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>

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
/*
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
  */
</script>

<div class="bs-docs-header" id="content" tabindex="-1" align="center">
      <div class="container" align="center">
    	<img src="bela-mes-fotos/concursoLogo.png" style="height: auto; width:600px; height:200px;" align="top">
      </div>
</div>

<div>	
	<div class="container" >
	
		<br><br>
		<div id="paredao">
			<?php include 'paredao.php';?>
		</div>
    </div>
</div>

<div>
	<h1>Top 20!</h1>	
	<div id="top20">
		<?php include 'top20.php';?>
	</div>	
</div>

<script>
/*
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

	*/
    //Metodo Ajax para votar e depois do voto chama o montarParedao
	function votar(cdPerfil) {
		jQuery.post("votar.php", 
			{cdPerfil: cdPerfil},
			function (data){
				location.reload();				
				//montarParedao();			
		});
	}
  </script>	
</body>
</html>