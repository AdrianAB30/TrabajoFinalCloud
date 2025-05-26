<?php
include '../db.php';

$p_id = $_POST['_id'];
$p_login_attempt = $_POST['_login_attempt'];
$p_modified_by = $_POST['_modified_by'];

$stmt = $conn->prepare("CALL sp_update_user_token(?, ?, ?)");
$stmt->bind_param("iis", $p_id, $p_login_attempt, $p_modified_by);
$stmt->execute();

echo json_encode(["message" => "sp_update_user_token ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
