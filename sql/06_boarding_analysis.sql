-- Count and rate of boarded patients
SELECT
    COUNT(*),
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM ed_visits), 2) AS boarding_rate
FROM ed_visits
WHERE is_boarded = 1;
-- 19.74% boarding rate is extremely high -- industry benchmark is <5%
-- Directly linked to LWBS rate as boarded patients block ED beds

-- Count and rate of boarded patients by disposition
SELECT 
	disposition,
	COUNT(*), 
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM ed_visits), 2) AS boarding_rate
FROM ed_visits
WHERE is_boarded = 1
GROUP BY disposition
ORDER BY COUNT(*) DESC;

-- Do ICU or floor boarders wait longer?
SELECT 
	disposition,
	ROUND(AVG(boarding_minutes),1) AS Average_Time
FROM ed_visits
WHERE is_boarded = 1
GROUP BY disposition;
-- Average boarding time ~218 min regardless of destination
-- Suggests systemic bed management issue, not unit-specific
-- 3.6 hrs of boarding per admitted patient significantly impacts ED capacity