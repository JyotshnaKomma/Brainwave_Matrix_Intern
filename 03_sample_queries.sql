-- SELECT queries for reports and insights

-- Available copies of books
SELECT b.book_id, b.title,
       (b.total_copies - (
           SELECT COUNT(*) FROM Issues i 
           WHERE i.book_id = b.book_id AND i.return_date IS NULL
       )) AS copies_left
FROM Books b;

-- Overdue books and borrowers
SELECT i.issue_id, m.name AS borrower, b.title, i.due_date,
       DATEDIFF(CURDATE(), i.due_date) AS days_late
FROM Issues i
JOIN Members m ON i.member_id = m.member_id
JOIN Books b ON i.book_id = b.book_id
WHERE i.return_date IS NULL AND i.due_date < CURDATE();

-- Total unpaid fines
SELECT SUM(amount) AS total_unpaid
FROM Fines
WHERE status = 'Unpaid';

-- Top 5 issued books
SELECT b.title, COUNT(*) AS times_issued
FROM Issues i
JOIN Books b ON i.book_id = b.book_id
GROUP BY i.book_id
ORDER BY times_issued DESC
LIMIT 5;