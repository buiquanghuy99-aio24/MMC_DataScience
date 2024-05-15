-- Question 1. Truy vấn tên và ngày bắt đầu công việc của tất cả nhân viên làm việc trong phòng ban số 5
SELECT      e.F_NAME, e.L_NAME, jh.START_DATE
FROM        employees   AS e
INNER JOIN  job_history AS jh
ON          jh.EMPL_ID = e.EMP_ID
WHERE       e.DEP_ID = 5;

-- Question 2. Truy vấn tên, ngày bắt đầu công việc và tên công việc của tất cả nhân viên làm việc trong phòng ban số 5
%%sql
SELECT      e.F_NAME, e.L_NAME, jh.START_DATE, j.JOB_TITLE
FROM        employees   AS e
INNER JOIN  job_history AS jh ON jh.EMPL_ID = e.EMP_ID
INNER JOIN  jobs        AS j  ON j.JOB_IDENT = jh.JOBS_ID
WHERE       e.DEP_ID = 5;

-- Question 3. Left (Outer) Join trên các bảng [EMPLOYEES, DEPARTMENTS] và Chọn [id nhân viên, họ, id phòng ban, tên phòng ban] cho tất cả Nhân viên
SELECT          e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME
FROM            employees   AS e
LEFT OUTER JOIN departments AS d
ON              d.DEPT_ID_DEP = e.DEP_ID;

-- Question 4. Viết lại truy vấn trước đó nhưng giới hạn tập kết quả chỉ có các hàng dành cho nhân viên sinh trước năm 1980
SELECT          e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME, e.B_DATE
FROM            employees   AS e
LEFT OUTER JOIN departments AS d
ON              d.DEPT_ID_DEP = e.DEP_ID
WHERE           YEAR(e.B_DATE) < 1980;

-- Question 5. Viết lại truy vấn trước đó sử dụng INNER JOIN
SELECT          e.EMP_ID, e.L_NAME, e.DEP_ID, d.DEP_NAME, e.B_DATE
FROM            employees   AS e
INNER JOIN      departments AS d
ON              d.DEPT_ID_DEP = e.DEP_ID
WHERE           YEAR(e.B_DATE) < 1980;

-- Question 6. FULL OUTER JOIN trên bảng [EMPLOYEES, DEPARTMENTS] và Chọn [tên, họ nhân viên, tên phòng ban] của tất cả nhân viên
SELECT          e.F_NAME, e.L_NAME, d.DEP_NAME
FROM            employees   AS e
LEFT JOIN       departments AS d    ON  d.DEPT_ID_DEP = e.DEP_ID
UNION ALL
SELECT          e.F_NAME, e.L_NAME, d.DEP_NAME
FROM            employees   AS e
RIGHT JOIN      departments AS d    ON  d.DEPT_ID_DEP = e.DEP_ID;

-- # Question 7. Viết lại truy vấn trước đó nhưng có tập kết quả bao gồm tất cả Tên nhân viên nhưng [id phòng ban, tên phòng ban] chỉ dành cho nhân viên Nam
SELECT          e.F_NAME, e.L_NAME, d.DEP_NAME
FROM            employees   AS e
LEFT JOIN       departments AS d    ON  d.DEPT_ID_DEP = e.DEP_ID    AND e.SEX='M'
UNION ALL
SELECT          e.F_NAME, e.L_NAME, d.DEP_NAME
FROM            employees   AS e
RIGHT JOIN      departments AS d    ON  d.DEPT_ID_DEP = e.DEP_ID    AND e.SEX='M';