-- ==========================================
-- 0919
-- ==========================================


-- 01) 세개의 테이블을 조인한다
SELECT *
FROM (
	SELECT
		ROWNUM AS rnum ,
		frm.*
	FROM (
			SELECT
				xx.* ,
				yy.emp_name
			FROM (
				SELECT
					aa.cln_code ,
					aa.pat_code ,
					aa.emp_id ,
					TO_CHAR(aa.cln_date,'yyyy/mm/dd hh24:mi') AS cln_date ,
					aa.cln_descr,
					bb.pat_name
				FROM 
					tb_clinic aa LEFT JOIN tb_patient bb ON aa.pat_code = bb.pat_code
			) xx LEFT JOIN tb_employee yy ON xx.emp_id = yy.emp_id
			WHERE 1 = 1
			ORDER BY cln_code DESC
		) frm
	)
WHERE rnum BETWEEN 1 AND 5;

-- Join을 위한 쿼리
SELECT
	aa.cln_code ,
	aa.pat_code ,
	aa.emp_id ,
	TO_CHAR(aa.cln_date,'yyyy/mm/dd hh24:mi') AS cln_date ,
	aa.cln_descr ,
	bb.pat_name ,
	cc.emp_name
FROM 
	tb_clinic aa
	INNER JOIN tb_patient bb ON aa.pat_code = bb.pat_code
	INNER JOIN tb_employee cc ON aa.emp_id = cc.emp_id
WHERE 1 = 1
ORDER BY cln_code DESC;


-- 위를 참조하여 서치/페이지네이션 가능한 쿼리
-- ;master와 slave 관계를 고려하면서 짜보자
SELECT *
FROM (
	SELECT
		ROWNUM AS rnum ,
		frm.*
	FROM (
			SELECT
				aa.cln_code ,
				aa.pat_code ,
				aa.emp_id ,
				TO_CHAR(aa.cln_date,'yyyy/mm/dd hh24:mi') AS cln_date ,
				aa.cln_descr ,
				bb.pat_name ,
				yy.emp_name
			FROM 
				tb_clinic aa
				INNER JOIN tb_patient bb ON aa.pat_code = bb.pat_code
				INNER JOIN tb_employee yy ON aa.emp_id = yy.emp_id
			WHERE pat_name LIKE '%' || '산' || '%'
			ORDER BY cln_code DESC
		) frm
	)
WHERE rnum BETWEEN 1 AND 10;


--
INSERT INTO
	tb_clinic (
		) VALUES (
			'C' || seq_clinic.nextval ,
			#{patCode} ,
			#{empId}   ,
			SYSDATE    ,
			#{clnDescr}
		)

-- 
SELECT * FROM TB_CLINIC;

INSERT INTO TB_CLINIC
	(CLN_CODE, PAT_CODE, EMP_ID, CLN_DATE, CLN_DESCR)
VALUES(
	'C' || LPAD(seq_clinic.NEXTVAL, 5, '0'),
	'p00042',
	'san', 
	SYSDATE,
	'진료 내용입니다'
);


--
SELECT * FROM TB_EMPLOYEE;
DELETE FROM TB_EMPLOYEE WHERE emp_id LIKE '%' ||'test'||'%';