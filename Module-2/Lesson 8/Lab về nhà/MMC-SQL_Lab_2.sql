-- Active: 1714660276272@@127.0.0.1@3306@testing_system_db
/*============================== CREATE DATABASE =======================================*/

DROP DATABASE IF EXISTS Testing_System_Db;
CREATE DATABASE Testing_System_Db;

USE Testing_System_Db;

/*============================== CREATE TABLE=== =======================================*/

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
    DepartmentID    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,  
    DepartmentName  NVARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position` (
    PositionID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName    NVARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
    AccountID       TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email           VARCHAR(50) NOT NULL UNIQUE KEY,
    Username        VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName        NVARCHAR(50) NOT NULL,
    DepartmentID    TINYINT UNSIGNED NOT NULL,
    PositionID      TINYINT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY     (DepartmentID)  REFERENCES Department(DepartmentID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY     (PositionID)    REFERENCES `Position`(PositionID)   ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group` (
    GroupID         TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName       NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID       TINYINT UNSIGNED,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY     (CreatorID)     REFERENCES `Account`(AccountID) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
    GroupID         TINYINT UNSIGNED NOT NULL,
    AccountID       TINYINT UNSIGNED NOT NULL,
    JoinDate        DATETIME DEFAULT NOW(),
    PRIMARY KEY     (GroupID, AccountID),
    FOREIGN KEY     (GroupID)       REFERENCES `Group`(GroupID) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
    TypeID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName        ENUM('Essay', 'Multiple-Choice') NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName    NVARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Content`       NVARCHAR(255) NOT NULL,
    CategoryID      TINYINT UNSIGNED NOT NULL,
    TypeID          TINYINT UNSIGNED NOT NULL,
    CreatorID       TINYINT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY     (CategoryID)    REFERENCES CategoryQuestion(CategoryID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY     (TypeID)        REFERENCES TypeQuestion(TypeID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY     (CreatorID)     REFERENCES `Account`(AccountID) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID        TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Content`       NVARCHAR(100) NOT NULL,
    QuestionID      TINYINT UNSIGNED NOT NULL,
    isCorrect       BIT DEFAULT 1,
    FOREIGN KEY     (QuestionID)    REFERENCES Question(QuestionID) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID          TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    `Code`          CHAR(50) NOT NULL,
    Title           NVARCHAR(50) NOT NULL,
    CategoryID      TINYINT UNSIGNED NOT NULL,
    Duration        TINYINT UNSIGNED NOT NULL,
    CreatorID       TINYINT UNSIGNED NOT NULL,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY     (CategoryID)    REFERENCES CategoryQuestion(CategoryID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY     (CreatorID)     REFERENCES `Account`(AccountID) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID          TINYINT UNSIGNED NOT NULL,
    QuestionID      TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY     (ExamID, QuestionID),
    FOREIGN KEY     (QuestionID)    REFERENCES Question(QuestionID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY     (ExamID)        REFERENCES Exam(ExamID) ON UPDATE CASCADE ON DELETE CASCADE
);

/*============================== INSERT DATABASE =======================================*/
USE Testing_System_Db;
INSERT INTO Department      (DepartmentName                ) 
VALUES				        ('Engineering'                 ),
                            ('Marketing'                   ),
                            ('Human Resources'             ),
                            ('Finance'                     ),
                            ('Operations'                  );
        
USE Testing_System_Db;      
INSERT INTO `Position`	    (PositionName	               ) 
VALUES 					    ('Engineering Manager'         ),
                            ('Marketing Manager'           ),
                            ('HR Manager'                  ),
                            ('Finance Manager'             ),
                            ('Operations Manager'          ),
                            ('Engineer'                    ),
                            ('Operations Specialist'       );

USE Testing_System_Db;
INSERT INTO `Account`       (Email					        , Username			    , FullName		    , DepartmentID	, PositionID, CreateDate    )
VALUES 				        ('michael.123@outlook.com'      , 'michael_johnson'     , 'Michael Johnson' , 3             , 3         , '2024-02-01'  ), -- HR Manager
                            ('john12@gmail.com'             , 'john_doe'            , 'John Doe'        , 1             , 1         , '2024-02-20'  ), -- Engineering Manager
                            ('david.007@icloud.com'         , 'david_brown'         , 'David Brown'     , 5             , 5         , '2024-02-20'  ), -- Operations Manager
                            ('jane.smith5@yahoo.com'        , 'jane_smith'          , 'Jane Smith'      , 2             , 2         , '2024-02-22'  ), -- Marketing Manager
                            ('emily_davis@gmail.com'        , 'emily_davis'         , 'Emily Davis'     , 4             , 4         , '2024-02-22'  ), -- Finance Manager
                            ('sarah89@gmail.com'            , 'sarah_wilson'        , 'Sarah Wilson'    , 1             , 6         , '2024-03-01'  ), -- Engineer
                            ('christopher_lee123@yahoo.com' , 'christopher_lee'     , 'Christopher Lee' , 1             , 6         , '2024-03-01'  ), -- Engineer
                            ('emma.taylor456@gmail.com'     , 'emma_taylor'         , 'Emma Taylor'     , 5             , 7         , '2024-03-01'  ), -- Operations Specialist
                            ('nathan_hernandez123@yahoo.com', 'nathan_hernandez'    , 'Nathan Hernandez', 5             , 7         , '2024-03-02'  ); -- Operations Specialist

USE Testing_System_Db;
INSERT INTO `Group`	        (GroupName			            , CreatorID		        , CreateDate       )
VALUES 				        ('Management Team'              , 1                     , '2024-02-23'     ), -- Created by HR Manager
                            ('HR Support'                   , 1                     , '2024-03-01'     ), -- Created by Michael Johnson
                            ('ENG Team'                     , 2                     , '2024-03-02'     ), -- Created by John Doe
                            ('Operations Team'              , 3                     , '2024-03-03'     ); -- Created by David Brown

USE Testing_System_Db;
INSERT INTO `GroupAccount`  (GroupID	                    , AccountID	            , JoinDate	       )
VALUES 					    (1                              , 1                     , '2024-02-23'     ), -- Michael Johnson joined Management Team    
                            (1                              , 2                     , '2024-02-24'     ), -- John Doe joined Management Team           
                            (1                              , 3                     , '2024-02-24'     ), -- David Brown joined Management Team        
                            (1                              , 4                     , '2024-02-24'     ), -- Jane Smith joined Management Team         
                            (1                              , 5                     , '2024-02-24'     ), -- Emily Davis joined Management Team        
                            (2                              , 1                     , '2024-03-01'     ), -- Michael Johnson joined HR Support
                            (2                              , 6                     , '2024-03-02'     ), -- Sarah Wilson joined HR Support
                            (2                              , 7                     , '2024-03-02'     ), -- Christopher Lee joined HR Support
                            (2                              , 8                     , '2024-03-02'     ), -- Emma Taylor joined HR Support
                            (2                              , 9                     , '2024-03-03'     ), -- Nathan Hernandez joined HR Support
                            (3                              , 2                     , '2024-03-02'     ), -- John Doe joined ENG Team                  
                            (3                              , 6                     , '2024-03-02'     ), -- Sarah Wilson joined ENG Team
                            (3                              , 7                     , '2024-03-02'     ), -- Christopher Lee joined ENG Team           
                            (4                              , 3                     , '2024-03-03'     ), -- David Brown joined Operation Team         
                            (4                              , 8                     , '2024-03-03'     ), -- Emma Taylor joined Operation Team     
                            (4                              , 9                     , '2024-03-03'     ); -- Nathan Hernandez joined Operation Team

USE Testing_System_Db;
INSERT INTO TypeQuestion	(TypeName			           ) 
VALUES 						('Essay'			           ), 
							('Multiple-Choice'	           );

USE Testing_System_Db;
INSERT INTO CategoryQuestion(CategoryName	               )
VALUES 						(N'Quy định chung'             ), 
                            (N'An toàn'                    ),
                            (N'Hiểu biết chung'            ),
                            (N'Phương pháp'                );                         


USE Testing_System_Db;
INSERT INTO Question        (`Content`			                                                , CategoryID    , TypeID	 , CreatorID    , CreateDate )
VALUES 		        		(N'Quy định về nơi được phép hút thuốc trong công ty'               , 1             , 1         , 1            , '2024-03-01'),
                            (N'Quy định về thời gian hút thuốc trong giờ giải lao'              , 1             , 2         , 1            , '2024-03-01'),
                            (N'Quy định về việc xin nghỉ phép, nghỉ ốm'                         , 1             , 1         , 1            , '2024-03-01'),
                            (N'Mỗi nhân viên được cấp bao nhiêu ngày phép năm hằng tháng'       , 1             , 2         , 1            , '2024-03-01'),
                            (N'Quy định về việc đăng ký tăng ca và số giờ tăng ca'              , 1             , 1         , 1            , '2024-03-01'),
                            (N'Kể tên những mối nguy về điện trong môi trường làm việc'         , 2             , 1         , 2            , '2024-03-05'),
                            (N'Có bao nhiêu bước trong tiêu lệnh chữa cháy'                     , 2             , 2         , 2            , '2024-03-05'),
                            (N'Các nguyên tắc trong sơ cấp cứu ban đầu'                         , 2             , 1         , 2            , '2024-03-05');

USE Testing_System_Db;
INSERT INTO Answer          (`Content`      , QuestionID, isCorrect )
VALUES                      (N'Trả lời 01'  , 1         , 1         ),
                            (N'Trả lời 02'  , 1         , 0         ),
                            (N'Trả lời 03'  , 1         , 1         ),
                            (N'Trả lời 04'  , 3         , 0         ),
                            (N'Trả lời 05'  , 3         , 1         ),
                            (N'Trả lời 06'  , 2         , 1         ),
                            (N'Trả lời 07'  , 2         , 1         ),
                            (N'Trả lời 08'  , 3         , 0         ),
                            (N'Trả lời 09'  , 5         , 0         ),                           
                            (N'Trả lời 10'  , 4         , 1         ),
                            (N'Trả lời 11'  , 5         , 1         ),
                            (N'Trả lời 12'  , 7         , 1         ),
                            (N'Trả lời 13'  , 6         , 0         ),
                            (N'Trả lời 14'  , 5         , 1         ),
                            (N'Trả lời 15'  , 6         , 0         ),
                            (N'Trả lời 16'  , 8         , 1         ),
                            (N'Trả lời 17'  , 7         , 1         ),
                            (N'Trả lời 18'  , 8         , 1         ),
                            (N'Trả lời 19'  , 8         , 0         );

USE Testing_System_Db;
INSERT INTO Exam            (`Code`         , Title                    , CategoryID, Duration  , CreatorID , CreateDate )
VALUES                      ('VTIQ001'      , N'Đề thi An toàn 01'     , 2         , 60        , 2         ,'2024-03-10'),
                            ('VTIQ002'      , N'Đề thi Nội quy 01'     , 1         , 60        , 1         ,'2024-03-15'),
                            ('VTIQ003'      , N'Đề thi Nội quy 02'     , 1         , 120       , 1         ,'2024-03-16'),
                            ('VTIQ004'      , N'Đề thi An toàn 02'     , 2         , 120       , 2         ,'2024-03-17');                 

USE Testing_System_Db;
INSERT INTO ExamQuestion    (ExamID , QuestionID)
VALUES                      (1      , 1         ),
                            (1      , 2         ),
                            (1      , 8         ),
                            (1      , 7         ),
                            (2      , 2         ),
                            (2      , 1         ),
                            (3      , 4         ),
                            (3      , 3         ),
                            (3      , 5         ),
                            (4      , 7         ),
                            (4      , 8         ),
                            (3      , 6         );
