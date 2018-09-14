
-- ============================================================
-- INSERT INTO : test data
-- ============================================================

-- 인서트 테스트 데이터 : TB_EMPLOYEE
SELECT * FROM TB_EMPLOYEE;

INSERT INTO TB_EMPLOYEE
	(EMP_ID, EMP_PWD, EMP_NAME, EMP_PHONE, EMP_RRNUM, EMP_ADDRESS, EMP_DIV, EMP_SALARY, EMP_HIREDATE)
VALUES ('master', '1111', '마스터', '010-1111-1111', '900101', '대전시 중구', 'A', 0, sysdate);

INSERT INTO TB_EMPLOYEE
	(EMP_ID, EMP_PWD, EMP_NAME, EMP_PHONE, EMP_RRNUM, EMP_ADDRESS, EMP_DIV, EMP_SALARY, EMP_HIREDATE)
VALUES ('admin', '1111', '어드민', '010-2222-2222', '931231', '대전시 중구', 'A', 0, sysdate);

INSERT INTO TB_EMPLOYEE
	(EMP_ID, EMP_PWD, EMP_NAME, EMP_PHONE, EMP_RRNUM, EMP_ADDRESS, EMP_DIV, EMP_SALARY, EMP_HIREDATE)
VALUES ('san', '1111', '김산', '010-3333-3333', '930303', '대전시 유성구', 'D', 2500, sysdate);

INSERT INTO TB_EMPLOYEE
	(EMP_ID, EMP_PWD, EMP_NAME, EMP_PHONE, EMP_RRNUM, EMP_ADDRESS, EMP_DIV, EMP_SALARY, EMP_HIREDATE)
VALUES ('star', '1111', '박스타', '010-4444-4444', '950522', '서울시 마포구', 'N', 4000, sysdate);


-- 인서트 테스트 데이터 : TB_PATIENT
SELECT * FROM TB_PATIENT;

INSERT INTO TB_PATIENT
	(PAT_CODE, PAT_INSCODE, PAT_NAME, PAT_PHONE, PAT_RRNUM, PAT_GENDER, PAT_ADDRESS)
VALUES ('p00001', '1-1234512345', '석환자', '010-5555-5555', '900101-1112222', 'M', '대전시 대덕구');

INSERT INTO TB_PATIENT
	(PAT_CODE, PAT_INSCODE, PAT_NAME, PAT_PHONE, PAT_RRNUM, PAT_GENDER, PAT_ADDRESS)
VALUES ('p00002', '1-0001000234', '최환자', '010-3333-6666', '840124-1662422', 'M', '경북 영주시');

INSERT INTO TB_PATIENT
	(PAT_CODE, PAT_INSCODE, PAT_NAME, PAT_PHONE, PAT_RRNUM, PAT_GENDER, PAT_ADDRESS)
VALUES ('p00003', '1-3332000234', '노환자', '010-6666-0000', '750124-1662422', 'M', '대전시 북구');


-- 인서트 테스트 데이터 : TB_NOTICE
SELECT * FROM TB_NOTICE;

INSERT INTO TB_NOTICE
	(NTC_IDX, NTC_TITLE, EMP_ID, NTC_CONTENT, NTC_COUNT, NTC_REGDATE)
VALUES (0, '하나하나', 'master', '테스트 게시판 내용 첫번째', 4, sysdate);

INSERT INTO TB_NOTICE
	(NTC_IDX, NTC_TITLE, EMP_ID, NTC_CONTENT, NTC_COUNT, NTC_REGDATE)
VALUES (1, '둘둘두르', 'admin', '내용 2번째 테스트 게시판 세시팔', 3, sysdate);

INSERT INTO TB_NOTICE
	(NTC_IDX, NTC_TITLE, EMP_ID, NTC_CONTENT, NTC_COUNT, NTC_REGDATE)
VALUES (2, '별이빛나는밤', 'star', '반짝반짝반짝반짝반짝반짝반짝반짝', 56, sysdate);


-- 인서트 테스트 데이터 : TB_MEDICINE
INSERT ALL 
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888891', SYSDATE, ADD_MONTHS(SYSDATE, +100), 100, '투통약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888892', SYSDATE, ADD_MONTHS(SYSDATE, +100), 100, '둗홍약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888893', SYSDATE, ADD_MONTHS(SYSDATE, +100), 100, '치질약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888894', SYSDATE, ADD_MONTHS(SYSDATE, +100), 100, '치약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888895', SYSDATE, ADD_MONTHS(SYSDATE, +100), 100, '괴물약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888896', SYSDATE, ADD_MONTHS(SYSDATE, +100), 100, '오리약일걸?')
SELECT 1 FROM dual;


-- 인서트 테스트 데이터 : TB_NOTICE
SELECT * FROM tb_notice;
INSERT ALL 
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (311, '제11목', 'master', '투통약을 먹읍시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (312, '제목12목', 'admin', '치약을 먹읍시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (313, '제목13목', 'san', '치질약을 먹읍시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (314, '제목14목', 'san', 'ㄱ자장면 먹읍시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (315, '제목15목', 'san', '순대 먹읍시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (316, '제목16목', 'san', '투통약을 던집시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (317, '제목17목', 'san', '투통약을 버립시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (318, '제목1목8', 'san', '투통약을 달립시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (319, '제목목19', 'san', '투약을 먹ㄱㅎㄱㅎ읍시다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (320, '제목목20', 'san', '투통약을 먹읍게게게다', 42, SYSDATE)
	INTO tb_notice (ntc_idx, ntc_title, emp_id, ntc_content, ntc_count, ntc_regdate)
		VALUES (321, '제목목21', 'san', '투통3232약을 먹읍시다', 42, SYSDATE)
SELECT 1 FROM dual;


-- 인서트 테스트 데이터 : TB_CLINIC
SELECT * FROM TB_CLINIC;
INSERT ALL
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10001', 'p00001', 'san', SYSDATE, '진료내용c10001입니다아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10002', 'p00002', 'san', SYSDATE, '진료내용c10002입니다아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10003', 'p00003', 'star', SYSDATE, '진료내용입c10003니다아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10004', 'p00001', 'san', SYSDATE, '진료내용입니c10004다아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10005', 'p00002', 'star', SYSDATE, '진료내용입니다아c10005아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10006', 'p00003', 'san', SYSDATE, '진료내c10006용입니다아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10007', 'p00001', 'san', SYSDATE, '진료내용입니다c10007아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10008', 'p00002', 'star', SYSDATE, '진료내용입니다c10008아아아아')
	INTO tb_clinic (cln_code, pat_code, emp_id, cln_date, cln_descr)
		VALUES('c10009', 'p00003', 'san', SYSDATE, '진료내c10009용입니다아아아아')
SELECT 1 FROM dual;

