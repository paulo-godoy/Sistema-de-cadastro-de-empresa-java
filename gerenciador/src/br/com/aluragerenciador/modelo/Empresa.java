package br.com.aluragerenciador.modelo;

import java.util.Date;

public class Empresa {
	
	private Integer id;
	private String nome;
	private String endereco;
	private String cidade;
	private String estado;
	private Integer cep;
	private Date dataAbertura;
	
	
		
	public Empresa(Integer id, String nome, String endereco, String cidade, String estado, Integer cep, Date dataAbertura) {
		super();
		this.id = id;
		this.nome = nome;
		this.endereco = endereco;  //tudo isso é atributos
		this.cidade = cidade;
		this.estado = estado;
		this.cep = cep;
		this.dataAbertura = dataAbertura;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getCep() {
		return cep;
	}
	public void setCep(Integer cep) {
		this.cep = cep;
	}
	
	public Date getDataAbertura() {
		return dataAbertura;
	}
	
	public void setDataAbertura(Date dataAbertura) {
		this.dataAbertura = dataAbertura;
	}
	
	
	
	

}
