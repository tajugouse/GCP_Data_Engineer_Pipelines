--- Given a list of students who attempted the exam in the last three years find their YOY performance of marks they are getting.


create table student_marks_report(student_name varchar(30), attempt_year int, marks int);

insert into student_marks_report values('Raghav', 2021,87),('Vivek', 2021,90),
('Mahendra',2022,83),('Vivek',2022,78),('Raghav',2022,78)
,('Vivek',2023,84),('Raghav',2023,90);

--Concepts we can use here: Window functions i.e LAG

--With the help of the lag function, we can find the previous year’s marks and then we can find the ratio of difference between current and previous to previous marks. Therefore we can find the change marks percentage if we multiply it with 100.

with cte as( 
select student_name, attempt_year, marks, 
lag(marks) over(partition by student_name order by attempt_year)
as previous_marks from student_marks_report)

select student_name,attempt_year as current_year, 
marks as current_marks, previous_marks, 
((marks-previous_marks)*100/previous_marks) as YOY_performance from cte order by student_name,attempt_year;
