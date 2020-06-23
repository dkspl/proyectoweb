package ar.edu.unlam.tallerweb1;

import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.controladores.ControladorUsuario;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioRestriccion;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

import static org.mockito.Mockito.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.assertj.core.api.Assertions.*;


public class TestRegistroUsuario {
	/*
	@Test
	public void testQuePruebaRegistroValidacion() {
		//preparaci�n
		ServicioUsuario servicioUsuario= mock(ServicioUsuario.class);
		ServicioRestriccion servicioRestriccion= mock(ServicioRestriccion.class);
		Usuario user = new Usuario();
		ControladorUsuario cu = new ControladorUsuario(servicioUsuario, servicioRestriccion);
		HttpServletRequest ht = mock(HttpServletRequest.class);
		HttpSession sesionMock = mock(HttpSession.class);
		
		when(ht.getSession()).thenReturn(sesionMock);

		//ejecuci�n
		ModelAndView resultado = cu.validarRegistro(user, ht);
		
		//validaci�n
		assertThat(resultado.getViewName()).isEqualTo("redirect:/seleccionarRestricciones");

	}
	*/
}
