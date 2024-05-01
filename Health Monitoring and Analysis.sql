SELECT * FROM healthmonitoring;

-- 1. How many Patients data are gotten?
SELECT COUNT(PatientID) AS number_of_patients FROM healthmonitoring;

-- 2. Number of Male to Female patient
SELECT gender,
	   COUNT(gender) AS present
FROM healthmonitoring
GROUP BY gender;

-- 3. Minimun, Average and Maximum Age of Patients, 
SELECT MIN(age) AS min_age,
		AVG(age) AS avg_age,
        MAX(age) as max_age
FROM healthmonitoring;

-- 4. Minimun, Average and Maximum age of Both Male and Female patients Patients
SELECT  gender,
		MIN(age) AS min_age,
		ROUND(AVG(age), 2	) AS avg_age,
        MAX(age) as max_age
FROM healthmonitoring
GROUP BY gender;

-- 5. The types of activity level & The most common
SELECT ActivityLevel,
		COUNT(ActivityLevel)
FROM healthmonitoring
GROUP BY ActivityLevel
ORDER BY ActivityLevel;

-- 6. Which age has the highest stress level
SELECT age,
		COUNT(StressLevel) AS stress_level_count
FROM healthmonitoring
WHERE StressLevel = "moderate"
GROUP BY age
ORDER BY  stress_level_count DESC;

-- 7. Which age has the highest ActivityLevel  
SELECT age,
		COUNT(ActivityLevel) AS activity_level_count
FROM healthmonitoring
WHERE ActivityLevel   = "walking"
GROUP BY age
ORDER BY  activity_level_count DESC;

-- 8. Patient 5 with the highest HeartRate 
SELECT PatientID,
		MAX(HeartRate) AS max_heart_rate
FROM healthmonitoring
GROUP BY PatientID
ORDER BY max_heart_rate
LIMIT 5;


-- 9. Catergorizing Age of Patients
SELECT *,
       CASE WHEN age >= 18 AND age <=25 THEN 'YOUNG ADULT'
       ELSE 'ADULT' END
AS patient_age_group
FROM healthmonitoring;

-- 10. Which patient has the highest body Temperature
SELECT PatientID,
       MAX(BodyTemperature) AS highest_body_temp
FROM healthmonitoring
GROUP BY PatientID
ORDER BY highest_body_temp
LIMIT 5;