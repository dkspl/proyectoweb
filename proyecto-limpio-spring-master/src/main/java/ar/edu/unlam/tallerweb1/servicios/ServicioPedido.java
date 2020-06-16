package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;
import java.util.TreeSet;

import ar.edu.unlam.tallerweb1.modelo.Comida;
import ar.edu.unlam.tallerweb1.modelo.Pedido;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

public interface ServicioPedido {
	Long crearPedido(Pedido pedido);
	List<Comida> generarComidasPorRestricciones(Long id);
	List<Comida> generarComidasPorCalorias(Usuario usuario);
	Double calcularImporteTotal(Pedido pedido);
	void cancelarPedido(Long id);
	Pedido buscarPedidoPorId(Long id);
	void actualizarPedido(Pedido pedido);
	List<Comida> generarMenusSugeridos(Usuario usuario);
	String concatenarIdComidas(List<Comida> comidas);
	Pedido generarPedidoPorIdComidas(String idComidas);
	List<Pedido> listarPedidosPorUsuario(Usuario usuario);
	List<Pedido> listarPedidos();
	TreeSet<Comida> listarComidasPedidas(Long id);
	Double calcularTiempo(Double distancia);
	Double distanciaCoord(Double lat1, Double lng1, Double lat2, Double lng2);
	Double convertirPrecio(Double precio);

}
