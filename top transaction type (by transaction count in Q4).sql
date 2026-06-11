SELECT transaction_type,
	   quarter,
       SUM(transaction_count) as total_transactions
FROM agg_trans
WHERE quarter = 4
GROUP BY transaction_type
ORDER BY total_transactions DESC
LIMIT 1;