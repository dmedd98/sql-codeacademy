-- Examine the data from the employees and projects table.
SELECT * FROM employees;
SELECT * FROM projects;
-- What are the names of employees who have not chosen a project?
SELECT first_name, last_name
FROM employees
WHERE current_project IS NULL;
-- What are the names of projects that were not chosen by any employees
SELECT p.project_name
FROM projects p 
LEFT JOIN employees e
  ON p.project_id = e.current_project
WHERE e.employee_id IS NULL;
-- What is the name of the project chosen by the most employees?
SELECT p.project_name, COUNT(*) AS 'Employee Count'
FROM projects p
LEFT JOIN employees e
  ON p.project_id = e.current_project
GROUP BY p.project_name
ORDER BY COUNT(*) DESC
LIMIT 1;
-- Which projects were chosen by multiple employees?
SELECT p.project_name, COUNT(*) AS 'Employee Count'
FROM projects p
LEFT JOIN employees e
  ON p.project_id = e.current_project
GROUP BY p.project_name
HAVING COUNT(*) > 1;
-- Each project needs at least 2 developers. How many available project positions are there for developers? Do we have enough developers to fill the needed positions?
SELECT (COUNT(*) * 2) - (
  SELECT COUNT(*)
  FROM employees
  WHERE current_project IS NOT NULL
    AND position = 'Developer') AS 'Count'
FROM projects;
-- Which personality is the most common across our employees?
SELECT personality, COUNT(*)
FROM employees
GROUP BY personality
ORDER BY 2 DESC
LIMIT 1;

-- What are the names of projects chosen by employees with the most common personality type?
SELECT p.project_name, COUNT(*)
FROM projects p
JOIN employees e
  ON p.project_id = e.current_project
WHERE e.personality = 'ENFJ'
GROUP BY p.project_name;

