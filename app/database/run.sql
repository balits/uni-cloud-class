CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    birth_year INT,
    biography TEXT
);
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    publication_year INT,
    isbn TEXT,
    available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id)
);

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