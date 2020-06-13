
--Merga Tafa
--CSC 355 
--Section 510
--Assignment 3 
--SubmissionDate,01- 29 -2020 


DROP TABLE PURCHASE CASCADE CONSTRAINTS;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE ITEM CASCADE CONSTRAINTS;
CREATE TABLE CUSTOMER
(
ID CHAR(3) PRIMARY KEY,
Name VARCHAR(12),
City VARCHAR(20),
Zip CHAR(5)
);
CREATE TABLE ITEM
(
ID CHAR(2) PRIMARY KEY,
Title VARCHAR(24),
Type VARCHAR(10),
Price NUMBER(4,2) CHECK (Price >= 0)
);
CREATE TABLE PURCHASE
(
PID CHAR(4) PRIMARY KEY,
CID CHAR(3) REFERENCES CUSTOMER(ID),
IID CHAR(2) REFERENCES ITEM(ID),
PDate DATE,
Quantity NUMBER(2) CHECK (Quantity > 0)
);
INSERT INTO CUSTOMER VALUES ('100', 'Reed', 'New York', '10017');
INSERT INTO CUSTOMER VALUES ('212', 'Franklin', 'Philadelphia', '19109');
INSERT INTO CUSTOMER VALUES ('333', 'Becker', 'Los Angeles', '90033');
INSERT INTO CUSTOMER VALUES ('481', 'Reed', 'Chicago', '60613');
INSERT INTO CUSTOMER VALUES ('590', 'Jordan', 'Chicago', '60606');
INSERT INTO CUSTOMER VALUES ('677', 'Jordan', 'Los Angeles', '92617');
INSERT INTO ITEM VALUES ('00', 'Time Trap', 'Book', 18.99);
INSERT INTO ITEM VALUES ('01', 'Altered Beast', 'CD', 12.99);
INSERT INTO ITEM VALUES ('02', 'Wild Wild West', 'CD', 21.99);
INSERT INTO ITEM VALUES ('03', 'The Dark Knight', 'DVD', 16.99);
INSERT INTO ITEM VALUES ('04', 'One November Night', 'CD', 13.99);
INSERT INTO ITEM VALUES ('05', 'A Brief History of Time', 'Book', 24.99);
INSERT INTO ITEM VALUES ('06', 'West of Hollywood', 'DVD', 11.99);
INSERT INTO ITEM VALUES ('07', 'The Skeleton Twins', 'DVD', 21.99);
INSERT INTO ITEM VALUES ('08', 'How the West Was Won', 'Book', 24.99);
INSERT INTO ITEM VALUES ('09', 'The Golden Gate', 'Book', 12.99);
INSERT INTO PURCHASE VALUES ('0001', '677', '02', DATE '2018-03-20', 2);
INSERT INTO PURCHASE VALUES ('0002', '590', '08', DATE '2018-06-15', 3);
INSERT INTO PURCHASE VALUES ('0003', '100', '02', DATE '2019-07-01', 1);
INSERT INTO PURCHASE VALUES ('0004', '212', '05', DATE '2019-07-01', 1);
INSERT INTO PURCHASE VALUES ('0005', '212', '01', DATE '2019-11-15', 1);
INSERT INTO PURCHASE VALUES ('0006', '481', '03', DATE '2019-11-15', 3);
INSERT INTO PURCHASE VALUES ('0007', '677', '03', DATE '2019-11-15', 1);
INSERT INTO PURCHASE VALUES ('0008', '100', '07', DATE '2020-01-01', 1);
INSERT INTO PURCHASE VALUES ('0009', '100', '00', DATE '2020-01-22', 2);
INSERT INTO PURCHASE VALUES ('0010', '333', '04', DATE '2020-01-22', 1);
SELECT * FROM CUSTOMER;
SELECT * FROM ITEM;
SELECT * FROM PURCHASE;



--1, display City with at least one customer alphabetical order

SELECT  city from CUSTOMER 
	ORDER BY CITY;
--2, Display the Title and price of DVD in table ITEM in desecnding order
SELECT  
Price,
Title
from ITEM
where Type = 'DVD'
ORDER BY Price ASC;
--3,Display Title, Type and Price in desending order of items which cost less than $15 dollars
SELECT Title, Type, Price
from ITEM
where Price <15
ORDER BY Price DESC;
--4, Display items that contain the word "West" any where under title
SELECT Title FROM ITEM
where Title LIKE '%West%';
--5, Display the ID of customer who made purchase during 2019
SELECT CID
from PURCHASE
where PDate like '%19';
--6 display the recent date of purchase for each Customer with their ID's
SELECT
 CID, 
MAX(PDate) as RecentPurchase
from PURCHASE
GROUP BY CID;


--7 display the least expensive price for each types item in table ITEM
SELECT Type,
MIN( Price ) as LeastExpensive
from ITEM
GROUP BY Type;
--8 for each date, to display the number of purchase made by customer in desending order

SELECT  PDate, 
SUM(QUANTITY) as PDate_Quantity

from PURCHASE
GROUP BY PDate
ORDER BY PDate_Quantity DESC;
---9,Gives ID  numbers and the purchase dates  by customer name "Reed"  in asending order of ID numbers
SELECT 
CID, 
PDate
FROM PURCHASE
INNER JOIN CUSTOMER
ON  CUSTOMER.ID = PURCHASE.CID 
where Name ='Reed'
ORDER BY CID;
--10 for each Purchase, it displays the ID and cost of purchase from highest to lowest of CUSTOMER
SELECT 
IID, 
Price*Quantity as cost
FROM PURCHASE
INNER JOIN ITEM
ON  ITEM.ID= PURCHASE.IID 

ORDER BY cost DESC;








	