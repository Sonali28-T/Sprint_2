

create database ShoppingTrendDB;

use  ShoppingTrendDB;

 CREATE TABLE Customers (
 CustomerID VARCHAR(10) PRIMARY KEY,
 Age INT NOT NULL, 
 Gender VARCHAR(10) NOT NULL, 
 Location VARCHAR(100) NOT NULL, 
 PreferredPaymentMethod VARCHAR(50) NOT NULL,
 FrequencyOfPurchases VARCHAR(50) NOT NULL);

desc Customers;
+------------------------+--------------+------+-----+---------+-------+
| Field                  | Type         | Null | Key | Default | Extra |
+------------------------+--------------+------+-----+---------+-------+
| CustomerID             | varchar(10)  | NO   | PRI | NULL    |       |
| Age                    | int          | NO   |     | NULL    |       |
| Gender                 | varchar(10)  | NO   |     | NULL    |       |
| Location               | varchar(100) | NO   |     | NULL    |       |
| PreferredPaymentMethod | varchar(50)  | NO   |     | NULL    |       |
| FrequencyOfPurchases   | varchar(50)  | NO   |     | NULL    |       |
+------------------------+--------------+------+-----+---------+-------+

 desc customers;
+------------------------+--------------+------+-----+---------+-------+
| Field                  | Type         | Null | Key | Default | Extra |
+------------------------+--------------+------+-----+---------+-------+
| CustomerID             | varchar(10)  | NO   | PRI | NULL    |       |
| Age                    | int          | NO   |     | NULL    |       |
| Gender                 | varchar(10)  | NO   |     | NULL    |       |
| Location               | varchar(100) | NO   |     | NULL    |       |
| PreferredPaymentMethod | varchar(50)  | NO   |     | NULL    |       |
| FrequencyOfPurchases   | varchar(50)  | NO   |     | NULL    |       |
+------------------------+--------------+------+-----+---------+-------+

CREATE TABLE Products (
 ProductID Varchar(10) PRIMARY KEY,
 ProductName VARCHAR(100) NOT NULL, 
 Category VARCHAR(50) NOT NULL,
 UNIQUE (ProductName));

desc products;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| ProductID   | varchar(10)  | NO   | PRI | NULL    |       |
| ProductName | varchar(100) | NO   | UNI | NULL    |       |
| Category    | varchar(50)  | NO   |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+

CREATE TABLE Categories (
CategoryID VARCHAR(10) PRIMARY KEY, 
CategoryName VARCHAR(50) UNIQUE NOT NULL);

desc categories;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| CategoryID   | varchar(10) | NO   | PRI | NULL    |       |
| CategoryName | varchar(50) | NO   | UNI | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

CREATE TABLE PaymentMethods (
PaymentMethodID INT PRIMARY KEY, 
PaymentMethodName VARCHAR(50) UNIQUE NOT NULL);

desc paymentmethods;
+-------------------+-------------+------+-----+---------+-------+
| Field             | Type        | Null | Key | Default | Extra |
+-------------------+-------------+------+-----+---------+-------+
| PaymentMethodID   | int         | NO   | PRI | NULL    |       |
| PaymentMethodName | varchar(50) | NO   | UNI | NULL    |       |
+-------------------+-------------+------+-----+---------+-------+

CREATE TABLE ShippingTypes (
ShippingTypeID VARCHAR(10) PRIMARY KEY, 
ShippingTypeName VARCHAR(50) NOT NULL);

desc shippingtypes;
+------------------+-------------+------+-----+---------+-------+
| Field            | Type        | Null | Key | Default | Extra |
+------------------+-------------+------+-----+---------+-------+
| ShippingTypeID   | varchar(10) | NO   | PRI | NULL    |       |
| ShippingTypeName | varchar(50) | NO   |     | NULL    |       |
+------------------+-------------+------+-----+---------+-------+

CREATE TABLE Subscriptions (
SubscriptionID VARCHAR(10) PRIMARY KEY, 
SubscriptionStatus VARCHAR(50) UNIQUE NOT NULL);

desc subscriptions;
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| SubscriptionID     | varchar(10) | NO   | PRI | NULL    |       |
| SubscriptionStatus | varchar(50) | NO   | UNI | NULL    |       |
+--------------------+-------------+------+-----+---------+-------+


