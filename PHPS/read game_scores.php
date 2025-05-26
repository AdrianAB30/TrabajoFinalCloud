<?php
include '../db.php';

$p_score_id = $_POST['_score_id'];

$stmt = $conn->prepare("CALL sp_read_game_score(?)");
$stmt->bind_param("i", $p_score_id);
$stmt->execute();

echo json_encode(["message" => "sp_read_game_score ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
