-- ============================================================
-- Nigeria Malaria Incidence Analysis — EDA Queries
-- Author: Apete Balikis Olanike
-- Database: malaria_project | Table: malaria_data
-- ============================================================

-- Row count check (should return 2400)
SELECT COUNT(*) FROM malaria_data;

-- ------------------------------------------------------------
-- Query 1: National yearly trend — incidence and mortality
-- ------------------------------------------------------------
SELECT 
    Year,
    SUM(Confirmed_Cases) AS Total_Cases,
    SUM(Malaria_Deaths) AS Total_Deaths,
    ROUND(AVG(Malaria_Incidence_per_1000), 2) AS Avg_Incidence_per_1000
FROM malaria_data
GROUP BY Year
ORDER BY Year;

-- ------------------------------------------------------------
-- Query 2: Monthly seasonality — which months carry the highest burden
-- ------------------------------------------------------------
SELECT 
    Month,
    SUM(Confirmed_Cases) AS Total_Cases,
    ROUND(AVG(Malaria_Incidence_per_1000), 2) AS Avg_Incidence_per_1000
FROM malaria_data
GROUP BY Month
ORDER BY Total_Cases DESC;

-- ------------------------------------------------------------
-- Query 3: State & Region burden ranking (raw totals vs. per-capita rate)
-- ------------------------------------------------------------
SELECT 
    State,
    Region,
    SUM(Confirmed_Cases) AS Total_Cases,
    SUM(Malaria_Deaths) AS Total_Deaths,
    ROUND(AVG(Malaria_Incidence_per_1000), 2) AS Avg_Incidence_per_1000,
    ROUND(AVG(Mortality_Rate), 2) AS Avg_Mortality_Rate
FROM malaria_data
GROUP BY State, Region
ORDER BY Total_Cases DESC;

-- ------------------------------------------------------------
-- Query 4: State-level improvement — early period vs. recent period
-- ------------------------------------------------------------
SELECT 
    State,
    ROUND(AVG(CASE WHEN Year BETWEEN 2000 AND 2004 THEN Malaria_Incidence_per_1000 END), 2) AS Avg_Incidence_2000_2004,
    ROUND(AVG(CASE WHEN Year BETWEEN 2020 AND 2024 THEN Malaria_Incidence_per_1000 END), 2) AS Avg_Incidence_2020_2024
FROM malaria_data
GROUP BY State
ORDER BY State;

-- ------------------------------------------------------------
-- Query 5: Quarterly pattern (national)
-- ------------------------------------------------------------
SELECT 
    Quarter,
    SUM(Confirmed_Cases) AS Total_Cases,
    ROUND(AVG(Malaria_Incidence_per_1000), 2) AS Avg_Incidence_per_1000
FROM malaria_data
GROUP BY Quarter
ORDER BY Quarter;

-- ------------------------------------------------------------
-- Query 6: Mortality trend over time (national, by year)
-- ------------------------------------------------------------
SELECT 
    Year,
    SUM(Malaria_Deaths) AS Total_Deaths,
    ROUND(AVG(Mortality_Rate), 2) AS Avg_Mortality_Rate
FROM malaria_data
GROUP BY Year
ORDER BY Year;