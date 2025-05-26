<?php
include '../db.php';

$p_username = $_POST['_username'];
$p_email = $_POST['_email'];
$p_password = $_POST['_password'];

$stmt = $conn->prepare("CALL sp_create_user(?, ?, ?)");
$stmt->bind_param("sss", $p_username, $p_email, $p_password);
$stmt->execute();

echo json_encode(["message" => "sp_create_user ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
