-- Rate of LWBS
SELECT
	COUNT(disposition),
	ROUND(100.0 * COUNT(disposition)/ (SELECT count(*) FROM ed_visits),2)
FROM ed_visits
WHERE disposition = 'LWBS'; 

-- LWBS rate of 7.6% exceed industry benchmark of <2%
-- Clear patient safety concern

-- LWBS by ESI Level

SELECT
	esi_level,
	COUNT(*),
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM ed_visits WHERE esi_level = ed_visits.esi_level), 2) as lwbs_rate
FROM ed_visits
WHERE disposition = 'LWBS'
GROUP BY esi_level
ORDER BY esi_level;
-- ESI 2 LWBS rate most concerning from patient safety perspective
-- These are emergent patients leaving with potentially life threatening conditions

-- Average LOS of LWBS by ESI level
SELECT
	esi_level,
	ROUND(AVG(total_los_min),1) as Total
FROM ed_visits
WHERE disposition = 'LWBS'
GROUP BY esi_level
ORDER BY esi_level;
-- ESI 2 patients abandon after just 75 min -- shortest threshold
-- Lower acuity patients wait longer before leaving (90-99 min)
-- Reducing wait times below 75 min for ESI 2 could recover high risk LWBS
