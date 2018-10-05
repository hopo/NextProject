-- ==============================================
-- 0920
-- ==============================================


-- 
 SELECT cln_code FROM tb_clinic;

-- 
SELECT
	cln_code
FROM (
	SELECT cln_code, cln_date, MAX( cln_date ) OVER() AS last_date
	FROM tb_clinic a
)
WHERE cln_date = last_date;
