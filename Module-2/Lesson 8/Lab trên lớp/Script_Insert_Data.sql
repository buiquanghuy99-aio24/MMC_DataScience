USE hr;

INSERT INTO employees   (EMP_ID     ,   F_NAME      ,   L_NAME      ,   SSN         ,   B_DATE          ,   SEX     ,   `ADDRESS`                           ,   JOB_ID      ,   SALARY    ,   MANAGER_ID    ,   DEP_ID  )
VALUES 		            ("E1001"	,   "John"      ,   "Thomas"    ,	123456      ,   "1976-01-09"	,   "M"	    ,   "5631 Rice, OakPark,IL"	            ,   100         ,	100000      ,	30001       ,	2       ),
                        ("E1002"	,   "Alice"     ,	"James"	    ,   123457	    ,   "1972-07-31"	,   "F"	    ,   "980 Berry ln, Elgin,IL"	        ,   200         ,	80000       ,	30002	    ,   5       ),
                        ("E1003"	,   "Steve"     ,	"Wells"	    ,   123458	    ,   "1980-08-10"	,   "M"	    ,   "291 Springs, Gary,IL"	            ,   300         ,	50000       ,	30002	    ,   5       ),
                        ("E1004"	,   "Santosh"   ,   "Kumar"	    ,   123459	    ,   "1985-07-20"	,   "M"	    ,   "511 Aurora Av, Aurora,IL"	        ,   400         ,	60000       ,	30004	    ,   5       ),
                        ("E1005"	,   "Ahmed"     ,   "Hussain"	,   123410	    ,   "1981-01-04"	,   "M"	    ,   "216 Oak Tree, Geneva,IL"	        ,   500         ,	70000       ,	30001	    ,   2       ),
                        ("E1006"	,   "Nancy"     ,   "Allen"	    ,   123411	    ,   "1978-02-06"	,   "F"	    ,   "111 Green Pl, Elgin,IL"	        ,   600         ,	90000       ,	30001	    ,   2       ),
                        ("E1007"	,   "Mary"      ,   "Thomas"	,   123412	    ,   "1975-05-05"	,   "F"	    ,   "100 Rose Pl, Gary,IL"	            ,   650         ,	65000       ,	30003	    ,   7       ),
                        ("E1008"	,   "Bharath"   ,   "Gupta"	    ,   123413      ,   "1985-05-06"	,   "M"	    ,   "145 Berry Ln, Naperville,IL"       ,	660         ,	65000       ,	30003	    ,   7       ),
                        ("E1009"	,   "Andrea"    ,   "Jones"	    ,   123414      ,   "1990-07-09"	,   "F"	    ,   "120 Fall Creek, Gary,IL"	        ,   234         ,	70000       ,	30003	    ,   7       ),
                        ("E1010"	,   "Ann"       ,   "Jacob"	    ,   123415	    ,   "1982-03-30"	,   "F"	    ,   "111 Britany Springs,Elgin,IL"      ,	220         ,	70000       ,	30004	    ,   5       ),
                        ('E1011'    ,   'Amanda'    ,   'Gusmao'    ,   123456      ,   '1985-01-09'    ,   'F'     ,   '1157 Paulista, Tutoia SP'          ,   760         ,   150000      ,   30004       ,   8       ),
                        ('E1012'    ,   'Vanessa'   ,   'Silva'     ,   123457      ,   '1982-07-31'    ,   'F'     ,   '1157 Paulista, Tutoia SP'          ,   720         ,   90000       ,   30004       ,   8       ),
                        ('E1013'    ,   'Khusia'    ,   'Ibshia'    ,   123458      ,   '1980-08-10'    ,   'M'     ,   '122005 Bandhwari,GwalPahari,ND'    ,   600         ,   100000      ,   30005       ,   9       ),
                        ('E1014'    ,   'Santosh'   ,   'Zhash'     ,   123459      ,   '1988-04-20'    ,   'M'     ,   '122005 Bandhwari,GwalPahari,ND'    ,   600         ,   100000      ,   30005       ,   9       ),
                        ('E1015'    ,   'Jorge'     ,   'Paulo'     ,   123410      ,   '1981-01-04'    ,   'M'     ,   '1157 Paulista Tutoia SP'           ,   500         ,   70000       ,   30001       ,   8       ),
                        ('E1016'    ,   'Clary'     ,   'Allen'     ,   123411      ,   '1978-02-08'    ,   'F'     ,   '111 Green Pl, Elgin, IL'           ,   600         ,   90000       ,   30001       ,   2       ),
                        ('E1017'    ,   'Amanda'    ,   'Thomas'    ,   123412      ,   '1975-05-05'    ,   'F'     ,   '100 Rose Pl, Gary, IL'             ,   650         ,   65000       ,   30003       ,   7       ),
                        ('E1018'    ,   'John '     ,   'Harry'     ,   123413      ,   '1985-05-06'    ,   'M'     ,   '145 Berry Ln, Naperville, IL'      ,   660         ,   65000       ,   30003       ,   7       ),
                        ('E1019'    ,   'Andrea'    ,   'Maria'     ,   123414      ,   '1990-09-09'    ,   'F'     ,   '120 Ruaa do Porto Lisboa, PT'      ,   780         ,   70000       ,   30003       ,   10      ),
                        ('E1020'    ,   'Roberta'   ,   'Lima'      ,   123415      ,   '1982-01-30'    ,   'F'     ,   '120 Rua do Porto Lisboa,   PT'     ,   780         ,   70000       ,   30004       ,   10      ),
                        ('E1021'    ,   'Mauricio'  ,   'Helfstein' ,   123414      ,   '1994-09-09'    ,   'M'     ,   '120 Rua do Brás, SP'               ,   300         ,   70000       ,   30003       ,   8       ),
                        ('E1022'    ,   'Lucas'     ,   'Roberto'   ,   123415      ,   '1995-01-30'    ,   'M'     ,   '120 Rua da Mooca, SP'              ,   400         ,   70000       ,   30004       ,   8       );

