WITH ranked AS
(SELECT *
 FROM (SELECT state, 
			  district,
			  year,
			  SUM(transaction_amount) AS Total_amount,
			  DENSE_RANK() OVER(PARTITION BY state, year ORDER BY SUM(transaction_amount) DESC) AS rnk
	    FROM map_trans
		GROUP BY district, state, year) AS t
 WHERE rnk <=3)
SELECT state,
	   district,
	   COUNT(DISTINCT year) as consistency
FROM ranked
GROUP BY state, district
ORDER BY state, consistency;