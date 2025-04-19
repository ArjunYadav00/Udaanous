-- work_19_04
use Student_information;
-- Use_Any_operator
select first_name from Student_information
where student_id = Any (select student_id from Student_information where department = 'science');
-- having_clause
select count(student_id)
from Student_information
group by department 
having count(student_id) >=4;
-- Exist_clause
select * from student_information
where exists ( select * from Student_information where GPA >2);

use udaanous;
-- Create_Table
CREATE TABLE student_info (
    StudentID INT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50)
);
INSERT INTO student_info (StudentID, FirstNames, LastNames) VALUES
(1, 'John', 'Doe'),
(2, 'Alice', 'Smith'),
(3, 'Bob', 'Johnson'),
(4, 'Emily', 'Brown'),
(5, 'Michael', 'Davis'),
(6, 'Sarah', 'Wilson'),
(7, 'David', 'Lee'),
(8, 'Jessica', 'Taylor'),
(9, 'Chris', 'Evans'),
(10, 'Emma', 'Thompson');
-- Create_Table
CREATE TABLE exam_info (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer
);
INSERT INTO exam_info (StudentID, Subjects, Scores) VALUES
(1, 'Math',  80),
(2, 'English',  75),
(3, 'Science',  78),
(4, 'Math',  60),
(5, 'English', 86),
(6, 'Science', 90),
(7, 'Science', 75),
(8, 'English', 75),
(9, 'Math',  55),
(10, 'Math',  67);
-- finding the info_of the students who scored < 75 in the exam.
SELECT si.*
FROM student_info si
INNER JOIN exam_info ei ON si.StudentID = ei.StudentID
WHERE ei.Scores > 75;
--  finding the info of the students who scored < 75 in the exam but using ANY.
SELECT * FROM student_info
WHERE StudentID = ANY ( SELECT StudentID 
    FROM exam_info 
    WHERE Scores > 75
);
