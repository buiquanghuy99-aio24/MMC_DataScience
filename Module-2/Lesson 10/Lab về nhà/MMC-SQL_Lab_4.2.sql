/*
Exercise 1: Join
*/
-- Question 1. Truy vấn danh sách Nhân viên và Phòng ban của họ
SELECT  a.AccountID, a.FullName, d.*
FROM    account     AS  a
JOIN    department  AS  d
ON      d.DepartmentID = a.DepartmentID;

-- Question 2. Truy vấn thông tin các Account được tạo sau ngày 01/05/2024
SELECT  *
FROM    account
WHERE   CreateDate > '2024-05-01';

-- Question 3. Truy vấn tất cả các Engineer
SELECT  a.*, p.PositionName
FROM    account     AS a
JOIN    position    AS p
ON      p.PositionID = a.PositionID
WHERE   p.PositionName = 'Engineer';

-- Question 4. Truy vấn danh sách các Phòng ban có >4 Nhân viên
SELECT      a.DepartmentID, COUNT(a.AccountID), d.DepartmentName
FROM        account     AS a
JOIN        department  AS d
ON          d.DepartmentID = a.DepartmentID
GROUP BY    DepartmentID
HAVING      COUNT(a.AccountID) > 4;

-- Question 5. Truy vấn danh sách Câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT      e.QuestionID, q.Content, COUNT(e.ExamID) AS NUM_EXAM
FROM        examquestion    AS e
JOIN        question        AS q    ON  q.QuestionID = e.QuestionID
GROUP BY    e.QuestionID
HAVING      NUM_EXAM = (SELECT  MAX(NUM_EXAM)
                        FROM    (SELECT     QuestionID, COUNT(ExamID) AS NUM_EXAM
                                FROM        examquestion
                                GROUP BY    QuestionID) AS examquestion_count);

-- Question 6. Thống kê mỗi Category Question được sử dụng trong bao nhiêu Question
SELECT      q.CategoryID, c.CategoryName, COUNT(q.QuestionID)
FROM        question            AS q
LEFT JOIN   categoryquestion    AS c
ON          c.CategoryID = q.CategoryID
GROUP BY    q.CategoryID;

-- Question 7. Thống kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT      q.QuestionID, q.Content, COUNT(e.ExamID) AS NUM_EXAM
FROM        examquestion    AS e
LEFT JOIN   question        AS  q   ON  q.QuestionID = e.QuestionID
GROUP BY    q.QuestionID;

-- Question 8. Truy vấn Question có nhiều câu trả lời nhất
SELECT      a.QuestionID, q.Content, COUNT(AnswerID) AS ANSW_COUNT_COL
FROM        answer      AS a
LEFT JOIN   question    AS q
ON          q.QuestionID = a.QuestionID
GROUP BY    a.QuestionID
HAVING      ANSW_COUNT_COL = (SELECT  MAX(NUM_ANSW)
                            FROM    (SELECT     COUNT(AnswerID) AS NUM_ANSW
                                    FROM        answer
                                    GROUP BY    QuestionID) AS answer_count_table);

-- Question 9. Thống kê số lượng account trong mỗi Group
SELECT      ga.GroupID, g.GroupName, COUNT(ga.AccountID) 
FROM        GroupAccount AS ga
RIGHT JOIN  `Group`      AS g
ON          g.GroupId = ga.GroupID
GROUP BY    g.GroupID;

-- Question 10. Tìm chức vụ có ít người nhất
SELECT      a.PositionID, p.PositionName, COUNT(a.AccountID) AS COUNT_ACC_COL
FROM        `Account`    AS a
RIGHT JOIN  `Position`   AS p    ON  p.PositionID = a.PositionID
GROUP BY    p.PositionID
HAVING      COUNT_ACC_COL = (SELECT     MIN(COUNT_ACC_COL)
                            FROM        (SELECT     a.PositionID, COUNT(a.AccountID) AS COUNT_ACC_COL
                                        FROM        Account AS a
                                        GROUP BY    a.PositionID) AS count_acc_table);

