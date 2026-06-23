SELECT MAX(price) as MAX_PRICE FROM Products; -- Get the most expensive product
SELECT AVG(grade) as AVG_GRADE FROM Exams WHERE id = 0; -- Get the average grade for an exam

-- Aggregation with grouping (Remember, only aggregates and cols in GROUP BY clause can
-- appear in SELECT clause!)
SELECT id, AVG(grade) as "Average Grade", COUNT(grade) as "Count"
FROM ExamResults GROUP BY id; -- Average grade for each exam and number of students taking it

SELECT id, AVG(grade) as avg, COUNT(grade) as cnt FROM ExamResults
GROUP BY id HAVING cnt > 0 ORDER BY avg DESC LIMIT 20;

-- Get exam details for all exams as filtered before
SELECT * FROM (
    SELECT id, AVG(grade) as avg, COUNT(grade) as cnt FROM ExamResults
    GROUP BY id HAVING cnt > 0 ORDER BY avg DESC LIMIT 20
) as filtered JOIN Exams e ON filtered.id = e.id;
