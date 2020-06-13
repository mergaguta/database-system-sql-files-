/*
Merga Tafa
 Course: CSC 355 
Section 510
Assignment 2
Due Date,01/22/ 2020
*/
Drop table BOOKING;
Drop table TRAVELER;
Drop table TOUR;
--create tables
create table TRAVELER (
TrID char(5), 
TrName  VARCHAR(10),
TrPhone NUMBER(10),
CONSTRAINT PK_TRAVELER
	PRIMARY KEY (TrID)


);

ALTER TABLE TRAVELER
DROP CONSTRAINT PK_TRAVELER;
create table TOUR (
TID char(4),
DestinationName varchar(15),
TLength NUMBER(3,0),
TCost NUMBER(6,2),
CONSTRAINT PK_TOUR
	PRIMARY KEY (TID)


);
ALTER TABLE TOUR
DROP CONSTRAINT PK_TOUR;

create table BOOKING 
(
TourID CHAR(4),
TravelerID CHAR(5),
TourDate DATE 

);

ALTER TABLE TRAVELER
ADD CONSTRAINT PK_TRAVELER
PRIMARY KEY (TrID);

ALTER TABLE TOUR
ADD CONSTRAINT PK_TOOUR 
PRIMARY KEY (TID);

ALTER TABLE BOOKING
ADD CONSTRAINT PK_BOOKING 
PRIMARY KEY (TourDate);



ALTER TABLE BOOKING
ADD CONSTRAINT FK_TOUR
FOREIGN KEY (TourID) 
REFERENCES TOUR(TID);

ALTER TABLE BOOKING
ADD CONSTRAINT FK_TRAVELER
FOREIGN KEY (TravelerID)
REFERENCES TRAVELER(TrID);



insert into TOUR values ('AByy', ' China', 715, 1580.25);
insert into TOUR values ('ABzz', ' Mexico', 130, 1240.35);
insert into TOUR values ('ABxx', ' Japan', 780, 1840.85);
insert into TOUR values ('ABss', ' Russia', 385, 1640.15);
insert into TOUR values ('ABcc', ' France', 280, 1440.60);

insert into TRAVELER values ('BOcca', 'MERGA', 7732906436);
insert into TRAVELER values ('BOccb', 'TEDESE', 3012907889);
insert into TRAVELER values ('BOccc', 'BLISUMA', 2403903456);
insert into TRAVELER values ('BOccd', ' Kabe', 2403782345);
insert into TRAVELER values ('BOccf', 'Gurmesa', 2403903411);

insert into BOOKING values ('AByy', 'BOcca', DATE '2020-03-12');
insert into BOOKING values ('ABzz', 'BOccb', DATE '2020-08-05');
insert into BOOKING values ('ABxx', 'BOccc', DATE '2020-06-01');
insert into BOOKING values ('ABss', 'BOccd', DATE '2020-10-16');
insert into BOOKING values ('ABcc', 'BOccf', DATE '2020-11-10');
insert into BOOKING values ('AByy', 'BOcca', DATE '2020-09-10');
insert into BOOKING values ('ABxx', 'BOccc', DATE '2020-11-12');
 SELECT * FROM TOUR ;
 SELECT * FROM TRAVELER ;
 SELECT * FROM BOOKING ;

