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

<link rel="stylesheet" type="text/css" href="css/component.css"/>
<script src="js/modernizr.custom.js"></script>

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
		  
<!-- 		  <div class="col-md-2"> -->
		   <div>
		    <div class="element thumbnail">		    
			    <div style="height: auto; max-width: 100%;" align="center" data-toggle="tooltip" title="${perfil.nmUsuario}" 
			   		 data-placement="bottom" id="foto${indice.index}">
			   		
			   		<img src="data:image/png;base64,${perfil.byteArrayString}" style="height: auto; max-width: 100%;"
			   			onclick="viewFoto(${indice.index})"> 
			   		
			   		<div style="font-size: 36px"> 
				    	<span class="foo label label-success label-as-badge">${indice.index + 1}º</span>
				    </div>
				    
				    
			    </div>
		    </div>
		  </div>
		  	<div>
		   		<div class="rb-overlay" id="divfoto${indice.index}">
					<div class="photo-viewer-wizard">
						<span class="rb-close" onclick="closeFoto(${indice.index})">close</span>
						<div class="pv-center">
							<div class="pv_img_wrap" style="height: 530px; width: 397px;">					
								<img src="data:image/png;base64,${perfil.byteArrayString}">							
							</div>
						</div>					
					</div>
				</div> 	
		 	</div>
		</c:forEach>
		
	</div>
</div>

<script type="text/javascript">

	function viewFoto(index){			
		var divFoto = jQuery("#divfoto"+index);
		
		if( divFoto.data( 'isExpanded' ) ) {
			return false;
		}
		divFoto.data( 'isExpanded', true );

		current = index;
		
		var layoutProp = getItemLayoutProp( divFoto ),
			clipPropFirst = 'rect(' + layoutProp.top + 'px ' + ( layoutProp.left + layoutProp.width ) + 'px ' + ( layoutProp.top + layoutProp.height ) + 'px ' + layoutProp.left + 'px)',
			clipPropLast = 'rect(0px ' + winsize.width + 'px ' + winsize.height + 'px 0px)';
		
		divFoto.css( {	
				clip : supportTransitions ? clipPropFirst : clipPropLast,
				opacity : 1,
				zIndex: 9999,
				pointerEvents : 'auto'
			});

		if( supportTransitions ) {
			divFoto.on( transEndEventName, function() {

				divFoto.off( transEndEventName );

				setTimeout( function() {
					divFoto.css( 'clip', clipPropLast ).on( transEndEventName, function() {
						divFoto.off( transEndEventName );
						$body.css( 'overflow-y', 'hidden' );
					} );
				}, 25 );

			} );
		} else {
			$body.css( 'overflow-y', 'hidden' );
		}
	};

	function closeFoto(index){
		$body.css( 'overflow-y', 'auto' );

		current = -1;
		var divFoto = jQuery("#divfoto"+index);
		
		var layoutProp = getItemLayoutProp( divFoto ),
			clipPropFirst = 'rect(' + layoutProp.top + 'px ' + ( layoutProp.left + layoutProp.width ) + 'px ' + ( layoutProp.top + layoutProp.height ) + 'px ' + layoutProp.left + 'px)',
			clipPropLast = 'auto';

		// reset current
		current = -1;

		divFoto.css( {
			clip : supportTransitions ? clipPropFirst : clipPropLast,
			opacity : supportTransitions ? 1 : 0,
			pointerEvents : 'none'
		});

		if( supportTransitions ) {
			divFoto.on( transEndEventName, function() {

				divFoto.off( transEndEventName );
				setTimeout( function() {
					divFoto.css( 'opacity', 0 ).on( transEndEventName, function() {
						divFoto.off( transEndEventName ).css( { clip : clipPropLast, zIndex: -1 } );
						$item.data( 'isExpanded', false );
					} );
				}, 25 );

			} );
		}
		else {
			divFoto.css( 'z-index', -1 );
			divFoto.data( 'isExpanded', false );
		}
		
		
		return false;		
	}

	function getItemLayoutProp( $item ) {
		
		var scrollT = $window.scrollTop(),
			scrollL = $window.scrollLeft(),
			itemOffset = $item.offset();

		return {
			left : itemOffset.left - scrollL,
			top : itemOffset.top - scrollT,
			width : $item.outerWidth(),
			height : $item.outerHeight()
		};

	}

	function getWindowSize() {
		$body.css( 'overflow-y', 'hidden' );
		var w = $window.width(), h =  $window.height();
		if( current === -1 ) {
			$body.css( 'overflow-y', 'auto' );
		}
		return { width : w, height : h };
	}

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

      transEndEventNames = {
  			'WebkitTransition' : 'webkitTransitionEnd',
  			'MozTransition' : 'transitionend',
  			'OTransition' : 'oTransitionEnd',
  			'msTransition' : 'MSTransitionEnd',
  			'transition' : 'transitionend'
  	  };
  	  // transition end event name
  	  transEndEventName = transEndEventNames[ Modernizr.prefixed( 'transition' ) ];
  	  
  	  // transitions support
  	  supportTransitions = Modernizr.csstransitions;
  		
      // window width and height
      current = -1;
	  $window = $(window);
	  $body = $( 'BODY' );
	      
	  winsize = getWindowSize();
    });
</script>

</body>
</html>