-- ============================================================
-- ED ANALYTICS PROJECT - Database Setup Script
-- ============================================================

-- Drop table if re-running
DROP TABLE IF EXISTS ed_visits;

-- Create the main ED visits table
CREATE TABLE ed_visits (
    visit_id                INTEGER PRIMARY KEY,
    arrival_datetime        TIMESTAMP,
    triage_datetime         TIMESTAMP,
    provider_datetime       TIMESTAMP,
    disposition_datetime    TIMESTAMP,
    departure_datetime      TIMESTAMP,
    esi_level               SMALLINT,
    arrival_mode            VARCHAR(20),
    chief_complaint         VARCHAR(50),
    disposition             VARCHAR(20),
    payer                   VARCHAR(20),
    provider_id             VARCHAR(10),
    room_id                 VARCHAR(10),
    patient_age             SMALLINT,
    patient_gender          VARCHAR(10),
    arrival_hour            SMALLINT,
    arrival_dow             SMALLINT,  -- 0=Monday, 6=Sunday
    door_to_triage_min      INTEGER,
    triage_to_provider_min  INTEGER,
    provider_to_dispo_min   INTEGER,
    dispo_to_departure_min  INTEGER,
    total_los_min           INTEGER,
    is_boarded              SMALLINT,
    boarding_minutes        INTEGER
);

-- ============================================================
-- LOAD DATA
-- ============================================================

COPY ed_visits
FROM '"C:ed-analytics-portfolio/data/ed_visits.csv"'
DELIMITER ','
CSV HEADER;

-- Verify load
SELECT COUNT(*) AS total_visits FROM ed_visits;

-- Quick sanity check
SELECT
    MIN(arrival_datetime) AS earliest_visit,
    MAX(arrival_datetime) AS latest_visit,
    ROUND(AVG(total_los_min)) AS avg_los_minutes,
    SUM(CASE WHEN disposition = 'LWBS' THEN 1 ELSE 0 END) AS lwbs_count,
    SUM(is_boarded) AS boarded_count
FROM ed_visits;