-- Question 11. Thống kê mỗi phòng ban có những chức vụ nào và số lượng từng chức vụ là bao nhiêu
SELECT d.DepartmentName, p.PositionName, COUNT(a.AccountID) AS NumAccounts
FROM Account AS a
RIGHT JOIN Position AS p ON p.PositionID = a.PositionID
RIGHT JOIN Department AS d ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentName, p.PositionName
ORDER BY d.DepartmentID, p.PositionID;


-- Question 12. Lấy thông tin chi tiết của câu hỏi
SELECT      q.QuestionID, q.Content, cq.CategoryName AS Category, tq.TypeName AS Type, ac.FullName AS Creator, COUNT(DISTINCT eq.ExamID) AS NUM_EXAM, COUNT(DISTINCT an.AnswerID) AS NUM_ANSWER
FROM        question            AS q
LEFT JOIN   categoryquestion    AS cq   ON  cq.CategoryID   = q.CategoryID
LEFT JOIN   typequestion        AS tq   ON  tq.TypeID       = q.TypeID
LEFT JOIN   account             AS ac   ON  ac.AccountID    = q.CreatorID
LEFT JOIN   examquestion        AS eq   ON  eq.QuestionID   = q.QuestionID
LEFT JOIN   answer              AS an   ON  an.QuestionID   = q.QuestionID
GROUP BY    q.QuestionID;

-- Question 13. Truy vấn số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT      tq.TypeName, COUNT(q.QuestionID) AS NUM_Q
FROM        question        AS  q
LEFT JOIN   typequestion    AS tq   ON tq.TypeID = q.TypeID
GROUP BY    tq.TypeName;

-- Question 14. Truy vấn Group không có Account nào
SELECT      ga.GroupID, g.GroupName, COUNT(ga.AccountID) AS NUM_ACCOUNT_COL
FROM        GroupAccount AS ga
RIGHT JOIN  `Group`      AS g
ON          g.GroupId = ga.GroupID
GROUP BY    g.GroupID
HAVING      NUM_ACCOUNT_COL = 0;

-- Question 15. Truy vấn Question không có Answer nào
SELECT      q.QuestionID, q.Content, COUNT(a.AnswerID) AS ANSW_COUNT_COL
FROM        question    AS q
LEFT JOIN   answer      AS a
ON          a.QuestionID = q.QuestionID
GROUP BY    q.QuestionID
HAVING      ANSW_COUNT_COL = 0;

/* 
Exercise 2: Union
*/
-- Question 17 a. Lấy các Account thuộc nhóm thứ 1
SELECT  *
FROM    GroupAccount
WHERE   GroupID = 1;

-- Question 17 b. Lấy các Account thuộc nhóm thứ 2
SELECT  *
FROM    GroupAccount
WHERE   GroupID = 2;

-- Question 17 c. Ghép 2 kết quả từ câu a) và câu b) sao cho không có Record nào trùng nhau
(SELECT * FROM GroupAccount WHERE GroupID = 1)
UNION DISTINCT
(SELECT * FROM GroupAccount WHERE GroupID = 2);

-- Question 18 a. Lấy các Group có >5 thành viên
SELECT      GroupID, COUNT(AccountID) AS NUM_ACC
FROM        GroupAccount
GROUP BY    GroupID
HAVING      NUM_ACC > 5;

-- Question 18 b. Lấy các group có >7 thành viên
SELECT      GroupID, COUNT(AccountID) AS NUM_ACC
FROM        GroupAccount
GROUP BY    GroupID
HAVING      NUM_ACC > 7;

-- Question 18 c. Ghép 2 kết quả từ câu a) và câu b)
(SELECT      GroupID, COUNT(AccountID) AS NUM_ACC
FROM        GroupAccount
GROUP BY    GroupID
HAVING      NUM_ACC > 5)
UNION ALL
(SELECT      GroupID, COUNT(AccountID) AS NUM_ACC
FROM        GroupAccount
GROUP BY    GroupID
HAVING      NUM_ACC > 7);