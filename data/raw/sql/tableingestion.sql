-- Creating the ecomm_returns table
DROP TABLE IF EXISTS ecommreturns;

CREATE TABLE ecommreturns (
	date DATE,
	return_transaction_id VARCHAR(255),
	user_id VARCHAR(255),
	sku VARCHAR(255),
	product_name  VARCHAR(255),
	size VARCHAR(255),
	colour  VARCHAR(255),
	parent_order_number  VARCHAR(255),
	region  VARCHAR(255)
);

SELECT *
	FROM ecommreturns;

---------------------------------------------------
DROP TABLE IF EXISTS retailreturns;

CREATE TABLE retailreturns (
    sales_date DATE,
    transaction_id VARCHAR(255) PRIMARY KEY,
    user_id VARCHAR(255),
    sku VARCHAR(100),
	product_name VARCHAR(255),
    size VARCHAR(50),
    colour VARCHAR(100),
    amount DECIMAL(10,2),
    store_id VARCHAR(100),
    region VARCHAR(100),
    original_transaction_id VARCHAR(255),
    transaction_type VARCHAR(50)
);

SELECT *
	FROM retailreturns;

---------------------------------------------------
DROP TABLE IF EXISTS ecommtransactions;

CREATE TABLE ecommtransactions(
	date DATE,
	transaction_id VARCHAR(255),
	user_id VARCHAR(255),
	sku VARCHAR(100),
	product_name VARCHAR(255),
	size VARCHAR(100),
	color VARCHAR(100),
	amount DECIMAL(10,2),
	region VARCHAR(10)
);

SELECT *
	FROM ecommtransactions;

--------------------------------------------------
DROP TABLE IF EXISTS GA4event;

CREATE TABLE GA4event (
	event_id VARCHAR(255),
	date DATE,
	transaction_id VARCHAR(255),
	user_id VARCHAR(255), 
	sku VARCHAR(100),
	size VARCHAR(100),
	colour VARCHAR(100),
	event_name VARCHAR(255),
	region VARCHAR(10)
);

SELECT *
	FROM GA4event
	LIMIT 10;

-------------------------------------------------
DROP TABLE IF EXISTS vendorreturnreasons;

CREATE TABLE vendorreturnreasons (
	rma_number VARCHAR(255),
	original_order_number VARCHAR(255),
	return_date VARCHAR(255),
	return_reason VARCHAR(255),
	return_status VARCHAR(255)
)

SELECT *
	FROM vendorreturnreasons
	LIMIT 10

-------------------------------------------------
DROP TABLE IF EXISTS retailsales;

CREATE TABLE retailsales (
	sales_date DATE,
    transaction_id VARCHAR(255),
    user_id VARCHAR(255),
    sku VARCHAR(100),
	product_name VARCHAR(255),
    size VARCHAR(50),
    colour VARCHAR(100),
    amount DECIMAL(10,2),
    store_id VARCHAR(100),
    region VARCHAR(100),
    original_transaction_id VARCHAR(255),
    transaction_type VARCHAR(50)
);

SELECT *
	FROM retailsales
	LIMIT 10


