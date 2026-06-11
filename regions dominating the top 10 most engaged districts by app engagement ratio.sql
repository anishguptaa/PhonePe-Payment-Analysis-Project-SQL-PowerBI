WITH eng AS
(
    SELECT state,
           district,
           region,
           SUM(app_opens) / SUM(registered_users) AS app_engagement_ratio
    FROM map_user
    GROUP BY state, district, region
    ORDER BY app_engagement_ratio DESC
    LIMIT 10
)

SELECT region,
       COUNT(*) AS district_count
FROM eng
GROUP BY region
ORDER BY district_count DESC;