SELECT 
    state,
    region,
    SUM(transaction_amount) AS total_transaction_amount
FROM
    agg_trans
GROUP BY state , region
ORDER BY total_transaction_amount DESC
LIMIT 5;