create database mydatabase;
use mydatabase;
alter database mydatabase
	character set = utf8mb4
    collate = utf8mb4_unicode_ci;
drop database mydatabase;
create table yadav_clan (
column1 int,
column2 Varchar(20)
);
drop table yadav_clan;
show tables;
alter table yadav_clan
modify column1 int not null;
alter table yadav_clan
add constraint unique_column1 unique (column1);
insert into yadav_clan(column1, column2)
values(1, 'Ram');
select * from yadav_clan;
alter table yadav_clan
modify column2 varchar(20);
insert into yadav_clan(column1, column2)
values(2, 'Devi');
delete from yadav_clan
where column1 = 2;
truncate table yadav_clan;
alter table yadav_clan
add Last_Name varchar(20);
alter table yadav_clan
change column2 First_Name Varchar(20);
alter table yadav_clan
drop column last_name;
create index Title
on yadav_clan( column1, First_name);
insert into yadav_clan(column1, First_name)
values(1, 'Ram');
insert into yadav_clan(column1, First_name)
values(2, 'Devi');
drop index Title
on yadav_clan;
insert into yadav_clan(column1, First_name)
values(3, 'Rita');
insert into yadav_clan(column1)
values(4);
alter table yadav_clan
add column4 varchar(20);
update yadav_clan
set first_name = 'Rama', column4 = 'yadava'
where column1 = 4;
select column4
from yadav_clan
where column4 is null;
select column1
from yadav_clan
where column1 is null;
select column4
from yadav_clan
where column4 is not null;
select column4, first_name
from yadav_clan
where column4 and first_name is null;
select *
from yadav_clan
where column4 is not null and first_name is not null;
select *
from yadav_clan
where column4 is null and first_name is null;
alter table yadav_clan
add constraint PK_column1 primary key (column1);
select * from yadav_clan;

select * from yadava
alter table yadava
change idyadava ID int not null;
alter table yadava
add column2 varchar(20) not null;
alter table yadava
add Age int not null;
insert into yadava(ID, column2, Age)
values(1, 'Ram', 90);
insert into yadava(ID, column2, Age)
values(2, 'Devii', 80);
insert into yadava(ID, column2, Age)
values(3, 'chand', 70);

rename table yadav_clan to yadava_clan;
alter table yadava
rename column column2 to first_name;