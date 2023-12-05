<?php
require("../model/SGIBD.php");

$id             = $_POST['cliente_id'];
$cpf            = $_POST['cliente_cpf'];
$email          = $_POST['cliente_email'];
$nome           = $_POST['cliente_nome_completo'];
$senha          = $_POST['cliente_senha'];
$dataNascimento = $_POST['cliente_dataNascimento'];

$res = alterarCliente($id, $cpf, $email, $nome, $senha, $dataNascimento);

if ($res) {
  echo "<script>alert('Cliente atualizado'); location.href='../aplicacao/'</script>";
} else {
  echo "<script>alert('Erro ao atualizar cliente'); location.href='../aplicacao/'</script>";
}
?>
