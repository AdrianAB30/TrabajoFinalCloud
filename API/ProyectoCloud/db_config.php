<?php
function conectar() {
    $host = 'localhost';
    $dbname = 'cloud 2025'; // <- cambia esto
    $username = 'root';           // <- cambia si tienes otro usuario
    $password = '';               // <- cambia si tienes contraseña

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Error en la conexión: " . $e->getMessage());
    }
}
?>
