SELECT assignments.day as day, COUNT(assignments.id) as number_of_assignments, SUM(assignments.duration)
FROM assignments
GROUP BY assignments.day
ORDER BY assignments.day;