const { Pool } = require('pg');

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
// Store all potentially malicious values in an array. 
const values = [`%${cohortName}%`, limit];


const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

/*
SELECT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
*/

pool.query(
  `SELECT teachers.name as teacher, cohorts.name as cohort
  FROM assistance_requests
  JOIN teachers ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  GROUP BY teachers.name, cohorts.name
  ORDER BY teachers.name
  LIMIT $2;`, values
)
.then (res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  });
});