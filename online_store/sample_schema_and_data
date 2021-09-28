/* Sample schema as DDL */

-- Table `subscriptions`

DROP TABLE IF EXISTS online_store.subscriptions;

CREATE TABLE online_store.subscriptions (
	subscription_id int4 NULL,
	user_id int4 NULL,
	product_id int4 NULL,
	plan_id int4 NULL,
	price float4 NULL,
	status varchar NULL,
	next_billing_date date NULL,
	created_at timestamp NULL,
	trial_duration int4 NULL,
	canceled_at timestamp NULL
);

-- Table `app`

DROP TABLE IF EXISTS online_store.app;

CREATE TABLE online_store.app (
	product_id int4 NULL,
	"name" varchar NULL,
	description varchar NULL,
	category_id int4 NULL
);

-- Table `app_category`

DROP TABLE IF EXISTS online_store.app_category;

CREATE TABLE online_store.app_category (
	id int4 NULL,
	description varchar NULL,
	"name" varchar NULL
);

-- Table `payments`

DROP TABLE IF EXISTS online_store.payments;

CREATE TABLE online_store.payments (
	subscription_id int4 NULL,
	payment_id int4 NULL,
	user_id int4 NULL,
	product_id int4 NULL,
	amount float4 NULL,
	payment_status varchar NULL,
	payment_timestamp timestamp NULL
);

/* Sample data as DML */

-- Sample data for table `subscriptions`

INSERT INTO online_store.subscriptions
(subscription_id, user_id, product_id, plan_id, price, status, next_billing_date, created_at, trial_duration, canceled_at)
VALUES 
	(1, 1, 1, 1, 10, 'Canceled', '2021-12-31', '2021-01-01', 30, '2021-09-01'),
	(2, 1, 2, 2, 15, 'Canceled', '2021-12-31', '2021-01-01', 30, '2021-09-01'),
	(3, 2, 1, 1, 20, 'Canceled', '2021-12-31', '2021-01-01', 30, '2021-09-01'),
	(4, 2, 3, 2, 30, 'Canceled', '2021-12-31', '2021-01-01', 30, '2021-10-01'),
	(5, 3, 2, 1, 25, 'Active', '2021-12-31', '2021-01-01', 30, null),
	(6, 4, 4, 1, 10, 'Active', '2021-12-31', '2021-01-01', 30, null),
	(7, 3, 5, 3, 50, 'Active', '2021-12-31', '2021-01-01', 30, null),
	(8, 4, 6, 3, 25, 'Active', '2021-12-31', '2021-01-01', 30, null),
	(9, 4, 7, 3, 45, 'Active', '2021-12-31', '2021-01-01', 30, null),
	(10, 4, 8, 3, 55, 'Active', '2021-12-31', '2021-01-01', 30, null),
	(11, 1, 2, 1, 10, 'Active', '2021-12-31', '2021-09-01', 30, null),
	(12, 2, 2, 1, 30, 'Active', '2021-12-31', '2021-09-01', 30, null);

-- Sample data for table `app`

INSERT INTO online_store.app
(product_id, "name", description, category_id)
VALUES
	(1, 'Product1', '', 1),
	(2, 'Product2', '', 1),
	(3, 'Product3', '', 2),
	(4, 'Product4', '', 2),
	(5, 'Product5', '', 3),
	(6, 'Product6', '', 3),
	(7, 'Product7', '', 3),
	(8, 'Product8', '', 3);

-- Sample data for table `app_category`

INSERT INTO online_store.app_category
(id, description, "name")
VALUES
	(1, 'Description of Category A', 'CategoryA'),
	(2, 'Description of Category B', 'CategoryB'),
	(3, 'Description of Category C', 'CategoryC');

-- Sample data for table `payments`

INSERT INTO online_store.payments
(subscription_id, payment_id, user_id, product_id, amount, payment_status, payment_timestamp)
VALUES
	(1, 1, 1, 1, 10.00, 'Done', '2021-01-01'),
	(2, 2, 1, 2, 10.00, 'Done', '2021-01-01'),
	(2, 3, 1, 2, 5.00, 'Done', '2021-01-01'),
	(3, 4, 2, 1, 10.00, 'Done', '2021-01-01'),
	(3, 5, 2, 1, 10.00, 'Done', '2021-01-01'),
	(4, 6, 2, 3, 15.00, 'Done', '2021-01-01'),
	(4, 7, 2, 3, 15.00, 'Done', '2021-01-01'),
	(5, 8, 3, 2, 20.00, 'Done', '2021-01-01'),
	(5, 9, 3, 2, 5.00, 'Done', '2021-01-01'),
	(6, 10, 4, 4, 10.00, 'Done', '2021-01-01'),
	(7, 11, 3, 5, 25.00, 'Done', '2021-01-01'),
	(7, 12, 3, 5, 25.00, 'Done', '2021-01-01'),
	(8, 13, 4, 6, 20.00, 'Done', '2021-01-01'),
	(8, 14, 4, 6, 5.00, 'Done', '2021-09-01'),
	(9, 15, 4, 7, 45.00, 'Processing', '2021-09-27'),
	(10, 16, 4, 8, 55.00, 'Processing', '2021-09-28');
