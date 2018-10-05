SELECT * FROM TB_EMPLOYEE;

--
DELETE FROM TB_EMPLOYEE
WHERE EMP_ID = 'sooki';

COMMIT;

--
DELETE FROM TB_EMPLOYEE
WHERE EMP_ID = 'sooki';

--
select * from parent join child using (id)
where id = 1;

--
ALTER TABLE JAVA.TB_PRESCRIPTION ADD CONSTRAINT TB_PRESCRIPTION_TB_CLINIC_FK FOREIGN KEY (CLN_CODE) REFERENCES JAVA.TB_CLINIC(CLN_CODE) ON DELETE CASCADE;
ALTER TABLE JAVA.TB_PRESCRIPTION DROP CONSTRAINT TB_PRESCRIPTION_TB_CLINIC_FK;


--
SELECT
	*
FROM
	tb_employee aa,
	tb_clinic bb,
	tb_login_info cc
WHERE
	aa.emp_id = bb.emp_id
	AND bb.emp_id = cc.emp_id;

--
DELETE FROM (
	SELECT
		*
	FROM
		tb_employee aa,
		tb_clinic bb,
		tb_login_info cc
	WHERE
		aa.emp_id = bb.emp_id
		AND bb.EMP_ID = cc.EMP_ID
) frm
WHERE
	frm.emp_id = 'hpark';