CREATE TABLE ReviewRatings (
ReviewID INT PRIMARY KEY, 
CustomerID varchar(10) NOT NULL, 
ProductID varchar(10) NOT NULL, 
Rating DECIMAL(3, 2) NOT NULL, 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID));

desc reviewratings;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| ReviewID   | int          | NO   | PRI | NULL    |       |
| CustomerID | varchar(10)  | NO   | MUL | NULL    |       |
| ProductID  | varchar(10)  | NO   | MUL | NULL    |       |
| Rating     | decimal(3,2) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+


CREATE TABLE Purchases (
PurchaseID INT PRIMARY KEY, 
CustomerID varchar(10) NOT NULL, 
ProductID varchar(10) NOT NULL,
PurchaseAmount_USD DECIMAL(10, 2) NOT NULL, 
Size VARCHAR(10) NOT NULL, 
Color VARCHAR(20) NOT NULL, 
Season VARCHAR(20) NOT NULL,
ReviewRating DECIMAL(3, 2) NOT NULL,
SubscriptionStatus VARCHAR(50) NOT NULL, 
PaymentMethodID INT NOT NULL, 
ShippingTypeID varchar(10) NOT NULL,
DiscountApplied BOOLEAN NOT NULL, 
PromoCodeUsed BOOLEAN NOT NULL, 
PreviousPurchases INT NOT NULL, 
FrequencyOfPurchases VARCHAR(50) NOT NULL, 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID), 
FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID),
FOREIGN KEY (ShippingTypeID) REFERENCES ShippingTypes(ShippingTypeID), 
FOREIGN KEY (SubscriptionStatus) REFERENCES Subscriptions(SubscriptionStatus));


desc purchases;
+----------------------+---------------+------+-----+---------+-------+
| Field                | Type          | Null | Key | Default | Extra |
+----------------------+---------------+------+-----+---------+-------+
| PurchaseID           | int           | NO   | PRI | NULL    |       |
| CustomerID           | varchar(10)   | NO   | MUL | NULL    |       |
| ProductID            | varchar(10)   | NO   | MUL | NULL    |       |
| PurchaseAmount_USD   | decimal(10,2) | NO   |     | NULL    |       |
| Size                 | varchar(10)   | NO   |     | NULL    |       |
| Color                | varchar(20)   | NO   |     | NULL    |       |
| Season               | varchar(20)   | NO   |     | NULL    |       |
| ReviewRating         | decimal(3,2)  | NO   |     | NULL    |       |
| SubscriptionStatus   | varchar(50)   | NO   | MUL | NULL    |       |
| PaymentMethodID      | int           | NO   | MUL | NULL    |       |
| ShippingTypeID       | varchar(10)   | NO   | MUL | NULL    |       |
| DiscountApplied      | tinyint(1)    | NO   |     | NULL    |       |
| PromoCodeUsed        | tinyint(1)    | NO   |     | NULL    |       |
| PreviousPurchases    | int           | NO   |     | NULL    |       |
| FrequencyOfPurchases | varchar(50)   | NO   |     | NULL    |       |
+----------------------+---------------+------+-----+---------+-------+

ALTER TABLE purchases MODIFY COLUMN PurchaseID VARCHAR(30);

desc purchases;
+----------------------+---------------+------+-----+---------+-------+
| Field                | Type          | Null | Key | Default | Extra |
+----------------------+---------------+------+-----+---------+-------+
| PurchaseID           | varchar(30)   | NO   | PRI | NULL    |       |
| CustomerID           | varchar(10)   | NO   | MUL | NULL    |       |
| ProductID            | varchar(10)   | NO   | MUL | NULL    |       |
| PurchaseAmount       | decimal(10,2) | NO   |     | NULL    |       |
| Size                 | varchar(10)   | NO   |     | NULL    |       |
| Color                | varchar(20)   | NO   |     | NULL    |       |
| Season               | varchar(20)   | NO   |     | NULL    |       |
| ReviewRating         | decimal(3,2)  | NO   |     | NULL    |       |
| SubscriptionStatus   | varchar(50)   | NO   | MUL | NULL    |       |
| PaymentMethodID      | int           | NO   | MUL | NULL    |       |
| ShippingTypeID       | varchar(10)   | NO   | MUL | NULL    |       |
| DiscountApplied      | tinyint(1)    | NO   |     | NULL    |       |
| PromoCodeUsed        | tinyint(1)    | NO   |     | NULL    |       |
| PreviousPurchases    | int           | NO   |     | NULL    |       |
| FrequencyOfPurchases | varchar(50)   | NO   |     | NULL    |       |
+----------------------+---------------+------+-----+---------+-------+

