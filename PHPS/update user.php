<?php
include '../db.php';

$p_id = $_POST['_id'];
$p_email = $_POST['_email'];
$p_modified_by = $_POST['_modified_by'];

$stmt = $conn->prepare("CALL sp_update_user(?, ?, ?)");
$stmt->bind_param("iss", $p_id, $p_email, $p_modified_by);
$stmt->execute();

echo json_encode(["message" => "sp_update_user ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
