
Create DataBase MasterDB;
go

Use MasterDB;
go

Create Schema MasterSchema;
go

-- Create Student Table;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY (1,1),
    First_Name NVARCHAR(255),
    Last_Name NVARCHAR(255),
    Email VARCHAR(50),
    Data_of_Birth DATE,
    Student_Image VARBINARY(MAX),
    Telephone VarChar (30),  
    Password NVARCHAR(50),
    Gender CHAR(1),
    Contact_Person VARCHAR(50),
    Address VARCHAR(255),
    RoleID INT --used for authtication later 

);
CREATE TABLE Comments (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,  
    StudentID INT,  
    Message NVARCHAR(MAX),
    PostedDate DATETIME,
    CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Subjects_Taught VARCHAR(255),
    Qualifications VARCHAR(255),
    Profile_Image VARBINARY(MAX),
    Gender CHAR(1),
    Level VARCHAR(50),	
	RoleID INT --used for authtication later 

);


CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ProfileImage VARBINARY(MAX),
    Gender CHAR(1),
    ContactNumber VARCHAR(20),
    Address VARCHAR(255),
 	RoleID INT, --used for authtication later 
    IsActive BIT
);
CREATE TABLE Classes_Schedule (
    TermID INT,
    YearsID INT,
    ClassName NVARCHAR(255),
    YearName VARCHAR(255),
    PRIMARY KEY (TermID, YearsID)
);
CREATE TABLE Subjects (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    TeacherID INT,
    Subject_Name NVARCHAR(255),
    Requirement NVARCHAR(MAX),
    TermID INT,
    YearsID INT,
    CONSTRAINT FK_TeacherID FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    CONSTRAINT FK_TermID_YearsID FOREIGN KEY (TermID, YearsID) REFERENCES Classes_Schedule(TermID, YearsID)
);

CREATE TABLE Questions_True_Or_False (
    QuestionID INT PRIMARY KEY,
    QuestionText NVARCHAR(510),
	SubjectID INT ,
    QuestionType INT, -- Indicates the type of question (1- for TrueFalse, 2- for MultipleChoice)
    CorrectAnswer INT, -- The index of the correct choice (1 for True, 2 for False)
    Choice1 NVARCHAR(10), -- True
    Choice2 NVARCHAR(10), -- False
    Explanation NVARCHAR(MAX),
    CreatedAt DATETIME,
    CONSTRAINT FK_SubjectID1 FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)

     
);
CREATE TABLE Questions_Multiple_Choice  (
    QuestionID INT PRIMARY KEY,
    QuestionText NVARCHAR(510),
	SubjectID INT ,
    QuestionType INT, -- Indicates the type of question ( 1- for True or False, 2- for MultipleChoice)
    CorrectAnswer INT, -- The index of the correct choice  
    Choice1 NVARCHAR(255),  
    Choice2 NVARCHAR(255),  
	Choice3 NVARCHAR(255),   
    Choice4 NVARCHAR(255),   
    Explanation NVARCHAR(MAX),
    CreatedAt DATETIME,
    CONSTRAINT FK_SubjectID2 FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) -- Foreing key for Subjects Table;

     
);
CREATE TABLE Course_Content(
 ChapterID INT PRIMARY KEY IDENTITY (1,1),
 SubjectID INT,
 ChapterName VARCHAR(255),
 ChapterURL VARCHAR(255),
 CONSTRAINT FK_SubjectID3 FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID) 
);






