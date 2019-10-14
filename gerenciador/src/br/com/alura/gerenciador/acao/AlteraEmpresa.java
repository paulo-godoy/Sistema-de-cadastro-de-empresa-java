package br.com.alura.gerenciador.acao;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.aluragerenciador.modelo.Banco;
import br.com.aluragerenciador.modelo.Empresa;

public class AlteraEmpresa implements Acao {
	
	public String executa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nomeEmpresa = request.getParameter("nome");
		String enderecoEmpresa = request.getParameter("endereco");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		//recebe a data
		String paramDataEmpresa = request.getParameter("data");
		String paramId = request.getParameter("id");
		Integer id = Integer.valueOf(paramId);
		
		
		
		Date dataAbertura;
		try {
			//converte a data
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			
			dataAbertura = sdf.parse(paramDataEmpresa);
		} catch (ParseException e) {
			
			throw new ServletException(e);
		}
		
		Banco banco = new Banco();
		Empresa empresa = banco.buscaEmpresaPorId(id);
		empresa.setNome(nomeEmpresa);
		empresa.setEndereco(enderecoEmpresa);
		empresa.setCidade(cidade);
		empresa.setEstado(estado);
		empresa.setDataAbertura(dataAbertura);
		
		
		return "redirect:entrada?acao=ListaEmpresas";
		
	}

}