INSERT INTO Category (CategoryID, CategoryName) 
VALUES 
('Cat_01', 'Accessories'),
('Cat_02', 'Clothing'),
('Cat_03', 'Footwear'),
('Cat_04', 'Outerwear');

select*from categories;

INSERT INTO Products (ProductID, ProductName, Category) 
VALUES 
('prod_01', 'Blouse', 'Clothing'), 
('prod_02', 'Coat', 'OuterWear'), 
('prod_03', 'Dress', 'Clothing'), 
('prod_04', 'HandBag', 'Accessories'),
('prod_05', 'Hat', 'Accessories'),
('prod_06', 'Hoodie', 'Clothing'),
('prod_07', 'Jeans', 'Clothing'),
('prod_08', 'Jewelry', 'Accessories'), 
('prod_09', 'Jacket', 'OuterWear'), 
('prod_10', 'Pants', 'Clothing'),
('prod_11', 'Sandals', 'Footwear'),
('prod_12', 'Scarf', 'Accessories'),
('prod_13', 'Shirt', 'Clothing'), 
('prod_14', 'Shorts', 'Clothing'),
('prod_15', 'Skirt', 'Clothing'),
('prod_16', 'Sneakers', 'Footwear'), 
('prod_17', 'Socks', 'Clothing'), 
('prod_18', 'Sunglasses', 'Accessories'), 
('prod_19', 'Sweater', 'Clothing'), 
('prod_20', 'T-shirt', 'Clothing'),
('prod_21', 'Shoes', 'Footwear');

select*from products;

INSERT INTO PaymentMethods (PaymentMethodID, PaymentMethodName) 
VALUES
(1,'Bank Transfer'),
(2,'Cash'),
(3,'Credit Card'),
(4,'Debit Card'),
(5,'Paypal'),
(6,'Venmo');

select*from  PaymentMethods;

INSERT INTO ShippingTypes (ShippingTypeID, ShippingTypeName) 
VALUES 
('ship_01', '2-Day Shipping'),
('ship_02', 'Express'), 
('ship_03', 'Free Shipping'), 
('ship_04', 'Next Day Air'),
('ship_05', 'Standard'), 
('ship_06', 'Store Pickup');

select*from shippingtypes;

INSERT INTO Subscriptions (SubscriptionID, SubscriptionStatus) 
VALUES 
('subs_01','YES'),
('subs_02','NO');

select*from subscriptions;


