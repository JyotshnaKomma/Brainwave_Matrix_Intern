-- INSERT sample data into tables

INSERT INTO Categories (name) VALUES 
('Fiction'), ('Programming'), ('Science'), ('History');

INSERT INTO Books (title, author, publisher, publication_year, category_id, total_copies) VALUES
('Clean Code', 'Robert C. Martin', 'Prentice Hall', 2008, 2, 5),
('Atomic Habits', 'James Clear', 'Penguin', 2018, 1, 4),
('A Brief History of Time', 'Stephen Hawking', 'Bantam', 1988, 3, 3),
('The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', 1999, 2, 2);

INSERT INTO Members (name, email, phone, address, join_date) VALUES
('Arun Kumar', 'arun@example.com', '9876543210', 'Vizag', CURDATE()),
('Sneha Rao', 'sneha@example.com', '9123456789', 'Hyderabad', CURDATE());

INSERT INTO Staff (name, email, phone, role) VALUES
('Librarian Lakshmi', 'lakshmi@library.com', '9000000001', 'Librarian'),
('Asst. Ravi', 'ravi@library.com', '9000000002', 'Assistant');

INSERT INTO Issues (book_id, member_id, issue_date, due_date) VALUES
(1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

INSERT INTO Issues (book_id, member_id, issue_date, due_date, return_date) VALUES
(2, 2, DATE_SUB(CURDATE(), INTERVAL 30 DAY),
        DATE_SUB(CURDATE(), INTERVAL 16 DAY),
        DATE_SUB(CURDATE(), INTERVAL 2 DAY));

INSERT INTO Fines (issue_id, amount, status) VALUES
(2, 70.00, 'Unpaid');