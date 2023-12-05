<?php
 // Conectando ao banco de dados //
$servidor = "127.0.0.1";
$db       = "JubilaMassas";
$usuario  = "root";
$senha    = "";

$link = mysqli_connect($servidor,$usuario,$senha,$db);

// Checando a conexão //
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    echo "err";
    exit();
}
?>
