package ar.edu.unlam.tallerweb1.controladores;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.TreeSet;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mercadopago.resources.Preference;

import ar.edu.unlam.tallerweb1.modelo.Comida;
import ar.edu.unlam.tallerweb1.modelo.Estado;
import ar.edu.unlam.tallerweb1.modelo.Pedido;
import ar.edu.unlam.tallerweb1.modelo.Posicion;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioMP;
import ar.edu.unlam.tallerweb1.servicios.ServicioPedido;
import ar.edu.unlam.tallerweb1.servicios.ServicioPosicion;
import ar.edu.unlam.tallerweb1.servicios.ServicioSuscripcion;

@Controller
public class ControladorPedido {

	private ServicioMP servicioMP = new ServicioMP();

	private Posicion posicionSucursal = new Posicion(-34.668680, -58.566209,"recomida");

	@Inject
	private ServicioPedido servicioPedido;

	@Inject
	private ServicioPosicion servicioPosicion;
	
	@Inject
	private ServicioSuscripcion servicioSuscripcion;
	//------------PROBANDO-----------


	// ----------SELECCIONAR UBICACION MAPA---------
	@RequestMapping(path="/elegirPedido")
	public ModelAndView elegir(HttpServletRequest request) {
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		ModelMap model = new ModelMap();
		
		//validacion de suscripcion
		if(user.getSuscripcion()!=null) {
			this.servicioSuscripcion.vencerSuscripcion(user.getSuscripcion().getId());
			if(!user.getSuscripcion().getEstado()) {
				String mensaje = "Suscripci�n vencida";
				model.put("msj", mensaje);
			}
		}else {
			String mensaje = "Debe tener una suscripci�n para obtener este beneficio";
			model.put("msj", mensaje);
		}
		//-----------------------------------
	
		return new ModelAndView("elegirPedido", model);
	}
	
	@RequestMapping(path = "/posicionId", method = RequestMethod.POST)
	public ModelAndView posicionDeUser(@RequestParam("id") Long idPosicion, HttpServletRequest request
		, RedirectAttributes atributos) {

		Posicion posicion=this.servicioPosicion.obtenerPosicionPorId(idPosicion);

		this.servicioPosicion.crearPosicion(posicion);
		
		ModelMap model = this.servicioPedido.generarPreviewPosicion(posicionSucursal,posicion);
	
		return new ModelAndView("infoViaje", model);
	}
	
	// ----------DISTANCIA DEL PEDIDO------

	@RequestMapping(path = "/mostrar", method = RequestMethod.POST)
	public ModelAndView distanciaDelPedido(@ModelAttribute("posicion") Posicion posicion, 
			@RequestParam(value="id",required=false)Long idPosicion,
			@RequestParam(value="idComidas",required=true) String idComidas, HttpServletRequest request) {
		
		if (posicion.getLatitude() == 0 && posicion.getLongitude() == 0 && idPosicion==-1 || idComidas==null) {
			return new ModelAndView("redirect:/elegirPedido");
		}		
		ModelMap model;
		if(idPosicion!=-1) {
			//vino posicion vieja
			Posicion pos=this.servicioPosicion.obtenerPosicionPorId(idPosicion);
			System.out.println(pos.getNombre());
			model = this.servicioPedido.generarPreviewPosicion(posicionSucursal,pos);

		}else {
			//vino posicion nueva
			this.servicioPosicion.crearPosicion(posicion);
			model = this.servicioPedido.generarPreviewPosicion(posicionSucursal,posicion);
		}		
		
		model.put("idComidas",idComidas);
		
		return new ModelAndView("infoViaje", model);
	}

	// ----------MENU SUGERIDO-------

	/*
	 * Se recibe el usuario activo en la sesion para obtener sus restricciones
	 * mediante su ID. Se generan tres listas de comida con la funcion
	 * generarComidasPorRestricciones, tomando en cuenta las restricciones del
	 * usuario. Cada lista representa una opcion de pedido que puede elegir el
	 * cliente, solo puede elegir una. Se genera un String con los ID de las comidas
	 * que tiene cada lista. Se insertan en el modelo las listas para ser mostrados
	 * en la vista menuSugerido, y los Strings se mandan para ser usados como
	 * valores en el formulario. La vista de retorno es el menu con las 3 opciones
	 * de sugerencias.
	 */

