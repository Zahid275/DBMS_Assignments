Create table customers(
customerid int primary key,
customername varchar(50),
city varchar(20),
state varchar(50),
joinDate date);


Insert into customers
values
(1,'Ali Khan','Lahore','PB','2022-05-10'),
(2,'Sara Ahmed','Karachi','SD','2023-03-21'),
(3,'Bilal Hussain','Islamabad','IS','2021-11-02'),
(4,'Nadia Iqbal','Multan','PB','2024-01-15'),
(5,'Hamza Raza','Faisalabad','PB','2022-08-09'),
(6,'Usman Farooq','Rawalpindi','PB','2023-06-14'),
(7,'Ayesha Noor','Peshawar','KP','2021-04-25'),
(8,'Zahid Ali','Hyderabad','SD','2024-07-19'),
(9,'Sana Malik','Quetta','BL','2023-01-10'),
(10,'Imran Khan','Sialkot','PB','2022-09-30');

Create table cars(
carid int primary key,
model Varchar(50),
brand varchar(20),
year int,
price numeric,
color varchar(20),
inventoryCount int);



Insert into cars
values
(1,'Corolla','Toyota',2023,3800000,'White',5),
(2,'Civic','Honda',2024,5500000,'Black',3),
(3,'Sportage','Kia',2023,7500000,'Silver',2),
(4,'Alto','Suzuki',2022,2000000,'Blue',8),
(5,'Elantra','Hyundai',2024,4500000,'Red',4),
(6,'Accord','Honda',2023,6500000,'Grey',3),
(7,'Fortuner','Toyota',2024,12000000,'Black',1),
(8,'Picanto','Kia',2022,2500000,'Yellow',6),
(9,'Swift','Suzuki',2023,3200000,'White',5),
(10,'Tucson','Hyundai',2024,6800000,'Blue',2);


Create table Sales(
saleid int primary key,
customerid int,
carid int,
saledate date,
saleprice numeric,
salespersonid int 
);


insert into Sales
values
(1,1,2,'2023-06-18',5400000,1),
(2,3,1,'2022-12-05',3750000,2),
(3,2,4,'2023-08-12',1980000,3),
(4,4,5,'2024-03-20',4450000,1),
(5,5,3,'2023-11-27',7400000,2),
(6,6,7,'2024-01-15',11800000,4),
(7,7,6,'2022-10-19',6450000,3),
(8,8,9,'2024-05-10',3150000,5),
(9,9,8,'2023-02-28',2450000,2),
(10,10,10,'2024-06-21',6750000,1);

Create table salesperson(
salespersonid int primary key,
name varchar(50),
department varchar(50),
hiredate date
);

Insert into salesperson values
(1,'Ahmed Raza','Sales','2020-04-15'),
(2,'Saima Tariq','Sales','2019-09-10'),
(3,'Usman Ali','Sales','2021-01-05'),
(4,'Zainab Khan','Marketing','2022-02-12'),
(5,'Imran Qureshi','Sales','2023-06-01'),
(6,'Hassan Shah','Sales','2021-07-20'),
(7,'Maria Khan','Marketing','2020-11-18'),
(8,'Faisal Mehmood','Sales','2018-08-25'),
(9,'Sadia Rauf','Sales','2022-09-05'),
(10,'Asad Zafar','Sales','2024-01-10')



Create table serviceRecors(
recordid int primary key,
carid int,
servicedate date,
servicetype varchar(30),
cost numeric,
technicianid int
);


insert into serviceRecors values
(1,1,'2023-09-05','Oil Change',5000,1),
(2,3,'2024-01-22','Brake Repair',15000,2),
(3,4,'2023-11-15','Tire Change',12000,3),
(4,5,'2024-04-10','Engine Check',20000,1),
(5,2,'2023-07-28','Battery Replace',8000,2),
(6,6,'2024-02-15','Suspension Repair',25000,4),
(7,7,'2023-08-19','AC Service',10000,3),
(8,8,'2022-12-10','Oil Change',5000,1),
(9,9,'2024-05-02','Clutch Replacement',18000,5),
(10,10,'2023-03-28','Brake Service',14000,2);



-- Part 1:basic Aggregate Functions

Select count(customerid) from customers;
Select avg(saleprice) from sales;
Select max(saleprice) from sales;
Select sum(inventorycount) from cars;
Select min(saledate) as earliest_date,max(saledate) as latest_date from sales;

--Part 2 group by
Select brand,count(model) as total_models from cars group by brand;
Select name,sum(saleprice) as total_sales from sales inner join salesperson on sales.salespersonid = salesperson.salespersonid group by name;
Select model,avg(saleprice) as average_sale_price from cars full join sales on sales.carid = cars.carid group by model;
Select servicetype,avg(cost) as average_cost from serviceRecors group by servicetype;
Select brand,color,count(carid) from cars group by brand,color;



-- Part 3
Select brand,count(model) from cars group by brand having count(model) >5;

Select model,count(saleprice) from cars left join sales on cars.carid = sales.carid group by model having count(saleprice)>10;

Select name,avg(saleprice) as avg_saleprice from sales inner join salesperson on sales.salespersonid = salesperson.salespersonid group by name having avg(saleprice)>50000;

Select Extract(MONTH from saledate) as month,count(saleprice) from sales group by month having count(saleprice)>20;

Select servicetype,avg(cost) as avg_cost from serviceRecors group by servicetype having avg(cost)>500;