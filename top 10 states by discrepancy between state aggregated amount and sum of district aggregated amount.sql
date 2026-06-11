WITH state_agg AS
(
SELECT state, 
	   SUM(Transaction_amount) AS State_level_trans_amount 
FROM agg_trans 
GROUP BY state
),
district_agg AS 
(
SELECT state, 
	   SUM(Transaction_amount) AS District_level_trans_amount 
FROM map_trans 
GROUP BY state
)
SELECT s.state, 
	   s.State_level_trans_amount, 
	   d.District_level_trans_amount, 
	   ABS(s.State_level_trans_amount - d.District_level_trans_amount) AS discrepancy
FROM state_agg AS s
JOIN district_agg AS d
ON s.state = d. state
ORDER BY discrepancy DESC
LIMIT 10;