	@RequestMapping("/menuSugerido")
	public ModelAndView irAMenuSugerido(HttpServletRequest request) {
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		ModelMap model = new ModelMap();
		List<Comida> opcion1 = servicioPedido.generarComidasPorRestricciones(user.getId());
		List<Comida> opcion2 = servicioPedido.generarComidasPorRestricciones(user.getId());
		List<Comida> opcion3 = servicioPedido.generarComidasPorRestricciones(user.getId());
		TreeSet<Comida> comidasmaspedidas = servicioPedido.comidasMasPedidas(user.getId());
		String idComidas1 = servicioPedido.concatenarIdComidas(opcion1);
		String idComidas2 = servicioPedido.concatenarIdComidas(opcion2);
		String idComidas3 = servicioPedido.concatenarIdComidas(opcion3);

		model.put("comidas1", opcion1);
		model.put("comidas2", opcion2);
		model.put("comidas3", opcion3);
		model.put("idcomidas1", idComidas1);
		model.put("idcomidas2", idComidas2);
		model.put("idcomidas3", idComidas3);
		model.put("comidasmaspedidas", comidasmaspedidas);

		return new ModelAndView("menuSugerido", model);
	}


	// --------GENERAR PEDIDO-------

	/*
	 * Se recibe como parametro un String con la opcion elegida en la vista
	 * menuSugerido. Esta opcion es mandada como parametro del metodo
	 * generarPedidoPorIdComidas, que se encarga de generar un pedido que contiene
	 * las comidas que eligio el usuario. Se asigna el usuario que esta activo en la
	 * sesion al pedido. Se cambia el estado del pedido. Se agrega el pedido a la
	 * base de datos. Se agrega al model los datos del pedido para mostrarlos en
	 * pantalla como vista previa.
	 */
	@RequestMapping(path ="/seleccionarUbicacion", method = RequestMethod.POST)
	public ModelAndView seleccionarUbicacion(@RequestParam("idComidas") String idComidas, HttpServletRequest request) {
		ModelMap model = new ModelMap();
		if(idComidas==null) {
			return new ModelAndView("redirect:/elegirPedido");
		}
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		if(user==null) {
			return new ModelAndView("redirect:/home");
		}
		
		List<Posicion>posicionesDelUsuario=this.servicioPosicion.obtenerPosicionesDeUnUsuario(user);
		
		Double lat = this.posicionSucursal.getLatitude();
		Double lag = this.posicionSucursal.getLongitude();
		
		model.put("lat", lat);
		model.put("lag", lag);
		model.put("idComidas", idComidas);
		model.addAttribute("posicion", new Posicion());
		model.put("posicionesUsuario",posicionesDelUsuario);
		return new ModelAndView("mapa", model);
	}
	
	@RequestMapping(path = "/generarpedido", method = RequestMethod.POST)
	public ModelAndView vistaPedido(@ModelAttribute("posicion") Posicion posicion,
			@RequestParam("idComidas") String idComidas, HttpServletRequest request) {
		ModelMap model = new ModelMap();

		// calculo distancia a la que esta el user
		Double distancia = this.servicioPedido.distanciaCoord(this.posicionSucursal.getLatitude(),
				this.posicionSucursal.getLongitude(), posicion.getLatitude(), posicion.getLongitude());

		// le dejo 2 numeros despues de la coma
		Double precioViaje = this.servicioPedido.convertirPrecio(distancia);
		// Obtengo la lista de comidas que tiene el futuro pedido
		List<Comida> comidas = servicioPedido.obtenerComidasConcatenadas(idComidas);
		// sumo el precio del pedido con el del precio de viaje
		Double precioFinalPedido = servicioPedido.calcularImporteTotal(comidas, precioViaje);
		String idLista = idComidas;
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		// Mercado pago
		Preference p = servicioMP.checkout(user, precioFinalPedido);

		model.put("preference", p);
		model.put("id", idLista);
		model.put("precio", precioFinalPedido);
		model.put("comidas", comidas);
		model.put("viaje", precioViaje);
		model.put("idPosicion", posicion.getId());
		return new ModelAndView("pedidoPorConfirmar", model);
	}
	// -------PAGAR PEDIDO-----

	/*
	 * Se le envia el pedido creado y seteado anteriormente, y se le otorga el
	 * estado de "PAGADO". Se muestra por pantalla el numero de pedido, dado por el
	 * ID generado en generarPedido().
	 */

