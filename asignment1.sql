
drop table STUDENT;

create table STUDENT (
  LastName      varchar(40) not null,
  FirstName     varchar(40),
  SID           number(5),
  SSN           number(9),
  Career      	varchar(4),
  Program       varchar(10),
  City          varchar(40),
  Started       number(4),
  primary key (SID),
  unique(SSN)
);