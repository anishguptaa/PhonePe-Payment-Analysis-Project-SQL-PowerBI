WITH total_amount AS                     -- for Calculating the total trans amount for India in each year
(SELECT year,
	    SUM(Transaction_amount) as yearly_amount
 FROM agg_trans
 GROUP BY year),
amount_per_type AS                       -- for Calculating the total trans amount for each transaction type
(SELECT transaction_type,
		year,
        SUM(Transaction_amount) AS type_amount
 FROM agg_trans
 GROUP BY transaction_type, year),
percent AS                               -- for Calculating percentage contribution
(SELECT ty.transaction_type,
		ty.year,
        ty.type_amount,
        tot.yearly_amount,
        ROUND(ty.type_amount*100 / tot.yearly_amount, 2) AS percent_contribution
FROM amount_per_type AS ty
LEFT JOIN total_amount AS tot
ON ty.year = tot.year),
comparison AS                            -- for Comparing pct of 2019 and 2022
(SELECT transaction_type,
	   MAX(CASE WHEN year = 2019 THEN percent_contribution END) AS pct_2019,
       MAX(CASE WHEN year = 2022 THEN percent_contribution END) AS pct_2022
FROM percent
GROUP BY transaction_type)
SELECT transaction_type,                 -- for calculating the shift and displaying type with greatest shift
	   pct_2019,
       pct_2022,
       ABS(pct_2022 - pct_2019) AS shift
FROM comparison
ORDER BY shift DESC
LIMIT 1;