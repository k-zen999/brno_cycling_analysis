select *
from brno_cycling.cycling_intensity;

/* CHECKING THE DATATYPES*/
describe brno_cycling.cycling_intensity;

/* CHECKING DUPLICATE ROWS*/
select objectid, 
no, 
vsedni_den_24, 
vikend_24, 
datum_exportu, 
Shape__Length, 
GlobalID, 
Count(*) AS duplicate_count
from brno_cycling.cycling_intensity
group by objectid, 
no, 
vsedni_den_24, 
vikend_24, 
datum_exportu, 
Shape__Length, 
GlobalID
having Count(*) > 1;

/* Checking if "objectid" is repeated*/
select objectid, count(*) AS duplicate_value
from brno_cycling.cycling_intensity
group by objectid
having count(*) > 1;

/* Checking if "GlobalID" is repeated*/
select GlobalID, COUNT(*) AS duplicate_value
from brno_cycling.cycling_intensity
group by GlobalID
having count(*)>1;

/* Checking for null values*/
select count(*) AS total_rows,
sum(objectid is null) AS objectid_nulls,
sum(no is null) AS no_nulls,
sum(vsedni_den_24 is null) AS vsedni_den_24_nulls,
sum(vikend_24 is null) AS vikend_24_nulls,
sum(datum_exportu is null) AS datum_exportu_nulls,
sum(Shape__Length is null) AS Shape__Length_nulls,
sum(GlobalID is null) AS GlobalID_nulls
from brno_cycling.cycling_intensity;

/* CHECKING MINIMUM AND MAXIMUM WEEKDAY AND WEEKEND CYCLING COUNTS */
select MIN(vsedni_den_24) AS min_weekday,
MAX(vsedni_den_24) AS max_weekday,
MIN(vikend_24) AS min_weekend,
MAX(vikend_24) AS max_weekend
from brno_cycling.cycling_intensity;

/* CHECKING MINIMUM AND MAXIMUM Shape_Length */
select MIN(Shape__Length) AS shape_length_min,
MAX(Shape__Length) AS shape_length_max
from brno_cycling.cycling_intensity;

/* CHECKING FOR DUPLICATE VALUES IN ROUTE NUMBER */
select no, count(*) AS count
from brno_cycling.cycling_intensity
group by no 
having count(*) > 1;

/* CHECKING IF THERE ARE MULTIPLE EXPORT DATES */
select MIN(datum_exportu) AS earliest_date,
MAX(datum_exportu) AS latest_date,
COUNT(DISTINCT datum_exportu) AS unique_dates
from brno_cycling.cycling_intensity;

/* CHECKING IF CYCLING COUNTS ARE WHOLE NUMBERS */
select *
from brno_cycling.cycling_intensity
where vsedni_den_24 <> FLOOR(vsedni_den_24)
   or vikend_24 <> FLOOR(vikend_24);
   
/* CHECKING TOTAL NUMBER OF RECORDS */
SELECT COUNT(*) AS total_records
FROM brno_cycling.cycling_intensity;

/* CHECKING UNIQUE ROUTES */
SELECT
    COUNT(DISTINCT objectid) AS unique_objectid,
    COUNT(DISTINCT no) AS unique_route_numbers
FROM brno_cycling.cycling_intensity;

/* CHECKING TOTAL CYCLING COUNTS */
SELECT
    SUM(vsedni_den_24) AS total_weekday_count,
    SUM(vikend_24) AS total_weekend_count
FROM brno_cycling.cycling_intensity;

/* COMPARING WEEKDAY AND WEEKEND CYCLING COUNTS */
SELECT
    AVG(vsedni_den_24) AS avg_weekday,
    AVG(vikend_24) AS avg_weekend
FROM brno_cycling.cycling_intensity;

