-- Active: 1714660276272@@127.0.0.1@3306@testing_system_db
USE testing_system_db;

SHOW TABLES

/*markdown
# Question 1. Thêm ít nhất 10 record vào mỗi bảng
*/

USE Testing_System_Db;      
INSERT INTO `Position`	    (PositionName	               ) 
VALUES 	                    ('HR Specialist'               ),
                            ('Marketer'                    ),
                            ('Financial Analyst'           ),
                            ('Operator'                    );

USE Testing_System_Db;
INSERT INTO `Account`       (Email					        , Username			    , FullName		    , DepartmentID	, PositionID, CreateDate    )
VALUES                      ('jessica4@gmail.com'           , 'jessica_garcia'      , 'Jessica Garcia'  , 3             , 8         , '2024-03-10'  ), -- HR Specialist
                            ('amanda123@outlook.com'        , 'amanda_thompson'     , 'Amanda Thompson' , 2             , 9         , '2024-03-10'  ), -- Marketer
                            ('daniel12@yahoo.com'           , 'daniel_rodriguez'    , 'Daniel Rodriguez', 3             , 8         , '2024-03-20'  ), -- HR Specialist
                            ('ashley.martinez@aol.com'      , 'ashley_martinez'     , 'Ashley Martinez' , 4             , 10        , '2024-03-21'  ), -- Financial Analyst
                            ('james99@aol.com'              , 'james_lopez'         , 'James Lopez'     , 5             , 11        , '2024-03-21'  ), -- Operator
                            ('alice.smith456@hotmail.com'   , 'alice_smith'         , 'Alice Smith'     , 1             , 6         , '2024-05-15'  ), -- Engineer
                            ('bob.jones789@protonmail.com'  , 'bob_jones'           , 'Bob Jones'       , 1             , 6         , '2024-05-16'  ), -- Engineer
                            ('carol.wilson123@live.com'     , 'carol_wilson'        , 'Carol Wilson'    , 5             , 11        , '2024-05-31'  ), -- Operator
                            ('dave_clark456@yandex.com'     , 'dave_clark'          , 'Dave Clark'      , 5             , 11        , '2024-05-31'  ), -- Operator
                            ('ryan.martinez@icloud.com'     , 'ryan_martinez'       , 'Ryan Martinez'   , 5             , 11        , '2024-05-31'  ); -- Operator

USE Testing_System_Db;
INSERT INTO `Group`	        (GroupName			            , CreatorID		        , CreateDate        )
VALUES                      ('Marketing Team'               , 4                     , '2024-03-11'      ), -- Created by Jane Smith
                            ('HR Team'                      , 1                     , '2024-03-11'      ), -- Created by Michael Johnson                            
                            ('Finance Team'                 , 5                     , '2024-03-23'      ), -- Created by Emily Davis
                            ('ENG_Help Team'                , 2                     , '2024-03-27'      ), -- Created by John Doe
                            ('Analyst Team'                 , 4                     , '2024-03-30'      ); -- Created by Jane Smith

USE Testing_System_Db;
INSERT INTO `GroupAccount`  (GroupID	                    , AccountID	            , JoinDate	        )
VALUES                      (2                              , 10                    , '2024-03-11'      ), -- Jessica Garcia joined HR Support
                            (2                              , 11                    , '2024-03-11'      ), -- Amanda Thompson joined HR Support
                            (2                              , 12                    , '2024-03-21'      ), -- Daniel Rodriguez joined HR Support
                            (2                              , 13                    , '2024-03-22'      ), -- Ashley Martinez joined HR Support
                            (2                              , 14                    , '2024-03-22'      ), -- James Lopez joined HR Support
                            (2                              , 15                    , '2024-05-16'      ), -- Alice Smith joined HR Support
                            (2                              , 16                    , '2024-05-17'      ), -- Bob Jones joined HR Support
                            (2                              , 17                    , '2024-06-01'      ), -- Carol Wilson joined HR Support
                            (2                              , 18                    , '2024-06-01'      ), -- Dave Clark joined HR Support
                            (2                              , 19                    , '2024-06-01'      ), -- Ryan Martinez joined HR Support         
                            (3                              , 15                    , '2024-05-16'      ), -- Alice Smith joined ENG Team
                            (3                              , 16                    , '2024-05-17'      ), -- Bob Jones joined ENG Team
                            (4                              , 14                    , '2024-03-23'      ), -- James Lopez joined Operation Team  
                            (4                              , 17                    , '2024-06-01'      ), -- Carol Wilson joined Operation Team 
                            (4                              , 18                    , '2024-06-01'      ), -- Dave Clark joined Operation Team   
                            (4                              , 19                    , '2024-06-01'      ), -- Ryan Martinez joined Operation Team       
                            (6                              , 1                     , '2024-03-11'      ), -- Michael Johnson joined HR Team            
                            (6                              , 10                    , '2024-03-11'      ), -- Jessica Garcia joined HR Team  
                            (6                              , 12                    , '2024-03-21'      ), -- Daniel Rodriguez joined HR Team         
                            (7                              , 5                     , '2024-03-23'      ), -- Emily Davis joined Finance Team           
                            (7                              , 13                    , '2024-03-24'      ), -- Ashley Martinez joined Finance Team      
                            (8                              , 2                     , '2024-03-27'      ), -- John Doe joined ENG HELP Team                  
                            (8                              , 3                     , '2024-03-27'      ), -- David Brown joined ENG HELP Team         
                            (8                              , 6                     , '2024-03-27'      ), -- Sarah Wilson joined ENG HELP Team         
                            (8                              , 7                     , '2024-03-27'      ), -- Christopher Lee joined ENG HELP Team      
                            (8                              , 15                    , '2024-05-17'      ), -- Alice Smith joined ENG HELP Team          
                            (8                              , 16                    , '2024-05-18'      ), -- Bob Jones joined ENG HELP Team            
                            (5                              , 4                     , '2024-03-30'      ), -- Jane Smith joined Marketing Team          
                            (5                              , 11                    , '2024-03-30'      ); -- Amanda Thompson joined Marketing Team

