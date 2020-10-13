SELECT cohorts.name AS cohort_name,
COUNT(*) AS student_count
FROM cohorts LEFT JOIN students on students.cohort_id = cohorts.id
GROUP BY cohort_name
HAVING COUNT(*) >= 18
ORDER BY student_count;