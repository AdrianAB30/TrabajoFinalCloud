<?php
include '../db.php';

$p_user_id = $_POST['_user_id'];
$p_token = $_POST['_token'];
$p_login_attempt = $_POST['_login_attempt'];
$p_last_login = $_POST['_last_login'];

$stmt = $conn->prepare("CALL sp_create_user_token(?, ?, ?, ?)");
$stmt->bind_param("isis", $p_user_id, $p_token, $p_login_attempt, $p_last_login);
$stmt->execute();

echo json_encode(["message" => "sp_create_user_token ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
