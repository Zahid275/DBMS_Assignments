Create Database library_db;
 
Create Table books(
book_id Serial Primary Key,
title varchar(50),
author Varchar(25),
isAvailable boolean,
price int,
year_published int,
publicationn varchar(50)
);

Insert Into books (title,author,isavailable,price,year_published,publicationn)
Values
('1984','George Orwell',true,3767,1949,'Secker & Warburg'),
('To Kill a Mockingbird','Harper Lee',true,3187,1960,'J.B. Lippincott & Co.'),
('The Great Gatsby','F. Scott Fitzgerald',true,2897,1925,'Charles Scribner''s Sons'),
('Pride and Prejudice','Jane Austen',true,2607,1813,'T. Egerton'),
('The Catcher in the Rye','J.D. Salinger',true,400,1951,'Little, Brown and Co.'),
('The Hobbit','J.R.R. Tolkien',true,3915,1937,'George Allen & Unwin'),
('Moby-Dick','Herman Melville',true,2900,1851,'Harper & Brothers'),
('War and Peace','Leo Tolstoy',false,4350,1869,'The Russian Messenger'),
('The Alchemist','Paulo Coelho',true,4347,1988,'HarperTorch'),
('Harry Potter and the Sorcerer..','J.K. Rowling',true,5800,1997,'Bloomsbury'),
('The Lord of the Rings','J.R.R. Tolkien',true,7250,1954,'George Allen & Unwin'),
('Crime and Punishment','Fyodor Dostoevsky',true,560,1866,'The Russian Messenger'),
('The Da Vinci Code','Dan Brown',true,4927,2003,'Doubleday'),
('The Book Thief','Markus Zusak',true,3625,2005,'Picador'),
('Brave New World','Aldous Huxley',true,2755,1932,'Chatto & Windus');

Select * from books where year_published>2000;


Select * from books where price<599 order by price DESC;


Select * from books order by price DESC Limit(3);



Select * from books Order by year_published DESC offset(2) Limit(2);


Select * from books where publicationn ='George Allen & Unwin' order by title ASC;

