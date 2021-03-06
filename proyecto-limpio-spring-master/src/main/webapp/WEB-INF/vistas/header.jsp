<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
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
					<c:if test="${usuario.rol == 'CLIENTE'}">
					<li class="nav-item"><a class="nav-link" href="elegirPedido">Realizar pedido</a></li>
					<li class="nav-item"><a class="nav-link" href="suscripciones">Suscripciones</a></li>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">${usuario.username} </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:if test="${usuario.rol == 'CLIENTE'}">
							<a class="dropdown-item" href="mostrarRestriccionesDeUsuario">Mis
								restricciones</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="mispedidos">Mis pedidos</a>
							<div class="dropdown-divider"></div>

							<c:if test="${usuario.rol == 'CLIENTE'}">
							<a class="dropdown-item" href="miscupones">Mis cupones</a>
							<div class="dropdown-divider"></div>
							</c:if>
							<a class="dropdown-item" href="miSuscripcion">Mi suscripción</a>
							<div class="dropdown-divider"></div>
						</c:if>
							<a class="dropdown-item" href="editarUsuario">Editar cuenta</a>
							<div class="dropdown-divider"></div>

							<a class="dropdown-item" href="cerrarSesion">Cerrar sesion</a>
						</div></li>

				</ul>
			</div>
		</div>
	</nav>