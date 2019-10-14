<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, br.com.aluragerenciador.modelo.Empresa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!--  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>-->
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<style>
.invisivel {
display:none;
}
</style>
</head>
<body>
<nav style="color: #fff; border: 1px solid #ccc; background: #054f77;" class="navbar mb-4 navbar-expand-lg navbar-light">
  <h2 style="color:#fff;" class="navbar-brand">Lista de empresas</h2>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div style="justify-content: flex-end;" class="collapse navbar-collapse" id="conteudoNavbarSuportado">
	<div class="d-flex justify-content-end">
	
		 <form class="form-inline my-2 my-lg-0 float-right">
      		<input id="filtrar-tabela" class="form-control mr-sm-2" type="search" placeholder="Pesquisar" aria-label="Pesquisar">
     	</form>
     	
		<div class="p-2 bd-highlight float-right"><h5>Usuário:</h5></div>
        <div class="p-2 bd-highlight float-right mr-2">${ usuarioLogado.login }</div>
        
        <div class="p-2 bd-highlight float-right mr-2"><a style="color: #fff;" href="entrada?acao=Logout"><i class="fas fa-sign-out-alt fa-2x"></i></a></div>
     	
  
	</div>
  </div>
    
</nav>
<div class="container">

<c:if test="${ not empty empresa }">

	<script>
	
		Swal.fire({
	  	position: 'top-center',
	  	type: 'success',
	 	title: 'Empresa ${ empresa } cadastrada com sucesso.',
	  	showConfirmButton: false,
	  	timer: 2500
		})
	</script>

</c:if>



	<table class="table table-hover">
		<thead>
			<tr>
			  <th scope="col">Nome</th>
			  <th scope="col">Endereço</th>
			  <th scope="col">Cidade</th>
			  <th scope="col">Estado</th>
			  <th scope="col">Data abertura</th>
			  <th scope="col"></th>
			  <th scope="col"></th>
			  </tr>
		</thead>
				
		<c:forEach items="${ empresas }" var="empresa">
		    <tbody>
				<tr class="empresa">
				<td class="info-nome"> ${ empresa.nome } </td>
				<td> ${ empresa.endereco } </td>
			    <td> ${ empresa.cidade } </td>
				<td> ${ empresa.estado } </td>
				<td> <fmt:formatDate value="${ empresa.dataAbertura }" pattern="dd/MM/yyyy"/> </td>
				<td><a href="/gerenciador/entrada?acao=MostraEmpresas&id=${ empresa.id }"><i style="color: #007bff;" class="far fa-edit" data-toggle="tooltip" data-placement="top" title="Editar"></i></a></td>
				<td><a id="remove" href="/gerenciador/entrada?acao=RemoveEmpresas&id=${ empresa.id }"><i style="color: red;" class="fas fa-trash-alt" data-toggle="tooltip" data-placement="top" title="Excluir"></i></a></td>
			</tbody>
		</c:forEach>
		</table>
		
		<a class="btn btn-primary" href="/gerenciador/entrada?acao=NovaEmpresaForm" role="button">Novo cadastro</a>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
var campoFiltro = document.querySelector("#filtrar-tabela");

campoFiltro.addEventListener("input", function () {
    var pacientes = document.querySelectorAll(".empresa");
 
    if (this.value.length > 0) {
    	
        for (var i = 0; i < pacientes.length; i++) {
            var paciente = pacientes[i];
            var tdNome = paciente.querySelector(".info-nome");
            var nome = tdNome.textContent;
            var expressao = new RegExp(this.value, "i");
            if (!expressao.test(nome)) {
                paciente.classList.add("invisivel");
            } else {
                paciente.classList.remove("invisivel");
            }
        }
 
    } else {
        for (var i = 0; i < pacientes.length; i++) {
            var paciente = pacientes[i];
            paciente.classList.remove("invisivel");
        }
    }
 
});
</script>		

</body>
</html>