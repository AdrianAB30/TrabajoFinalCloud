<?php
include '../db.php';

$data = json_decode(file_get_contents("php://input"));

$stmt = $conn->prepare("CALL sp_login_user(?, ?)");
$stmt->bind_param("ss", $data->email, $data->password);
$stmt->execute();

$result = $stmt->get_result();
$response = $result->fetch_assoc();

echo json_encode($response);

$stmt->close();
$conn->close();
?>
