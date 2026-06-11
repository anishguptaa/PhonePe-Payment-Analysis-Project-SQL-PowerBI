SELECT 
    SUM(Transaction_count) AS Total_No_Of_Transactions,
    SUM(Transaction_amount) AS Total_transaction_amount
FROM
    agg_trans;