Project Title: Netflix Global Content Strategy & Trends Analysis
Project Overview
Developed a comprehensive data analytics project to uncover Netflix's evolving business strategy by analyzing a dataset of ~8,800 movies and TV shows. The analysis focused on identifying historical content acquisition patterns, regional market penetration, and the creative social network of directors and actors.

Tech Stack

Databases: PostgreSQL (Advanced SQL)

Languages: Python (Pandas, Matplotlib, Seaborn)

Tools: Power BI (Data Visualization), Jupyter Notebook

Key Analytical Contributions

Time-Series Growth Analysis: Implemented SQL Window Functions (LAG) to calculate Year-over-Year (YoY) growth of content additions. Successfully identified a 576% growth spike in TV shows in 2016, pinpointing Netflix's strategic pivot toward serialized original content.

Regional Market Penetration: Built a proportional market share model to analyze "Content Density" by country. Discovered India’s peak influence periods by calculating its relative share of the global library using correlated subqueries.

Relational Mapping of Multi-Valued Data: Resolved "One-to-Many" data complexities in the director and cast columns. Used PostgreSQL UNNEST and CROSS JOIN LATERAL to identify the most frequent Director-Actor collaborations, revealing "Brand Loyalty" in production partnerships.

Advanced Data Engineering: Executed complex string manipulation and data type casting (e.g., extracting numeric durations from text and parsing non-standard date formats) to enable accurate quantitative sorting and filtering.

Feature Engineering: Categorized content into "Legacy" vs. "New Arrivals" using date-math logic to evaluate the platform's reliance on archival content versus fresh releases.

Business Insights Delivered

The "Pandemic Effect": Quantified the 2020 production plateau, showing a near 0% growth in new TV content additions compared to the previous year, highlighting the impact of global filming shutdowns.

Content Freshness: Identified that a significant portion of the library was added within 1–2 years of its theatrical release, indicating a high-investment "Freshness First" acquisition strategy.

Geographic Powerhouses: Determined the top 3 content-producing nations (USA, India, UK) and mapped their growth trajectories over a 10-year period.