USE Testing_System_Db;
INSERT INTO Question        (`Content`			                                                , CategoryID    , TypeID	 , CreatorID    , CreateDate )
VALUES                      (N'Có bao nhiêu bước trong phương pháp 5S nơi làm việc'             , 3             , 2         , 3            , '2024-04-01'),
                            (N'Kể tên những mối nguy về hóa chất có thể gặp'                    , 2             , 1         , 3            , '2024-04-01'),
                            (N'Quy định về việc trang bị đẩy đủ bảo hộ lao động'                , 2             , 1         , 3            , '2024-04-01'),
                            (N'Bạn biết gì về nguyên lý 80/20'                                  , 4             , 1         , 5            , '2024-04-20'),
                            (N'5W1H và 5M1E là viết tắt của những từ gì?'                       , 4             , 2         , 5            , '2024-04-20'),
                            (N'Ứng dụng sơ đồ xương cá trong phân tích nguyên nnhân gốc rễ'     , 4             , 1         , 5            , '2024-04-20'),
                            (N'Mục tiêu chất lượng của công ty là gì?'                          , 3             , 1         , 4            , '2024-04-22'),
                            (N'Mục tiêu không tai nạn lao động trong 1 năm'                     , 3             , 2         , 1            , '2024-04-25'),
                            (N'Công ty đang sản xuất những mặt hàng nào'                        , 3             , 1         , 3            , '2024-04-26'),
                            (N'Các lỗi sản phẩm hay gặp trong sản xuất'                         , 3             , 2         , 3            , '2024-04-26');

USE Testing_System_Db;
INSERT INTO Answer          (`Content`      , QuestionID, isCorrect )
VALUES                      (N'Trả lời 20'  , 9         , 0         ),
                            (N'Trả lời 21'  , 10        , 1         ),
                            (N'Trả lời 22'  , 17        , 1         ),
                            (N'Trả lời 23'  , 18        , 1         ),
                            (N'Trả lời 24'  , 11        , 0         ),
                            (N'Trả lời 25'  , 10        , 1         ),
                            (N'Trả lời 26'  , 16        , 1         ),
                            (N'Trả lời 27'  , 11        , 0         ),
                            (N'Trả lời 28'  , 8         , 1         ),
                            (N'Trả lời 29'  , 8         , 0         ),
                            (N'Trả lời 30'  , 1         , 1         ),
                            (N'Trả lời 31'  , 1         , 1         ),
                            (N'Trả lời 32'  , 15        , 0         ),
                            (N'Trả lời 33'  , 3         , 0         ),
                            (N'Trả lời 34'  , 9         , 1         ),
                            (N'Trả lời 35'  , 5         , 0         ),
                            (N'Trả lời 36'  , 13        , 1         ),
                            (N'Trả lời 37'  , 18        , 1         ),
                            (N'Trả lời 38'  , 13        , 1         ),
                            (N'Trả lời 39'  , 9         , 0         ),
                            (N'Trả lời 40'  , 15        , 1         ),
                            (N'Trả lời 41'  , 1         , 0         );

USE Testing_System_Db;
INSERT INTO Exam            (`Code`         , Title                 , CategoryID, Duration  , CreatorID , CreateDate )
VALUES                      ('VTIQ005'      , N'Đề thi định kỳ 01'  , 2         , 60        , 2         ,'2024-04-05'),
                            ('VTIQ006'      , N'Đề thi An toàn 03'  , 1         , 60        , 1         ,'2024-04-06'),
                            ('VTIQ007'      , N'Đề thi Phân tích 01', 1         , 120       , 1         ,'2024-04-20'),
                            ('VTIQ008'      , N'Đề thi Mục tiêu'    , 2         , 60        , 2         ,'2024-04-25'),
                            ('VTIQ009'      , N'Đề thi Sản phẩm'    , 1         , 120       , 1         ,'2024-04-26'),
                            ('VTIQ010'      , N'Đề thi Phân tích 02', 2         , 60        , 2         ,'2024-04-27'),
                            ('VTIQ011'      , N'Đề thi định kỳ 02'  , 2         , 60        , 2         ,'2024-04-27');


