<?php
include '../db.php';

$p_user_id = $_POST['_user_id'];

$stmt = $conn->prepare("CALL sp_read_user(?)");
$stmt->bind_param("i", $p_user_id);
$stmt->execute();

echo json_encode(["message" => "sp_read_user ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
