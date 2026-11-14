--TASK1
 
SELECT FIRST_NAME,LAST_NAME, HIRE_DATE,
       CASE WHEN HIRE_DATE < TO_DATE('2003-01-01','YYYY-MM-DD') THEN 'Veteran'
            WHEN HIRE_DATE BETWEEN TO_DATE ('2003-01-01','YYYY-MM-DD')
                                AND TO_DATE('2006-12-31','YYYY-MM-DD') THEN 'Tecrubeli'
            ELSE  'Yeni'
        END AS STAJ_QRUPU
FROM HR.EMPLOYEES

--TASK2

SELECT DEPARTMENT_ID,DEPARTMENT_NAME,
        CASE DEPARTMENT_NAME
            WHEN 'Administration' THEN 'Idareetme'
            WHEN 'Marketing' THEN 'Marketing'
            WHEN 'Purchasing' THEN 'Satinalma'
            WHEN 'Human Resources' THEN 'Insan Resurslari'
            ELSE 'Diger Sobe'
        END AS SOBE_AZ
FROM HR.DEPARTMENTS;

--TASK3

SELECT FIRST_NAME, DEPARTMENT_ID, 
        CASE WHEN DEPARTMENT_ID IS NULL THEN 'Sobe teyin olunmayib'
            ELSE 'Sobe var'
        END AS SOBE_STATUSU
FROM HR.EMPLOYEES;
            
SELECT FIRST_NAME, DEPARTMENT_ID,
        NVL2(DEPARTMENT_ID,'Sobe var','Sobe teyin olunmayib') AS SOBE_STATUSU
FROM HR.EMPLOYEES;

--TASK4

SELECT JOB_ID , JOB_TITLE, 
        CASE WHEN JOB_ID IN ('AS_PRES','AD_VP','FI_MGR','AC_MGR') THEN 'Ali Rehberlik'
             WHEN JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT') THEN 'Esas Mutexessis'
             WHEN JOB_ID IN ('ST_CLERK', 'SH_CLERK', 'PU_CLERK') THEN 'Operativ Isci'
             ELSE 'Diger'
        END AS KATEQORIYA
FROM HR.JOBS;

--TASK5

SELECT FIRST_NAME, DEPARTMENT_ID, SALARY, 
        CASE DEPARTMENT_ID
            WHEN 50 THEN SALARY * 0.08 
            WHEN 30 THEN SALARY * 0.12
            WHEN 100 THEN 400
            ELSE SALARY * 0.04
        END AS MUAVINET
FROM HR.EMPLOYEES;

--TASK6

SELECT FIRST_NAME, COMMISSION_PCT,
       CASE
           WHEN COMMISSION_PCT = NULL  THEN 'Yoxdur'
           WHEN COMMISSION_PCT > 0.10  THEN 'Normal komissiya'
           WHEN COMMISSION_PCT > 0.25  THEN 'Yuksek komissiya'
           ELSE 0
       END AS 'Komissiya novu'
FROM HR.EMPLOYEES;


SELECT FIRST_NAME, COMMISSION_PCT,
       CASE
           WHEN COMMISSION_PCT IS NULL  THEN 'Yoxdur'
           WHEN COMMISSION_PCT > 0.25  THEN 'Yuksek komissiya'
           ELSE  'Normal komissiya'
       END AS "Komissiya novu"
FROM HR.EMPLOYEES;

--SEHVLER
--1 COMMISSION_PCT = NULL YOX IS NULL OLMALIDI
--2 WHEN COMMISSION_PCT > 0.10  THEN 'Normal komissiya' BU SETR LAZM DEYIL
--3 ELSE QARSISINDA 0 YOX 'Normal Komissiya' YAZILMALIDIR
--4 END ALLIASDAKI SOZ TEK DIRNAQDA YOX IKILI DIRNAQDA OLMALIDI

--TASK7

SELECT FIRST_NAME, PHONE_NUMBER, SALARY, 
        CASE WHEN PHONE_NUMBER LIKE '515%' THEN 'Daxili xett'
             WHEN SALARY >= 10000 THEN 'Yuksek maasli'
             WHEN COMMISSION_PCT IS NOT NULL THEN 'Satis komandasi'
             ELSE 'Standart isci'
        END AS KATEQORIYA
FROM HR.EMPLOYEES;

--TASK8 

SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
        SALARY * NVL(COMMISSION_PCT,0) * 3 AS RUBLUK_BONUS,
        (SALARY * 3) + (SALARY * NVL(COMMISSION_PCT,0)* 3) AS RUBLUK_UMUMI
FROM HR.EMPLOYEES;

--TASK9

SELECT E.FIRST_NAME, J.JOB_TITLE, E.SALARY, J.MIN_SALARY, J.MAX_SALARY,
        CASE WHEN E.SALARY = J.MAX_SALARY THEN 'Limite catib'
             WHEN J.MAX_SALARY - E.SALARY <= 2000 THEN 'Limite cox yaxin'
             WHEN E.SALARY < J.MIN_SALARY + 1000 THEN 'Baslangic seviyyede'
             ELSE 'Orta araliqda'
        END AS MAAS_VEZIYYETI
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
ON E.JOB_ID = J.JOB_ID;

--TASK10

SELECT E.FIRST_NAME, E.LAST_NAME, 
        NVL2(D.MANAGER_ID,'Rehberi var','Rehbersiz sobe')  AS MENECER_STATUSU,
        CASE WHEN D.DEPARTMENT_ID IS NULL THEN 'Teyin edilmeyib'
             WHEN L.COUNTRY_ID = 'US' THEN 'ABS ofisi'
             ELSE 'Beynelxalq ofis'
        END AS REGION
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN HR.LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;

