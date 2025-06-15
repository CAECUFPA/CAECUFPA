<?php require_once 'php/dados.php';
?>

<img class="coruja" src="assets/coruja.png" alt="Coruja" />

<div class="container">
  <h1>
    <img src="assets/logo,semfundo.png" alt="emoji" class="emoji" />
    Caixa Caec:
  </h1>

  <div id="resultado">
    <p><strong>Entradas:</strong> <span id="entradas"><?= htmlspecialchars($entradas) ?></span></p>
    <p><strong>Saídas:</strong> <span id="saidas"><?= htmlspecialchars($saidas) ?></span></p>
  </div>

  <div id="saldo-atual" style="margin-top: 20px; font-weight: bold;">
    Saldo atual: <span id="saldo"><?= htmlspecialchars($saldo) ?></span>
  </div>
</div>

<footer>CAEC© 2025</footer>