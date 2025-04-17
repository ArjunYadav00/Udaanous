use udaanous;
create table purchases(
customerID INT,
PurchaseDate Date,
ReturnDate Date
);

insert into purchases (CustomerID,PurchaseDate,ReturnDate)
               values (1,"2024-01-01","2024-01-05"),
                      (2,"2024-01-02","2024-01-06"),
                      (3,"2024-01-03","2024-01-07"),
                      (4,"2024-01-04","2024-01-08"),
                      (5,"2024-01-05","2024-01-09"),
                      (6,"2024-01-06","2024-01-11"),
                      (7,"2024-01-07","2024-01-11"),
                      (8,"2024-01-08","2024-01-12"),
                      (9,"2024-01-09","2024-01-13"),
                      (10,"2024-01-10","2024-01-14");
select date_format(PurchaseDate,"%y-%M-%d") from purchases;

CREATE TABLE purchases2 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
insert into  purchases2(customerid,purchaseDate,ReturnDate) 
				values	 (1, '2024-01-01', '2024-01-09'),
						  (2, '2024-01-02', '2024-01-16'),
                          (3, '2024-01-03', '2024-01-11'),
                          (4, '2024-01-04', '2024-01-08'),
                          (5, '2024-01-05', '2024-01-09'),
                          (6, '2024-01-06', '2024-01-10'),
						  (7, '2024-01-07', '2024-01-21'),
                          (8, '2024-01-08', '2024-01-29'),
                          (9, '2024-01-09', '2024-01-13'),
                          (10, '2024-01-10', '2024-01-24');
select datediff(returndate,purchasedate) as Datedifference from purchases2;

CREATE TABLE purchases1 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
INSERT INTO purchases1 (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),
(2, '2024-01-02', '2024-01-06'),
(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),
(5, '2024-01-05', '2024-01-09'),
(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),
(8, '2024-01-08', '2024-01-12'),
(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');

select year(ReturnDate) as YearsData from purchases;
