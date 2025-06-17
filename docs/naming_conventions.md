1.  [ ] Gold Rules
2.  [ ] Column Naming Conventions
    * [ ] Surrogate Keys
    * [ ] Technical Columns
3.  [ ] Stored Procedure

---

## General Principles

* **Naming Conventions:** Use snake_case, with lowercase letters and underscores (\_\_) to separate words.
* **Language:** Use English for all names.
* **Avoid Reserved Words:** Do not use SQL reserved words as object names.

---

## Table Naming Conventions

### Bronze Rules

* All names must start with the source system name, and table names must match their original names without renaming.
    `<sourcesystem>_<entity>`
    * `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).
    * `<entity>`: Exact table name from the source system.
  * Example: `crm_customer_info` $\rightarrow$ Customer information from the CRM system.

### Silver Rules

* All names must start with the source system name, and table names must match their original names without renaming.
    `<sourcesystem>_<entity>`
    * `<sourcesystem>`: Name of the source system (e.g., `crm`, `erp`).
    * `<entity>`: Exact table name from the source system.
    * Example: `crm_customer_info` $\rightarrow$ Customer information from the CRM system.

### Gold Rules

* All names must use meaningful, business-aligned names for tables, starting with the category prefix.
* `<category>_<entity>`
    * `<category>`: Describes the role of the table, such as `dim` (dimension) or `fact` (fact table).
    * `<entity>`: Descriptive name of the table, aligned with the business domain (e.g., `customers`, `products`, `sales`).
  * Examples:
      * `dim_customers` $\rightarrow$ Dimension table for customer data.
      * `fact_sales` $\rightarrow$ Fact table containing sales transactions.
 
#### Glossary of Category Patterns

| Pattern | Meaning          | Example(s)                          |
| :------ | :--------------- | :---------------------------------- |
| `dim_`  | Dimension table  | `dim_customer`, `dim_product`       |
| `fact_` | Fact table       | `fact_sales`                        |
| `agg_`  | Aggregated table | `agg_customers`, `agg_sales_monthly` |

## Column Naming Conventions

### Surrogate Keys

* All primary keys in dimension tables must use the suffix `_key`.
* `<table_name>_key`
    * `<table_name>`: Refers to the name of the table or entity the key belongs to.
    * `_key`: A suffix indicating that this column is a surrogate key.
    * Example: `customer_key` $\rightarrow$ Surrogate key in the `dim_customers` table.

### Technical Columns

* All technical columns must start with the prefix `dwh__`, followed by a descriptive name indicating the column's purpose.
* `dwh__<column_name>`
    * `dwh__`: Prefix exclusively for system-generated metadata.
    * `<column_name>`: Descriptive name indicating the column's purpose.
    * Example: `dwh_load_date` $\rightarrow$ System-generated column used to store the date when the record was loaded.
 
## Stored Procedure

* All stored procedures used for loading data must follow the naming pattern:
* `load_<layer>`.
    * `<layer>`: Represents the layer being loaded, such as `bronze`, `silver`, or `gold`.
    * Example:
        * `load_bronze` $\rightarrow$ Stored procedure for loading data into the Bronze layer.
        * `load_silver` $\rightarrow$ Stored procedure for loading data into the Silver layer.
