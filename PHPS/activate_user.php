<?php
include '../db.php';

$data = json_decode(file_get_contents("php://input"));

$stmt = $conn->prepare("CALL sp_activate_user(?)");
$stmt->bind_param("i", $data->user_id);
$stmt->execute();

echo json_encode(["status" => "User activated"]);

$stmt->close();
$conn->close();
?>
