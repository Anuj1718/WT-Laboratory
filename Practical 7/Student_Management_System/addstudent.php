<?php
// Include the database connection file
include('db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the form data
    $class = $_POST['class'];
    $div = $_POST['div'];
    $name = $_POST['name'];

    // Insert the data into the student_record table
    $sql = "INSERT INTO student_record (class, div1, name1) VALUES ('$class', '$div', '$name')";

    if ($conn->query($sql) === TRUE) {
        echo "New student added successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Add Student</h2>

    <form action="addstudent.php" method="POST">
        <label for="class">Class:</label>
        <input type="text" name="class" required>

        <label for="div">Division:</label>
        <input type="text" name="div" required>

        <label for="name">Name:</label>
        <input type="text" name="name" required>

        <input type="submit" value="Add Student">
    </form>

    <a href="index.php">Back to Home</a>
</body>
</html>
