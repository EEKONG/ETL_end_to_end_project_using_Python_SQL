# Retail Orders Extraction, Data Cleaning, Transformation, and SQL Integration  

This project demonstrates a complete workflow of **data acquisition, cleaning, transformation, and database integration** using Python, Pandas, and MySQL.  

SQL ANALYSIS BUSINESS INSIGHTS
- Top products generate a majority of revenue — focus on these for demand forecasting.
- Regional trends show different product preferences — customize marketing strategies.
- Seasonality is strong — timing promotions around peak months increases impact.
- Sub-category growth in 2023 reveals new profit opportunities for the business.

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

