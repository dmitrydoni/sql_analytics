/* Product and category info by app, active subscriptions only */
WITH
	active_subscriptions AS (
		SELECT 
			product_id,
			COUNT(subscription_id) AS subscriptions_count
		FROM
			subscriptions
		WHERE 
			status = 'Active' 
			AND created_at < now()
		GROUP BY 
			product_id
	),
	product_category AS (
		SELECT 
			a.product_id AS product_id,
			a."name" AS product_name,
			ac.id AS category_id,
			ac.description AS category_description
		FROM 
			app a
			LEFT JOIN app_category ac ON a.category_id = ac.id
	)
	
SELECT
	pc.product_id,
	product_name,
	category_id,
	category_description,
	subscriptions_count
FROM
	product_category pc
	JOIN active_subscriptions acts ON pc.product_id = acts.product_id;

/* Users and payments for canceled subscriptions, by plan */
WITH
	canceled_subscriptions AS (
		SELECT 
			subscription_id,
			user_id,
			plan_id
		FROM
			subscriptions
		WHERE 
			status = 'Canceled' 
			AND canceled_at < now() 
	),
	subscription_payments AS (
		SELECT 
			subscription_id,
			SUM(amount) AS payments_total,
			COUNT(amount) AS payments_count
		FROM 
			payments
		GROUP BY subscription_id
	)
	
SELECT
	plan_id,
	COUNT(DISTINCT cs.user_id) AS users_count,
	SUM(payments_total) AS payments_total,
	SUM(payments_count) AS payments_count
FROM 
	canceled_subscriptions cs
	LEFT JOIN subscription_payments sp ON cs.subscription_id = sp.subscription_id
GROUP BY plan_id
ORDER BY plan_id;

/* Top 10 products by total payment amount */
WITH 
	products_payments AS (
		SELECT 
			a.product_id, 
			a."name" AS product_name,
			amount
		FROM 
			app a 
		LEFT JOIN payments p ON a.product_id = p.product_id
	)
	
SELECT
	product_name,
	sum(amount) AS total_payments
FROM 
	products_payments
GROUP BY 
	product_name
ORDER BY 
	total_payments DESC
LIMIT 10;


/* Top 3 products by total payment amount in each category */
WITH
	product_category AS (
		SELECT 
			a.product_id, 
			a.name AS product_name,
			ac."name" AS category_name
		FROM 
			app a
			LEFT JOIN app_category ac ON a.category_id = ac.id
	),
	product_payments AS (
		SELECT 
			a.product_id, 
			a.name AS product_name,
			SUM(amount) AS payments_total
		FROM 
			app a 
			LEFT JOIN payments p ON a.product_id = p.product_id
		GROUP BY a.product_id, product_name
	)

SELECT 
	category_name,
	product_name,
	payments_total,
	product_rank
FROM ( 
	SELECT
		category_name,
		pc.product_name,
		payments_total,
		RANK() OVER (
			PARTITION BY category_name
			ORDER BY payments_total DESC
		) AS product_rank
	FROM 
		product_category pc 
		LEFT JOIN product_payments pp ON pc.product_id = pp.product_id
) product_ranks
WHERE product_rank BETWEEN 1 AND 3 
ORDER BY category_name;

