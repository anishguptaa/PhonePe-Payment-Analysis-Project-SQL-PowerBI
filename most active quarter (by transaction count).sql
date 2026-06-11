SELECT 
    quarter, SUM(Transaction_count) AS total_transaction_count
FROM
    agg_trans
GROUP BY quarter
ORDER BY total_transaction_count DESC
LIMIT 1;