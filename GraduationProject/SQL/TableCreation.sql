
Create DataBase MyDB;
go;
use  master;
go
 
use MyDB;	
go
-- Default Schema is dbo
Create Schema MySchema
go

Create Table Students
(
 StudentID int primary key identity (1,1),
 FirstName VarChar(255),
 LastName VarChar(255),
 Email VarChar(255) Unique,
 DataOfBirth DATE,
 StudentImg VarBinary (MAX),
 PhoneNumber VarChar(20),
 PassWord varchar(50),
 Gender char(1),
 ContactPerson varchar (50),
 Address varchar(255),
);
go

Create Table Comments
(
 CommentID int Primary Key identity (1,1),
 StudentID int Foreign Key references Students( StudentID) not null,
 MessageContent varchar( 255 ) not null,
 DatePosted DateTime not null,
);
go

Create Table Admins 
(
AdminID int primary key identity (1,1),
AdminName varchar (255),
AdminEmail varchar (50),
AdminPassword varchar (50),
ProfileImage VARBINARY(MAX),
StudentID int ,
TeacherID int,
SubjectID int,
TermID int,
YearsID int,

);
go

Create Table Registration
(
 RegistrationID int primary key identity (1,1),
 SudentID int foreign key references Students (StudentID) not null, 
 AdminID int foreign key references Admins (AdminID) not null, 
 Registration_role_ID int ,
 SecurityQuestion varchar (255),
 Email varchar (255),
 Password varchar (255),
 LimitedTries int,

);
go

Create Table Subjects
(
SubjectID int primary key,
TeacherID int foreign key references Teachers(TeacherID),
SubjectName varchar (255),
Requirement varchar (255),
Questions_AnswersID int foreign key references Questions_Answers (Questions_AnswersID)
ExaminationID int foreign key references Examinations (ExaminationID)
);
go;

Create Table ClassesSchedule
(
TermID int,
YearID int,
ClassName varchar (255),
NameofTheYear varchar (255),
SubjectID int foreign key references Subjects(SubjectID),
primary key ( TermID, YearID)
);
go;

Create Table PrivateCourses
(
CourseID int primary key,
StudentID int foreign key references Students (StudentID),
TermID int foreign key references ClassesSchedule (TermID),
YearID int foreign key references ClassesSchedule (YearID),
TeacherID int foreign key references Teacher (TeacherID)
);
go;

Create Table Questions_Answers
(
Questions_AnswersID int primary key,
SubjectID int foreign key references Subjects(SubjectID),
	
);
go;

Create Table Teachers
(
 TeacherID int primary key,
 FirstName varchar (255) ,
 LastName varchar (255) ,
 SubjectsTaught  varchar(255), --?
 Qualifications varchar (255), -- ?
 ProfileImg VarBinary(MAX),
 Gender char(1),
 Level varchar(50),
 CouruseID int foreign key references CourseLocation( CourseLocationID),

);
go

Create Table CourseLocation
(
CourseLocationID int primary key,
TeacherID int foreign key references Teachers (TeacherID),

);
go

 
 










 Select * from Students;





 -- Students Table
INSERT INTO Students (FirstName, LastName, Email, DataOfBirth, PhoneNumber, PassWord, Gender, ContactPerson, Address)
VALUES 
('Ibrahim', 'Ali', 'ibrahim.ali@example.com', '1999-03-12', '01012345678', 'HASHED_PASSWORD_1', 'M', 'Fatma Ali', '5 El Gomhoreya St, Cairo'),
('Mohamed', 'Khaled', 'mohamed.khaled@example.com', '2001-08-25', '01198765432', 'HASHED_PASSWORD_2', 'M', 'Nadia Khaled', '10 El Tahrir St, Giza'),
('Ahmed', 'Hassan', 'ahmed.hassan@example.com', '1998-11-05', '01234567890', 'HASHED_PASSWORD_3', 'M', 'Mona Hassan', '15 El Nasr St, Alexandria'),
('Gehan', 'Mahmoud', 'gehan.mahmoud@example.com', '2000-06-18', '01098712345', 'HASHED_PASSWORD_4', 'F', 'Sara Mahmoud', '20 El Gezira St, Luxor'),
('Aya', 'Youssef', 'aya.youssef@example.com', '1997-09-30', '01132165498', 'HASHED_PASSWORD_5', 'F', 'Nour Youssef', '25 El Nahr St, Aswan'),
('Tasneem', 'Ahmed', 'tasneem.ahmed@example.com', '1999-12-03', '01245698732', 'HASHED_PASSWORD_6', 'F', 'Hala Ahmed', '30 El Saad St, Port Said')
