<?php
class Cliente {
  private $idCliente;
  private $cpf;
  private $email;
  private $nomeCompleto;
  private $senha;
  private $dtNascimento;

  public function __construct($idCliente, $cpf, $email, $nomeCompleto, $senha, $dtNascimento) {
    $this->idCliente = $idCliente;
    $this->cpf = $cpf;
    $this->email = $email;
    $this->nomeCompleto = $nomeCompleto;
    $this->senha = $senha;
    $this->dtNascimento = $dtNascimento;
  }

  function getId(){
    return $this->idCliente;
  }
  function getCpf(){
    return $this->cpf;
  }
  function getEmail(){
    return $this->email;
  }
  function getNomeCompleto(){
    return $this->nomeCompleto;
  }
  function getSenha(){
    return $this->senha;
  }
  function getDataNascimento(){
    return $this->dtNascimento;
  }
}
?>
