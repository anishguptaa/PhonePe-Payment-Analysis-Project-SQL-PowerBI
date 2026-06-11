WITH brand_users AS					-- for calculating quarter wise brand users
(
    SELECT Year,
           Quarter,
           Brand,
           SUM(Transaction_count) AS brand_users
    FROM agg_user
    GROUP BY Year, Quarter, Brand
),
quarter_totals AS					-- for calculating quarter wise total users
(
    SELECT Year,
           Quarter,
           SUM(Transaction_count) AS total_users
    FROM agg_user
    GROUP BY Year, Quarter
),
market_share AS						-- for calculating quarter wise market share of each brand
(
    SELECT b.Year,
           b.Quarter,
           b.Brand,
           ROUND(b.brand_users * 100.0 / q.total_users, 4) AS market_share_pct
    FROM brand_users b
    JOIN quarter_totals q
    ON b.Year = q.Year AND b.Quarter = q.Quarter
),
baseline AS							-- retrieving the market share in 2018 Q1 as baseline
(
    SELECT Brand,
           market_share_pct AS baseline_share
    FROM market_share
    WHERE Year = 2018 AND Quarter = 1
),
latest AS							-- retrieving the market share in 2022 Q1 as latest timeline
(
    SELECT Brand,
           market_share_pct AS share_2022_q1
    FROM market_share
    WHERE Year = 2022 AND Quarter = 1
),
cumulative_change AS				-- calculating cumulative change in market share quarter-by-quarter
(
	SELECT m.Brand,
		   m.Year,
		   m.Quarter,
		   b.baseline_share,
		   m.market_share_pct,
		   ROUND(m.market_share_pct - b.baseline_share, 4) AS change_from_baseline
	FROM market_share m
	JOIN baseline b
	ON m.Brand = b.Brand
	ORDER BY m.Brand, m.Year, m.Quarter
)
SELECT b.Brand,						-- calculating net change in market share b/w 2018 Q1 and 2022 Q1
       b.baseline_share,
       l.share_2022_q1,
       ROUND(l.share_2022_q1 - b.baseline_share, 4) AS net_change
FROM baseline b
JOIN latest l
     ON b.Brand = l.Brand
ORDER BY net_change DESC;