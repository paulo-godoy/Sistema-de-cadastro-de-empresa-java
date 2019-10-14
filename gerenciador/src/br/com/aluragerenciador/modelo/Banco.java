package br.com.aluragerenciador.modelo;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Banco {
	
	private static List<Empresa> lista = new ArrayList<>();
	
	//Lista de usuarios
	
	private static List<Usuario> listaUsuario = new ArrayList<>();
	
	private static Integer chaveSequencial = 1;
	
	static {
		//Lista de empresas
		Empresa e1 = new Empresa(1, "Compasso", "Av, Julho de castilhos, 132", "Porto Alegre", "RS", 91720000, new Date());
		Empresa e2 = new Empresa(2, "UOL", "Av, Julho de castilhos, 132", "Porto Alegre", "RS", 91720000, new Date() );
		
		lista.add(e1);
		lista.add(e2);
		
		Usuario u1 = new Usuario();
		u1.setLogin("paulo.godoy");
		u1.setSenha("12345");
		
		Usuario u2 = new Usuario();
		u2.setLogin("murilo.godoy");
		u2.setSenha("12345");
		
		Usuario u3 = new Usuario();
		u3.setLogin("fabrine.dalbosco");
		u3.setSenha("12345");
		
		listaUsuario.add(u1);
		listaUsuario.add(u2);
		listaUsuario.add(u3);
	}
	
	
	public void adiciona(Empresa empresa) {
		
		empresa.setId(Banco.chaveSequencial++);
		Banco.lista.add(empresa);
		
	}
	
	public List<Empresa> getEmpresas() {
		return Banco.lista;
	}

	public void removeEmpresa(Integer id) {
		
		Iterator<Empresa> it = lista.iterator();
		while(it.hasNext()) {
			Empresa emp = it.next();
			
			if(emp.getId() == id) {
				it.remove();
				
				
			}
		}
	}

	public Empresa buscaEmpresaPorId(Integer id) {
		
		for (Empresa empresa : lista) {
			
			if(empresa.getId() == id) {
				return empresa;
			}
			
		}
		return null;
		
	}

	public Usuario existeUsuario(String login, String senha) {
		
		for (Usuario usuario : listaUsuario) {
			if (usuario.ehIgual(login, senha)) {
				return usuario;
			}
		}
		return null;
		
	}

}
