<?php
require("../model/SGIBD.php");

$cpf            = $_POST['cliente_cpf'];
$nomeCompleto   = $_POST['cliente_nome_completo'];
$email          = $_POST['cliente_email'];
$senha          = $_POST['cliente_senha'];
$dataNasc       = $_POST['cliente_dataNascimento'];

$nova_data = str_replace("-","/", $dataNasc);

if(verificaCliente($cpf)){
  echo "<script>alert('Funcionario já cadastrado');</script>";
}else{
  if(adicionarCliente($cpf, $email, $nomeCompleto, $senha, $nova_data)){
    echo "<script>alert('Cadastro realizado com sucesso');</script>";
  }else{
    echo "<script>alert('Erro no cadastro,tente novamente');</script>";
  }
}

echo "<script>location.href='../aplicacao/';</script>";

?>
