-- Average LOS
SELECT
	AVG(total_los_min)
FROM ed_visits;

-- Average LOS by ESI Level
SELECT
	AVG(total_los_min),
	esi_level
FROM ed_visits
GROUP BY esi_level
ORDER BY esi_level;
-- ESI 3 shows highest LOS despite not being most critical
-- ESI 1/2 patients are admitted quickly, pulling their LOS down
-- ESI 3 requires extensive workup but often results in discharge

-- Avergae LOS by Disposition
SELECT
	AVG(total_los_min),
	disposition
FROM ed_visits
GROUP BY disposition
ORDER BY disposition;
-- Confirms ESI analysis: floor admissions drive longest LOS
-- LWBS shortest as patients left before full care episode

-- Average LOS by Arrival Mode
SELECT
	AVG(total_los_min),
	arrival_mode
FROM ed_visits
GROUP BY arrival_mode
ORDER BY arrival_mode;
-- LOS consistent across arrival modes -- potential opportunity
-- to stream low acuity walk-ins to fast track to reduce overall LOS