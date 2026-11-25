-- ============================================================================
-- Script: 01_row_count_and_completeness.sql
-- Purpose: Verify source-to-target row counts, NULL constraints, and duplicates
-- ============================================================================

-- 1. Compare total record counts between source and target tables
SELECT 
    'customers' AS table_name,
    (SELECT COUNT(*) FROM source_db.customers) AS source_count,
    (SELECT COUNT(*) FROM target_db.customers) AS target_count,
    (SELECT COUNT(*) FROM source_db.customers) - (SELECT COUNT(*) FROM target_db.customers) AS variance;

-- 2. Check for unexpected NULL values in mandatory target columns
SELECT customer_id, email, created_date
FROM target_db.customers
WHERE email IS NULL 
   OR TRIM(email) = ''
   OR created_date IS NULL;

-- 3. Detect duplicate primary or business keys post-migration
SELECT email, COUNT(*) AS duplicate_count
FROM target_db.customers
GROUP BY email
HAVING COUNT(*) > 1;
