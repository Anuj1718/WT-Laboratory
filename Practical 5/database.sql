CREATE DATABASE ebookdb;
USE ebookdb;

CREATE TABLE ebookshop (
  book_id INT PRIMARY KEY,
  book_title VARCHAR(100),
  book_author VARCHAR(100),
  book_price DECIMAL(10,2),
  quantity INT
);

INSERT INTO ebookshop VALUES
(1, 'Atomic Habits', 'James Clear', 350.00, 10),
(2, 'The Alchemist', 'Paulo Coelho', 299.00, 15),
(3, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 400.00, 8),
(4, 'Crime and Punishment', 'Fyodor Dostoevsky', 450.00, 12),
(5, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 499.00, 10),
(6, 'Thus Spoke Zarathustra', 'Friedrich Nietzsche', 399.00, 9),
(7, 'Beyond Good and Evil', 'Friedrich Nietzsche', 350.00, 11),
(8, 'The Stranger', 'Albert Camus', 320.00, 13),
(9, 'The Myth of Sisyphus', 'Albert Camus', 300.00, 14),
(10, '1984', 'George Orwell', 299.00, 16),
(11, 'Brave New World', 'Aldous Huxley', 310.00, 10),
(12, 'Meditations', 'Marcus Aurelius', 280.00, 17),
(13, 'Man’s Search for Meaning', 'Viktor E. Frankl', 330.00, 10);

SELECT * FROM ebookshop;

