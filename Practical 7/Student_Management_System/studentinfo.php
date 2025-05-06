<?php
// Include the database connection file
include('db.php');

// Retrieve all student records
$sql = "SELECT * FROM student_record";
$result = $conn->query($sql);
?>
<!-- PHP fetching logic remains unchanged -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Information</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Student Records</h2>

    <?php
    if ($result->num_rows > 0) {
        echo "<table><tr><th>ID</th><th>Class</th><th>Division</th><th>Name</th><th>Actions</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['id']}</td>
                    <td>{$row['class']}</td>
                    <td>{$row['div1']}</td>
                    <td>{$row['name1']}</td>
                    <td>
                        <a href='editstudent.php?id={$row['id']}'>Edit</a> |
                        <a href='delstudent.php?id={$row['id']}'>Delete</a>
                    </td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "No students found!";
    }
    ?>

    <a href="index.php">Back to Home</a>
</body>
</html>
