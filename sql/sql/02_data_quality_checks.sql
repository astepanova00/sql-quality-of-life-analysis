-- ============================================================
-- Project: SQL Quality of Life Analysis
-- File: 02_data_quality_checks.sql
-- Purpose: Check imported data before analysis.
-- ============================================================
-- ------------------------------------------------------------
-- 1. Count rows in each table
-- ------------------------------------------------------------
-- This query shows how many rows each table contains.

SELECT 'population' AS table_name, COUNT(*) AS row_count
FROM population

UNION ALL

SELECT 'life_expectancy' AS table_name, COUNT(*) AS row_count
FROM life_expectancy

UNION ALL

SELECT 'gdp_per_capita' AS table_name, COUNT(*) AS row_count
FROM gdp_per_capita;
-- ------------------------------------------------------------
-- 2. Check missing country codes
-- ------------------------------------------------------------
-- This query shows rows where the country code is missing.

SELECT *
FROM population
WHERE country_code IS NULL;
-- ------------------------------------------------------------
-- 3. Check available years
-- ------------------------------------------------------------
-- This query shows the first and last year available
-- in the life_expectancy table.

SELECT
    MIN(year) AS first_year,
    MAX(year) AS last_year
FROM life_expectancy;
-- ------------------------------------------------------------
-- 4. Check duplicate records
-- ------------------------------------------------------------
-- This query checks if there are multiple records
-- for the same country and year.

SELECT
    country,
    year,
    COUNT(*) AS record_count
FROM life_expectancy
GROUP BY country, year
HAVING COUNT(*) > 1;
