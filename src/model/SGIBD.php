<?php
require("conexao.php");
require("objetos/Cliente.php");

// FLUXO DE CLIENTES //
function adicionarCliente($cpf, $email, $nomeCompleto, $senha, $dtNascimento){
  global $link;

  $nova_senha = base64_encode($senha);

  $query = "INSERT INTO Cliente (cpf, email, nomeCompleto, senha, dtNascimento) VALUES ('{$cpf}', '{$email}', '{$nomeCompleto}', '{$nova_senha}' , '{$dtNascimento}');";
  $result = mysqli_query($link, $query) or die(mysqli_error($link));

  if ($result){
    return true;
  }else{
    return false;
  }
}

function alterarCliente($idCliente,$cpf,$email,$nomeCompleto, $senha,$dtNascimento){
  global $link;

  $nova_senha = base64_encode($senha);

  $query="UPDATE Cliente SET
  cpf='{$cpf}',
  email='{$email}',
  nomeCompleto='{$nomeCompleto}',
  senha='{$nova_senha}',
  dtNascimento='{$dtNascimento}'
  WHERE idCliente='{$idCliente}'";

  if (mysqli_query($link, $query)) {
    return true;
  } else {
    return false;
  }
}

function removerCliente($idCliente){
  global $link;

  $query="DELETE FROM Cliente WHERE idCliente={$idCliente}";

  if (mysqli_query($link, $query)) {
    return true;
  } else {
    return false;
  }
}

function getClienteById($id){
  global $link;

  $query = "SELECT * FROM Cliente WHERE id='{$id}';";
  $result = mysqli_query($link, $query) or die(mysqli_error($link));
  $row = mysqli_fetch_assoc($result);
  $nova_senha = base64_decode($row['senha']);

  return new Cliente($row['idCliente'],$row['cpf'],$row['email'], $row['nomeCompleto'],$nova_senha,$row['dtNascimento']);
}

function getClientes(){
  global $link;

  $query = "SELECT * FROM Cliente";
  $result = mysqli_query($link, $query) or die(mysqli_error($link));
  $array = array();

  while($row = mysqli_fetch_assoc($result)){
    $nova_senha = base64_decode($row['senha']);
    $array[] = new Cliente($row['idCliente'],$row['cpf'],$row['email'],$row['nomeCompleto'],$nova_senha,$row['dtNascimento']);
  }
  return $array;
}

function verificaCliente($cpf){
  global $link;

  $query = "SELECT cpf FROM Cliente WHERE cpf='{$cpf}';";
  $result = mysqli_query($link, $query) or die(mysqli_error($link));
  $row = mysqli_fetch_assoc($result);

  return mysqli_num_rows($result) > 0 ? true : false;
}
?>
