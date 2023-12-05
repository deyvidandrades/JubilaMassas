<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require('../controller/listarClientes.php');
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Deyvid Andrade">
  <link rel="icon" href="../favicon.png">

  <title>Jubila Massas</title>

  <!-- Bootstrap CSS -->
  <link href="libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/main.css" rel="stylesheet">

</head>

<body class="container p-5">

  <div class="align-middle bg-light rounded-3 p-4">
    <div class="row">
      <div class="list-group list-group-horizontal" id="list-tab" role="tablist">
        <a class="list-group-item list-group-item-action active" id="list-clientes-list" data-bs-toggle="list" href="#list-clientes" role="tab" aria-controls="list-clientes">Clientes</a>
        <a class="list-group-item list-group-item-action disabled" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile" di>Loja</a>
        <a class="list-group-item list-group-item-action disabled" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">Pedido</a>
        <a class="list-group-item list-group-item-action disabled" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab" aria-controls="list-settings">Pizza</a>
      </div>
    </div>
    
    <div class="row mt-4">
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="list-clientes" role="tabpanel" aria-labelledby="list-clientes-list">
          <table class="table table-bordered table-striped rounded">
            <?php criarTabelaClientes(); ?>
          </table>

        </div>
        <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">...</div>
        <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">...</div>
        <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">...</div>
      </div>
    </div>

    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalCriarCliente">
      Criar cliente
    </button>

    <!-- Modal Criar Cliente-->
    <div class="modal fade" id="modalCriarCliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header text-light bg-primary">
            <h1 class="modal-title fs-5">Criar novo cliente</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">

            <form class="needs-validation" method="post" >
              <div class="mb-3">
                <label for="cliente_senha" class="form-label">Senha</label>
                <input type="password" class="form-control" id="cliente_senha" name="cliente_senha" aria-describedby="cliente_senha" required>
              </div>

              <div class="mb-3">
                <label for="cliente_nome_completo" class="form-label">Nome Completo</label>
                <input type="name" class="form-control" id="cliente_nome_completo" name="cliente_nome_completo" aria-describedby="cliente_nome_completo" required>
              </div>

              <div class="mb-3">
                <label for="cliente_email" class="form-label">Email</label>
                <input type="email" class="form-control" id="cliente_email" name="cliente_email" aria-describedby="cliente_email" required>
              </div>

              <div class="mb-3">
                <label for="cliente_cpf" class="form-label">CPF</label>
                <input type="name" class="form-control" id="cliente_cpf" name="cliente_cpf" aria-describedby="cliente_cpf" required>
              </div>

              <div class="mb-3">
                <label for="cliente_dataNascimento" class="form-label">Data de Nascimento</label>
                <input type="date" class="form-control" id="cliente_dataNascimento" name="cliente_dataNascimento" placeholder="yyyy/mm/dd" aria-describedby="cliente_dataNascimento" required>
              </div>

              <div class="mt-4 border-top pt-4">
                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-outline-primary" name="submit" formaction="../controller/cadastrarCliente.php" value="alterar_funcionario" data-toggle="validator">Finalizar Cadastro</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="libs/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Main Script -->
  <script src="js/main.js"></script>

</body>
</html>
