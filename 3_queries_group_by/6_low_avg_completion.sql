SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;

-- SELECT students.name AS student, AVG(duration) AS average_assignment_duration
-- FROM students
-- JOIN assignment_submissions as x ON students.id = student_id
-- JOIN (
--   SELECT AVG(duration) AS estimate_duration, assignment_id
--   FROM assignment_submissions
--   GROUP BY assignment_id
--   ) AS y ON y.assignment_id = x.assignment_id
-- WHERE students.end_date IS NULL 
-- GROUP BY student
-- ORDER BY average_assignment_duration DESC;


-- SELECT students.name AS student, AVG(duration) AS average_assignment_duration
-- SELECT students.name AS student, AVG(duration) AS average_assignment_duration
-- FROM students
-- JOIN assignment_submissions as x ON students.id = student_id
-- WHERE students.end_date IS NULL 
-- GROUP BY student
-- HAVING AVG(duration) > (
--   SELECT AVG(duration) 
--   FROM assignment_submissions WHERE assignment_submissions.assignment_id = x.assignment_id)
-- -- GROUP BY assignment_id, student
-- ORDER BY average_assignment_duration DESC;