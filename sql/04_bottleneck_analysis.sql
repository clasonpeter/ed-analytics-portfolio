-- Average in 4 important segments
SELECT
	AVG(door_to_triage_min) as DOORTRIAGE,
	AVG(triage_to_provider_min) as TRIAGEPROVI,
	AVG(provider_to_dispo_min) as PROVIDISPO,
	AVG(dispo_to_departure_min) as DISPODEPART
FROM ed_visits;
-- Longest in Provider to Dispo

SELECT
	AVG(door_to_triage_min) as DOORTRIAGE,
	AVG(triage_to_provider_min) as TRIAGEPROVI,
	AVG(provider_to_dispo_min) as PROVIDISPO,
	AVG(dispo_to_departure_min) as DISPODEPART,
	esi_level
FROM ed_visits
GROUP by esi_level
ORDER by esi_level;
-- ESI 3 patients are driving the longest LOS AND the longest provider-to-disposition time.
-- ESI 3 patients are the primary driver of ED inefficiency.