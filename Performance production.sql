CREATE DATABASE production_performance;
SELECT * FROM prod_data;
DESCRIBE prod_data;
INSERT INTO prod_data
(Record_ID, Date, Machine, Shift, Planned_Hours, Downtime_Hours,
 Operating_Hours, Production_Target, Actual_Production, Defective_Units,
 Maintenance_Event, Operator_Experience, Energy_kWh)
VALUES
(10571, '2025-06-20 19:00', 'Kiln B', 'Morning', 7.73, NULL, 5.92, 847, 742, 21, 'None', '3-5 years', 862),
(10579, '2025-06-10 21:00', 'Kiln A', 'Morning', 7.97, 1.01, 6.96, 947, 886, 16, 'None', '5+ years', NULL),
(10659, '2025-01-14 01:00', 'Kiln A', 'Morning', 8.11, NULL, 6.80, 945, 844, 22, 'None', '3-5 years', 945),
(11311, '2025-04-05 09:00', 'Mill A', 'Morning', 7.30, NULL, 6.73, 646, 600, 15, 'None', '5+ years', 648),
(11799, '2025-03-28 05:00', 'Mill A', 'Morning', 7.64, 0.46, 7.18, 675, 644, 16, 'None', '5+ years', NULL),
(11854, '2025-01-29 20:00', 'Kiln A', 'Afternoon', 8.19, NULL, 6.72, 953, 838, 23, 'None', '5+ years', 1062),
(11902, '2025-04-06 13:00', 'Mill A', 'Afternoon', 7.47, 1.52, 5.94, 672, 650, 19, 'None', '3-5 years', NULL),
(12293, '2025-02-12 08:00', 'Kiln B', 'Night', 8.46, 2.01, 6.45, 926, 800, 29, 'None', '3-5 years', NULL),
(12340, '2025-01-17 16:00', 'Kiln A', 'Morning', 7.91, NULL, 7.58, 910, 910, 14, 'None', '3-5 years', 1014),
(12758, '2025-04-25 04:00', 'Kiln B', 'Morning', 8.12, 1.56, 6.56, 912, 807, 21, 'None', '5+ years', NULL);
SELECT COUNT(*) FROM prod_data;

## DATASET Validation 
## How many total records and unique Record_IDs are in the cleaned table?
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT Record_ID) AS unique_records,
    MIN(Record_ID) AS first_record_id,
    MAX(Record_ID) AS last_record_id
FROM prod_data;

## Overall production performance
SELECT 
    SUM(production_target) AS prod_target,
    SUM(actual_production) AS act_prod,
    (SUM(actual_production) / SUM(production_target)) * 100 AS percent_achieve 
FROM prod_data;

## Overall Quality
## Total actual production, Total defective units and Defect rate
SELECT 
	SUM(actual_production) AS prod_data,
    SUM(defective_units) AS def_units,
    (SUM(defective_units)/SUM(actual_production)) * 100 AS defect_rate
FROM prod_data;

## 4. Monthly Production Performance
## For each month, calculate: Number of records, Total production target, Total actual production,Achievement rate %
SELECT
    DATE_FORMAT(STR_TO_DATE(`Date`, '%Y-%m-%d %H:%i'),
    '%Y-%m'
    ) AS month,
     COUNT(Record_ID) AS num_of_rec,
     SUM(production_target) AS prod_target,
     SUM(actual_production) AS act_prod,
     ROUND((SUM(actual_production) / SUM(production_target)),2) * 100 AS percent_achieve
FROM prod_data
GROUP BY month
order by month;

## Machine Performance
## For each machine, calculate:Number of records, Total production target, Total actual production
## Achievement rate %, Average downtime, Total defective units, Defect rate %
SELECT 
    Machine,
    COUNT(record_id) AS num_of_rec,
    SUM(production_target) AS prod_target,
	SUM(actual_production) AS act_prod,
	ROUND((SUM(actual_production) / SUM(production_target)),2) * 100 AS ach_rate,
    ROUND(AVG(downtime_hours),2) AS avg_dt,
    SUM(defective_units) AS def_units,
    ROUND((SUM(defective_units)/SUM(actual_production)) * 100,2) AS defect_rate
