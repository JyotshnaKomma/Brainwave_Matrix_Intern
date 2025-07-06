-- Extra features: View, Trigger, Update/Delete

-- View for active (unreturned) issues
CREATE OR REPLACE VIEW v_active_issues AS
SELECT i.issue_id, b.title AS book_title, m.name AS member_name, i.issue_date, i.due_date
FROM Issues i
JOIN Books b ON i.book_id = b.book_id
JOIN Members m ON i.member_id = m.member_id
WHERE i.return_date IS NULL;

-- Trigger: Insert fine on late return
DELIMITER $$
CREATE TRIGGER trg_insert_fine_after_return
AFTER UPDATE ON Issues
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL AND NEW.return_date > NEW.due_date THEN
        INSERT INTO Fines(issue_id, amount, status)
        VALUES (NEW.issue_id,
                DATEDIFF(NEW.return_date, NEW.due_date) * 5,
                'Unpaid');
    END IF;
END$$
DELIMITER ;

-- Example: Mark a fine as paid
-- UPDATE Fines SET status = 'Paid' WHERE fine_id = 2;

-- Example: Delete inactive member (if no active issues)
-- DELETE FROM Members WHERE member_id = 3;