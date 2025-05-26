<?php
include '../db.php';

$p_gamename = $_POST['_gamename'];

$stmt = $conn->prepare("CALL sp_create_game(?)");
$stmt->bind_param("s", $p_gamename);
$stmt->execute();

echo json_encode(["message" => "sp_create_game ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
