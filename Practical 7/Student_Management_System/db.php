<?php
// db.php - Database connection file

$servername = "localhost";
$username = "root";  // Default MySQL username
$password = "";      // Default MySQL password (empty)
$dbname = "student_management";  // Database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
