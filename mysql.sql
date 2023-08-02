create database task;
use task;
CREATE TABLE student (
  studentID INT PRIMARY KEY,
  studentName VARCHAR(50) NOT NULL
);
INSERT INTO student (studentID, studentName) VALUES
(1001, 'Mary'),
(1002, 'Jane'),
(1003, 'Daniel'),
(1004, 'Jack'),
(1005, 'Harold');

CREATE TABLE course (
  courseID INT PRIMARY KEY,
  courseName VARCHAR(50) NOT NULL,
  studentID INT,
  FOREIGN KEY (studentID) REFERENCES student(studentID)
);
INSERT INTO course (courseID, courseName, studentID) VALUES
(5001, 'PHP', 1004),
(5002, 'Java', 1001),
(5003, 'ASP.NET', 1001),
(5004, 'Ruby', 1002);

CREATE TABLE teacher (
  teacherID INT PRIMARY KEY,
  teacherName VARCHAR(50) NOT NULL,
  courseID INT,
  FOREIGN KEY (courseID) REFERENCES course(courseID)
);

INSERT INTO teacher (teacherID, teacherName, courseID) VALUES
(3001, 'Jill', 5003),
(3002, 'Greul', 5002),
(3003, 'Jenkins', 5001),
(3004, 'Polo', 5004);

ALTER TABLE Student ADD PRIMARY KEY (studentID);
ALTER TABLE Course ADD PRIMARY KEY (courseID);
ALTER TABLE Teacher ADD PRIMARY KEY (teacherID);

ALTER TABLE Course ADD FOREIGN KEY (studentID) REFERENCES Students(studentID);
ALTER TABLE Teacher ADD FOREIGN KEY (courseID) REFERENCES Course(courseID);

-- Fetch all column's details using a JOIN:-- 
  SELECT * FROM student JOIN course ON student.studentID = course.studentID JOIN teacher ON course.courseID = teacher.courseID;
  
-- Fetch the details of students who appeared in asp.net--  
SELECT studentID, studentName FROM student JOIN course ON student.studentID = course.studentID WHERE course.courseName = 'ASP.NET';

SELECT * FROM student CROSS JOIN course;

SELECT * FROM student LEFT JOIN course ON student.studentID = course.studentID;

SELECT * FROM student RIGHT JOIN course ON student.studentID = course.studentID;

SELECT * FROM student INNER JOIN course ON student.studentID = course.studentID;