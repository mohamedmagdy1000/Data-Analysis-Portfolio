-- staging_schema.sql
CREATE TABLE IF NOT EXISTS staging_population (
  year SMALLINT,
  governorate_name_en VARCHAR(100),
  governorate_name_ar VARCHAR(100),
  age_group_code VARCHAR(20),
  male INT,
  female INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
