DROP TABLE IF EXISTS Order_Detail;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

CREATE TABLE Customer (
	CustomerID SERIAL PRIMARY KEY,
	CompanyName TEXT NOT NULL,
	ContactName TEXT NOT NULL,
	ContactTitle TEXT,
	Address TEXT UNIQUE,
	City TEXT  NOT NULL,
	Region TEXT NOT NULL,
	PostalCode INT NOT NULL,
	Country TEXT NOT NULL,
	Phone INT UNIQUE,
	Fax INT UNIQUE
);

INSERT INTO Customer (CompanyName,ContactName,Address,City,Region,PostalCode,Country,Phone)
	VALUES ('Codecool kft.','Alfonz','Régiposta u. 9','Miskolc','Borsod',3525,'Hungary',0615888588);
	
CREATE TABLE Orders (
	OrderID SERIAL PRIMARY KEY,
	CustomerID SERIAL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	EmployeeID SERIAL,
	OrderDate TEXT NOT NULL,
	RequireDate TEXT,
	ShippedDate TEXT NOT NULL,
	ShipVia TEXT,
	Freight INT NOT NULL,
	ShipName TEXT,
	ShipAddress TEXT, 
	ShipCity TEXT,
	ShipRegion TEXT,
	ShipPostalCode TEXT,
	ShipCountry TEXT
);

INSERT INTO Orders (OrderDate,ShippedDate,Freight)
	VALUES ('2020-03-20','2020-04-08',6);
	
CREATE TABLE Product (
	ProductID SERIAL PRIMARY KEY,
	ProductName TEXT NOT NULL,
	SupplierID SERIAL,
	CategoryID SERIAL,
	QuantityPerUnit INT NOT NULL,
	UnitPrice INT NOT NULL,
	UnitsInStock INT NOT NULL,
	UnitsOnOrder INT CHECK (UnitsOnOrder <= UnitsInStock),
	ReorderLevel INT,
	Discontinued INT
);

INSERT INTO Product (ProductName,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder)
	VALUES ('Guminő',1,35000,13,9);
	
CREATE TABLE Order_Detail (
	OrderID SERIAL,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	ProductID SERIAL,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	UnitPrice INT,
	Quantity INT NOT NULL,
	Discount INT
);

INSERT INTO Order_Detail (Quantity) 
	VALUES (2);
	
SELECT * FROM Order_Detail