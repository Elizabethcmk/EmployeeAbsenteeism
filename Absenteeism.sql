--Creating a join table
SELECT * FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON
a.Reason_for_absence = r.Number

--Finding the healthiest employees for the bonus
SELECT * FROM Absenteeism_at_work
WHERE Social_smoker = 0 AND Social_drinker = 0
AND Body_mass_index < 25 AND Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work)
ORDER BY Absenteeism_time_in_hours ASC

--optimizing the data
SELECT  
a.ID,
r.Reason,
CASE WHEN Body_mass_index < 18.5 THEN 'Underweight'
	 WHEN Body_mass_index BETWEEN 18.5 AND 25 THEN 'Healthy weight'
	 WHEN Body_mass_index BETWEEN 25 AND 30 THEN 'Overweight'
	 WHEN Body_mass_index > 30 THEN 'Obese'
	 ELSE 'Unknown' END as BMI,
CASE WHEN Month_of_absence IN (12, 1, 2) THEN 'Winter'
	 WHEN Month_of_absence IN (3, 4, 5) THEN 'Spring'
	 WHEN Month_of_absence IN (6, 7, 8) THEN 'Summer'
	 WHEN Month_of_absence IN (9, 10, 11) THEN 'Autumn'
	 ELSE 'Unknown' END as Season_Names,
Seasons,
Month_of_absence,
Transportation_expense,
Education,
Social_drinker,
Social_smoker,
Pet,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
FROM Absenteeism_at_work a
LEFT JOIN compensation b
ON a.ID = b.ID
LEFT JOIN Reasons r ON
a.Reason_for_absence = r.Number;