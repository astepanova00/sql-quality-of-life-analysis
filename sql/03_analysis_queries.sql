-- ============================================================
-- Project: SQL Quality of Life Analysis
-- File: 03_analysis_queries.sql
-- Purpose: Analyze population, life expectancy, and GDP per capita.
-- ============================================================
-- ------------------------------------------------------------
-- 1. Countries with the highest life expectancy
-- ------------------------------------------------------------
-- This query shows the top 10 countries with the highest
-- life expectancy in the latest available year.

SELECT
    country,
    year,
    life_expectancy
FROM life_expectancy
WHERE year = (
    SELECT MAX(year)
    FROM life_expectancy
)
AND country_code IS NOT NULL
ORDER BY life_expectancy DESC
LIMIT 10;
-- ------------------------------------------------------------
-- 2. Countries with the lowest life expectancy
-- ------------------------------------------------------------
-- This query shows the 10 countries with the lowest
-- life expectancy in the latest available year.

SELECT
    country,
    year,
    life_expectancy
FROM life_expectancy
WHERE year = (
    SELECT MAX(year)
    FROM life_expectancy
)
AND country_code IS NOT NULL
ORDER BY life_expectancy ASC
LIMIT 10;
-- ------------------------------------------------------------
-- 3. Life expectancy trend in Czechia
-- ------------------------------------------------------------
-- This query shows how life expectancy changed in Czechia over time.

SELECT
    country,
    year,
    life_expectancy
FROM life_expectancy
WHERE country = 'Czechia'
ORDER BY year;
SELECT
    l.country,
    l.year,
    l.life_expectancy,
    g.gdp_per_capita
FROM life_expectancy AS l
JOIN gdp_per_capita AS g
    ON l.country_code = g.country_code
    AND l.year = g.year
WHERE l.year = (
    SELECT MAX(year)
    FROM life_expectancy
)
AND l.country_code IS NOT NULL
ORDER BY g.gdp_per_capita DESC;
-- ------------------------------------------------------------
-- 5. GDP categories and life expectancy
-- ------------------------------------------------------------
-- This query groups countries into GDP categories
-- and shows their life expectancy.

SELECT
    l.country,
    l.year,
    l.life_expectancy,
    g.gdp_per_capita,
    CASE
        WHEN g.gdp_per_capita < 10000 THEN 'Low GDP'
        WHEN g.gdp_per_capita BETWEEN 10000 AND 40000 THEN 'Medium GDP'
        ELSE 'High GDP'
    END AS gdp_category
FROM life_expectancy AS l
JOIN gdp_per_capita AS g
    ON l.country_code = g.country_code
    AND l.year = g.year
WHERE l.year = (
    SELECT MAX(year)
    FROM life_expectancy
)
AND l.country_code IS NOT NULL
ORDER BY g.gdp_per_capita DESC;
-- ------------------------------------------------------------
-- 6. Average life expectancy by GDP category
-- ------------------------------------------------------------
-- This query calculates the average life expectancy
-- for each GDP category.

WITH country_categories AS (
    SELECT
        l.country,
        l.year,
        l.life_expectancy,
        g.gdp_per_capita,
        CASE
            WHEN g.gdp_per_capita < 10000 THEN 'Low GDP'
            WHEN g.gdp_per_capita BETWEEN 10000 AND 40000 THEN 'Medium GDP'
            ELSE 'High GDP'
        END AS gdp_category
    FROM life_expectancy AS l
    JOIN gdp_per_capita AS g
        ON l.country_code = g.country_code
        AND l.year = g.year
    WHERE l.year = (
        SELECT MAX(year)
        FROM life_expectancy
    )
    AND l.country_code IS NOT NULL
)

SELECT
    gdp_category,
    ROUND(AVG(life_expectancy), 2) AS avg_life_expectancy,
    COUNT(*) AS number_of_countries
FROM country_categories
GROUP BY gdp_category
ORDER BY avg_life_expectancy DESC;
-- ------------------------------------------------------------
-- 7. Population growth between first and latest available year
-- ------------------------------------------------------------
-- This query calculates population growth percentage
-- between the first and the latest available year.

WITH first_year AS (
    SELECT MIN(year) AS year
    FROM population
),

latest_year AS (
    SELECT MAX(year) AS year
    FROM population
),

population_first_year AS (
    SELECT
        country_code,
        country,
        population AS population_first_year
    FROM population
    WHERE year = (
        SELECT year
        FROM first_year
    )
    AND country_code IS NOT NULL
),

population_latest_year AS (
    SELECT
        country_code,
        country,
        population AS population_latest_year
    FROM population
    WHERE year = (
        SELECT year
        FROM latest_year
    )
    AND country_code IS NOT NULL
)

SELECT
    latest.country,
    first.population_first_year,
    latest.population_latest_year,
    ROUND(
        ((latest.population_latest_year - first.population_first_year) * 100.0 / first.population_first_year),
        2
    ) AS population_growth_percent
FROM population_latest_year AS latest
JOIN population_first_year AS first
    ON latest.country_code = first.country_code
ORDER BY population_growth_percent DESC
LIMIT 10;
