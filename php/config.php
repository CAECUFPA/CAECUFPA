<?php
function loadPage($filename)
{
    ob_start();
    include $filename;
    return ob_get_clean();
}

$pages = [
    'home' => 'Página inicial',
    'produtos' => 'Lista de produtos',
    'finaceiro' =>  loadPage('page/adminfin.php'),
    'login' => loadPage('page/login.php'),
];

$page = isset($_GET['page']) ? $_GET['page'] : 'home';

if (!array_key_exists($page, $pages)) {
    $page = 'home';
}