CREATE DATABASE Pramath_Final_Project;
SHOW DATABASES;
USE Pramath_Final_Project;

-- Create 'genre' table
CREATE TABLE genre (
    Genre_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

-- Create 'Catalog' table
CREATE TABLE catalog (
	Catalog_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

-- Create 'Material' table 
CREATE TABLE material (
	Material_ID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Publication_Date DATE,
    Catalog_ID INT,
    Genre_ID INT,
    FOREIGN KEY (Catalog_ID) REFERENCES catalog(Catalog_ID),
    FOREIGN KEY (Genre_ID) REFERENCES genre(Genre_ID)
);


-- Create 'Author' table
CREATE TABLE author (
	Author_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Birth_Date Date,
    Nationality VARCHAR(100)
    );
    
-- Create 'Authorship' table
CREATE TABLE authorship (
	Authorship_ID INT AUTO_INCREMENT PRIMARY KEY,
    Author_ID INT,
    Material_ID INT,
    FOREIGN KEY (Author_ID) REFERENCES author(Author_ID),
    FOREIGN KEY (Material_ID) REFERENCES material(Material_ID)
    );
    
    -- Create 'Member' table
CREATE TABLE member (
	Member_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL, 
    Contact_Info VARCHAR(100),
    Join_Date DATE
    );
    
    -- Create 'Staff' table
CREATE TABLE staff (
	Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact_Info VARCHAR(100),
    Job_Title VARCHAR(100),
    Hire_Date DATE
    );
    
-- Create 'borrow' table
CREATE TABLE borrow (
    Borrow_ID INT AUTO_INCREMENT PRIMARY KEY,
    Material_ID INT,
    Member_ID INT,
    Staff_ID INT,
    Borrow_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    Return_Date DATE,
    FOREIGN KEY (Material_ID) REFERENCES material(Material_ID),
    FOREIGN KEY (Member_ID) REFERENCES member(Member_ID),
    FOREIGN KEY (Staff_ID) REFERENCES staff(Staff_ID)
);

SHOW TABLES;

-- Inserting values into 'genre' table.
INSERT INTO genre ( Genre_ID, Name, Description) 
VALUES
(1, 'Science Fiction', 'A genre of speculative fiction that typically deals with imaginative and futuristic concepts such as advanced science and technology, space exploration, time travel, parallel universes, and extraterrestrial life.'),
(2, 'Fantasy', 'A genre of speculative fiction set in a fictional universe, often inspired by real world myth and folklore.'),
(3, 'Mystery', 'A genre of fiction that involves a mysterious death or a crime to be solved.'),
(4, 'Horror & Suspense', 'Stories designed to evoke fear, unease, or dread, often featuring supernatural or psychological elements.'),
(5, 'Dystopian & Apocalyptic', 'Depictions of societies in decline or collapse, often exploring themes of political and social oppression or environmental disaster.'),
(6, 'Classics', 'Enduring works of literature that have stood the test of time, often featuring rich language and complex themes.'),
(7, 'Historical Fiction', 'Fictional stories set in the past, often based on real historical events or figures, and exploring the customs and experiences of that time.'),
(8, 'Epic Poetry & Mythology', 'Ancient or traditional stories and poems, often featuring heroes, gods, and mythical creatures, and exploring cultural values and beliefs.');
-- This is to print the values in genre table.
SELECT Genre_ID, Name, Description FROM genre; 

-- Inserting values in 'catalog' table.
INSERT INTO catalog (Catalog_ID, Name, Location) 
VALUES
(1, 'Books', 'A1.1'),
(2, 'Magazines', 'B2.1'),
(3, 'E-Books', 'C3.1'),
(4, 'Audiobooks', 'D4.1'),
(5, 'Journals', 'E5.1'),
(6, 'Newspaper', 'F6.1'),
(7, 'Maps', 'G7.1'),
(8, 'Novels', 'H8.1'),
(9, 'Sheet Music', 'I9.1'),
(10, 'Educational', 'J10.1');
-- To print the values from catalog table.
SELECT Catalog_ID, Name, Location FROM catalog;

-- Inserting values into 'Material' table.
INSERT INTO material (Material_ID, Title, Publication_Date, Catalog_ID, 
Genre_ID) VALUES
(1, 'The Catcher in the Rye', '1951-07-16', 1, 1),
(2, 'To Kill a Mockingbird', '1960-07-11', 2, 1),
(3, 'The Da Vinci Code', '2003-04-01', 3, 2),
(4, 'The Hobbit', '1937-09-21', 4, 3),
(5, 'The Shining', '1977-01-28', 5, 4),
(6, 'Pride and Prejudice', '1813-01-28', 1, 1),
(7, 'The Great Gatsby', '1925-10-04', 2, 1),
(8, 'Moby Dick', '1851-10-18', 3, 1),
(9, 'Crime and Punishment', '1866-01-01', 4, 1),
(10, 'The Hitchhiker''s Guide to the Galaxy', '1979-10-12', 5, 3),
(11, '1984', '1949-06-08', 1, 5),
(12, 'Animal Farm', '1945-08-17', 2, 5),
(13, 'The Haunting of Hill House', '1959-10-17', 3, 4),
(14, 'Brave New World', '1932-08-01', 4, 5),
(15, 'The Chronicles of Narnia: The Lion the Witch and the Wardrobe', '1950-10-16', 5, 3),
(16, 'The Adventures of Huckleberry Finn', '1884-12-10', 6, 1),
(17, 'The Catch-22', '1961-10-11', 7, 1),
(18, 'The Picture of Dorian Gray', '1890-07-01', 8, 1),
(19, 'The Call of Cthulhu', '1928-02-01', 9, 4),
(20, 'Harry Potter and the Philosopher''s Stone', '1997-06-26', 10, 3),
(21, 'Frankenstein', '1818-01-01', 6, 4),
(22, 'A Tale of Two Cities', '1859-04-30', 7, 1),
(23, 'The Iliad', '1750-01-01', 8, 6),
(24, 'The Odyssey', '1725-01-01', 9, 6),
(25, 'The Brothers Karamazov', '1880-01-01', 10, 1),
(26, 'The Divine Comedy', '1320-01-01', 6, 6),
(27, 'The Grapes of Wrath', '1939-04-14', 7, 1),
(28, 'The Old Man and the Sea', '1952-09-01', 8, 1),
(29, 'The Count of Monte Cristo', '1844-01-01', 9, 1),
(30, 'A Midsummer Night''s Dream', '1596-01-01', 10, 7),
(31, 'The Tricky Book', '1888-01-01', 10, 7);
-- Print the material table.
SELECT * FROM material;

-- Insert values into 'Author' Table.
INSERT INTO author ( Author_ID, Name, Birth_Date, Nationality)
VALUES
(1, 'Jane Austen', '1775-12-16', 'British'),
(2, 'Ernest Hemingway', '1899-07-21', 'American'),
(3, 'George Orwell', '1903-06-25', 'British'),
(4, 'Scott Fitzgerald', '1896-09-24', 'American'),
(5, 'J.K. Rowling', '1965-07-31', 'British'),
(6, 'Mark Twain', '1835-11-30', 'American'),
(7, 'Leo Tolstoy', '1828-09-09', 'Russian'),
(8, 'Virginia Woolf', '1882-01-25', 'British'),
(9, 'Gabriel Márquez', '1927-03-06', 'Colombian'),
(10, 'Charles Dickens', '1812-02-07', 'British'),
(11, 'Harper Lee', '1926-04-28', 'American'),
(12, 'Oscar Wilde', '1854-10-16', 'Irish'),
(13, 'William Shakespeare', '1564-04-26', 'British'),
(14, 'Franz Kafka', '1883-07-03', 'Czech'),
(15, 'James Joyce', '1882-02-02', 'Irish'),
(16, 'J.R.R. Tolkien', '1892-01-03', 'British'),
(17, 'Emily Brontë', '1818-07-30', 'British'),
(18, 'Toni Morrison', '1931-02-18', 'American'),
(19, 'Fyodor Dostoevsky', '1821-11-11', 'Russian'),
(20, 'Lucas Piki', '1847-10-16', 'British');
-- Print the 'Author' Table
SELECT * FROM author;

-- Insert values into 'authorship' Table
INSERT INTO authorship ( Authorship_ID, Author_ID, Material_ID)
VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),
(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),
(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),
(20,20,20),(21,1,21),(22,2,22),(23,3,22),(24,3,23),(25,4,24),(26,5,25),
(27,6,26),(28,7,27),(29,8,28),(30,19,28),(31,9,29),(32,10,30),(33,8,30),
(34,2,29);
-- Print the values from 'authorship' table
SELECT Authorship_ID, Author_ID, Material_ID FROM authorship;

-- Insert values into 'member' table
INSERT INTO member( Member_ID, Name, Contact_Info, Join_Date)
VALUES
(1,  'Alice Johnson', 'alice.johnson@email.com', '2018-01-10'),
(2, 'Bob Smith', 'bob.smith@email.com', '2018-03-15'),
(3, 'Carol Brown', 'carol.brown@email.com', '2018-06-20'),
(4, 'David Williams', 'david.williams@email.com', '2018-09-18'),
(5, 'Emily Miller', 'emily.miller@email.com', '2019-02-12'),
(6, 'Frank Davis', 'frank.davis@email.com', '2019-05-25'),
(7, 'Grace Wilson', 'grace.wilson@email.com', '2019-08-15'),
(8, 'Harry Garcia', 'harry.garcia@email.com', '2019-11-27'),
(9, 'Isla Thomas', 'isla.thomas@email.com', '2020-03-04'),
(10, 'Jack Martinez', 'jack.martinez@email.com', '2020-07-01'),
(11, 'Kate Anderson', 'kate.anderson@email.com', '2020-09-30'),
(12, 'Luke Jackson', 'luke.jackson@email.com', '2021-01-18'),
(13, 'Mia White', 'mia.white@email.com', '2021-04-27'),
(14, 'Noah Harris', 'noah.harris@email.com', '2021-07-13'),
(15, 'Olivia Clark', 'olivia.clark@email.com', '2021-10-05'),
(16, 'Peter Lewis', 'peter.lewis@email.com', '2021-12-01'),
(17, 'Quinn Hall', 'quinn.hall@email.com', '2022-02-28'),
(18, 'Rachel Young', 'rachel.young@email.com', '2022-06-17'),
(19, 'Sam Walker', 'sam.walker@email.com', '2022-09-25'),
(20, 'Tiffany Allen', 'tiffany.allen@email.com', '2022-12-10');
-- Print the values of 'member' table
SELECT * FROM member;

-- Insert values to 'Staff' table
INSERT INTO staff (Staff_ID, Name, Contact_Info, Job_Title, Hire_Date)
VALUES
(1, 'Amy Green', 'amy.green@email.com', 'Librarian', '2017-06-01'),
(2, 'Brian Taylor', 'brian.taylor@email.com', 'Library Assistant', '2018-11-15'),
(3, 'Christine King', 'chris.king@email.com', 'Library Assistant', '2019-05-20'),
(4, 'Daniel Wright', 'dan.wright@email.com', 'Library Technician', '2020-02-01');
-- Print the values of 'staff' table
SELECT * FROM staff;    

-- Insert values into 'borrow' table
INSERT INTO borrow ( Borrow_ID, Material_ID, Member_ID, Staff_ID, Borrow_Date, Due_Date, Return_Date)
VALUES
(1, 1, 1, 1, '2018-09-12', '2018-10-03', '2018-09-30'),
(2, 2, 2, 1, '2018-10-15', '2018-11-05', '2018-10-29'),
(3, 3, 3, 1, '2018-12-20', '2019-01-10', '2019-01-08'),
(4, 4, 4, 1, '2019-03-11', '2019-04-01', '2019-03-27'),
(5, 5, 5, 1, '2019-04-20', '2019-05-11', '2019-05-05'),
(6, 6, 6, 1, '2019-07-05', '2019-07-26', '2019-07-21'),
(7, 7, 7, 1, '2019-09-10', '2019-10-01', '2019-09-25'),
(8, 8, 8, 1, '2019-11-08', '2019-11-29', '2019-11-20'),
(9, 9, 9, 1, '2020-01-15', '2020-02-05', '2020-02-03'),
(10, 10, 10, 1, '2020-03-12', '2020-04-02', '2020-03-28'),
(11, 1, 11, 2, '2020-05-14', '2020-06-04', '2020-05-28'),
(12, 2, 12, 2, '2020-07-21', '2020-08-11', '2020-08-02'),
(13, 3, 13, 2, '2020-09-25', '2020-10-16', '2020-10-15'),
(14, 4, 1, 2, '2020-11-08', '2020-11-29', '2020-11-24'),
(15, 5, 2, 2, '2021-01-03', '2021-01-24', '2021-01-19'),
(16, 6, 3, 2, '2021-02-18', '2021-03-11', '2021-03-12'),
(17, 17, 4, 2, '2021-04-27', '2021-05-18', '2021-05-20'),
(18, 18, 5, 2, '2021-06-13', '2021-07-04', '2021-06-28'),
(19, 19, 6, 2, '2021-08-15', '2021-09-05', '2021-09-03'),
(20, 20, 7, 2, '2021-10-21', '2021-11-11', NULL),
(21, 21, 1, 3, '2021-11-29', '2021-12-20', NULL),
(22, 22, 2, 3, '2022-01-10', '2022-01-31', '2022-01-25'),
(23, 23, 3, 3, '2022-02-07', '2022-02-28', '2022-02-23'),
(24, 24, 4, 3, '2022-03-11', '2022-04-01', '2022-03-28'),
(25, 25, 5, 3, '2022-04-28', '2022-05-19', '2022-05-18'),
(26, 26, 6, 3, '2022-06-22', '2022-07-13', '2022-07-08'),
(27, 27, 7, 3, '2022-08-04', '2022-08-25', '2022-08-23'),
(28, 28, 8, 3, '2022-09-13', '2022-10-04', '2022-09-28'),
(29, 29, 9, 3, '2022-10-16', '2022-11-06', '2022-11-05'),
(30, 30, 8, 3, '2022-11-21', '2022-12-12', '2022-12-05'),
(31, 1, 9, 4, '2022-12-28', '2023-01-18', NULL),
(32, 2, 1, 4, '2023-01-23', '2023-02-13', NULL),
(33, 3, 10, 4, '2023-02-02', '2023-02-23', '2023-02-17'),
(34, 4, 11, 4, '2023-03-01', '2023-03-22', NULL),
(35, 5, 12, 4, '2023-03-10', '2023-03-31', NULL),
(36, 6, 13, 4, '2023-03-15', '2023-04-05', NULL),
(37, 7, 17, 4, '2023-03-25', '2023-04-15', NULL),
(38, 8, 8, 4, '2023-03-30', '2023-04-20', NULL),
(39, 9, 9, 4, '2023-03-26', '2023-04-16', NULL),
(40, 10, 20, 4, '2023-03-28', '2023-04-18', NULL);
-- Print the values of 'borrow' table
SELECT * FROM borrow;

-- 1 . Which materials are currently available in the library? 
-- If a material is borrowed and not returned, it’s not considered as available. 
SELECT ml.Material_ID, ml.Title
FROM material ml
WHERE Material_ID NOT IN (
SELECT Material_ID
FROM borrow
WHERE Return_Date IS NULL
);

-- 2. Which materials are currently overdue?
-- Suppose today is 04/01/2023, and show the borrow date and due date of each material.
SELECT ml.Material_ID, ml.Title, bw.Borrow_Date, bw.Due_Date
FROM material ml
JOIN borrow bw ON ml.Material_ID = bw.Material_ID
WHERE bw.Due_Date < '2023-04-01' AND bw.Return_Date IS NULL 
ORDER BY ml.Material_ID;

-- 3. What are the top 10 most borrowed materials in the library? 
-- Show the <tle of each material and order them based on their available counts.
SELECT ml.Material_ID, ml.Title, COUNT(bw.Material_ID) AS Count_Borrow
FROM borrow bw
JOIN material ml ON bw.Material_ID = ml.Material_ID
WHERE Return_Date IS NOT NULL
GROUP BY bw.Material_ID, ml.Title
ORDER BY Count_Borrow DESC
LIMIT 10;

-- 4. How many materials has the author Lucas Piki written?
SELECT ar.Name,COUNT(ml.Material_ID) AS Total_Author_Materials
FROM author ar
JOIN authorship aup ON ar.Author_ID = aup.Author_ID
JOIN material ml ON aup.Material_ID = ml.Material_ID
WHERE ar.Name = 'Lucas Piki';

-- 5. How many materials were written by two or more authors?
SELECT COUNT(*) AS Materials_With_Multiple_Authors
FROM (
    SELECT Material_ID
    FROM authorship
    GROUP BY Material_ID
    HAVING COUNT(Author_ID) >=2
) AS subquery;
SELECT ml.material_ID,ml.Title, COUNT(DISTINCT ar.Author_ID) AS Author_Count
FROM material ml
JOIN authorship aup ON ml.Material_ID = aup.Material_ID
JOIN author ar ON ar.Author_ID = aup.Author_ID
GROUP BY ml.Material_ID, ml.Title
ORDER BY Author_Count DESC
LIMIT 4;

-- 7. How many materials had been borrowed from 09/2020-10/2020?
SELECT ml.Title, COUNT(*) AS Materials_Borrowed
FROM borrow bw
JOIN material ml ON bw.Material_ID = ml.Material_ID
WHERE bw.Borrow_Date >= '2020-09-01' AND bw.Borrow_Date <= '2020-10-31'
GROUP BY ml.Title
ORDER BY Materials_Borrowed DESC;

-- 8. How do you update the “Harry Potter and the Philosopher's Stone” when it is returned on 04/01/2023?
UPDATE borrow
SET Return_Date = '2023-04-01'
WHERE Material_ID = (SELECT Material_ID FROM material WHERE Title = 'Harry Potter and the Philosopher\'s Stone')
  AND Return_Date IS NULL
ORDER BY Borrow_Date DESC
LIMIT 1;
SELECT * FROM borrow;

-- 9. How do you delete the member Emily Miller and all her related records from the database?
DELETE FROM borrow
WHERE Member_ID = (
    SELECT Member_ID FROM member WHERE Name = 'Emily Miller'
);
SELECT * FROM borrow WHERE Member_ID = 5;

DELETE FROM member
WHERE Member_ID IN (
    SELECT Member_ID FROM (SELECT Member_ID FROM member WHERE Name = 'Emily Miller' LIMIT 1) AS subquery
);

SELECT * FROM member;

-- 10. How do you add the following material to the database?
-- Title: New book
-- Date: 2020-08-01
-- Catalog: E-Books
-- Genre: Mystery & Thriller
-- Author: Lucas Luke
INSERT INTO Material (Material_ID, Title, Publication_Date, 
Catalog_ID, Genre_ID) 
VALUES (32, 'New book', '2020-08-01', 
 (SELECT Catalog_ID FROM Catalog WHERE Name = 'E-Books' ), 
 (SELECT Genre_ID FROM Genre WHERE Name = 'Mystery & 
Thriller'));
SELECT * FROM material;
INSERT INTO author (Author_ID, Name, Birth_Date, Nationality)
VALUES (21, 'Lucas Luke', '1988-09-09', 'American');
SET SQL_SAFE_UPDATES = 0;
UPDATE author
SET Birth_Date = NULL, 
    Nationality = NULL
WHERE Name = 'Lucas Luke';
SELECT * FROM author; 
INSERT INTO authorship (Authorship_ID, Author_ID, Material_ID) 
VALUES (35, 
 (SELECT Author_ID FROM Author WHERE Name = 'Lucas Luke' 
LIMIT 1),
 (SELECT Material_ID FROM material WHERE Title = 'New book' 
AND Publication_Date = '2020-08-01'));
SELECT * FROM authorship;

-- 1. Alert staff about overdue materials on a daily basis?

SELECT ml.Title, bw.Borrow_Date, bw.Due_Date, bw.Member_ID, mem.Name AS member_name
FROM borrow bw
JOIN material ml ON bw.Material_ID = ml.Material_ID
JOIN member mem ON bw.Member_ID = mem.Member_ID
WHERE bw.Due_Date < CURDATE() AND bw.Return_Date IS NULL;

