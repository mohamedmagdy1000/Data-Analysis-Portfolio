-- 01_import_and_checks.sql
-- Basic checks after importing CSV into staging_population

-- 1) Count rows
SELECT COUNT(*) AS rows_imported FROM staging_population;

-- 2) Sample rows
SELECT * FROM staging_population LIMIT 10;

-- 3) Totals by year
SELECT year, SUM(male) AS male_total, SUM(female) AS female_total, SUM(male+female) AS grand_total
FROM staging_population
GROUP BY year;

-- 4) Top 10 governorates by total population (for a given year)
SELECT governorate_name_en, SUM(male+female) AS total_pop
FROM staging_population
WHERE year = 2024
GROUP BY governorate_name_en
ORDER BY total_pop DESC
LIMIT 10;

-- 5) Male percentage per governorate (example)
SELECT governorate_name_en,
       SUM(male) AS male_total,
       SUM(female) AS female_total,
       ROUND(100.0 * SUM(male) / NULLIF(SUM(male+female),0),2) AS male_pct
FROM staging_population
WHERE year = 2024
GROUP BY governorate_name_en
ORDER BY male_pct DESC;
