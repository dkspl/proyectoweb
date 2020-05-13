package ar.edu.unlam.tallerweb1.servicios;

import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.repositorios.UsuarioDao;

@Service
@Transactional
public class ServicioUsuarioImpl implements ServicioUsuario {
	@Inject
	private UsuarioDao usuarioDao;
	@Override
	public Long registrarUsuario(Usuario usuario) {
		return usuarioDao.registrarUsuario(usuario);
	}
	@Override
	public Boolean validarExistenciaEmail(String email) {
		return usuarioDao.validarExistenciaEmail(email);
	}
	@Override
	public Boolean validarFormatoEmail(String email) {
		String regex="[^@]+@[^@]+\\.[a-zA-Z]{2,}";
		
		return Pattern.matches(regex, email);
	}
	/*
	 * Se recibe la password por parametro y se la convierte en una cadena de caracteres
	 * generada bajo el algoritmo SHA-256, el cual genera un hash de 64 d�gitos hexadecimales.
	 */
	@Override
	public String encriptarPassword(String password) {
		return org.apache.commons.codec.digest.DigestUtils.sha256Hex(password);
	}
}
