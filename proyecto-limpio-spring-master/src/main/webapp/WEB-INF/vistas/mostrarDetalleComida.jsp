<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle | ${comida.nombre}</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
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
					<li class="nav-item active"><a class="nav-link" href="#">Inicio</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="cerrarSesion">Cerrar
							Sesi�n</a></li>
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
							<a class="dropdown-item" href="#">Mis pedidos</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Imc</a>
						</div></li>

				</ul>
			</div>
		</div>
	</nav>



	<section class="container-sm p-4">
		<ul class="list-group list-group-horizontal-sm">
			<li class="list-group-item"><img src="img/${comida.nombre}.jpg"
				alt="..." style="width: 650px; height: 420px"></li>
			<li>
			<li class="list-group-item flex-fill">
				<h3 class="text-center text-danger">${comida.nombre}</h3>
				<hr class="my-2">
				<p class="lead">${comida.descripcion}</p>
				<h1>$ ${comida.precio}</h1> <cite title="Source Title">${comida.calorias}
					kcal</cite> <br>
				<h4 class="text-danger">${comida.tipoHorario}</h4> <span
				class="badge badge-primary">Env�o con normalidad</span> <br> <br>
				<p class="blockquote">Aceptamos todos los medios de pago</p> <img
				src="img/pay.png" style="width: 40px; height: 40px;" alt="tarjetas">
				<img src="img/wallet.png" style="width: 40px; height: 40px;"
				alt="efectivo"> <img src="img/bank.png"
				style="width: 40px; height: 40px;" alt="banco"> <br> <br>
				<a href="mapa" class="btn btn-danger" role="button"
				aria-pressed="false">Comprar</a>

			</li>

		</ul>
		<br>

		<section class="container -sm p-2">
			<h3 class="text-center">Tambi�n podr�a interesarte las comidas
				m�s Vistas..</h3>
			<hr class="my-2">
			<div class="container -sm p-2">
				<ul class="list-group list-group-flush">
					<li class="list-group-item  flex-fill"><c:forEach
							items="${comidasVistas}" var="comida1">

							<ul class="list-unstyled">
								<li class="media"><img src="img/${comida1.nombre}.jpg"
									class="rounded float-left mr-3" alt="..."
									style="width: 170px; height: 100px">
									<div class="media-body">
										<h5 class="mb-1 text-dark">${comida1.nombre}</h5>
										<small class="blockquote">${comida1.contador} views</small> <br>
										<a href="mostrarComidasMasVistasyPedidas?id=${comida.id}"
											class="btn btn-outline-danger" role="button"
											aria-pressed="false">Ver detalle</a>
									</div></li>
							</ul>
							<br>
						</c:forEach></li>
				</ul>
			</div>

			<h3 class="text-center">�Las comidas m�s Pedidas!</h3>
			<hr class="my-2">
			<br>
			<div class="container -sm p-2">
				<ul class="list-unstyled">
					<li class="media"><c:forEach items="${comidasPedidas}"
							var="comida">
							<img src="img/${comida.nombre}.jpg"
								class=" rounded float-left mr-3" alt="..."
								style="width: 140px; height: 100px; border: 1px black">
							<div class="media-body">
								<h5 class="mt-0 mb-1 text-dark">${comida.nombre}</h5>
								<p></p>
								<a
									href="mostrarComidasMasVistasyPedidas?id=${comida.id}"
									class="btn btn-outline-danger" role="button"
									aria-pressed="false">Ver detalle</a>
							</div>
						</c:forEach></li>
				</ul>
			</div>
		</section>

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
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('_$tag_______________________________________________$tag_____')
	</script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>