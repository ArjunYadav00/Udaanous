use arjuna;
select `Course ID`,`Course Name`
from courses_data;
select distinct `Course Level`
from courses_data;
show tables;
select * from courses_data;
select Semester as sem
from enrollments_data;
select `Enrollment ID` as enroll_id
from enrollments_data;
select `Student ID`, Grade
from enrollments_data
where Grade in ('A', 'B', 'C', 'D');
select `Student ID`, Grade
from enrollments_data
where Grade between 'A' and 'D';
