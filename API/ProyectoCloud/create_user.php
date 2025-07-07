<?php
require 'db_config.php';

$input = json_decode(file_get_contents("php://input"), true);

if (
    !isset($input['username']) ||
    !isset($input['email']) ||
    !isset($input['password']) ||
    !isset($input['created_by'])
) {
    http_response_code(400);
    echo "Faltan datos necesarios (username, email, password, created_by)";
    exit;
}

$pdo = conectar();
$sql = "CALL CreateUser(?, ?, ?, ?)";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    $input['username'],
    $input['email'],
    $input['password'],
    $input['created_by']
]);

echo "Usuario creado";
?>
