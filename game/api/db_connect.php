<?php
require '/var/www/html/vendor/autoload.php';
use Aws\SecretsManager\SecretsManagerClient;

function getDbConnection() {
    $secretName = 'rds!db-79922ce7-4cfa-4511-bda9-59a87f82be85';
    $region = 'ap-south-1';
    $dbHost = 'project2-monolith.cjq40ma4q744.ap-south-1.rds.amazonaws.com';
    $dbName = 'snake_game';

    // Fetch Secret
    $client = new SecretsManagerClient(['version' => 'latest', 'region' => $region]);
    try {
        $result = $client->getSecretValue(['SecretId' => $secretName]);
    } catch (Exception $e) {
        die(json_encode(["status" => "error", "message" => "Secret Error"]));
    }

    $secret = json_decode($result['SecretString'], true);

    $conn = new mysqli($dbHost, $secret['username'], $secret['password'], $dbName);

    if ($conn->connect_error) {
        die(json_encode(["status" => "error", "message" => "DB Connection Failed"]));
    }
    return $conn;
}
?>
