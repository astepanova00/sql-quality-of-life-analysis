# SQL Quality of Life Analysis

This is a beginner SQL portfolio project focused on analyzing population, life expectancy, and GDP per capita data using public datasets.

The goal of this project is to practice SQL step by step and learn how to work with real-world datasets.

## Project Status

The first version of this SQL portfolio project is complete. The project includes datasets, SQL scripts, data quality checks, analysis queries, and a summary of key findings.

Possible next steps include creating a Power BI dashboard and adding visualizations based on the same datasets.

## Key Findings

- Countries with higher GDP per capita generally have higher life expectancy.
- Czechia's life expectancy increased from approximately 64.41 years in 1950 to 79.83 years in 2023.
- High GDP countries had the highest average life expectancy, while Low GDP countries had the lowest average life expectancy.
- Some high GDP countries or territories had lower life expectancy than expected, which shows that GDP per capita alone does not fully explain life expectancy differences.
- The highest population growth was observed in countries such as the United Arab Emirates and Qatar.

## Tools Used

- SQL
- SQLite
- DB Browser for SQLite
- GitHub
- CSV datasets

## Project Structure

- `data/` contains the CSV datasets
- `sql/` contains SQL scripts for creating tables, checking data quality, and running analysis queries
- `results/` contains a summary of key findings
- `README.md` explains the project

## SQL Skills Practiced

- Creating tables
- Importing CSV data
- Counting rows
- Checking data quality
- Filtering data with `WHERE`
- Sorting results with `ORDER BY`
- Limiting results with `LIMIT`
- Joining tables with `JOIN`
- Creating categories with `CASE WHEN`
- Using Common Table Expressions

## What I Learned

During this project, I practiced creating SQL tables, importing CSV files into SQLite, checking data quality, writing analysis queries, joining tables, using CASE WHEN, working with CTEs, and interpreting query results.

One of the most useful parts for me was learning how JOIN works and why it is important to join data by both country code and year.

## Challenges

One challenge was working with CSV files from Our World in Data, because the original column names were not ideal for SQL. I renamed the columns to make the queries easier to read and understand.

Another challenge was understanding how to structure SQL queries step by step, especially when using JOINs and temporary results with WITH.

## Note

This project was created as a learning project with the assistance of AI. AI was used to help explain SQL concepts, structure the project, and provide guidance during the learning process. All code and analysis are reviewed and understood by me as part of my learning journey.
