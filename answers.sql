-- Create a database named `education_db` and create the following two tables:

create database education_db;
use education_db;

-- *Course

--  `course_id` – Primary Key, Auto Increment
--  `course_name` – NOT NULL, UNIQUE
--  `duration`
--  `fee`

create table Course1(course_id int primary key auto_increment,
				    course_name varchar(30) not null unique,
                    duration varchar(30),
                    fee int)
                    
insert into Course1(course_id,course_name,duration,fee)
			values(1,'python','six months',50000),
				  (2,'java','seven month',60000),
                  (3, 'data science', 'eight months', 75000),
				  (4,'web development', 'four months', 45000),
				  (5,'cyber security', 'six months', 55000),
                  (6,'cloud computing', 'five months', 65000);
-- Student

--  `student_id` – Primary Key, Auto Increment
--  `student_name` – NOT NULL
--  `email` – UNIQUE
--  `age`
--  `gender`
--  `mark`
--  `courseid` – Foreign Key referencing `Course(courseid)`
create table Student (
    student_id int auto_increment primary key,
    student_name varchar(30) not null,
    email varchar(30) unique,
    age int,
    gender varchar(10),
    mark int,
    course_id int,
    foreign key (course_id) references Course1(course_id));
    
-- Insert records

insert into student (student_name, email, age, gender, mark, course_id)
values 
    ('arjun sharma', 'arjun@email.com', 21, 'male', 85, 1),
    ('diya patel', 'diya@email.com', 22, 'female', 92, 2),
    ('rohan das', 'rohan@email.com', 23, 'male', 78, 3),
    ('isha nair', 'isha@email.com', 20, 'female', 88, 4),
    ('kabir singh', 'kabir@email.com', 24, 'male', 95, 5),
    ('ananya rao', 'ananya@email.com', 22, 'female', 81, 6);



-- ### Questions

-- 1. Write a query to display all students who scored more than *80 marks, ordered by mark in descending order.

select * from student where mark>80 order by mark desc;

-- 2. Write a query to find the highest mark, lowest mark, and average mark of all students.

select max(mark),min(mark),avg(mark) from student ;

-- 3. Write a query to display the top 5 students based on their marks.

select * from student order by mark desc limit 5;

-- 4. Write a query to display the names and marks of students whose age is between 18 and 25, ordered by age.

select student_name,mark from student where age between 18 and 25 order by age;

-- 5. Write a query to find the number of students in each course.

select course_id, count(*) from student group by course_id;

-- 6. Write a query to display the courses that have more than 2 students.

select course_id, count(*)  from student group by course_id having count(*) > 2;

-- 7. Write a query to display the student name, mark, and course name using an `INNER JOIN`.

select student_name, mark, course_name from student inner join Course1  on student.course_id = Course1.course_id;

-- 8. Write a query to display all courses and their students, including courses that have no students, using a `LEFT JOIN`.

select course_name, student_name from Course1 left join student  on Course1.course_id = student.course_id;

-- 9. Write a query to display students whose marks are greater than the overall average mark using a subquery.

select * from student where mark > (select avg(mark) from student);

-- 10. Write a query to find the second-highest mark and display the student name, mark, and course name using a subquery and `JOIN`.

select student_name, mark, course_name from student inner join Course1  on student.course_id = Course1.course_id where student.mark = (
select max(mark) from student where mark < (select max(mark) from student));


-- ### Git Repository Task

-- 1. Create a new GitHub repository for this SQL practice task.
-- 2. Create a file named `answers.sql` and write the SQL queries for all 10 questions in it.
-- 3. Commit and push the file to your GitHub repository.
-- 4. Make the repository public and share the GitHub repository link*