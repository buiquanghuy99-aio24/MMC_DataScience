-- Active: 1714660276272@@127.0.0.1@3306@hr
USE hr;

SHOW TABLES;

/*markdown
# Question 1. Truy vấn tất cả các nhân viên có địa chỉ Elgin, IL
*/

SELECT *
FROM employees
WHERE `ADDRESS` LIKE '%Elgin,IL%';

/*markdown
# Question 2. Truy vấn tất cả nhân viên sinh vào những năm 1970
*/

SELECT *
FROM employees
WHERE `B_DATE` LIKE '%197%';

SELECT *
FROM employees
WHERE YEAR(`B_DATE`) >= 1970 AND YEAR(`B_DATE`) <= 1979;

/*markdown
# Question 3. Truy vấn tất cả nhân viên trong phòng ban 5 có mức lương từ 60000 đến 70000
*/

SELECT *
FROM employees
WHERE `DEP_ID`=5 AND `SALARY`>=60000 AND `SALARY`<=70000;

SELECT *
FROM employees
WHERE `DEP_ID`=5 AND (`SALARY` BETWEEN 60000 AND 70000);

/*markdown
# Question 4. Truy vấn danh sách nhân viên được sắp xếp
*/

/*markdown
## Quesiton 4A. Sắp xếp theo ID phòng ban
*/

SELECT *
FROM employees
ORDER BY `DEP_ID`;

/*markdown
## Question 4B. Sắp xếp theo ID phòng ban theo thứ tự giảm dần, trong mỗi phòng ban các nhân viên cũng được sắp xếp theo họ với thứ tự giảm dần bảng chữ cái
*/

SELECT *
FROM employees
ORDER BY `DEP_ID` DESC, `L_NAME` DESC;

/*markdown
# Question 5. Truy vấn số lượng nhân viên theo phòng ban
*/

/*markdown
## Question 5A. Truy vấn số lượng nhân viên trong phòng ban đối với mỗi ID phòng ban
*/

SELECT `DEP_ID`, COUNT(*)
FROM employees
GROUP BY `DEP_ID`;

/*markdown
## Question 5B. Truy vẫn số lượng nhân viên và mức lương trung bình của nhân viên đối với mỗi ID phòng ban
*/

SELECT `DEP_ID`, COUNT(*), AVG(`SALARY`)
FROM employees
GROUP BY `DEP_ID`;

/*markdown
## Question 5C. Gán nhãn các cột đã tính trong tập hợp kết quả của câu trên là NUM_EMPLOYEES và AVG_SALARY
*/

SELECT `DEP_ID`, COUNT(*) AS NUM_EMPLOYEES, AVG(`SALARY`) AS AVG_SALARY
FROM employees
GROUP BY `DEP_ID`;

/*markdown
## Question 5D. Sắp xếp tập hợp kết quả câu trên theo Mức lương trung bình
*/

SELECT `DEP_ID`, COUNT(*) AS NUM_EMPLOYEES, AVG(`SALARY`) AS AVG_SALARY
FROM employees
GROUP BY `DEP_ID`
ORDER BY AVG_SALARY;

/*markdown
## Question 5E. Giới hạn kết quả thànhtrên với chỉ ít hơn 4 nhân viên cho các phòng ban
*/

SELECT `DEP_ID`, COUNT(*) AS NUM_EMPLOYEES, AVG(`SALARY`) AS AVG_SALARY
FROM employees
GROUP BY `DEP_ID`
HAVING COUNT(*) < 4
ORDER BY AVG_SALARY;