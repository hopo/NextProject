-- 
 SELECT
	aa.emp_id,
	aa.emp_name,
	aa.emp_div,
	bb.emp_divname
FROM
	tb_employee aa
LEFT JOIN tb_emp_divname bb ON
	aa.emp_div = bb.emp_div
WHERE
	emp_id = 'san'
	AND emp_pwd = '1111';

-- 
 SELECT
	*
FROM
	TB_LOGIN_INFO;

--
 INSERT
	INTO
		tb_login_info(
			log_idx,
			emp_id,
			log_logindate
		)
	VALUES(
		seq_logininfo.nextval,
		'nanana',
		SYSDATE
	);

--
 SELECT
	MAX( log_idx )
FROM
	TB_LOGIN_INFO
WHERE
	EMP_ID = 'hpark';

--
 UPDATE
	TB_LOGIN_INFO
SET
	LOG_LOGOUTDATE = SYSDATE
WHERE
	LOG_IDX =(
		SELECT
			MAX( log_idx )
		FROM
			TB_LOGIN_INFO
		WHERE
			EMP_ID = 'hpark'
	);

--
kjW COLUMNS FROM TB_EMPLOYEE;



-- 컬럼만 보자
SELECT * FROM user_tab_cols WHERE table_name = 'TB_LOGIN_INFO';

-- sys 권한
SELECT * FROM dba_objects;