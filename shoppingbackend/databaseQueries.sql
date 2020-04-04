CREATE TABLE category (

	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_URL VARCHAR(50),
	is_active BOOLEAN,
	
	CONSTRAINT pk_category_id PRIMARY KEY (id)

);

SELECT * FROM CATEGORY

INSERT INTO category (name,description,image_url,is_active) VALUES ('Television','this is description of Television category','CAT_1.PNG', true);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Laptop','this is description of Laptop category','CAT_2.PNG', true);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Mobile','this is description of Mobile category','CAT_3.PNG', true);

CREATE TABLE user_details(
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(50),
	email VARCHAR(100),
	contact_number VARCHAR(15),
	CONSTRAINT pk_user_id PRIMARY KEY(id),
);

INSERT INTO user_details
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Shubham','Kulthe','ADMIN',true,'admin','kulthe152@gmail.com','7841080108');

INSERT INTO user_details
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Suraj','Bedre','SUPPLIER',true,'12345','surajb@gmail.com','9999999999');

INSERT INTO user_details
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Akash','Nalawade','SUPPLIER',true,'12345','akashn@gmail.com','8888888888');


CREATE TABLE product(
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(250),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category(id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_details(id),
);

INSERT INTO product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id)
VALUES('PRDABC123DEFX','Iphone 5s','Apple','This is one of best phone available in the market right now',57000,5,true,3,2);

INSERT INTO product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id)
VALUES('PRDDEF123DEFX','Samsung A10s','Samsung','A smart phone by Samsung',32000,2,true,3,2);

INSERT INTO product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id)
VALUES('PRDPQR123WGTX','Google Pixel','Google','This is one of best Android phone available in the market right now',39000,4,true,3,2);

INSERT INTO product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id)
VALUES('PRDMNO123PQRX','Macbook pro','Apple','This is one of best laptop available in the market right now',54000,3,true,1,3);

INSERT INTO product(code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id)
VALUES('PRDABCXYZDEFX','Dell Latitude E6510','Dell','This is one of best laptop series from dell that can used',48000,5,true,1,3);





