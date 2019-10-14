<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/entrada" var="linkServletNovaEmpresa"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!--  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>-->
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 and Android browser -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>


</head>
<body>
<nav style="color: #fff; border: 1px solid #ccc; background: #054f77;" class="navbar mb-4 navbar-expand-lg navbar-light">
  <h2 style="color:#fff;" class="navbar-brand">Cadastra empresas</h2>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div style="justify-content: flex-end;" class="collapse navbar-collapse" id="conteudoNavbarSuportado">
	<div class="d-flex justify-content-end">
		<div class="p-2 bd-highlight float-right"><h5>Usuário:</h5></div>
        <div class="p-2 bd-highlight float-right mr-2">${ usuarioLogado.login }</div>
        
        <div class="p-2 bd-highlight float-right mr-2"><a style="color: #fff;" href="entrada?acao=Logout"><i class="fas fa-sign-out-alt fa-2x"></i></a></div>
        

	</div>
  </div>
    
</nav>

<div class="container">
<!-- <header style="color: #fff; border: 1px solid #ccc; background: #054f77; padding: 10px; "><h3>Cadastrar empresa</h3></header> -->
<!-- <br /> -->


<form action="${ linkServletNovaEmpresa }" method="post" class="needs-validation" novalidate>
  <div class="form-row">
  
  	<div style="display:none;" class="col-md-1 mb-3">
      <label for="validationCustom01">Açao:</label>
      <input type="text" name="acao" class="form-control" value="NovaEmpresa">
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationCustom01">Nome:</label>
      <input type="text" name="nome" class="form-control" id="validationCustom01" placeholder="Nome"  required>
      <div class="valid-feedback">
        Tudo certo!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom02">Endereço:</label>
      <input type="text" name="endereco" class="form-control" id="validationCustom02" placeholder="Endereço"  required>
      <div class="valid-feedback">
        Tudo certo!
      </div>
    </div>
    
    <div class="col-md-4 mb-3">
      <label for="validationCustom03">Cidade</label>
      <input type="text" name="cidade" class="form-control" id="validationCustom03" placeholder="Cidade" required>
      <div class="invalid-feedback">
        Por favor, informe uma cidade válida.
      </div>
    </div>
    
  </div>
  <div class="form-row">
    
    <div class="col-md-4 mb-3">
      <label for="validationCustom04">Estado</label>
      <input type="text" name="estado" class="form-control" id="validationCustom04" placeholder="Estado" required>
      <div class="invalid-feedback">
        Por favor, informe um estado válido.
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom05">CEP</label>
      <input type="text" name="cep" class="form-control" id="validationCustom05" placeholder="CEP" required>
      <div class="invalid-feedback">
        Por favor, informe um CEP válido.
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationCustom06">Data abertura</label>
      <input type="text" name="data" class="form-control" id="validationCustom06" placeholder="Data abertura" onkeypress="mascaraData( this, event )" required>
      <div class="invalid-feedback">
        Por favor, informe um estado válido.
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        Concordo com os termos e condições
      </label>
      <div class="invalid-feedback">
        Você deve concordar, antes de continuar.
      </div>
    </div>
  </div>
  <button class="btn btn-primary" type="submit">Salvar</button>
</form>

</div>

<script>
// Exemplo de JavaScript inicial para desativar envios de formulário, se houver campos inválidos.
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Pega todos os formulários que nós queremos aplicar estilos de validação Bootstrap personalizados.
    var forms = document.getElementsByClassName('needs-validation');
    // Faz um loop neles e evita o envio
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();


///////

function mascaraData( campo, e )
{
	var kC = (document.all) ? event.keyCode : e.keyCode;
	var data = campo.value;
	
	if( kC!=8 && kC!=46 )
	{
		if( data.length==2 )
		{
			campo.value = data += '/';
		}
		else if( data.length==5 )
		{
			campo.value = data += '/';
		}
		else
			campo.value = data;
	}
}
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</body>
</html>