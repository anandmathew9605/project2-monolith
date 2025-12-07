<?php
header('Content-Type: application/json');
require_once 'db_connect.php';

// Get JSON input from game.js
$input = json_decode(file_get_contents('php://input'), true);

if (isset($input['name']) && isset($input['score'])) {
    $conn = getDbConnection();

    // Secure insert using Prepared Statements
    $stmt = $conn->prepare("INSERT INTO leaderboard (player_name, score) VALUES (?, ?)");
    $stmt->bind_param("si", $input['name'], $input['score']);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["status" => "error", "message" => "Invalid Input"]);
}
?>
