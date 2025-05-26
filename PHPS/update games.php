<?php
include '../db.php';

$p_id = $_POST['_id'];
$p_gamename = $_POST['_gamename'];
$p_modified_by = $_POST['_modified_by'];

$stmt = $conn->prepare("CALL sp_update_game(?, ?, ?)");
$stmt->bind_param("iss", $p_id, $p_gamename, $p_modified_by);
$stmt->execute();

echo json_encode(["message" => "sp_update_game ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