INSERT INTO customers (CustomerID, Age, Gender, Location, PreferredPaymentMethod, FrequencyOfPurchases) 
VALUES
     ('C01', 55, 'Male', 'Kentucky', 'Credit Card', 'Fortnightly'),
     ('C02', 19, 'Female', 'Maine', 'Bank Transfer', 'Fortnightly'),
     ('C03', 50, 'Male', 'Massachusetts', 'Cash', 'Weekly'),
     ('C04', 21, 'Female', 'Rhode Island', 'PayPal', 'Weekly'),
     ('C05', 45, 'Female', 'Oregon', 'Cash', 'Annually'),
     ('C06', 46, 'Male', 'Wyoming', 'Venmo', 'Weekly'),
     ('C07', 63, 'Female', 'Montana', 'Debit Card', 'Quarterly'),
     ('C08', 27, 'Male', 'Louisiana', 'Debit Card', 'Weekly'),
     ('C09', 26, 'Female', 'West Virginia', 'Venmo', 'Annually'),
     ('C10', 57, 'Male', 'Missouri', 'PayPal', 'Quarterly'),
     ('C11', 53, 'Male', 'Arkansas', 'Credit Card', 'Bi-Weekly'),
     ('C12', 30, 'Female', 'Hawaii', 'PayPal', 'Fortnightly'),
     ('C13', 61, 'Male', 'Delaware', 'PayPal', 'Fortnightly'),
     ('C14', 65, 'Female', 'New Hampshire', 'Debit Card', 'Weekly'),
     ('C15', 64, 'Male', 'New York', 'PayPal', 'Weekly'),
     ('C16', 64, 'Female', 'Rhode Island', 'Credit Card', 'Monthly'),
     ('C17', 25, 'Male', 'Alabama', 'Venmo', 'Bi-Weekly'),
     ('C18', 53, 'Female', 'Mississippi', 'Debit Card', 'Quarterly'),
     ('C19', 52, 'Male', 'Montana', 'Bank Transfer', 'Weekly'),
     ('C20', 66, 'Female', 'Rhode Island', 'Venmo', 'Bi-Weekly'),
     ('C21', 21, 'Female', 'Louisiana', 'Credit Card', 'Every 3 Months'),
     ('C22', 31, 'Male', 'North Carolina', 'Credit Card', 'Quarterly'),
     ('C23', 56, 'Female', 'California', 'Cash', 'Annually'),
     ('C24', 31, 'Male', 'Oklahoma', 'Credit Card', 'Weekly'),
     ('C25', 18, 'Female', 'Florida', 'Cash', 'Weekly'),
     ('C26', 18, 'Female', 'Texas', 'Bank Transfer', 'Annually'),
     ('C27', 38, 'Male', 'Nevada', 'Cash', 'Annually'),
     ('C28', 56, 'Female', 'Kentucky', 'Debit Card', 'Every 3 Months'),
     ('C29', 54, 'Male', 'North Carolina', 'Debit Card', 'Every 3 Months'),
     ('C30', 31, 'Female', 'Wyoming', 'Venmo', 'Weekly'),
     ('C31', 57, 'Male', 'North Carolina', 'Bank Transfer', 'Monthly'),
     ('C32', 33, 'Female', 'West Virginia', 'Venmo', 'Monthly'),
     ('C33', 36, 'Male', 'Kansas', 'Bank Transfer', 'Annually'),
     ('C34', 54, 'Male', 'Colorado', 'Venmo', 'Quarterly'),
     ('C35', 36, 'Female', 'North Dakota', 'Debit Card', 'Quarterly'),
     ('C36', 54, 'Male', 'Massachusetts', 'Bank Transfer', 'Bi-Weekly'),
     ('C37', 35, 'Male', 'Illinois', 'Cash', 'Fortnightly'),
     ('C38', 35, 'Male', 'Indiana', 'Debit Card', 'Weekly'),
     ('C39', 29, 'Male', 'Florida', 'Debit Card', 'Every 3 Months'),
     ('C40', 70, 'Male', 'Arizona', 'Bank Transfer', 'Monthly'),
     ('C41', 69, 'Female', 'Louisiana', 'PayPal', 'Quarterly'),
     ('C42', 67, 'Male', 'Alaska', 'Cash', 'Annually'),
     ('C43', 20, 'Female', 'Tennessee', 'Bank Transfer', 'Annually'),
     ('C44', 25, 'Male', 'Ohio', 'PayPal', 'Fortnightly'),
     ('C45', 39, 'Male', 'Kentucky', 'Bank Transfer', 'Weekly'),
     ('C46', 50, 'Male', 'Tennessee', 'Venmo', 'Annually'),
     ('C47', 57, 'Female', 'California', 'Venmo', 'Quarterly'),
     ('C48', 55, 'Female', 'Montana', 'Debit Card', 'Weekly'),
     ('C49', 42, 'Male', 'Nevada', 'Debit Card', 'Monthly'),
     ('C50', 68, 'Female', 'New Jersey', 'Bank Transfer', 'Bi-Weekly');

	 
