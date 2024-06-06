-- Salespersons Table Creation
create table salespersons_aldag(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	address VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(50),
	zip_code VARCHAR(50),
	phone_number VARCHAR(15),
	email_address VARCHAR(150),
	shift VARCHAR(150),
	salary NUMERIC(8,2),
	commission NUMERIC(8,2),
	total_pay NUMERIC(10,2)
);

-- Cars Table Creation
create table cars_aldag(
	car_serial_number SERIAL primary key,
	vehicle_identification_number VARCHAR(150),
	make VARCHAR(100),
	model VARCHAR(100),
	car_year VARCHAR(4),
	color VARCHAR(50),
	new_or_used VARCHAR(50),
	for_sale VARCHAR(1)
);

-- Customers Table Creation
create table customers_aldag(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	address VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(50),
	zip_code VARCHAR(50),
	phone_number VARCHAR(15),
	email_address VARCHAR(150)
);

-- Mechanics Table Creation
create table mechanics_aldag(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	address VARCHAR(100),
	city VARCHAR(100),
	state VARCHAR(50),
	zip_code VARCHAR(50),
	phone_number VARCHAR(15),
	email_address VARCHAR(150),
	shift VARCHAR(150),
	salary NUMERIC(8,2)
);

-- Parts Table Creation
create table parts_aldag(
	part_id SERIAL primary key,
	part_number VARCHAR(150),
	purchase_price NUMERIC(8,2),
	retail_price NUMERIC(8,2)
);

-- Car Sales Table Creation
create table car_sales_aldag(
	sale_invoice_id SERIAL primary key,
	sale_date DATE,
	sale_amount NUMERIC(10,2),
	car_serial_number INTEGER not null,
	customer_id INTEGER not null,
	salesperson_id INTEGER not null,
	foreign key(car_serial_number) references cars_aldag(car_serial_number),
	foreign key(customer_id) references customers_aldag(customer_id),
	foreign key(salesperson_id) references salespersons_aldag(salesperson_id)
);

-- Service Tickets Table Creation
create table service_tickets_aldag(
	service_ticket_id SERIAL primary key,
	service_date DATE,
	service_total_amount NUMERIC(8,2),
	car_serial_number INTEGER not null,
	customer_id INTEGER not null,
	foreign key(car_serial_number) references cars_aldag(car_serial_number),
	foreign key(customer_id) references customers_aldag(customer_id)
);

-- Parts Used Table Creation
create table parts_used_aldag(
	parts_used_id SERIAL primary key,
	number_used INTEGER,
	part_id INTEGER not null,
	service_ticket_id INTEGER not null,
	foreign key(part_id) references parts_aldag(part_id),
	foreign key(service_ticket_id) references service_tickets_aldag(service_ticket_id)
);

-- Mechanic Service History Table Creation
create table mechanic_service_history_aldag(
	mechanic_service_id SERIAL primary key,
	service_provided VARCHAR(500),
	hours_spent NUMERIC(5,2),
	service_amount NUMERIC(8,2),
	service_ticket_id INTEGER not null,
	mechanic_id INTEGER not null,
	foreign key(service_ticket_id) references service_tickets_aldag(service_ticket_id),
	foreign key(mechanic_id) references mechanics_aldag(mechanic_id)
);