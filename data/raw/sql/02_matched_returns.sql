-- To start this analysis, I needed to know in the ecomm sales, which transactions used the feature
-- This required that I match the GA4 transactions with the Ecomm transactions
WITH cte_ecomm_sales AS (
SELECT
	et.transaction_id,
	et.user_id, --normall email but for privacy and for this exercise I am just using random numbers
	CONCAT(et.transaction_id, '-', et.sku, '-', et.size,'-',et.color) AS sales_uid,
	et.size,
	et.color,
	et.sku,
	et.date,
	et.product_name,
	CASE WHEN ga.transaction_id IS NOT NULL THEN 1
		ELSE 0
	END AS used_feature
FROM ecommtransactions AS et
	LEFT JOIN ga4event as ga
	ON et.transaction_id = ga.transaction_id
),
/*SELECT 
	count(*)
FROM cte_ga4_ecommtrans
WHERE used_feature = 0*/

-- now I am joining ecomm and retail returns so I can concat the parent order number into one place
cte_all_returns AS (
SELECT -- 900 rows
	date AS return_date,
	return_transaction_id,
	CONCAT(parent_order_number, '-', sku, '-', size, '-', colour) AS return_uid,
	sku,
	product_name,
	size,
	colour,
	parent_order_number,
	'ecomm' AS return_channel
FROM ecommreturns

UNION ALL

SELECT --540 rows
	sales_date AS return_date,
	transaction_id AS return_transaction_id,
	CONCAT(original_transaction_id, '-', sku, '-', size, '-', colour) AS return_uid,
	sku,
	product_name,
	size,
	colour,
	original_transaction_id,
	'retail' AS return_channel
FROM retailreturns
WHERE transaction_type = 'return'
),
cte_matched_returns AS (
SELECT
	r.return_date,
	r.return_transaction_id,
	r.return_uid,
	r.sku,
	r.product_name,
	r.size,
	r.colour,
	r.return_channel,
	s.sales_uid,
	s.transaction_id AS parent_transaction_id,
	s.date AS purchase_date,
	s.used_feature,
	s.user_id
FROM cte_all_returns AS r
	LEFT JOIN cte_ecomm_sales AS s
	ON r.return_uid = s.sales_uid
)
SELECT
	mr.*,
	vrr.return_status,
	vrr.return_reason
FROM cte_matched_returns AS mr
	LEFT JOIN vendorreturnreasons AS vrr
	ON mr.parent_transaction_id = vrr.original_order_number


