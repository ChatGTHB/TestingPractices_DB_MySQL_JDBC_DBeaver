CREATE TABLE Users(
id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(50)
)

INSERT INTO Users (id,name,email)
VALUES 
(1,'Hakan Kanatsizkus','hkanatsizkus@mail.com'),
(2,'Arif Karakus','akarakus@mail.com'),
(3,'Fatma Arkın','farkin@mail.com'),
(4,'Simge Yigitoglu','syigitoglu@mail.com'),
(5,'Bünyamin Sagin','bsagin@mail.com'),
(6,'Aylin Luleburgaz','aluleburgaz@mail.com');

SELECT * FROM Users;

CREATE TABLE Products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
amount_stock INT,
price DECIMAL(10,2)
)

INSERT INTO Products(product_id,product_name,amount_stock,price)
VALUES 
(101,'Laptop',50,13999.99),
(102,'Phone',120,6999.99),
(103,'Tablet',40,3689.99),
(104,'Monitor',2,399.99),
(105,'Printer',45,499.99);

SELECT * FROM Products;