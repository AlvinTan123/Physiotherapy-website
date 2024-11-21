<?php
// Database connection settings
$db_hostname = "localhost";
$db_username = "root";
$db_password = "";
$db_name = "physiowerkz";

// Create connection
$conn = new mysqli($db_hostname, $db_username, $db_password, $db_name);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