INSERT INTO ReviewRatings (ReviewID, CustomerID, ProductID, Rating)
VALUES
     (1, 'C01', 'prod_01', 3.1),
     (2, 'C02', 'prod_19', 3.1),
     (3, 'C03', 'prod_07', 3.1),
     (4, 'C04', 'prod_11', 3.5),
     (5, 'C05', 'prod_01', 2.7),
     (6, 'C06', 'prod_16', 2.9),
     (7, 'C07', 'prod_13', 3.2),
     (8, 'C08', 'prod_14', 3.2),
     (9, 'C09', 'prod_02', 2.6),
     (10, 'C10', 'prod_04', 4.8),
     (11, 'C11', 'prod_21', 4.1),
     (12, 'C12', 'prod_14', 4.9),
     (13, 'C13', 'prod_02', 4.5),
     (14, 'C14', 'prod_03', 4.7),
     (15, 'C15', 'prod_02', 4.7),
     (16, 'C16', 'prod_15', 2.8),
     (17, 'C17', 'prod_18', 4.1),
     (18, 'C18', 'prod_03', 4.7),
     (19, 'C19', 'prod_19', 4.6),
     (20, 'C20', 'prod_10', 3.3),
     (21, 'C21', 'prod_10', 2.8),
     (22, 'C22', 'prod_10', 4.1),
     (23, 'C23', 'prod_10', 3.2),
     (24, 'C24', 'prod_10', 4.4),
     (25, 'C25', 'prod_09', 2.9),
     (26, 'C26', 'prod_06', 3.6),
     (27, 'C27', 'prod_08', 3.6),
     (28, 'C28', 'prod_14', 5),
     (29, 'C29', 'prod_04', 4.4),
     (30, 'C30', 'prod_03', 4.1),
     (31, 'C31', 'prod_08', 4.7),
     (32, 'C32', 'prod_03', 4.7),
     (33, 'C33', 'prod_09', 4.9),
     (34, 'C34', 'prod_10', 3.3),
     (35, 'C35', 'prod_20', 4.6),
     (36, 'C36', 'prod_01', 4),
     (37, 'C37', 'prod_20', 4.6),
     (38, 'C38', 'prod_07', 2.8),
     (39, 'C39', 'prod_03', 3.7),
     (40, 'C40', 'prod_10', 4.2),
     (41, 'C41', 'prod_04', 4.6),
     (42, 'C42', 'prod_12', 4.5),
     (43, 'C43', 'prod_02', 4.1),
     (44, 'C44', 'prod_12', 3.7),
     (45, 'C45', 'prod_05', 4.6),
     (46, 'C46', 'prod_17', 2.9),
     (47, 'C47', 'prod_13', 2.9),
     (48, 'C48', 'prod_08', 4.5),
     (49, 'C49', 'prod_13', 2.7),
     (50, 'C50', 'prod_06', 4.6);

select *from  ReviewRatings;

INSERT INTO purchases (
         PurchaseID,
         CustomerID,
         ProductID,
         PurchaseAmount_USD,
         Size,
         Color,
         Season,
         ReviewRating,
         SubscriptionStatus,
         PaymentMethodID,
         ShippingTypeID,
         DiscountApplied,
         PromoCodeUsed,
         PreviousPurchases,
         FrequencyOfPurchases)
