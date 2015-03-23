<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title></title>
		<meta name="description" content="Blueprint: Blueprint: Google Grid Gallery" />
		<meta name="keywords" content="google getting started gallery, image gallery, image grid, template, masonry" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="GridGallery/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="GridGallery/css/component.css" />		
		<script src="GridGallery/js/modernizr.custom.js"></script>
		
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	</head>
	<body>
<!-- 		<div class="container">			 -->
			<div id="grid-gallery" class="grid-gallery">
				
				<section class="grid-wrap">
					<ul class="grid">					
						<li class="grid-sizer"></li> <!-- for Masonry column width -->					
						<c:forEach var="perfil" items="${listaPerfil}" varStatus="indice">

								<li class="grid2">
										<figure class="effect-lexi">									
									   		<img src="data:image/png;base64,${perfil.byteArrayString}" name="bela${indice.index}"
									   			id="img${indice.index}">
											<figcaption>
												<H2>${perfil.nmUsuario} <br />
													<SPAN>Top: ${indice.index + 1}º</SPAN>
												</H2>
												<P>
													Nome: ${perfil.nmUsuario}<br />
													Idade: ${perfil.idade}<br />
													Cidade: ${perfil.cidade}<br />
													Votos: ${perfil.qtVoto}<br />
												</P>										
											</figcaption>
										</figure>
								</li>
							
						</c:forEach>											
					</ul>
				</section><!-- // grid-wrap -->
				<section class="slideshow">
					<ul>
						<c:forEach var="perfil" items="${listaPerfil}" varStatus="indice">
							<li>
								<figure>
									<figcaption>
										<h3>${perfil.nmUsuario}</h3>
										Idade: ${perfil.idade} <br/>
										Cidade: ${perfil.cidade}<br/>
										Votos: ${perfil.qtVoto}<br/>
									</figcaption>
									
							   		<img src="data:image/png;base64,${perfil.byteArrayString}" name="bela${indice.index}"
							   			id="img${indice.index}">
							   										   		
								</figure>
							</li>
						</c:forEach>												
					</ul>
					<nav>
						<span class="icon nav-prev"></span>
						<span class="icon nav-next"></span>
						<span class="icon nav-close"></span>
					</nav>
					<div class="info-keys icon">Navegue com as setas</div>
				</section><!-- // slideshow -->
			</div><!-- // grid-gallery -->
<!-- 		</div> -->
		
		<script src="GridGallery/js/imagesloaded.pkgd.min.js"></script>
		<script src="GridGallery/js/masonry.pkgd.min.js"></script>
		<script src="GridGallery/js/classie.js"></script>
		<script src="GridGallery/js/cbpGridGallery.js"></script>
		<script>
			new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
		</script>
	</body>
</html>