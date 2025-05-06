<?php
// Include the database connection file
include('db.php');

// Check if an ID is provided in the URL
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Delete the student record with the given ID
    $sql = "DELETE FROM student_record WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo "Student record deleted successfully!";
        header("Location: studentinfo.php");  // Redirect to the student info page
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>
