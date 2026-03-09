# ED Operations Analytics Dashboard

## Overview
An end-to-end healthcare analytics project analyzing Emergency Department 
operational efficiency across 50,000 patient visits (2023-2024).

## Key Findings
- **7.6% LWBS rate** — nearly 4x the industry benchmark of <2%
- **19.7% boarding rate** — admitted patients waiting avg 218 min for inpatient beds
- **ESI 3 patients** identified as primary driver of ED inefficiency
- **ESI 2 patients** abandoning after just 75 min — critical patient safety concern
- **Provider-to-disposition** identified as largest care pathway bottleneck

## Tools Used
- **PostgreSQL 18** — data storage and analysis
- **SQL** — volume analysis, LOS breakdown, bottleneck analysis, LWBS and boarding analysis
- **Tableau Public** — interactive dashboard

## Live Dashboard
[View on Tableau Public](https://public.tableau.com/app/profile/clason.peter/viz/EDOperationsDashboard/EDOperationsDashboard)

## Repository Structure
```
ed-analytics-portfolio/
├── data/               # Synthetic ED dataset (50,000 visits)
├── sql/                # Analysis queries
│   ├── 01_setup.sql
│   ├── 02_volume_analysis.sql
│   ├── 03_los_breakdown.sql
│   ├── 04_bottleneck_analysis.sql
│   ├── 05_lwbs_analysis.sql
│   └── 06_boarding_analysis.sql
└── tableau/            # Tableau data export
```

## SQL Analyses
- **Volume Analysis** — monthly, hourly, and day-of-week visit patterns
- **LOS Breakdown** — average length of stay by ESI level, disposition, and arrival mode
- **Bottleneck Analysis** — care pathway timing segmented by acuity level
- **LWBS Analysis** — left without being seen rates and wait time thresholds
- **Boarding Analysis** — admitted patient boarding rates and duration
```