package br.com.aluragerenciador.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.thoughtworks.xstream.XStream;

import br.com.aluragerenciador.modelo.Banco;
import br.com.aluragerenciador.modelo.Empresa;


@WebServlet("/empresas")
public class EmpresasService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//listandon as empresas
		
		List<Empresa> empresas = new Banco().getEmpresas();
		
		//aqui vai ler a requisicão
		
		String valor = request.getHeader("Accept");
		
		if (valor.endsWith("json")) {
		//Converte uma lista para formado json
		Gson gson = new Gson();
		String json = gson.toJson(empresas);
		
		//Devolvendo o objeto Gson
		response.setContentType("application/json");
		response.getWriter().print(json);
		} if (valor.contains("xml")) {
		
		//converte uma lista para formato xml
		XStream hxml = new XStream();
		String xml = hxml.toXML(empresas);
		
		//Devolvendo o objeto Gson
		response.setContentType("application/xml");
		response.getWriter().print(xml);
		} else {
			response.setContentType("application/json");
			response.getWriter().print("{'message': 'no content'}");
		}
		
	}

}