/* CALCULATING THE DIFFERENCE BETWEEN WEEKDAY AND WEEKEND AVERAGES */
SELECT
    AVG(vsedni_den_24) AS avg_weekday,
    AVG(vikend_24) AS avg_weekend,
    AVG(vsedni_den_24) - AVG(vikend_24) AS average_difference
FROM brno_cycling.cycling_intensity;

/* FINDING THE TOP 10 ROUTES BY WEEKDAY CYCLING COUNT */
SELECT
    no,
    vsedni_den_24 AS weekday_count
FROM brno_cycling.cycling_intensity
ORDER BY vsedni_den_24 DESC
LIMIT 10;

/* FINDING THE TOP 10 ROUTES BY WEEKEND CYCLING COUNT */
SELECT
    no,
    vikend_24 AS weekend_count
FROM brno_cycling.cycling_intensity
ORDER BY vikend_24 DESC
LIMIT 10;

/* COMPARING WEEKDAY AND WEEKEND CYCLING COUNTS BY ROUTE */
SELECT
    no,
    vsedni_den_24 AS weekday_count,
    vikend_24 AS weekend_count,
    vsedni_den_24 - vikend_24 AS difference
FROM brno_cycling.cycling_intensity
ORDER BY difference DESC
LIMIT 10;

/* FINDING ROUTES WHERE WEEKEND CYCLING IS MORE THAN WEEKDAYS */
SELECT 
	no,
    vsedni_den_24 AS weekday_count,
    vikend_24 AS weekend_count,
    vikend_24 - vsedni_den_24  AS weekend_difference
FROM brno_cycling.cycling_intensity	
where vikend_24 > vsedni_den_24
order by weekend_difference DESC;

/* FINDING ROUTES WHERE WEEKDAY CYCLING IS MORE THAN WEEKEND CYCLING */
select 
	no, 
    vsedni_den_24 AS weekday_count,
    vikend_24 AS weekend_count,
	vsedni_den_24 - vikend_24  AS weekday_difference
from brno_cycling.cycling_intensity
where vsedni_den_24 > vikend_24 
order by weekday_difference DESC;

/* Overall Weekday vs Weekend Cycling Volume */
select
	sum(vsedni_den_24) AS total_weekday,
    sum(vikend_24) AS total_weekend,
	sum(vsedni_den_24) - sum(vikend_24) AS total_difference
from brno_cycling.cycling_intensity;

/* COMPARISON OF WEEKDAY AND WEEKEND DOMINANT ROUTES */
select 
	sum(vsedni_den_24 > vikend_24) as weekday_higher,
    sum(vsedni_den_24 < vikend_24) as weekend_higher,
    sum(vsedni_den_24 = vikend_24) as equal
from brno_cycling.cycling_intensity;

/* PERCENTAGE OF WEEKDAY AND WEEKEND CYCLING */
select 
	Round(sum(vsedni_den_24)/(sum(vsedni_den_24)+sum(vikend_24))*100,2) AS weekday_percentage,
	Round((sum(vikend_24)/(sum(vsedni_den_24)+sum(vikend_24)))*100,2) AS weekend_percentage
from brno_cycling.cycling_intensity;

/* AVERAGE CYCLING BY ROUTE */
select 
	no,
	round(avg(vsedni_den_24), 2) AS avg_weekday,
    round(avg(vikend_24), 2) AS avg_weekend
from brno_cycling.cycling_intensity
group by no
order by avg_weekday desc; 

/* Weekday vs Weekend Cycling Preference by Route*/
SELECT
    no,
    vsedni_den_24 AS weekday_count,
    vikend_24 AS weekend_count,
    vsedni_den_24 - vikend_24 AS difference,
    ROUND(
        ABS(vsedni_den_24 - vikend_24) /
        (vsedni_den_24 + vikend_24) * 100,
        2
    ) AS preference_percentage
FROM brno_cycling.cycling_intensity
WHERE vsedni_den_24 + vikend_24 > 0
ORDER BY preference_percentage DESC;