<?php
include '../db.php';

$p_game_id = $_POST['_game_id'];
$p_time = $_POST['_time'];
$p_score = $_POST['_score'];
$p_user_id = $_POST['_user_id'];

$stmt = $conn->prepare("CALL sp_create_game_score(?, ?, ?, ?)");
$stmt->bind_param("isii", $p_game_id, $p_time, $p_score, $p_user_id);
$stmt->execute();

echo json_encode(["message" => "sp_create_game_score ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
