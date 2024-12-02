-- Sets the schema being used to normalized_database
use normalized_database;

-- Creates a table called Car that contains data for the car_id, make, model, car_year, and some foreign data like designer_id, and dealership_id
Create Table Car (
car_id int not null,
make varchar(250),
model varchar(250),
car_year int,
designer_id int not null,
dealership_id int not null,
Primary Key (car_id),
Foreign Key (designer_id) References Designer(designer_id),
Foreign Key (dealership_id) References Dealership(dealership_id)
);

-- Creates a table called Designer that contains data for designer_id and designer name
Create Table Designer (
designer_id int not null,
desinger_name varchar(250),
Primary Key (designer_id)
);

-- Creates a table called Dealership that contains data for dealership_id, dealership_name, and dealership_location
Create Table Dealership (
dealership_id int not null,
dealership_name varchar(250),
dealership_location varchar(250),
Primary Key (dealership_id)
);

-- Creates a table called Customer that contains data for customer_id and customer_name
Create Table Customer (
customer_id int not null,
customer_name varchar(250),
Primary Key (customer_id)
);

-- Creates a table called PurchaseRecords that contains data for purchase_id, purchase_date, total_cost, and some foreign data like car_id, and customer_id
Create Table PurchaseRecords (
purchase_id int not null,
car_id int not null,
customer_id int not null,
purchase_date date,
total_cost dec(10,2),
Primary Key (purchase_id),
Foreign Key (car_id) References Car(car_id),
Foreign Key (customer_id) References Customer(customer_id)
);

-- This inserts all the data for the desinger_id and designer_name column inside the Designer table
Insert Into Designer (designer_id, desinger_name)
Values
(1, 'Frank Lamberty'),
(2, 'Julian Hoenig'),
(3, 'Seungmo Lim'),
(4, 'Magna Steyr'),
(5, 'Harley Earl'),
(6, 'Harvey J. Winn'),
(7, 'Flavio Manzoni'),
(8, 'Laurens van den Acker'),
(9, 'Gordon Platto'),
(10, 'Linda Zhang'),
(11, 'Kunimichi Odagaki'),
(12, 'Hiroyuki Odagaki');

-- This inserts all the data for the dealership_id, dealership_name, and dealership_location column inside the Dealership table
Insert Into Dealership (dealership_id, dealership_name, dealership_location)
Values
(1, 'Niello Audio', 'Sacramento, CA'),
(2, 'Audi Elk Grove', 'Elk Grove, CA'),
(3, 'BMW of Roseville', 'Roseville, CA'),
(4, 'BMW of Roseville', 'Roseville, CA'),
(5, 'Future Chevrolet', 'Sacramento, CA'),
(6, 'Elk Grove Dodge Chrysler Jeep Ram', 'Elk Grove, CA'),
(7, 'Ferrari Silicon Valley', 'Redwood, CA'),
(8, 'Folsom Lake Ford', 'Folsom, CA'),
(9, 'Downtown Ford Sacramento', 'Sacramento, CA'),
(10, 'Downtown Ford Sacramento', 'Sacramento, CA'),
(11, 'Future Honda', 'Citrus Heights, CA'),
(12, 'Future Honda', 'Citrus Heights, CA');

-- This inserts all the data for the car_id, make, model, car_year, designer_id, and dealership_id column inside the Car table
Insert Into Car (car_id, make, model, car_year, designer_id, dealership_id)
Values
(1, 'Audi', 'R8', 2023, 1, 1),
(2, 'Audi', 'Q3', 2025, 2, 2),
(3, 'BMW', 'i4', 2024, 3, 3),
(4, 'BMW', 'X3', 2025, 4, 4),
(5, 'Chevrolet', 'Corvette', 2025, 5, 5),
(6, 'Dodge', 'Charger', 2024, 6, 6),
(7, 'Ferrari', 'Roma', 2023, 7, 7),
(8, 'Ford', 'Escape', 2025, 8, 8),
(9, 'Ford', 'Explorer', 2025, 9, 9),
(10, 'Ford', 'F150 Lighning', 2023, 10, 10),
(11, 'Honda', 'Odyssey', 2024, 11, 11),
(12, 'Honda', 'CR-V', 2024, 12, 12);

-- This inserts all the data for the customer_id and customer_name column inside the Customer table
Insert Into Customer (customer_id, customer_name)
Values
(1, 'Mandy Christensen'),
(2, 'Harriett Kidd'),
(3, 'Justin Mendez'),
(4, 'Cassie Parks'),
(5, 'Veronica Byrd'),
(6, 'Kristofer Chung'),
(7, 'Aurelio Porter'),
(8, 'Luther Montgomery'),
(9, 'Freeman McKnight'),
(10, 'Lacy French'),
(11, 'Coleen Collier'),
(12, 'Donny Williams');

-- This inserts all the data for the purchase_id, car_id, customer_id, purchase_date, and total_cost column inside the PurchaseRecords table
Insert Into PurchaseRecords (purchase_id, car_id, customer_id, purchase_date, total_cost)
Values
(1, 9, 7, ('2023-1-19'), 39755),
(2, 3, 6, ('2023-5-10'), 52200),
(3, 1, 4, ('2023-8-8'), 158600),
(4, 11, 9, ('2024-10-4'), 28240),
(5, 6, 1, ('2024-5-22'), 59595),
(6, 2, 5, ('2023-8-31'), 37400),
(7, 4, 2, ('2023-12-22'), 49500),
(8, 12, 3, ('2024-4-29'), 29500),
(9, 10, 12, ('2024-3-15'), 49995),
(10, 7, 8, ('2024-2-14'), 243360),
(11, 8, 10, ('2024-2-7'), 27995),
(12, 5, 11, ('2024-1-12'), 68300);

-- This will select all of the purchases and link them to the customer that made the purchase and the car that they purchased as well as some information about there purchase like purchase_date and total_cost
Select purchase_id, customer_name, car_year, make, model, purchase_date, total_cost
From PurchaseRecords
Inner Join Customer
On Customer.customer_id = PurchaseRecords.customer_id
Inner Join Car
On Car.car_id = PurchaseRecords.car_id;

-- This will select all of the purchases that exceed or are equal to $50,000 in terms of total cost and link it to the customer_name
Select purchase_id, total_cost, customer_name, purchase_date
From PurchaseRecords
Inner Join Customer
On Customer.customer_id = PurchaseRecords.customer_id
-- This is where the selection gets limited to the purchases that exceeded or are equal to $50,000 in terms of total cost 
Where total_cost >= 50000;

-- This will select all of the purchases that where made after the 31st of December, 2023 and provide the customer name for that purchase
Select n.purchase_id, n.purchase_date, s.customer_name
From PurchaseRecords n
Inner Join Customer s
On s.customer_id = n.customer_id
-- This is where the selection gets limited to the purchases that were made after the 31st of December, 2023
Where purchase_date > '2023-12-31';