<?php
require("../model/SGIBD.php");

$id = $_POST['cliente_id'];

$res = removerCliente($id);
if ($res) {
  echo "<script>location.href='../aplicacao/'</script>";
} else {
  echo "<script>location.href='../aplicacao/'</script>";
}
?>
