package br.com.alura.gerenciador.acao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.aluragerenciador.modelo.Banco;
import br.com.aluragerenciador.modelo.Empresa;

public class ListaEmpresas implements Acao {

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		
		
		
		Banco banco = new Banco();
		
		List<Empresa> lista = banco.getEmpresas();
		
		//Chama a pagina jsp
		request.setAttribute("empresas", lista);
		
		 
		return "forward:/listaEmpresas.jsp";

	}
}