INSERT INTO job_history (EMPL_ID    ,   START_DATE      ,   JOBS_ID   ,     DEPT_ID )
VALUES                  ("E1001"    ,   "2000-08-01"    ,   100       ,     2       ),
                        ("E1002"    ,   "2001-08-01"    ,   200       ,     5       ),
                        ("E1003"    ,   "2001-08-16"    ,   300       ,     5       ),
                        ("E1004"    ,   "2000-08-16"    ,   400       ,     5       ),
                        ("E1005"    ,   "2000-05-30"    ,   500       ,     2       ),
                        ("E1006"    ,   "2001-08-16"    ,   600       ,     2       ),
                        ("E1007"    ,   "2002-05-30"    ,   650       ,     7       ),
                        ("E1008"    ,   "2010-05-06"    ,   660       ,     7       ),
                        ("E1009"    ,   "2016-08-16"    ,   234       ,     7       ),
                        ("E1010"    ,   "2016-08-16"    ,   220       ,     5       ),
                        ('E1011'    ,   '2000-08-01'    ,   760       ,     8       ),
                        ('E1012'    ,   '2001-08-01'    ,   720       ,     8       ),
                        ('E1013'    ,   '2001-08-16'    ,   720       ,     9       ),
                        ('E1014'    ,   '2000-08-16'    ,   720       ,     9       ),
                        ('E1015'    ,   '2000-05-30'    ,   500       ,     8       ),
                        ('E1016'    ,   '2001-08-16'    ,   600       ,     2       ),
                        ('E1017'    ,   '2002-05-30'    ,   650       ,     7       ),
                        ('E1018'    ,   '2010-05-06'    ,   700       ,     7       ),
                        ('E1019'    ,   '2016-08-16'    ,   780       ,     10      ),
                        ('E1020'    ,   '2016-08-16'    ,   780       ,     8       );

INSERT INTO jobs        (JOB_IDENT  ,   JOB_TITLE               ,   MIN_SALARY  ,    MAX_SALARY )
VALUES                  (100        ,   "Sr. Architect"         ,   60000       ,   100000      ),
                        (200        ,   "Sr. Software Developer",   60000       ,   80000       ),
                        (300        ,   "Jr.Software Developer" ,   40000       ,   60000       ),
                        (400        ,   "Jr.Software Developer" ,   40000       ,   60000       ),
                        (500        ,   "Jr. Architect"         ,   50000       ,   70000       ),
                        (600        ,   "Lead Architect"        ,   70000       ,   100000      ),
                        (650        ,   "Jr. Designer"          ,   60000       ,   70000       ),
                        (660        ,   "Jr. Designer"          ,   60000       ,   70000       ),
                        (234        ,   "Sr. Designer"          ,   70000       ,   90000       ),
                        (220        ,   "Sr. Designer"          ,   70000       ,   90000       ),
                        (700        ,   'Scrum Master'          ,   60000       ,    70000      ),
                        (720        ,   'PMO'                   ,   90000       ,    150000     ),
                        (760        ,   'PE'                    ,   100000      ,    200000     ),
                        (780        ,   'UX Designer'           ,   70000       ,    90000      );

INSERT INTO departments (DEPT_ID_DEP,   DEP_NAME            ,   MANAGER_ID  ,   LOC_ID  )
VALUES                  (2          ,   "Architect Group"   ,   30001       ,   L0001   )
                        (5          ,   "Software Group"    ,   30002       ,   L0002   )
                        (7          ,   "Design Team"       ,   30003       ,   L0003   )
                        (5          ,   "Software Group"    ,   30004       ,   L0004   )
                        (8          ,   'Software Group'    ,   30004       ,   'L0005' ),
                        (9          ,   'Architect Group'   ,   30005       ,   'L0006' ),
                        (10         ,   'Design Team'       ,   30006       ,   'L0007' );

INSERT INTO locations   (LOCT_ID    ,   DEP_ID_LOC  )
VALUES                  ("L0001"    ,   2           ),
                        ("L0002"    ,   5           ),
                        ("L0003"    ,   7           ),
                        ('L0004'    ,   8           ),
                        ('L0005'    ,   9           ),
                        ('L0006'    ,   10          );
