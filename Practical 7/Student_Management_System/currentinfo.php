<?php
// currentinfo.php - To edit and display a student's current information

include('db.php');

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    
    // Fetch the existing student record
    $sql = "SELECT * FROM student_record WHERE id = $id";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
    } else {
        echo "Student not found.";
        exit();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $class = $_POST['class'];
        $div = $_POST['div'];
        $name = $_POST['name'];

        $sql = "UPDATE student_record SET class='$class', div1='$div', name1='$name' WHERE id=$id";
        
        if ($conn->query($sql) === TRUE) {
            echo "Record updated successfully.";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Current Info</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Edit Student Info</h2>

    <form action="currentinfo.php?id=<?php echo $id; ?>" method="post">
        <label>Class:</label>
        <input type="text" name="class" value="<?php echo $row['class']; ?>" required>

        <label>Division:</label>
        <input type="text" name="div" value="<?php echo $row['div1']; ?>" required>

        <label>Name:</label>
        <input type="text" name="name" value="<?php echo $row['name1']; ?>" required>

        <button type="submit">Update Student</button>
    </form>

    <a href="studentinfo.php">Back</a>
</body>
</html>


