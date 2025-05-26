<?php
include '../db.php';

$p_id = $_POST['_id'];
$p_state = $_POST['_state'];
$p_modified_by = $_POST['_modified_by'];

$stmt = $conn->prepare("CALL sp_delete_state_type(?, ?, ?)");
$stmt->bind_param("iis", $p_id, $p_state, $p_modified_by);
$stmt->execute();

echo json_encode(["message" => "sp_delete_state_type ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
