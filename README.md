# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository!  
This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. 
Presented as a portfolio project that highlights industry best practices in data engineering and analytics.

---

## 🏗️ Data Architecture
The data architecture for this project follows Medallion Architecture Bronze, Silver, and Gold layers:
![data_architecture](docs/data_architecture.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

---

## 📁 Project Overview:

This project involves:
1.  **Data Architecture:** Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2.  **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the warehouse.
3.  **Data Modeling:** Developing fact and dimension tables optimized for analytical queries.
4.  **Analytics & Reporting:** Creating SQL-based reports and dashboards for actionable insights.

✅ This portfolio project showcases skills in:
* SQL Development
* Data Architect
* Data Engineering
* ETL Pipeline Developer
* Data Modeling
* Data Analytics

---
## ⚙️ Important Links & Tools: 

Below are the links and tools used for the project.

* [Datasets](https://github.com/KLinh62/SQL-Data-Warehouse-Project/tree/e01f1d35b14873cfb305d611b07929cb80b6e31a/datasets): Access to the project dataset (.csv files).
* [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/ssms/install/install?view=sql-server-ver16): GUI for managing and interacting with databases.
* [DrawIO](https://www.drawio.com/): Design data architecture, models, flows, and diagrams.
* [Notion Project Steps](https://www.notion.so/My-Data-Warehouse-Project-20fb404cdc59804987b3fa411d94675c): Access to All Project Phases and Tasks.

---
## 🚀 Project Requirements 

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files. Data include information about customers, products, and sales details.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.  
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.  
- **Scope**: Focus on the latest dataset only; historization of data is not required.  
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

### BI: Analytics & Reporting (Data Analytics)

#### Objective
Key business metrics and insights are explored through:

- Identifying **top-performing products**
- Understanding **customer purchasing behavior**
- Analyzing **sales trends** across time

----

> 
>   - Top customers by total spending  
>   - Most frequently purchased products  
>   - Monthly revenue and order count trends  
>   - Average basket size per order

> 🧠 **DAX Measures**:
```DAX
Total Sales = SUM(fact_sales[quantity] * dim_products[unit_price])
Avg Order Value = [Total Sales] / DISTINCTCOUNT(fact_sales[order_id])
Customer Count = DISTINCTCOUNT(dim_customers[customer_id])
```
---
#### 📊 Power BI Dashboard: Build Procedures

**🔄 Step 1: Data Import**

- Export key SQL views to `.csv` OR connect Power BI to SQL database
- Recommended Views:
  - `vw_sales_by_month`
  - `vw_top_customers`
  - `vw_product_performance`
  - `vw_orders_by_segment`
  - `vw_channel_trends`

**🗂 Step 2: Data Model Setup**

- Ensure relationships:
  - `Date[Date]` → `Orders[OrderDate]`
  - `CustomerID`, `ProductID` as foreign keys
- Create Calendar Table if not imported

**📐 Step 3: Measure Definitions**

Create DAX KPIs like:

```DAX
Total Revenue = SUM(Orders[Revenue])
Avg Order Value = [Total Revenue] / COUNTROWS(Orders)
Return Rate = DIVIDE(SUM(Orders[IsReturn]), COUNTROWS(Orders))
```

More measures can be derived using SQL views or custom DAX logic.

---

### 📊 Dashboard Design Layout

#### 1. **Executive Summary**
- Total Revenue
- Order Count
- Return Rate
- Revenue Trend (line chart)

#### 2. **Customer Insights**
- Top Spending Customers (bar chart)
- Customer Segments by Spending (Table: High-value vs low-value customers)
- Orders by Age Group, Gender, or Region (Eg: Regional Performance => Map: Sales volume by country or region)
- New vs Returning Customers (Matrix or bar chart: Frequency bands)
- Orders per Customer per Month
- Customer Lifetime Value (LTV)

#### 3. **Product Performance**
- Top SKUs by Revenue / Orders
- Product Category and Subcategory Breakdown (Donut chart: Sales % by product category )
- Product Sales Trends over Time
- Discount Impact on Returns

#### 4. **Sales Trends**
- Monthly/Quarterly Revenue Trend (line chart)
- Channel Performance (stacked column)
- Growth YOY / MOM (% change cards)
- Running Total Sales (Area chart: Cumulative monthly revenue)
- Average Order Value (AOV)
- Revenue vs. Quantity Correlation

---

### 📌 Insights

- 📈 ....% of revenue comes from 3 key regions  
- 🎯 ...% of customers generate 40% of revenue  
- ❗ Products with >...% discount have 2.5x higher return rate  
- 📉 Offline channel underperforms during Quarter ....  

---

### 🚀 Future Enhancements

- RLS (row-level security) for sales managers  
- Drillthrough for product details  
- Integration with Python scripts for forecast  

---
### 📁 Repository Structure for Power BI project
```
Data-Analytics-Project/
├── 📂 data/               → Raw CSV export of SQL queries
├── 📂 queries/            → SQL scripts for staging & analysis
├── 📂 visuals/            → Power BI screenshots
├── 📂 reports/            → Power BI (.pbix) file
├── README.md              → Project documentation
```


---
## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                        # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                            # Project documentation and architecture details
│   ├── etl.png                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.png        # Draw.io file shows the project's data architecture
│   ├── data_catalog.md              # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.png                # Draw.io file for the data flow diagram
│   ├── data_integration.png         # Draw.io file shows the data objects and the relationships between tables
│   ├── data_model.png               # Draw.io file for data models (star schema)
│   ├── data_layers.png              # Draw.io files outlines the specific processes and characteristics of the data layers
│   ├── naming-conventions.md        # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                         # SQL scripts for ETL and transformations
│   ├── bronze/                      # Scripts for extracting and loading raw data
│   ├── silver/                      # Scripts for cleaning and transforming data
│   ├── gold/                        # Scripts for creating analytical models
│
├── tests/                           # Test scripts and quality files
│
├── README.md                        # Project overview and instructions
└── LICENSE                          # License information for the repository 
```

---

## 🌟 About Me

Hi there! I'm **Linh Nguyen**, an Supply Chain professional who is passonate about data.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kh%C3%A1nh-linh-nguy%E1%BB%85n-346115176/)

 
