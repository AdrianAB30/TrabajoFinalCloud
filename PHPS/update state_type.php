<?php
include '../db.php';

$p_id = $_POST['_id'];
$p_description = $_POST['_description'];
$p_modified_by = $_POST['_modified_by'];

$stmt = $conn->prepare("CALL sp_update_state_type(?, ?, ?)");
$stmt->bind_param("iss", $p_id, $p_description, $p_modified_by);
$stmt->execute();

echo json_encode(["message" => "sp_update_state_type ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
