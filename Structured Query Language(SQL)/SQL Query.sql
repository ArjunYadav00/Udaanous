create database Student_information;
use Student_information;
-- Using_OR_Function
Select * from courses_data where course_name = "calculus" or course_name =  "Biology";
-- using_limit_function
Select * from courses_data where course_name = "Computer Science" limit 5;
-- using_between_function
select * from courses_data where course_id between 10 and 20;
-- using_in_function
select * from student_infromation where year in ("freshman","senior");
-- using_like_function
select * from student_infromation where department like "s%";
select * from student_infromation where department like "%s";
select * from student_infromation where department like "%s%";
-- using_and_function 
select * from student_infromation where department = "science" and year = "senior";
-- using_not_function
select * from student_infromation where not department = "Arts";
-- using_lower_function
select lower ("Last_Name") as LcaseColName;
select lower (Last_Name) as LcaseColName
from student_infromation;
-- using_Char_Length_function
select char_length("SQL Tutorial") as LengthOfString;
select char_length(Course_Name) as LengthOfString
from Courses_data;
-- using_upper_function
select upper("string string") as UcaseColName;
select upper(Last_name) as UcaseColName
from student_infromation;
-- using_trim_function
select trim(last_name) as TrimmedCol
from student_infromation;
-- using_replace_function
select replace("SQL Tutorial", "SQL", "HTML") as corrected;
select replace(course_name, "Computer Science", "DA") as CorrectedCol
from courses_data;
-- using_concat_function
select concat("string1","string2") as ConcatenatedString;
select concat(First_Name," ",Last_Name) as New_Column
from student_infromation;

-- work_17_April
select * from courses_dataa1;
select min(Course_level) from courses_dataa1;
drop table courses_dataa;
select avg(course_level) from courses_Dataa1;
select max(course_level) from courses_Dataa1;
select * from student_information;

select count(student_id) as total_count from student_information;
select * from student_information;
alter table student_information
add column credibility int;
update student_information set credibility = -25;
set sql_safe_updates=0;
select abs(credibility) from student_information;

select power(course_level,2) from courses_dataa1;