USE Testing_System_Db;
INSERT INTO ExamQuestion    (ExamID , QuestionID)
VALUES                      (5      , 1         ),
                            (5      , 3         ),
                            (5      , 4         ),
                            (5      , 6         ),
                            (5      , 7         ),
                            (6      , 11        ),
                            (6      , 15        ),
                            (6      , 6         ),
                            (6      , 10        ),
                            (6      , 9         ),
                            (7      , 13        ),
                            (7      , 12        ),
                            (8      , 16        ),
                            (8      , 15        ),
                            (9      , 18        ),
                            (9      , 15        ),
                            (9      , 17        ),
                            (10     , 13        ),
                            (10     , 14        ),
                            (11     , 16        ),
                            (11     , 10        ),
                            (11     , 17        ),
                            (11     , 18        ),
                            (11     , 4         ),
                            (11     , 5         );


/*markdown
# Question 2. Truy vấn tất cả các phòng ban
*/

SELECT *
FROM department
ORDER BY `DepartmentID`;

/*markdown
# Question 3. Truy vấn ID của phòng Marketing
*/

-- Active: 1714660276272@@127.0.0.1@3306@testing_system_db
SELECT *
FROM department
WHERE `DepartmentName`='Marketing'

/*markdown
# Question 4. Truy vấn Account có full name dài nhất
*/

SELECT *, LENGTH(`FullName`)
FROM `account`
WHERE LENGTH(`FullName`) = (
                            SELECT MAX(LENGTH(`FullName`))
                            FROM `account`
                            );

/*markdown
# Question 5.Truy vấn Account có full name dài nhất và thuộc phòng ban có ID = 3
*/

SELECT  *, LENGTH(`FullName`)
FROM    `account`
WHERE   LENGTH(`FullName`) = (SELECT MAX(LENGTH(`FullName`)) FROM `account`)
AND     `DepartmentID` = 3;


/*markdown
# Question 6. Truy vấn tên Group đã tham gia trước ngày 11/03/2024
*/

SELECT  `GroupName`, `CreateDate`
FROM    `group`
WHERE   `CreateDate`< '2024-03-11';

/*markdown
# Question 7. Truy vấn ID của Question có >= 4 câu trả lời
*/

SELECT      `QuestionID`, COUNT(`AnswerID`) AS NUM_ASQW
FROM        answer
GROUP BY    `QuestionID`
ORDER BY    NUM_ASQW DESC
LIMIT       5;

SELECT      `QuestionID`, COUNT(`AnswerID`) AS NUM_ASQW
FROM        answer
GROUP BY    `QuestionID`
HAVING      COUNT(`AnswerID`) >= 4;

/*markdown
# Question 8. Truy vấn các mã đề thi có thời gian thi > 60 phút và được tạo trước ngày 05/04/2024
*/

-- Active: 1714660276272@@127.0.0.1@3306@testing_system_db
SELECT  *
FROM    exam
WHERE   `Duration` > 60 AND `CreateDate` < '2024-04-05';

/*markdown
# Question 9. Truy vấn 5 group được tạo gần đây nhất
*/

SELECT      *
FROM        `group`
ORDER BY    `CreateDate` DESC
LIMIT       5;

/*markdown
# Question 10. Truy vấn số nhân viên thuộc Department có ID = 2
*/

SELECT      `DepartmentID`, COUNT(`AccountID`)
FROM        `account`
GROUP BY    `DepartmentID`
HAVING      `DepartmentID` = 2;

/*markdown
# Question 11. Truy vấn Nhân viên có tên bắt đầu bằng "R" và kết thúc bằng "z"
*/

SELECT	*
From	`account`
WHERE	SUBSTRING_INDEX(FullName,' ',-1) LIKE 'R%z';

/*markdown
# Question 12. Xóa tất cả các Exam được tạo trước ngày 10/03/2023
*/

DELETE FROM     Exam
WHERE			`CreateDate` <= '2024-03-01';

/*markdown
# Question 13. Xóa tất cả các Question có nội dung bắt đầu bằng từ "Câu hỏi"
*/

DELETE  
FROM    Question
WHERE   SUBSTRING_INDEX(`Content`, ' ', 2) = 'Câu hỏi';

/*markdown
# Question 14. Update thông tin của Account có ID = 20 thành tên "Michael Fassbender" và email thành 'fassbender123@mmc.edu.vn'
*/

UPDATE  Account
SET     `FullName` = 'Michael Fassbender', `Email` = 'fassbender123@mmc.edu.vn'
WHERE   `AccountID` = 20;

/*markdown
# Question 15. Cập nhật Account có ID = 20 sẽ thuộc GroupID = 2
*/

UPDATE		`GroupAccount`
SET			GroupId = 2 
WHERE		AccountId = 20;
