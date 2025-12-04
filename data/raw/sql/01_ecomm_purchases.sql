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
	ON et.transaction_id = ga.transaction_id;