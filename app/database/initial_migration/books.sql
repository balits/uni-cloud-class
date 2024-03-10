CREATE TABLE books (
	id SERIAL PRIMARY KEY,
	title  	TEXT NOT NULL,
	author_id INT NOT NULL,
	genre_id INT NOT NULL,
	publication_year INT,
	isbn TEXT,
	available BOOLEAN DEFAULT TRUE,

	FOREIGN KEY (author_id) REFERENCES authors(id),
	FOREIGN KEY (author_id) REFERENCES genres(id)
);
