/*
===============================================================================
Quality Checks
===============================================================================

Script Purpose:
    This script performs quality checks to validate the integrity, consistency,
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of surrogate keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- =============================================================================
-- Checking: gold.dim_customers
-- =============================================================================

-- Check for Uniqueness of Customer Key in gold.dim_customers
-- Expectation: No results
SELECT
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- =============================================================================
-- Checking: gold.product_key
-- =============================================================================

-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results
SELECT
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- Check for the List of Values in Gender
-- Expectation: three values ('Male', 'Female', 'n/a')
SELECT DISTINCT gender
FROM gold.dim_customers;

-- Final check
SELECT *
FROM gold.dim_customers;

-- =============================================================================
-- Checking: gold.fact_sales
-- =============================================================================

-- Foreign Key Integrity (Dimensions): check the data model connectivity between fact and dimensions
-- Expeactation: No Results
SELECT *
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
    ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products AS p
    ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL;

