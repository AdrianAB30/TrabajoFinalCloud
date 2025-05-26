<?php
include '../db.php';

$p_game_id = $_POST['_game_id'];

$stmt = $conn->prepare("CALL sp_read_game(?)");
$stmt->bind_param("i", $p_game_id);
$stmt->execute();

echo json_encode(["message" => "sp_read_game ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
