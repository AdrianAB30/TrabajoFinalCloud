<?php
include '../db.php';



$stmt = $conn->prepare("CALL sp_read_state_type()");
$stmt->bind_param("", );
$stmt->execute();

echo json_encode(["message" => "sp_read_state_type ejecutado correctamente"]);
$stmt->close();
$conn->close();
?>
