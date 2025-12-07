<?php
header('Content-Type: application/json');
require_once 'db_connect.php';

$conn = getDbConnection();

// Query matches your table structure
$sql = "SELECT player_name, score FROM leaderboard ORDER BY score DESC LIMIT 8";
$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// Format exactly how your game.js expects it (data.status and data.data)
echo json_encode(["status" => "success", "data" => $data]);

$conn->close();
?>