FROM prod_data
GROUP BY machine
ORDER BY machine;

## Shift Performance
## For each shift, calculate:Number of records, Total production target, Total actual production, Achievement rate %,
## Average downtime, Defect rate %
SELECT 
    shift,
    COUNT(record_id) AS num_of_rec,
    SUM(production_target) AS prod_target,
	SUM(actual_production) AS act_prod,
	ROUND((SUM(actual_production) / SUM(production_target)),2) * 100 AS ach_rate,
    ROUND(AVG(downtime_hours),2) AS avg_dt,
    SUM(defective_units) AS def_units,
    ROUND((SUM(defective_units)/SUM(actual_production)) * 100,2) AS defect_rate
FROM prod_data
GROUP BY shift
ORDER BY shift;

## Overall Downtime
## Calculate:Number of records with a recorded downtime value, Average downtime, Minimum downtime, Maximum downtime
SELECT
    COUNT(downtime_hours) AS records_with_downtime,
    ROUND(AVG(downtime_hours), 2) AS avg_downtime,
    ROUND(MIN(downtime_hours), 2) AS min_downtime,
    ROUND(MAX(downtime_hours), 2) AS max_downtime
FROM prod_data;

## Downtime by Machine
## For each machine, calculate:Number of records with recorded downtime,Average downtime,Maximum downtime
SELECT 
    machine,
    COUNT(downtime_hours) AS records_with_downtime,
    ROUND(AVG(downtime_hours), 2) AS avg_downtime,
    ROUND(MIN(downtime_hours), 2) AS min_downtime,
    ROUND(MAX(downtime_hours), 2) AS max_downtime
FROM prod_data
GROUP BY machine
ORDER BY machine;

## Downtime by Shift
## For each shift, calculate:Number of records with recorded downtime,Average downtime,Maximum downtime
SELECT 
    shift,
    COUNT(downtime_hours) AS records_with_downtime,
    ROUND(AVG(downtime_hours), 2) AS avg_downtime,
    ROUND(MIN(downtime_hours), 2) AS min_downtime,
    ROUND(MAX(downtime_hours), 2) AS max_downtime
FROM prod_data
GROUP BY shift
ORDER BY shift;

## Production Quality by Machine
## For each machine, calculate:Total defective units,Total actual production,Defect rate %
SELECT 
    machine,
    SUM(defective_units),
    SUM(actual_production),
	(SUM(defective_units)/ SUM(actual_production)) * 100 AS defect_rate
FROM prod_data
GROUP BY machine
ORDER BY defect_rate;

## Operator Experience
SELECT
    operator_experience,
    COUNT(*) AS records,
    ROUND(SUM(actual_production) /SUM(production_target) * 100,2) AS achievement_rate_pct,
    ROUND(AVG(downtime_hours), 2) AS avg_downtime
FROM prod_data
GROUP BY operator_experience
ORDER BY achievement_rate_pct DESC;

## Maintainance event 
SELECT
    maintenance_event,
    COUNT(*) AS records,
    ROUND(SUM(actual_production) /SUM(production_target) * 100,2) AS achievement_rate_pct,
    ROUND(AVG(downtime_hours), 2) AS avg_downtime,
    ROUND(SUM(defective_units) /SUM(actual_production) * 100,2) AS defect_rate_pct
FROM prod_data
GROUP BY maintenance_event
ORDER BY achievement_rate_pct DESC;
    
## Analytical view
CREATE VIEW production_analysis AS
SELECT
    record_id,
    STR_TO_DATE(`date`, '%Y-%m-%d %H:%i') AS production_datetime,
    machine,
    shift,
    planned_hours,
    downtime_hours,
    operating_hours,
    production_target,
    actual_production,
    defective_units,
    maintenance_event,
    operator_experience,
    energy_kWh,
    ROUND(actual_production / production_target,4) AS achievement_rate,
    ROUND(defective_units / actual_production,4) AS defect_rate
FROM prod_data;

SELECT * FROM production_analysis

    
     
     
     
    