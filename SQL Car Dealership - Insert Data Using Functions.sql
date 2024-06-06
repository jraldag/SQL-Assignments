-- Stored Function to Add a Customer 
create or replace function add_customers_aldag(
	_customer_id INTEGER,
	_first_name VARCHAR(100),
	_last_name VARCHAR(150),
	_address VARCHAR(100),
	_city VARCHAR(100),
	_state VARCHAR(50),
	_zip_code VARCHAR(50),
	_phone_number VARCHAR(15),
	_email_address VARCHAR(150)
)
returns void
as $MAIN$
begin 
	insert into customers_aldag(customer_id, first_name, last_name, address, city, state, zip_code, phone_number, email_address)
	VALUES(_customer_id, _first_name, _last_name, _address, _city, _state, _zip_code, _phone_number, _email_address);
end;
$MAIN$
language plpgsql;

select add_customers_aldag(5, 'Michael', 'Jordan', '1 GOAT Road', 'Chicago', 'IL', '23232', '232-232-2323', 'mjthegoat@nba.com');

select add_customers_aldag(6, 'Larry', 'Bird', '1 Celtic Drive', 'Boston', 'MA', '11111', '867-530-9867', 'larrylegend@nba.com');


-- Stored Function to Add a Car
create or replace function add_cars_aldag(
	_car_serial_number INTEGER,
	_vehicle_identification_number VARCHAR(150),
	_make VARCHAR(100),
	_model VARCHAR(100),
	_car_year VARCHAR(4),
	_color VARCHAR(50),
	_new_or_used VARCHAR(50),
	_for_sale VARCHAR(1)
)
returns void
as $MAIN$
begin 
	insert into cars_aldag(car_serial_number, vehicle_identification_number, make, model, car_year, color, new_or_used, for_sale)
	VALUES(_car_serial_number, _vehicle_identification_number, _make, _model, _car_year, _color, _new_or_used, _for_sale);
end;
$MAIN$
language plpgsql;

select add_cars_aldag(108, '4444444444', 'Dodge', 'Dakota', '2015', 'Black', 'Used', 'Y');


-- Stored Function to Add a Part
create or replace function add_parts_aldag(
	_part_id INTEGER,
	_part_number VARCHAR(150),
	_purchase_price NUMERIC(8,2),
	_retail_price NUMERIC(8,2)
)
returns void
as $MAIN$
begin 
	insert into parts_aldag(part_id, part_number, purchase_price, retail_price)
	VALUES(_part_id, _part_number, _purchase_price, _retail_price);
end;
$MAIN$
language plpgsql;

select add_parts_aldag(5, '2', 50.50, 80.75);

