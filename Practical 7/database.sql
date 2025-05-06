CREATE DATABASE student_management;

USE student_management;

CREATE TABLE student_record (
    id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    class VARCHAR(10),
    div1 VARCHAR(10),
    name1 VARCHAR(100),
    action VARCHAR(50)
);

drop table student_record;