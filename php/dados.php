<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

function buscarDados($url)
{
  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
  $resultado = curl_exec($ch);

  if (curl_errno($ch)) {
    $erro = curl_error($ch);
    curl_close($ch);
    echo json_encode(['erro' => "Erro cURL: $erro"]);
    exit;
  }
  curl_close($ch);
  return $resultado;
}

function formatarMoeda($valor)
{
  return 'R$ ' . number_format($valor, 2, ',', '.');
}

$apiUrl = "https://script.google.com/macros/s/AKfycbxxQZnI8h7dffH6683uk6Y2gGBg4rRIAOP1VcNXW_Pf1GUEvQTY0GduZ_fo-5DRj91V/exec";

$dadosJson = buscarDados($apiUrl);

if (!$dadosJson) {
  $entradas = $saidas = $saldo = 'Erro: dados não retornaram';
} else {
  $dados = json_decode($dadosJson, true);

  if (!$dados || !isset($dados['entradas'], $dados['saidas'], $dados['saldo'])) {
    echo "Erro: dados inválidos retornados da API.<br>";
    var_dump($dadosJson);
    exit;
  }

  $entradas = formatarMoeda($dados['entradas']);
  $saidas = formatarMoeda($dados['saidas']);
  $saldo = formatarMoeda($dados['saldo']);
};