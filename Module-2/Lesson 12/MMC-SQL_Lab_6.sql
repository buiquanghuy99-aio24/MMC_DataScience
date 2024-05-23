-- Active: 1714660276272@@127.0.0.1@3306@testing_system_db
USE testing_system_db;
-- Question 1. Question 1. Tạo store để User nhập vào tên Phòng ban và in ra tất cả các Account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS sp_GetAccountFromDept;
DELIMITER $$
CREATE PROCEDURE sp_GetAccountFromDept(
    IN in_dept_name VARCHAR(50)
)
BEGIN
    SELECT  a.*
    FROM    `Account`   AS a
    JOIN    department  AS d
    ON      d.DepartmentID = a.DepartmentID
    WHERE   d.DepartmentName = in_dept_name;
END $$
DELIMITER ;

CALL sp_GetAccountFromDept('Engineering');

%%sql
DROP    PROCEDURE IF EXISTS sp_CountAccountsInGroups;
DELIMITER $$
CREATE  PROCEDURE           sp_CountAccountsInGroups()
BEGIN
    SELECT      g.GroupID, g.groupName, COUNT(ga.AccountID) AS NUM_ACCOUNT
    FROM        GroupAccount    AS  ga
    RIGHT JOIN  `Group`         AS  g   ON  g.GroupID = ga.GroupID
    GROUP BY    g.GroupName
    ORDER BY    NUM_ACCOUNT;
END $$
DELIMITER ;

CALL sp_CountAccountsInGroups();

-- Question 3: Tạo Store để thống kê mỗi Type question có bao nhiêu Question được tạo trong tháng hiện tại
DROP    PROCEDURE IF EXISTS sp_CountQuestionByTypeAndCurrentMonth;
DELIMITER $$
CREATE  PROCEDURE           sp_CountQuestionByTypeAndCurrentMonth()
BEGIN
        DECLARE     current_year    INT;
        DECLARE     current_month   INT;

        SET         current_year    = YEAR(NOW());
        SET         current_month   = MONTH(NOW());

        SELECT      tq.TypeName, COUNT(q.QuestionID)
        FROM        Question        AS q
        RIGHT JOIN  TypeQuestion    AS tq   ON tq.TypeID = q.TypeID
        WHERE       YEAR(q.CreateDate)  = current_year
        AND         MONTH(q.CreateDate) = current_month 
        GROUP BY    tq.TypeName;
END $$
DELIMITER ;

-- Question 4: Tạo Store để trả ra Id của Type question có nhiều Câu hỏi nhất
DROP    PROCEDURE IF EXISTS sp_GetTypeIdWithMostQuestions;
DELIMITER $$
CREATE  PROCEDURE           sp_GetTypeIdWithMostQuestions()
BEGIN   
        DECLARE v_MaxQuestionCount      INT;
        DECLARE v_TypeIDWithMaxQuestion INT;

        SELECT      MAX(NUM_Q)  INTO v_MaxQuestionCount
        FROM        (
                    SELECT      COUNT(q.QuestionID) AS NUM_Q
                    FROM        Question            AS q
                    RIGHT JOIN  TypeQuestion        AS tq   ON tq.TypeID = q.TypeID
                    GROUP BY    tq.TypeName
                    ) AS CountQuestion;
        
        SELECT      tq.TypeID   INTO v_TypeIDWithMaxQuestion
        FROM        Question        AS q
        RIGHT JOIN  TypeQuestion    AS tq   ON tq.TypeID = q.TypeID
        GROUP BY    tq.TypeName
        HAVING      COUNT(q.QuestionID) = v_MaxQuestionCount;

        SELECT      v_TypeIDWithMaxQuestion;
END $$
DELIMITER ;

-- Question 5: Sử dụng Store ở Question-4 để tìm ra tên của Type question
DROP    PROCEDURE IF EXISTS sp_GetTypeIdWithMostQuestions;
DELIMITER $$
CREATE  PROCEDURE           sp_GetTypeIdWithMostQuestions(OUT v_TypeIDWithMaxQuestion INT)
BEGIN   
        DECLARE v_MaxQuestionCount      INT;

        SELECT      MAX(NUM_Q)  INTO v_MaxQuestionCount
        FROM        (
                    SELECT      COUNT(q.QuestionID) AS NUM_Q
                    FROM        Question            AS q
                    RIGHT JOIN  TypeQuestion        AS tq   ON tq.TypeID = q.TypeID
                    GROUP BY    tq.TypeName
                    ) AS CountQuestion;
        
        SELECT      tq.TypeID   INTO v_TypeIDWithMaxQuestion
        FROM        Question        AS q
        RIGHT JOIN  TypeQuestion    AS tq   ON tq.TypeID = q.TypeID
        GROUP BY    tq.TypeName
        HAVING      COUNT(q.QuestionID) = v_MaxQuestionCount;
END $$
DELIMITER ;

