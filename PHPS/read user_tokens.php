<?php
include '../db.php';

$p_token_id = $_POST['_token_id'];

$stmt = $conn->prepare("CALL sp_read_user_token(?)");
$stmt->bind_param("i", $p_token_id);
$stmt->execute();

echo json_encode(["message" => "sp_read_user_token ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
