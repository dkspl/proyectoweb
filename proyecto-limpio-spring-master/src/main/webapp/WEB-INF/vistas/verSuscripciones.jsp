<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<title>Recomida!</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
		<div class="container">

			<a class="navbar-brand" href="home">RECOMIDA</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="home">Inicio</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Men� de
							comidas</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Mi cuenta </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="mostrarRestriccionesDeUsuario">Mis
								restricciones</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="mispedidos">Mis pedidos</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Imc</a>
						</div></li>

				</ul>
			</div>
		</div>
	</nav>

	<section class="container mt-5 mb-5 clearfix">
		<h1 class="display-3 text-center">Suscripciones</h1>
		<p class="lead text-center mb-5">
			Obtener una suscripci�n en <span class="text-danger">Recomida</span> te va a permitir, por un bajo precio,
			disfrutar de todos los servicios que tenemos para vos. Solo los clientes suscritos 
			tienen acceso a la sugerencia de men�s distintos cada d�a seg�n sus restricciones de salud, 
			gustos, calor�as diarias recomendadas y calculadas seg�n t� estilo de vida y tus caracteristicas
			f�sicas. �Qu� estas esperando para obtener beneficios �nicos?
		</p>
		
	<div class="card-deck">
		<div class="card text-center">
		  <div class="card-header h2 text-success">
		    Mensual
		  </div>
		  <div class="card-body">
		  	<div class="mb-2">
			    <h1 class="h4">$ <span class="display-3">75,00</span>/mes </h1>
			    <h6>Pesos Argentinos</h6>
			    <hr/>
		    </div>
		    <p class="card-text">La suscripci�n mensual se le cobrar� una sola vez y deber� ser renovada
		    al pasar la fecha de vencimiento.<br>
		    Los pedidos no estan inclu�dos en la suscripci�n</p>
		    <form action="obtenerSuscripcion" method="get">
		     <input type="hidden" value="1" name="tipo">
		    <input type="submit" class="btn btn-success" value="Suscribirme">
		    </form>
		  </div>
		</div>
		
		<div class="card text-center">
		  <div class="card-header h2 text-info">
		    Semestral
		  </div>
		  <div class="card-body">
		  	<div class="mb-2">
			    <h1 class="h4">$ <span class="display-3">65,00</span>/mes </h1>
			    <h6>Pesos Argentinos</h6>
			    <hr/>
		    </div>
		    <p class="card-text">La suscripci�n semestral descontar� el precio mensual al
		    momento de ser adquirida y, cada vez que se cumpla un mes del pago anterior,
		     durante los seis meses activos. Al pasar la fecha de vencimiento deber� renovar
		     la suscripci�n.<br>
		     Los pedidos no estan inclu�dos en la suscripci�n.</p>
		     <form action="obtenerSuscripcion" method="get">
		     <input type="hidden" value="2" name="tipo">
		    <input type="submit" class="btn btn-info" value="Suscribirme">
		    </form>
		  </div>
		</div>
		
		<div class="card text-center">
		  <div class="card-header h2 text-danger">
		    Anual
		  </div>
		  <div class="card-body">
		  	<div class="mb-2">
			    <h1 class="h4">$ <span class="display-3">50,00</span>/mes </h1>
			    <h6>Pesos Argentinos</h6>
			    <hr/>
		    </div>
		    <p class="card-text">La suscripci�n anual descontar� el precio mensual al
		    momento de ser adquirida y, cada vez que se cumpla un mes del pago anterior,
		     durante los doce meses activos. Al pasar la fecha de vencimiento deber� renovar
		     la suscripci�n.<br>
		     Los pedidos no estan inclu�dos en la suscripci�n.</p>
		    <form action="obtenerSuscripcion" method="get">
		     <input type="hidden" value="3" name="tipo">
		    <input type="submit" class="btn btn-danger" value="Suscribirme">
		    </form>
		  </div>
		</div>
	</div>
	
		<a href="interno"  class="btn btn-outline-danger mt-5 btn-lg">Por ahora no, gracias</a>
	</section>

	<!-- Footer -->
	<footer class="page-footer font-small unique-color-dark">

		<div class="bg-danger">
			<div class="container">

				<!-- Grid row-->
				<div class="row py-4 d-flex align-items-center">

					<!-- Grid column -->
					<div
						class="col-md-12 col-lg-12 text-center text-md-left mb-4 mb-md-0">
						<h6 class="mb-0 text-center text-white">Get connected with us
							on social networks!</h6>
					</div>
					<!-- Grid column -->


				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row-->

		</div>
		</div>

		<!-- Footer Links -->
		<div class="container text-center text-md-left mt-5">

			<!-- Grid row -->
			<div class="row mt-3">

				<!-- Grid column -->
				<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

					<!-- Content -->
					<h6 class="text-uppercase font-weight-bold">Recomida</h6>
					<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
						style="width: 60px;">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

					<!-- Links -->
					<h6 class="text-uppercase font-weight-bold">Products</h6>
					<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
						style="width: 60px;">
					<p>
						<a href="#!">Wea1</a>
					</p>
					<p>
						<a href="#!">Wea2</a>
					</p>
					<p>
						<a href="#!">Wea3</a>
					</p>
					<p>
						<a href="#!">Wea4</a>
					</p>

				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

					<!-- Links -->
					<h6 class="text-uppercase font-weight-bold">Useful links</h6>
					<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
						style="width: 60px;">
					<p>
						<a href="#!">Tu cuenta</a>
					</p>
					<p>
						<a href="#!">Tu suscripcion</a>
					</p>
					<p>
						<a href="#!">Otra cosa</a>
					</p>
					<p>
						<a href="#!">Help</a>
					</p>

				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

					<!-- Links -->
					<h6 class="text-uppercase font-weight-bold">Contacto</h6>
					<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
						style="width: 60px;">
					<p>
						<i class="fas fa-home mr-3"></i> Buenos Aires, Argentina
					</p>
					<p>
						<i class="fas fa-envelope mr-3"></i> info@lala.com
					</p>
					<p>
						<i class="fas fa-phone mr-3"></i> + 011 7777 6666
					</p>
					<p>
						<i class="fas fa-print mr-3"></i> + 011 2424 3332
					</p>

				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row -->

		</div>
		<!-- Footer Links -->

	</footer>
	<!-- Footer -->


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>