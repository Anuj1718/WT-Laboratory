-- Create the database and table (if not already created)
CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

CREATE TABLE IF NOT EXISTS students_info (
    stud_id INT PRIMARY KEY,
    stud_name VARCHAR(50),
    class VARCHAR(10),
    division VARCHAR(5),
    city VARCHAR(30)
);

-- Insert your requested students
INSERT INTO students_info VALUES 
(1, 'Anuj Dhole', 'TY', 'A', 'Nashik'),
(2, 'Mohan Dinkar', 'TY', 'B', 'Nagpur'),
(3, 'Jiwan Dhatbale', 'TY', 'C', 'Aurangabad'),
(4, 'Chetan Kolhe', 'TY', 'A', 'Pune'),
(5, 'Andrej Karpathy', 'TY', 'B', 'San Francisco'),
(6, 'Okabe Rintarou', 'TY', 'C', 'Akihabara'),
(7, 'Elon Musk', 'TY', 'D', 'Austin'),
(8, 'Sam Altman', 'TY', 'D', 'San Francisco');

select * from students_info;