	@RequestMapping(path = "/pagarpedido", method = RequestMethod.GET)
	public ModelAndView pagarPedido(@RequestParam(value = "id") String id,
			@RequestParam(value = "payment_status") String estado, @RequestParam(value = "idPosicion") Long idPosicion,
			HttpServletRequest request) {
		ModelMap model = new ModelMap();
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		Pedido nuevoPedido = new Pedido();
		Posicion posicionCliente = this.servicioPosicion.obtenerPosicionPorId(idPosicion);

		nuevoPedido = servicioPedido.generarPedidoPorIdComidas(id, posicionCliente, posicionSucursal);
		// Estado proveniente de mercado pago
		if (estado.equals("approved")) {
			nuevoPedido.setEstado(Estado.PROCESO);
		} else {
			nuevoPedido.setEstado(Estado.CANCELADO);
		}
		nuevoPedido.setUsuario(user);
		Long idPedido = servicioPedido.crearPedido(nuevoPedido);
		nuevoPedido.setId(idPedido);

		model.put("pedido", nuevoPedido);
		return new ModelAndView("pedidoRealizado", model);
	}
	
	// ----------ACTUALIZAR ESTADO DEL PEDIDO---------
	
	@RequestMapping(path = "/actualizarestado", method = RequestMethod.POST)
	public ModelAndView actualizarEstado(String id, String estado, HttpServletRequest request) {
		Pedido pedido = servicioPedido.buscarPedidoPorId(Long.parseLong(id));
		Estado estadoPedido = Enum.valueOf(Estado.class, estado);
		if(pedido != null) {
			pedido.setEstado(estadoPedido);
			servicioPedido.actualizarPedido(pedido, estadoPedido);
		}
		return new ModelAndView("redirect:/verpedidos");
	}

	// ----------CANCELAR PEDIDO---------

	/*
	 * Se recibe por parametro el ID del pedido que queremos cancelar. Si es
	 * distinto de null, se realiza la accion sobre el pedido existente.
	 */

	@RequestMapping(path = "/cancelarpedido", method = RequestMethod.GET)
	public ModelAndView cancelarPedidoPorId(@RequestParam(value = "id", required = true) String id,
			HttpServletRequest request) {
		Pedido pedido=servicioPedido.buscarPedidoPorId(Long.parseLong(id));
		
		if ((pedido != null) && !(pedido.getEstado().equals(Estado.ENVIADO)))
			servicioPedido.actualizarPedido(pedido, Estado.CANCELADO);
		return new ModelAndView("redirect:/home");
	}

	// ----------LISTA DE MIS PEDIDOS-------

	@RequestMapping(path = "/mispedidos")
	public ModelAndView listarPedidos(HttpServletRequest request) {
		ModelMap model = new ModelMap();
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		List<Pedido> listaPedidos = servicioPedido.listarPedidosPorUsuario(user);
		model.put("pedidos", listaPedidos);
		model.put("usuario", user);
		return new ModelAndView("listapedidos", model);
	}
	
	// --------VER PEDIDO ADMINISTRADOR---------

	@RequestMapping(path = "/verpedidos")
	public ModelAndView listarPedidosAdmin(HttpServletRequest request) {
		ModelMap model = new ModelMap();
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		if (user.getRol().equals(Rol.ADMINISTRADOR)) {
			List<Pedido> listaPedidos = servicioPedido.listarPedidos();
			model.put("pedidos", listaPedidos);
			model.put("usuario", user);
			return new ModelAndView("listapedidos", model);
		} else {
			return new ModelAndView("redirect:/mispedidos");
		}
	}
	// ---------DETALLE DE PEDIDO--------

	@RequestMapping(path = "/detallepedido")
	public ModelAndView verDetallePedido(@RequestParam(value = "id", required = true) Long id,
			HttpServletRequest request) {
		ModelMap model = new ModelMap();
		Pedido pedido = servicioPedido.buscarPedidoPorId(id);
		Usuario user = (Usuario) request.getSession().getAttribute("usuario");
		List<Estado> estados = Arrays.asList(Estado.values());
		List<Comida> comidas = servicioPedido.listarComidasDeUnPedido(pedido);
		model.put("pedido", pedido);
		model.put("usuario", user);
		model.put("estados", estados);
		model.put("comidas", comidas);
		return new ModelAndView("detallepedido", model);
	}
	
	public ServicioMP getServicioMP() {
		return servicioMP;
	}

	public void setServicioMP(ServicioMP servicioMP) {
		this.servicioMP = servicioMP;
	}

	public Posicion getPosicionSucursal() {
		return posicionSucursal;
	}

	public void setPosicionSucursal(Posicion posicionSucursal) {
		this.posicionSucursal = posicionSucursal;
	}

	public ServicioPedido getServicioPedido() {
		return servicioPedido;
	}

	public void setServicioPedido(ServicioPedido servicioPedido) {
		this.servicioPedido = servicioPedido;
	}

	public ServicioPosicion getServicioPosicion() {
		return servicioPosicion;
	}

	public void setServicioPosicion(ServicioPosicion servicioPosicion) {
		this.servicioPosicion = servicioPosicion;
	}
}