CALL sp_GetTypeIdWithMostQuestions(@TypeID);
SELECT  TypeName
FROM    TypeQuestion
WHERE   TypeID = @TypeID;

-- Question 6. Viết 1 Store cho phép User nhập vào 1 chuỗi và trả về Group có tên chứa chuỗi đó hoặc trả về User có Username chứa chuỗi đó
DROP    PROCEDURE   IF EXISTS   sp_SearchGroupOrUser2;
DELIMITER $$
CREATE  PROCEDURE               sp_SearchGroupOrUser2(IN search_string NVARCHAR(255))
BEGIN
    SELECT 'Group' AS ResultType, g.GroupName, g.GroupID, NULL AS AccountID, NULL AS Username 
    FROM `Group` AS g 
    WHERE g.GroupName LIKE CONCAT('%', 'ma', '%')

    UNION ALL

    SELECT 'User' AS ResultType, NULL AS GroupName, NULL AS GroupID, a.AccountID, a.Username
    FROM `Account` AS a 
    WHERE a.Username LIKE CONCAT('%', 'ma', '%');
    
    IF ROW_COUNT() = 0 THEN
        SELECT 'No match found' AS ResultType, NULL AS Name, NULL AS ID, NULL AS AccountID, NULL AS Username;
    END IF;
END $$
DELIMITER ;

-- Question 7. Viết 1 Store cho phép User nhập vào thông tin FullName, Email.
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là Operator
-- departmentID: sẽ được cho vào 1 phòng chờ
-- In ra kết quả tạo thành công
%%sql
DROP    PROCEDURE IF EXISTS sp_CreateAccount2;
DELIMITER $$
CREATE  PROCEDURE           sp_CreateAccount2(
        IN  p_FullName      NVARCHAR(50),
        IN  p_Email         VARCHAR(50)
)
BEGIN
    DECLARE v_Username      VARCHAR(50);
    DECLARE v_PositionID    TINYINT UNSIGNED;
    DECLARE v_PendingDepartmentID TINYINT UNSIGNED;
    DECLARE v_AccountID INT;

    SET     v_Username  = SUBSTRING_INDEX(p_Email, '@', 1);

    INSERT INTO Department (DepartmentName)
    SELECT 'Phòng chờ'
    FROM dual
    WHERE NOT EXISTS (
        SELECT 1
        FROM Department
        WHERE DepartmentName = 'Phòng chờ'
    );

    SELECT DepartmentID INTO v_PendingDepartmentID
    FROM `Department`
    WHERE DepartmentName = 'Phòng chờ';

    SELECT  PositionID INTO v_PositionID
    FROM    `Position`
    WHERE   PositionName = 'Operator';

    INSERT INTO `Account` (Email    , Username  , FullName  , DepartmentID          , PositionID    , CreateDate)
    VALUES                (p_Email  , v_Username, p_FullName, v_PendingDepartmentID , v_PositionID  , NOW()     );

    SELECT LAST_INSERT_ID() INTO v_AccountID;
    SELECT  *
    FROM    `Account`
    WHERE   AccountID = v_AccountID;
END $$
DELIMITER ;

-- Question 8. Viết 1 Store cho phép User nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi nào có content dài nhất
DROP    PROCEDURE IF EXISTS sp_LongestQuestionByType;
DELIMITER $$
CREATE  PROCEDURE           sp_LongestQuestionByType(IN search_type NVARCHAR(50))
BEGIN
    DECLARE v_max_len_question    INT;
    DECLARE v_result_question     NVARCHAR(255);

    SELECT  MAX(LEN_CONTENT) INTO v_max_len_question
    FROM    (SELECT     LENGTH(q.Content) AS LEN_CONTENT
            FROM        Question        AS q
            RIGHT JOIN  TypeQuestion    AS tq   ON tq.TypeID = q.TypeID
            WHERE       tq.TypeName = search_type
            ORDER BY    LEN_CONTENT DESC
            ) AS LengthQuestion;
    
    SELECT      q.Content INTO v_result_question
    FROM        Question        AS q
    RIGHT JOIN  TypeQuestion    AS tq   ON tq.TypeID = q.TypeID
    WHERE       tq.TypeName         = search_type
    AND         LENGTH(q.Content)   = v_max_len_question;

    SELECT v_result_question;
END $$
DELIMITER ;

-- Question 9: Viết 1 Store cho phép User xóa Exam dựa vào ID
DROP    PROCEDURE IF EXISTS sp_DeleteExamByID;
DELIMITER $$
CREATE  PROCEDURE           sp_DeleteExamByID(
    IN  p_ExamID TINYINT UNSIGNED
)
BEGIN
    IF EXISTS (
                SELECT  1
                FROM    Exam
                WHERE   ExamID = p_ExamID
                ) 
        THEN
        DELETE
        FROM    Exam
        WHERE   ExamID = p_ExamID;

        SELECT CONCAT('Exam with ID ', p_ExamID, ' has been deleted!')   AS MESSAGE;
    ELSE
        SELECT CONCAT('No Exam found with ID ', p_ExamID)                AS MESSAGE;
    END IF;
