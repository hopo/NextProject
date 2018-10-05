
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
VALUES ('p0001', '1-1234512345', '석환자', '010-5555-5555', '900101-1112222', 'M', '대전시 대덕구');

INSERT INTO TB_PATIENT
	(PAT_CODE, PAT_INSCODE, PAT_NAME, PAT_PHONE, PAT_RRNUM, PAT_GENDER, PAT_ADDRESS)
VALUES ('p0042', '1-0001000234', '최환자', '010-6666-6666', '740124-1662422', 'M', '경북 영주시');


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
		VALUES ('m88888891', SYSDATE, ADD_MONTHS(SYSDATE, +100),  100, '투통약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888892', SYSDATE, ADD_MONTHS(SYSDATE, +100),  100, '둗홍약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888893', SYSDATE, ADD_MONTHS(SYSDATE, +100),  100, '치질약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888894', SYSDATE, ADD_MONTHS(SYSDATE, +100),  100, '치약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888895', SYSDATE, ADD_MONTHS(SYSDATE, +100),  100, '괴물약일걸?')
	INTO tb_medicine (med_code, med_storedate, med_disusedate, med_amt, med_memo)
		VALUES ('m88888896', SYSDATE, ADD_MONTHS(SYSDATE, +100),  100, '오리약일걸?')
SELECT 1 FROM dual;
