<?php
require '/var/www/html/vendor/autoload.php';
use Aws\SecretsManager\SecretsManagerClient;

function getDbConnection() {
    // We only hardcode the Secret Name and Region. NOT the database address.
    $secretName = 'project2-secret'; // Keep your secret name
    $region = 'ap-south-1';

    $client = new SecretsManagerClient(['version' => 'latest', 'region' => $region]);

    try {
        $result = $client->getSecretValue(['SecretId' => $secretName]);
    } catch (Exception $e) {
        // In production, log this error securely
        die(json_encode(["status" => "error", "message" => "Secret Error"]));
    }

    // Decode the JSON from Secrets Manager
    $secret = json_decode($result['SecretString'], true);

    // KEY CHANGE: We get the 'host' from the secret, not a variable!
    $conn = new mysqli($secret['host'], $secret['username'], $secret['password'], $secret['dbname']);

    if ($conn->connect_error) {
        die(json_encode(["status" => "error", "message" => "DB Connection Failed"]));
    }
    return $conn;
}
?>
