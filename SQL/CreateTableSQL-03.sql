
-- ============================================================
-- CREATE TABLE : 13 tables
-- ============================================================

-- T01 : TB_EMPLOYEE 직원
CREATE TABLE TB_EMPLOYEE (
	emp_id 			VARCHAR2(50)  	NOT NULL,
	emp_pwd 		VARCHAR2(20)  	NOT NULL,
	emp_name 		VARCHAR2(200) 	NOT NULL,
	emp_phone 		VARCHAR2(50)  	NOT NULL,
	emp_rrnum 		VARCHAR2(14)  	NOT NULL,
	emp_address 	VARCHAR2(500) 	NOT NULL,
	emp_div 		CHAR(1),
	emp_salary 		NUMBER,
	emp_hiredate 	DATE,
	emp_retiredate 	DATE
);


-- T02 : TB_EMP_DIVNAME 직원 구분이름
CREATE TABLE TB_DIVNAME (
	emp_div 		CHAR(1)		  	NOT NULL,
	emp_divname 	VARCHAR2(200) 	NOT NULL
);


-- T03 : TB_NOTICE 게시판
CREATE TABLE TB_NOTICE ( 
	ntc_idx			NUMBER(22)		NOT NULL,
	ntc_title		VARCHAR2(200)	NOT NULL,
	emp_id			VARCHAR2(50)	NOT NULL,
	ntc_content		VARCHAR2(4000)	NOT NULL,
	ntc_count		NUMBER,
	ntc_regdate		DATE,
	ntc_update		DATE,
	ntc_delat		CHAR(1) DEFAULT 'F'
);


-- T04 : TB_LOGIN_INFO 접속정보
CREATE TABLE TB_LOGIN_INFO ( 
	emp_id			VARCHAR2(50)	NOT NULL,
	log_logindate	DATE,
	log_logoutdate	DATE
);


-- T05 : TB_PATIENT 환자
CREATE TABLE TB_PATIENT ( 
	pat_code		CHAR(6) 		NOT NULL,
	pat_inscode		VARCHAR2(12),		
	pat_name		VARCHAR2(200) 	NOT NULL,
	pat_phone		VARCHAR2(50) 	NOT NULL,
	pat_rrnum		VARCHAR2(14) 	NOT NULL,
	pat_gender		CHAR(1) 		NOT NULL,
	pat_address		VARCHAR2(500) 	NOT NULL,
	pat_disease		VARCHAR2(500),
	pat_firstdate	DATE,
	pat_redate		DATE,
	pat_memo		VARCHAR2(500),
	emp_id			VARCHAR2(50)
);


-- T06 : TB_RESERVE 예약
CREATE TABLE TB_RESERVE ( 
	res_idx			NUMBER 			NOT NULL,
	res_name		VARCHAR2(200) 	NOT NULL,
	res_phone		VARCHAR2(50) 	NOT NULL,
	res_date		DATE
);


-- T07 : TB_INSURANCE 의료보험
CREATE TABLE TB_INSURANCE ( 
	ins_code		VARCHAR2(12) 	NOT NULL,
	ins_rrnum		VARCHAR2(14) 	NOT NULL,
	ins_regname		VARCHAR2(20) 	NOT NULL,
	ins_div			VARCHAR2(20) 	NOT NULL
);


-- T08 : TB_CLINIC 진료
CREATE TABLE TB_CLINIC ( 
	cln_code		CHAR(6)			NOT NULL,
	pat_code		CHAR(6)			NOT NULL,
	emp_id			VARCHAR2(50)	NOT NULL,
	cln_date		DATE,
	cln_descr		VARCHAR2(4000)	NOT NULL
);


-- T09 : TB_PRESCRIPTION 처방
CREATE TABLE TB_PRESCRIPTION ( 
	prs_code		CHAR(6)			NOT NULL,
	cln_code		CHAR(6)			NOT NULL,
	prs_descr		VARCHAR2(4000)	NOT NULL,
	med_code		CHAR(9),
	med_code2		CHAR(9),
	med_code3		CHAR(9)
);


-- T10 : TB_SALES 매출
CREATE TABLE TB_SALES ( 
	cln_code		CHAR(6)			NOT NULL,
	sal_date		DATE,
	sal_income		NUMBER,
	sal_uncamt		NUMBER
);


-- T11 : TB_MEDICINE 의약품
CREATE TABLE TB_MEDICINE ( 
	med_code		CHAR(9)			NOT NULL,
	med_storedate	DATE,
	med_disusedate	DATE,
	med_amt			NUMBER,
	med_memo		VARCHAR2(4000)
);


-- T12 : TB_MED_CODENAME 의약품
CREATE TABLE TB_MED_CODENAME ( 
	med_code		CHAR(9)			NOT NULL,
	med_codename	VARCHAR2(200)	NOT NULL,
	med_unit		VARCHAR2(50)
);


-- T13 : TB_BUSICOMPANY 의약품
CREATE TABLE TB_BUSICOMPANY ( 
	cpn_phone		VARCHAR2(50)	NOT NULL,
	cpn_phone2		VARCHAR2(50),
	cpn_name		VARCHAR2(200)	NOT NULL,
	cpn_address		VARCHAR2(500)	NOT NULL,
	cpn_busicoun	NUMBER
);
