WITH yearly_users AS   -- To calculate the total users registered per year
(SELECT state, 
	    year, 
        SUM(registered_users) as total_users
FROM map_user
GROUP BY state, Year),
growth AS              -- To calculate the growth rate of every year
(SELECT y.*,
		ROUND((total_users - LAG(total_users) OVER(PARTITION BY state ORDER BY year))*100/
        LAG(total_users) OVER(PARTITION BY state ORDER BY year), 2) as growth_rate
from yearly_users AS y)
SELECT state,          -- To extract growth rate of 2021 vs 2022 with ranks
	   year,
       growth_rate,
       RANK() OVER(ORDER BY growth_rate desc) as rnk
FROM growth
WHERE year = 2022;