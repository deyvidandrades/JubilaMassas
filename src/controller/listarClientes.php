<?php
require('../model/SGIBD.php');

// TABELAS //
function criarTabelaClientes(){
  $array = getClientes();
  echo
  '<thead>
  <tr>
  <th scope="col">#</th>
  <th scope="col">CPF</th>
  <th scope="col">Email</th>
  <th scope="col">Nome Completo</th>
  <th scope="col">Senha</th>
  <th scope="col">Data de Nascimento</th>
  <th scope="col">Opções</th>
  </tr>
  </thead>
  <tbody>';

  for ($i=0; $i < count($array); $i++) {

    $senha = base64_encode($array[$i]->getSenha());
    echo
    '<tr>
    <th scope="row">'.$array[$i]->getId().'</th>
    <td>'.$array[$i]->getCpf().'</td>
    <td>'.$array[$i]->getEmail().'</td>
    <td>'.$array[$i]->getNomeCompleto() .'</td>
    <td>'.$senha.'</td>
    <td>'.$array[$i]->getDataNascimento() .'</td>
    <td class="text-center">
    <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalAlterarCliente'.$array[$i]->getId().'">Atualizar</button>
    <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modalRemoverCliente'.$array[$i]->getId().'">Remover</button>
    </tr>';

    getModaisCliente(
      $array[$i]->getId(),
      $array[$i]->getCpf(),
      $array[$i]->getEmail(),
      $array[$i]->getNomeCompleto(),
      $array[$i]->getSenha(),
      $array[$i]->getDataNascimento()
    );

  }
  echo '</tbody>';
}

// MODAIS //
function getModaisCliente($id,$cpf,$email,$nomeCompleto, $senha,$dtNascimento){
  echo '
  <!-- Modal Alterar Cliente '.$id.'-->
  <div class="modal fade" id="modalAlterarCliente'.$id.'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
  <div class="modal-header text-light bg-primary">
  <h1 class="modal-title fs-5">Atualizar cadastro de cliente</h1>
  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
  </div>
  <div class="modal-body">

  <form class="needs-validation" method="post">
  <input type="hidden" class="form-control" id="cliente_'.$id.'_remover_id" name="cliente_id" aria-describedby="cliente_id" value="'.$id.'" required>

  <div class="mb-3">
  <label for="cliente_'.$id.'_id2" class="form-label">ID</label>
  <input type="number" class="form-control" id="cliente_'.$id.'_id2" name="" aria-describedby="cliente_id2" value="'.$id.'" required disabled>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_senha" class="form-label">Senha</label>
  <input type="password" class="form-control" id="cliente_'.$id.'_senha" name="cliente_senha" aria-describedby="cliente_senha" value="'.$senha.'" required>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_nome_completo" class="form-label">Nome Completo</label>
  <input type="name" class="form-control" id="cliente_'.$id.'_nome_completo" name="cliente_nome_completo" aria-describedby="cliente_nome_completo" value="'.$nomeCompleto.'" required>
  <div class="invalid-feedback">
  Please provide a valid city.
  </div>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_email" class="form-label">Email</label>
  <input type="email" class="form-control" id="cliente_'.$id.'_email" name="cliente_email" aria-describedby="cliente_email" value="'.$email.'" required>
  </div>

  <div class="mb-3">
  <label for="client_'.$id.'e_cpf" class="form-label">CPF</label>
  <input type="name" class="form-control" id="cliente_'.$id.'_cpf" name="cliente_cpf" aria-describedby="cliente_cpf" value="'.$cpf.'" required>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_dataNascimento" class="form-label">Data de Nascimento</label>
  <input type="date" class="form-control" id="cliente__'.$id.'dataNascimento" name="cliente_dataNascimento" aria-describedby="cliente_dataNascimento" value="'.$dtNascimento.'" required>
  </div>

  <div class="mt-4 border-top pt-4">
  <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancelar</button>
  <button type="submit" class="btn btn-outline-primary" name="submit" formaction="../controller/alterarCliente.php" value="alterar_funcionario" data-toggle="validator">Atualizar</button>
  </div>
  </form>
  </div>
  </div>
  </div>
  </div>
  ';

  echo '
  <!-- Modal Remover Cliente '.$id.'-->
  <div class="modal fade" id="modalRemoverCliente'.$id.'" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
  <div class="modal-header text-light bg-primary">
  <h1 class="modal-title fs-5">Remover cliente</h1>
  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
  </div>
  <div class="modal-body">

  <form class="needs-validation" method="post" >
  <input type="hidden" class="form-control" id="cliente_'.$id.'_remover_id" name="cliente_id" aria-describedby="cliente_id" value="'.$id.'" required>


  <div class="mb-3">
  <label for="cliente_'.$id.'_remover_id2" class="form-label">ID</label>
  <input type="email" class="form-control" id="cliente_'.$id.'_remover_id2" aria-describedby="cliente_id" value="'.$id.'" required disabled>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_remover_senha" class="form-label">Senha</label>
  <input type="password" class="form-control" id="cliente_'.$id.'_remover_senha" aria-describedby="cliente_senha" value="'.$senha.'" required disabled>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_remover_nome_completo" class="form-label">Nome Completo</label>
  <input type="name" class="form-control" id="cliente_'.$id.'_remover_nome_completo" aria-describedby="cliente_nome_completo" value="'.$nomeCompleto.'" required disabled>
  <div class="invalid-feedback">
  Please provide a valid city.
  </div>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_remover_email" class="form-label">Email</label>
  <input type="email" class="form-control" id="cliente_'.$id.'_remover_email" aria-describedby="cliente_email" value="'.$email.'" required disabled>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_remover_cpf" class="form-label">CPF</label>
  <input type="name" class="form-control" id="cliente_'.$id.'_remover_cpf" aria-describedby="cliente_cpf" value="'.$cpf.'" required disabled>
  </div>

  <div class="mb-3">
  <label for="cliente_'.$id.'_remover_dataNascimento" class="form-label">Data de Nascimento</label>
  <input type="date" class="form-control" id="cliente_'.$id.'_remover_dataNascimento" aria-describedby="cliente_dataNascimento" value="'.$dtNascimento.'" required disabled>
  </div>

  <p>Você confirma a exclusão desse cliente?</p>
  <div class="mt-4 border-top pt-4">
  <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancelar</button>
  <button type="submit" class="btn btn-outline-primary" name="submit" formaction="../controller/removerCliente.php" value="remover_funcionario" data-toggle="validator">Remover Cliente</button>
  </div>
  </form>
  </div>
  </div>
  </div>
  </div>
  ';
}

?>
