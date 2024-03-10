-- Inserting data into Authors table
INSERT INTO Authors (name, birth_year, biography)
VALUES ('George R.R. Martin',  1948, 'George Raymond Richard Martin, often referred to as GRRM, is an American novelist and short story writer, screenwriter, and television producer.');

-- Inserting data into Genres table
INSERT INTO Genres (name, description)
VALUES ('Fantasy', 'A genre of speculative fiction set in a fictional universe, often inspired by mythology and folklore.');

-- Inserting data into Books table
INSERT INTO Books (title, author_id, genre_id, publication_year, isbn, available)
VALUES ('A Game of Thrones', 1, 1, 1996, '978-0553103540', true),
       ('A Clash of Kings', 1, 1, 1998, '978-0553108033', true),
       ('A Storm of Swords', 1, 1, 2000, '978-0553106633', true),
       ('A Feast for Crows', 1, 1, 2005, '978-0553801507', true),
       ('A Dance with Dragons', 1, 1, 2011, '978-0553801477', true);

-- Optionally, you can also insert borrowed book data into BorrowedBooks table
-- For simplicity, let's assume no books are borrowed initially
-- INSERT INTO BorrowedBooks (user_id, book_id, borrow_date, return_date, returned)
-- VALUES (1, 1, '2024-03-10', '2024-03-20', true); -- Example of a borrowed book

