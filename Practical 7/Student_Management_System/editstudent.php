<?php
// Include the database connection file
include('db.php');

// Check if an ID is provided in the URL
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Retrieve the student record for the given ID
    $sql = "SELECT * FROM student_record WHERE id = $id";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $student = $result->fetch_assoc();
    } else {
        echo "No student found with that ID.";
        exit;
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the updated form data
    $class = $_POST['class'];
    $div = $_POST['div'];
    $name = $_POST['name'];

    // Update the student record in the database
    $sql = "UPDATE student_record SET class='$class', div1='$div', name1='$name' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "Student record updated successfully!";
        header("Location: studentinfo.php");  // Redirect to the student info page after success
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Edit Student Information</h2>

    <form action="editstudent.php?id=<?php echo $student['id']; ?>" method="POST">
        <label for="class">Class:</label>
        <input type="text" name="class" value="<?php echo $student['class']; ?>" required>

        <label for="div">Division:</label>
        <input type="text" name="div" value="<?php echo $student['div1']; ?>" required>

        <label for="name">Name:</label>
        <input type="text" name="name" value="<?php echo $student['name1']; ?>" required>

        <input type="submit" value="Update Student">
    </form>

    <a href="studentinfo.php">Back to Student Info</a>
</body>
</html>
