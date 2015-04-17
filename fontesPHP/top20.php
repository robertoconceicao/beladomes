<!DOCTYPE html>

<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet" type="text/css" href="GridGallery/css/demo.css" />
<link rel="stylesheet" type="text/css" href="GridGallery/css/component.css" />		
<script src="GridGallery/js/modernizr.custom.js"></script>
<script src="GridGallery/js/imagesloaded.pkgd.min.js"></script>
<script src="GridGallery/js/masonry.pkgd.min.js"></script>
<script src="GridGallery/js/classie.js"></script>
<script src="GridGallery/js/cbpGridGallery.js"></script>
<script>
	new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
</script>

	<div id="grid-gallery" class="grid-gallery">
		
		<section class="grid-wrap">
			<ul class="grid">					
				<li class="grid-sizer"></li> <!-- for Masonry column width -->
			<?php				
				require_once 'src/db.php';
				session_start();
				
				$cdConcurso = $_SESSION['cdConcurso'];
				
				$query=mysqli_query($connection,
                    "SELECT
					p.cdPerfil, 
					p.nmUsuario, 
					p.urlPerfil, 
					p.urlFoto, 
					p.cidade, 
					p.idade, 
					p.genero, 			
					p.foto, 	
					v.qtVoto 	
					FROM perfil p
					join voto v on
					v.cdPerfil = p.cdPerfil
					and v.cdConcurso = $cdConcurso
					ORDER BY v.qtVoto desc LIMIT 0,20							
				") or die(mysqli_error($connection));

				$arr = array();
				while($obj = mysqli_fetch_object($query)) {
				    array_push($arr, $obj);
				}

				$indice = 0;
				foreach ($arr as $perfil) {
			?>								
					<li class="grid2">
							<figure class="effect-lexi">									
						   		<img src="data:image/png;base64,<?php echo base64_encode($perfil->foto);?>" name="bela<?php echo $indice;?>"
						   			id="img${indice->index}">
								<figcaption>
									<H2><?php echo $perfil->nmUsuario;?> <br />
										<SPAN>Top: <?php echo $indice + 1;?>º</SPAN>
									</H2>
									<P>
									<?php 
										echo 'Nome: '. $perfil->nmUsuario . '<br />';
										echo 'Idade: '. $perfil->idade . '<br />';
										echo 'Cidade: '. $perfil->cidade . '<br />';
										echo 'Votos: '. $perfil->qtVoto . '<br />';													
									?>
									</P>										
								</figcaption>
							</figure>
					</li>
			<?php 
				    $indice++;
				}	
			?>										
		</ul>
	</section><!-- // grid-wrap -->
	<section class="slideshow">
		<ul>
			<?php
				$indice2 = 0;
				foreach ($arr as $perfil) {  
			?>
				<li>
					<figure>
						<figcaption>
							<?php 
							echo '<h3>'.$perfil->nmUsuario .'</h3>';
							echo 'Idade: '.$perfil->idade.' <br/>';
							echo 'Cidade: '.$perfil->cidade.' <br/>';
							echo 'Votos: '.$perfil->qtVoto.' <br/>';
							?>										
						</figcaption>
						
				   		<img src="data:image/png;base64,<?php echo base64_encode($perfil->foto); ?>" name="bela<?php echo $indice2;?>"
				   			id="img<?php echo $indice2;?>">
				   										   		
					</figure>
				</li>
			<?php 
				    $indice2++;
				}	
			?>													
		</ul>
		<nav>
			<span class="icon nav-prev"></span>
			<span class="icon nav-next"></span>
			<span class="icon nav-close"></span>
		</nav>
		<div class="info-keys icon">Navegue com as setas</div>
	</section><!-- // slideshow -->
</div><!-- // grid-gallery -->			
