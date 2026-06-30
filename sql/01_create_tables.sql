-- ============================================================
-- Project: SQL Quality of Life Analysis
-- File: 01_create_tables.sql
-- Purpose: Create empty tables for population, life expectancy,
--          and GDP per capita data.
-- ============================================================
-- ------------------------------------------------------------
-- 1. Drop existing tables
-- ------------------------------------------------------------
-- These commands remove the tables if they already exist.
-- This makes it possible to run this script multiple times
-- without getting an error.
DROP TABLE IF EXISTS population;
DROP TABLE IF EXISTS life_expectancy;
DROP TABLE IF EXISTS gdp_per_capita;
-- ------------------------------------------------------------
-- 2. Create table: population
-- ------------------------------------------------------------
-- This table will store population data by country and year.
CREATE TABLE population (
    country TEXT,
    country_code TEXT,
    year INTEGER,
    population INTEGER
);
 -- ------------------------------------------------------------
-- 3. Create table: life_expectancy
-- ------------------------------------------------------------
-- This table will store life expectancy data by country and year.
CREATE TABLE life_expectancy (
    country TEXT,
    country_code TEXT,
    year INTEGER,
    life_expectancy REAL
);
-- ------------------------------------------------------------
-- 4. Create table: gdp_per_capita
-- ------------------------------------------------------------
-- This table will store GDP per capita data by country and year.
CREATE TABLE gdp_per_capita (
    country TEXT,
    country_code TEXT,
    year INTEGER,
    gdp_per_capita REAL,
    world_region TEXT
);
