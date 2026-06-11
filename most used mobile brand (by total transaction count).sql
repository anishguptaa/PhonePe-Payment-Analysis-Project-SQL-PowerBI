SELECT 
    brand, SUM(transaction_count) AS total_transaction_count
FROM
    agg_user
GROUP BY brand
ORDER BY total_transaction_count DESC
LIMIT 1;