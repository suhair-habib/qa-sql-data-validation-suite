# User Acceptance Testing (UAT) & Data Migration Sign-Off Plan

## 1. Scope & Objectives
Validate that migrated records in the target environment are complete, accurate, and compliant with business rules prior to production cutover.

## 2. Test Execution Matrix

| Test ID | Category | Test Scenario | Validation Method | Expected Result | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **TC-01** | Completeness | Compare source vs. target row counts across all core tables | Run `01_row_count_and_completeness.sql` | Variance = `0` for all tables | Pending |
| **TC-02** | Data Integrity | Verify zero NULL values in mandatory fields (`email`, `created_date`) | Run `01_row_count_and_completeness.sql` | `0` rows returned | Pending |
| **TC-03** | Uniqueness | Confirm no duplicate business keys exist after transformation | Run `01_row_count_and_completeness.sql` | `0` rows returned | Pending |
| **TC-04** | Referential Integrity | Verify all child orders link to an existing parent customer ID | Run `02_referential_integrity_checks.sql` | `0` orphaned records | Pending |
| **TC-05** | Financial Reconciliation | Reconcile total migrated order revenue against legacy source | Run `02_referential_integrity_checks.sql` | Source total equals Target total | Pending |

## 3. Defect Severity & Exit Criteria
* **Critical / High:** Zero open defects allowed prior to production sign-off.
* **Medium / Low:** Documented with an approved workaround and target remediation sprint.

## 4. Stakeholder Sign-Off
* **QA / Validation Lead:** ______________________ Date: __________
* **Project Coordinator / PM:** ___________________ Date: __________
* **Business Owner:** ___________________________ Date: __________
