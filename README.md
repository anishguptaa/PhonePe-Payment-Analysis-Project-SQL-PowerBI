# PhonePe Analytics Dashboard – SQL + Power BI
In this project, I analyzed India’s digital payment ecosystem using data from PhonePe – one of India’s largest digital payment intelligence platforms. The objective was to transform raw transaction and user data into meaningful business insights that highlight payment trends, user adoption patterns, device preferences, and regional growth opportunities across the country.

The dataset consisted of multiple interconnected tables covering different aspects of the PhonePe ecosystem:  
•	Aggregated Transactions: Transaction count and transaction value by state, quarter, and transaction category.  
•	Aggregated Users: Registered users and device brand adoption across states.  
•	Map Transactions: District-level transaction activity across India.  
•	Map Users: District-level registered users and app engagement data.  

Using SQL, I performed data preparation, validation, and business analysis by writing queries to calculate and verify key performance indicators such as:  
•	Total Payment Value (TPV)  
•	Total Transactions  
•	Average Transaction Value (ATV)  
•	Registered Users  
•	App Opens  
•	State and District Rankings  
•	Transaction Category Contribution

After validating the metrics through SQL, I developed a complete Power BI solution using dimensional modeling, DAX measures, drill-through capabilities, geographic analysis, and dynamic filtering.
To build a scalable and analytics-ready model, I created:  
•	Dim_Date  
•	Dim_State  
•	Dim_District  
•	Fact tables for Transactions and Users

Relationships were carefully designed using proper one-to-many cardinality and single-direction filtering to ensure accurate aggregations and dashboard performance.

The Power BI report was divided into four business-focused pages:
1. Executive Overview:  
•	National payment ecosystem performance  
•	TPV and transaction growth analysis  
•	State-wise transaction heatmap  
•	Top-performing states and KPI tracking

2. Transaction Analytics:  
•	Transaction category analysis  
•	TPV trends and growth patterns  
•	State contribution analysis  
•	Market concentration insights

3. User & Device Analytics:  
•	Registered user growth  
•	App engagement analysis  
•	Mobile device brand market share  
•	State-level user adoption trends  

4. Geographic Intelligence:  
•	District-level transaction analysis  
•	Geographic concentration of payment activity  
•	District growth contribution  
•	Regional opportunity identification

Key DAX measures created include:  
•	Total TPV  
•	Total Transactions  
•	Average Transaction Value (ATV)  
•	Registered Users  
•	App Opens  
•	YoY Growth %  
•	QoQ Growth %  
•	State Share %  
•	Transaction Share %  
•	Growth Contribution  
•	Ranking Measures

The dashboard includes KPI cards, heatmaps, bar charts, scatter plots, treemaps, decomposition trees, ranking tables, and drill-down geographic visuals, all controlled through dynamic slicers for Year, Quarter, State, Region, and District.

The final dashboard serves as a business intelligence solution that answers questions such as:  
•	Which states are driving India’s digital payment ecosystem?  
•	Which transaction categories contribute the most value?  
•	How is user adoption evolving across regions?  
•	Which districts are emerging as digital payment hotspots?
# This whole project transformed complex fintech data into meaningful business intelligence — revealing transaction trends, geographic insights, and growth opportunities, with all key metrics validated through SQL