VALUES
         ('P001', 'C01', 'prod_01', 53, 'L', 'Gray', 'Winter', 3.1, 'Yes', 3, 'ship_02', TRUE, TRUE, 14, 'Fortnightly'),
         ('P002', 'C02', 'prod_19', 64, 'L', 'Maroon', 'Winter', 3.1, 'Yes', 1, 'ship_02', TRUE, TRUE, 2, 'Fortnightly'),
         ('P003', 'C03', 'prod_07', 73, 'S', 'Maroon', 'Spring', 3.1, 'Yes', 2, 'ship_03', TRUE, TRUE, 23, 'Weekly'),
         ('P004', 'C04', 'prod_11', 90, 'M', 'Maroon', 'Spring', 3.5, 'Yes', 5, 'ship_04', TRUE, TRUE, 49, 'Weekly'),
         ('P005', 'C05', 'prod_01', 49, 'M', 'Turquoise', 'Spring', 2.7, 'Yes', 2, 'ship_03', FALSE, FALSE, 31, 'Annually'),
         ('P006', 'C06', 'prod_16', 20, 'M', 'White', 'Summer', 2.9, 'Yes', 6, 'ship_05', TRUE, TRUE, 14, 'Weekly'),
         ('P007', 'C07', 'prod_13', 85, 'M', 'Gray', 'Fall', 3.2, 'Yes', 4, 'ship_03', TRUE, TRUE, 49, 'Quarterly'),
         ('P008', 'C08', 'prod_14', 34, 'L', 'Charcoal', 'Winter', 3.2, 'Yes', 4, 'ship_03', TRUE, TRUE, 19, 'Weekly'),
         ('P009', 'C09', 'prod_02', 97, 'L', 'Silver', 'Summer', 2.6, 'Yes', 6, 'ship_02', FALSE, FALSE, 8, 'Annually'),
         ('P010', 'C10', 'prod_04', 31, 'M', 'Pink', 'Spring', 4.8, 'Yes', 5, 'ship_01', TRUE, TRUE, 4, 'Quarterly'),
         ('P011', 'C11', 'prod_21', 34, 'L', 'Purple', 'Fall', 4.1, 'Yes', 3, 'ship_06', TRUE, TRUE, 26, 'Bi-Weekly'),
         ('P012', 'C12', 'prod_14', 68, 'S', 'Olive', 'Winter', 4.9, 'Yes', 5, 'ship_06', FALSE, FALSE, 10, 'Fortnightly'),
         ('P013', 'C13', 'prod_02', 72, 'M', 'Gold', 'Winter', 4.5, 'Yes', 5, 'ship_02', TRUE, TRUE, 37, 'Fortnightly'),
         ('P014', 'C14', 'prod_03', 51, 'M', 'Violet', 'Spring', 4.7, 'Yes', 4, 'ship_02', TRUE, TRUE, 31, 'Weekly'),
         ('P015', 'C15', 'prod_02', 53, 'L', 'Teal', 'Winter', 4.7, 'Yes', 5, 'ship_03', TRUE, TRUE, 34, 'Weekly'),
         ('P016', 'C16', 'prod_15', 81, 'M', 'Teal', 'Winter', 2.8, 'Yes', 3, 'ship_06', FALSE, FALSE, 8, 'Monthly'),
         ('P017', 'C17', 'prod_18', 36, 'S', 'Gray', 'Spring', 4.1, 'Yes', 6, 'ship_04', TRUE, TRUE, 44, 'Bi-Weekly'),
         ('P018', 'C18', 'prod_03', 38, 'XL', 'Lavender', 'Winter', 4.7, 'Yes', 4, 'ship_01', TRUE, TRUE, 36, 'Quarterly'),
         ('P019', 'C19', 'prod_19', 48, 'S', 'Black', 'Summer', 4.6, 'Yes', 1, 'ship_03', TRUE, TRUE, 17, 'Weekly'),
         ('P020', 'C20', 'prod_10', 90, 'M', 'Green', 'Summer', 3.3, 'Yes', 6, 'ship_05', TRUE, TRUE, 46, 'Bi-Weekly'),
         ('P021', 'C21', 'prod_10', 51, 'M', 'Black', 'Winter', 2.8, 'Yes', 3, 'ship_02', TRUE, TRUE, 50, 'Every 3 Months'),
         ('P022', 'C22', 'prod_10', 62, 'M', 'Charcoal', 'Winter', 4.1, 'Yes', 3, 'ship_06', FALSE, FALSE, 22, 'Quarterly'),
         ('P023', 'C23', 'prod_10', 37, 'M', 'Peach', 'Summer', 3.2, 'Yes', 2, 'ship_06', TRUE, TRUE, 32, 'Annually'),
         ('P024', 'C24', 'prod_10', 88, 'XL', 'White', 'Winter', 4.4, 'Yes', 3, 'ship_02', TRUE, TRUE, 40, 'Weekly'),
         ('P025', 'C25', 'prod_09', 22, 'M', 'Green', 'Fall', 2.9, 'Yes', 2, 'ship_06', TRUE, TRUE, 16, 'Weekly'),
         ('P026', 'C26', 'prod_06', 25, 'M', 'Silver', 'Summer', 3.6, 'Yes', 1, 'ship_02', TRUE, TRUE, 14, 'Annually'),
         ('P027', 'C27', 'prod_08', 20, 'M', 'Red', 'Spring', 3.6, 'Yes', 2, 'ship_04', FALSE, FALSE, 13, 'Annually'),
         ('P028', 'C28', 'prod_14', 56, 'L', 'Cyan', 'Summer', 5, 'Yes', 4, 'ship_04', TRUE, TRUE, 7, 'Every 3 Months'),
         ('P029', 'C29', 'prod_04', 94, 'M', 'Gray', 'Fall', 4.4, 'Yes', 4, 'ship_03', TRUE, TRUE, 41, 'Every 3 Months'),
         ('P030', 'C30', 'prod_03', 48, 'S', 'Black', 'Fall', 4.1, 'Yes', 6, 'ship_06', TRUE, TRUE, 14, 'Weekly'),
         ('P031', 'C31', 'prod_08', 31, 'L', 'Black', 'Winter', 4.7, 'Yes', 1, 'ship_05', TRUE, TRUE, 16, 'Monthly'),
         ('P032', 'C32', 'prod_03', 79, 'L', 'Brown', 'Winter', 4.7, 'Yes', 6, 'ship_06', TRUE, TRUE, 45, 'Monthly'),
         ('P033', 'C33', 'prod_09', 67, 'M', 'Silver', 'Summer', 4.9, 'Yes', 1, 'ship_03', FALSE, FALSE, 37, 'Annually'),
         ('P034', 'C34', 'prod_10', 38, 'L', 'Green', 'Summer', 3.3, 'Yes', 6, 'ship_06', TRUE, TRUE, 45, 'Quarterly'),
         ('P035', 'C35', 'prod_20', 91, 'L', 'Violet', 'Spring', 4.6, 'Yes', 4, 'ship_01', TRUE, TRUE, 38, 'Quarterly'),
         ('P036', 'C36', 'prod_01', 33, 'M', 'Cyan', 'Summer', 4, 'Yes', 1, 'ship_01', TRUE, TRUE, 48, 'Bi-Weekly'),
         ('P037', 'C37', 'prod_20', 69, 'M', 'Maroon', 'Winter', 4.6, 'Yes', 2, 'ship_03', TRUE, TRUE, 44, 'Fortnightly'),
         ('P038', 'C38', 'prod_05', 71, 'L', 'Gray', 'Summer', 2.7, 'Yes', 3, 'ship_02', FALSE, FALSE, 45, 'Weekly'),
         ('P039', 'C39', 'prod_18', 53, 'XL', 'Turquoise', 'Winter', 4.9, 'Yes', 5, 'ship_04', TRUE, TRUE, 45, 'Every 3 Months');
         ('P040', 'C40', 'prod_10', 60, 'S', 'Turquoise', 'Summer', 4.2, 'Yes', 1, 'ship_02', TRUE, TRUE, 18, 'Monthly'),
         ('P041', 'C41', 'prod_04', 76, 'L', 'Beige', 'Winter', 4.6, 'Yes', 5, 'ship_04', TRUE, TRUE, 31, 'Quarterly'),
         ('P042', 'C42', 'prod_12', 39, 'M', 'Orange', 'Spring', 4.5, 'Yes', 2, 'ship_05', FALSE, FALSE, 40, 'Annually'),
         ('P043', 'C43', 'prod_02', 100, 'M', 'Beige', 'Spring', 4.1, 'Yes', 1, 'ship_03', TRUE, TRUE, 15, 'Annually'),
         ('P044', 'C44', 'prod_12', 69, 'L', 'Lavender', 'Fall', 3.7, 'Yes', 5, 'ship_06', TRUE, TRUE, 19, 'Fortnightly'),
         ('P045', 'C45', 'prod_05', 53, 'S', 'Silver', 'Summer', 4.6, 'Yes', 1, 'ship_03', TRUE, TRUE, 45, 'Weekly'),
         ('P046', 'C46', 'prod_17', 21, 'XL', 'Indigo', 'Fall', 2.9, 'Yes', 6, 'ship_01', TRUE, TRUE, 25, 'Annually'),
         ('P047', 'C47', 'prod_13', 43, 'L', 'White', 'Summer', 2.9, 'Yes', 6, 'ship_06', TRUE, TRUE, 45, 'Quarterly'),
         ('P048', 'C48', 'prod_08', 54, 'M', 'Charcoal', 'Winter', 4.5, 'Yes', 4, 'ship_03', FALSE, FALSE, 36, 'Weekly'),
         ('P049', 'C49', 'prod_13', 55, 'M', 'Orange', 'Summer', 2.7, 'Yes', 4, 'ship_06', TRUE, TRUE, 38, 'Monthly'),
         ('P050', 'C50', 'prod_06', 30, 'S', 'Indigo', 'Spring', 4.6, 'Yes', 1, 'ship_04', TRUE, TRUE, 34, 'Bi-Weekly');



