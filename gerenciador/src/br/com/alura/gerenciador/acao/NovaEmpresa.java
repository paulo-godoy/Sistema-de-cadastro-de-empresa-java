package br.com.alura.gerenciador.acao;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.aluragerenciador.modelo.Banco;
import br.com.aluragerenciador.modelo.Empresa;

public class NovaEmpresa implements Acao {
	
	public String executa(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		PrintWriter saida = response.getWriter();
		String nomeEmpresa = request.getParameter("nome");
		String enderecoEmpresa = request.getParameter("endereco");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		//recebe a data
		String paramDataEmpresa = request.getParameter("data");
		
		
		
		Date dataAbertura;
		try {
			//converte a data
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			
			dataAbertura = sdf.parse(paramDataEmpresa);
		} catch (ParseException e) {
			
			throw new ServletException(e);
		}
		
		
		
		
		Empresa empresa = new Empresa(1 , nomeEmpresa, enderecoEmpresa, cidade, estado, 91720000, dataAbertura );
		
		Banco banco = new Banco();
		
		banco.adiciona(empresa);
		
		 //chamar o JSP
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher("/listaEmpresasServlet");
		 * request.setAttribute("empresa", empresa.getNome()); rd.forward(request,
		 * response);
		 */

		return "redirect:entrada?acao=ListaEmpresas";
		
		
	}

}
