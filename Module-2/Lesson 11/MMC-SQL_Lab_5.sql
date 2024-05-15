-- Question 1. Tạo view có chứa danh sách nhân viên thuộc phòng Engineering
CREATE VIEW     ENG_DEPT_VIEW AS
SELECT          a.AccountID, a.FullName, d.DepartmentName
FROM            account     AS  a
LEFT JOIN       department  AS  d   ON  d.DepartmentID = a.DepartmentID
WHERE           d.DepartmentName = 'Engineering';

-- Question 2. Tạo View có chứa thông tin các Account tham gia vào nhiều Group nhất
CREATE VIEW     MOST_JOINING_ACC AS
SELECT          AccountID, COUNT(GroupID) AS NUM_GROUP
FROM            GroupAccount
GROUP BY        AccountID
HAVING          NUM_GROUP = (SELECT  MAX(NUM_GROUP)
                        FROM    (SELECT      AccountID, COUNT(GroupID) AS NUM_GROUP
                                FROM        GroupAccount
                                GROUP BY    AccountID) AS count_group_table);


-- Question 3. Tạo View có chứa Câu hỏi có Content dài hơn 70 và xóa nó đi
CREATE VIEW     LONG_QUESTION AS
SELECT          QuestionID, Content, LENGTH(Content) AS LEN_CONTENT
FROM            question
WHERE           LENGTH(Content) > 70;

-- Question 4. Tạo View có chứa danh sách các Phòng ban có nhiều Nhân viên nhất
CREATE VIEW most_acc_dept AS
SELECT      a.DepartmentID, d.DepartmentName, COUNT(a.AccountID) NUM_ACC
FROM        Account     AS a
LEFT JOIN   Department  AS d    ON d.DepartmentID = a.DepartmentID
GROUP BY    a.DepartmentID
HAVING      NUM_ACC =   (SELECT     MAX(NUM_ACC)
                        FROM        (SELECT     COUNT(AccountID) as NUM_ACC
                                    FROM        Account
                                    GROUP BY    DepartmentID) AS COUNT_ACC_DEPT);

-- Question 5. Tạo View có chứa tất các các Câu hỏi do User họ Brown tạo ra
CREATE VIEW Brown_questions AS
SELECT      q.QuestionID, q.Content, q.CreatorID, a.FullName
FROM        Question    AS q
LEFT JOIN   Account     AS a    ON a.AccountID = q.CreatorID
WHERE       SUBSTRING_INDEX(a.FullName,' ',-1) = 'Brown';