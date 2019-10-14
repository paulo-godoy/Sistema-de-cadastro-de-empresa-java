package br.com.alura.gerenciador.acao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.aluragerenciador.modelo.Banco;
import br.com.aluragerenciador.modelo.Usuario;

public class Login implements Acao {

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String login = request.getParameter("username");
		String senha = request.getParameter("password");
		
		
		Banco banco = new Banco();
		Usuario usuario = banco.existeUsuario(login, senha); 
		
		if (usuario != null) {
			//System.out.println("existe");
			HttpSession sessao = request.getSession(); //pegar o usuario da sessao.
			sessao.setAttribute("usuarioLogado", usuario); //deixar o usuario pedurado durante as sesões
			return "redirect:entrada?acao=ListaEmpresas";
		} else {
			return "redirect:entrada?acao=LoginForm";
		}
		
		
	}

}
