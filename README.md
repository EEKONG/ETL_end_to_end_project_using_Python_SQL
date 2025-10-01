# Retail Orders Extraction, Data Cleaning, Transformation, and SQL Integration  

This project demonstrates a complete workflow of **data acquisition, cleaning, transformation, and database integration** using Python, Pandas, and MySQL.  

### SQL ANALYSIS BUSINESS INSIGHTS
- Top products generate a majority of revenue — focus on these for demand forecasting.
  - A handful of products generate the majority of sales.
  - Business Impact: These should be prioritized for **inventory planning** and **demand forecasting** to avoid stockouts and maximize revenue.

- Regional trends show different product preferences — customize marketing strategies.
  - Customer preferences vary across regions.
  - Business Impact: Marketing strategies and promotions should be **region-specific**, catering to local demand.

- Seasonality is strong — timing promotions around peak months increases impact.
  - Clear month-over-month fluctuations in sales highlight seasonality.
  - Business Impact: Running **targeted promotions around peak months** can significantly improve revenue performance.

- Sub-category growth in 2023 reveals new profit opportunities for the business.
  - Profit growth in specific sub-categories during 2023 shows shifting consumer interest.
  - Business Impact: Companies can invest in **expanding product lines** in these categories to capture market growth early.

## Project Workflow  

### 1. Dataset Acquisition  
- Installed and configured the Kaggle API.  
- Downloaded the **Retail Orders dataset** (`orders.csv`) directly from Kaggle using:  
  ```bash
  kaggle datasets download ankitbansal06/retail-orders -f orders.csv

### 2. Data Cleaning & Preprocessing
- Loaded the dataset into a Pandas DataFrame.
- Replaced invalid entries ("Not Available", "unknown") with null values (NaN).
- Standardized column names.
- Dropped unwaneted columns

### 3. Database Integration (MySQL)
- Installed required libraries: sqlalchemy, pymysql, mysql-connector-python.
- Established connection to a MySQL Workbench server using SQLAlchemy.
- Loaded the cleaned DataFrame (df_new) into a MySQL table (df1_orders).
- Verified data insertion by running SQL queries from Python.

### Tech Stack
Python: Pandas, SQLAlchemy, PyMySQL
Database: MySQL (Workbench)
Data Source: Kaggle Retail Orders Dataset

