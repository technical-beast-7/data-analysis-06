# Sales Trend Analysis Using MySQL

## 📌 Objective
This project analyzes monthly revenue and order volume for an e-commerce dataset using SQL aggregations. The dataset contains orders from January 2023 to December 2024, and the goal is to perform trend analysis, aggregating revenue and order volume by month.

## 📚 Dataset
The dataset contains the following fields:
- `order_id` (Primary Key)
- `order_date` (Date of the order)
- `amount` (Amount spent on the order)
- `product_id` (Product associated with the order)

The dataset was generated with random data for 731 days, starting from **2023-01-01** to **2024-12-31**.

## 🛠 Tools Used
- MySQL Workbench
- SQL (DDL + DML + Aggregation Queries)

## 📂 Files

| File                       | Description |
|----------------------------|-------------|
| `online_sales_analysis.sql` | Contains all SQL code to create the database, generate the data, and perform the analysis. |
| `all_orders.csv`            | CSV file with the full dataset of orders from Jan 2023 to Dec 2024. |
| `extracted_orders.csv`      | CSV file with orders filtered between Jan 2023 and Dec 2024. |

## 🚀 How to Use

1. Open **MySQL Workbench**.
2. Run `online_sales_analysis.sql` to:
   - Create the `online_sales` database.
   - Create the `orders` table.
   - Populate the table with random sample data for 731 days.
   - Perform analysis to generate monthly revenue and order volume.
3. If you prefer working with the data immediately, you can download the pre-generated **CSV files** (`all_orders.csv` and `extracted_orders.csv`) for analysis using tools like Excel, Python, etc.

## 📊 Analysis Queries

- **Monthly Sales Summary**: 
  - This SQL query groups the data by month and year, and calculates the total revenue (`SUM(amount)`) and order volume (`COUNT(DISTINCT order_id)`).
  
- **Full Table Extract**: 
  - Retrieves all rows from the `orders` table.

- **Filtered Orders Extract**: 
  - Displays orders filtered between `2023-01-01` and `2024-12-31`.

---

Feel free to clone or fork the repository, and let me know if you have any questions or need further modifications.
