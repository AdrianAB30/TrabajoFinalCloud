<?php
header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);
$email = $data['email'];
$password = $data['password'];

$conn = new mysqli("localhost", "usuario", "clave", "basededatos");
$stmt = $conn->prepare("CALL tu_procedure_login(?, ?)");
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$result = $stmt->get_result();
if ($result && $result->num_rows > 0) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false]);
}
$conn->close();
?>