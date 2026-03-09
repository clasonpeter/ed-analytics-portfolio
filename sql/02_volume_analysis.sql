-- Monthly Volume: Feb typically lowest volume
SELECT 
    DATE_TRUNC('month', arrival_datetime) AS Month,
    COUNT(*) AS Volume
FROM ed_visits
GROUP BY DATE_TRUNC('month', arrival_datetime)
ORDER BY DATE_TRUNC('month', arrival_datetime);

-- Hourly Volume: Peak hours typically 10am-8pm, informing staffing needs
SELECT
    arrival_hour AS Hour,
    COUNT(*) AS Volume
FROM ed_visits
GROUP BY Hour
ORDER BY Hour;

-- Volume by Day of the Week - Consistent throughout
SELECT
    arrival_dow AS Day,
    COUNT(*) AS Volume
FROM ed_visits
GROUP BY Day
ORDER BY Day;