END $$
DELIMITER ;

-- Question 9: Viết 1 Store cho phép User xóa Exam dựa vào ID
DROP    PROCEDURE IF EXISTS sp_DeleteExamByID;
DELIMITER $$
CREATE  PROCEDURE           sp_DeleteExamByID(
    IN  p_ExamID TINYINT UNSIGNED
)
BEGIN
    IF EXISTS (
                SELECT  1
                FROM    Exam
                WHERE   ExamID = p_ExamID
                ) 
        THEN
        DELETE
        FROM    Exam
        WHERE   ExamID = p_ExamID;

        SELECT CONCAT('Exam with ID ', p_ExamID, ' has been deleted!')   AS MESSAGE;
    ELSE
        SELECT CONCAT('No Exam found with ID ', p_ExamID)                AS MESSAGE;
    END IF;
END $$
DELIMITER ;

-- Question 10: 

-- Question 11: Viết Store cho phép User xóa Phòng ban bằng cách nhập vào tên Phòng ban. Các Account thuộc phòng ban đã bị xóa sẽ được chuyển về phòng ban default là phòng ban chờ việc
DROP    PROCEDURE   IF EXISTS   sp_DeleteDeptByName;
DELIMITER $$
CREATE  PROCEDURE               sp_DeleteDeptByName(
    IN      p_DeptName          NVARCHAR(50)
)
BEGIN
    DECLARE v_RemoveFromDeptID  TINYINT UNSIGNED;
    DECLARE v_MovetoDeptID      TINYINT UNSIGNED;

    SELECT  DepartmentID    INTO v_RemoveFromDeptID
    FROM    Department
    WHERE   DepartmentName = p_DeptName;

    INSERT INTO Department (DepartmentName)
    SELECT 'Phòng chờ'
    FROM    dual
    WHERE NOT EXISTS (
        SELECT  1
        FROM    Department
        WHERE   DepartmentName = 'Phòng chờ'
        );
    
    SELECT  DepartmentID    INTO v_MovetoDeptID
    FROM    Department
    WHERE   DepartmentName = 'Phòng chờ';

    IF  v_RemoveFromDeptID IS NOT NULL THEN
        UPDATE  Account
        SET     DepartmentID    = v_MovetoDeptID
        WHERE   DepartmentID    = v_RemoveFromDeptID;

        DELETE
        FROM    Department
        WHERE   DepartmentID    = v_RemoveFromDeptID;

        SELECT  CONCAT('Department ', p_DeptName, ' has been deleted!') AS MESSAGE;
    ELSE
        SELECT  CONCAT('Department ', p_DeptName, ' does not exist!')   AS MESSAGE;
    END IF;
END $$
DELIMITER ;

-- Question 12. Viết Store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
DROP    PROCEDURE IF EXISTS sp_CountQuestionByMonth;
DELIMITER $$
CREATE  PROCEDURE           sp_CountQuestionByMonth()
BEGIN
    SELECT      MONTH(CreateDate) AS MONTH, COUNT(QuestionID) AS NUM_QUESTION
    FROM        Question
    WHERE       YEAR(CreateDate) = YEAR(CURRENT_DATE())
    GROUP BY    MONTH;
END $$
DELIMITER ;

-- Question 13. Viết Store để in ra Mỗi tháng có bao nhiêu Câu hỏi được tạo trong 6 tháng gần đây nhất (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
DROP PROCEDURE IF EXISTS sp_CountQuestionLastSixMonths;
DELIMITER $$
CREATE PROCEDURE         sp_CountQuestionLastSixMonths()     
BEGIN
    DECLARE v_Count INT DEFAULT 0;
    DECLARE v_Month INT;

    DROP    TEMPORARY TABLE IF EXISTS   temp_LastSixMonths;
    CREATE  TEMPORARY TABLE             temp_LastSixMonths(
        Month INT
    );

    WHILE v_Count < 6 DO
        SET     v_Month = MONTH(DATE_SUB(NOW(), INTERVAL v_Count MONTH));
        INSERT  INTO temp_LastSixMonths (Month) 
        VALUES                          (v_Month);
        SET     v_Count = v_Count + 1;
    END WHILE;

    SELECT      t.Month AS MONTH,
                CASE
                    WHEN COUNT(q.QuestionID) = 0 THEN 'Không có câu hỏi nào trong tháng'
                    ELSE COUNT(q.QuestionID)
                END AS NUM_QUESTION
    FROM        temp_LastSixMonths  AS  t
    LEFT JOIN   Question            AS  q ON MONTH(q.CreateDate) = t.Month
    AND         q.CreateDate > DATE_SUB(NOW(), INTERVAL 6 MONTH) 
    AND         q.CreateDate <= NOW()
    GROUP BY    t.Month;
END $$
DELIMITER ;