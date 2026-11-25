# QA & SQL Data Migration Validation Suite

A structured quality assurance toolkit designed to verify data integrity, schema mapping, and business rule compliance during enterprise database migrations.

## 🎯 Overview
Large-scale data migrations often fail due to silent truncation, orphaned foreign keys, or mismatched data types. This repository demonstrates a repeatable QA and UAT framework combining automated SQL verification scripts with structured test case documentation.

## 🛠️ Technologies & Standards
* **Database / Querying:** ANSI SQL (PostgreSQL / SQL Server / MySQL compatible)
* **QA Methodology:** Boundary Value Analysis, Referential Integrity Checks, User Acceptance Testing (UAT)
* **Documentation:** Markdown Test Plans & Defect Triage Templates

## 📂 Repository Structure
* `sql/01_row_count_and_completeness.sql` – Verifies source-to-target record counts and NULL constraints.
* `sql/02_referential_integrity_checks.sql` – Detects orphaned records across parent/child tables.
* `docs/UAT_Test_Plan_Template.md` – Standard test execution matrix and sign-off criteria.

## 🚀 Sample Validation Query
```sql
-- Verify zero orphaned records exist after migrating orders to target schema
SELECT o.order_id, o.customer_id
FROM target_db.orders o
LEFT JOIN target_db.customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
