<?php
include '../db.php';

$p_id = $_POST['_id'];
$p_description = $_POST['_description'];

$stmt = $conn->prepare("CALL sp_create_state_type(?, ?)");
$stmt->bind_param("is", $p_id, $p_description);
$stmt->execute();

echo json_encode(["message" => "sp_create_state_type ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
