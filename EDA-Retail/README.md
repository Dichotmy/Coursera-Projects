# Exploratory Data Analysis (EDA) on Retail Data

This repository contains the project files for the Exploratory Data Analysis (EDA) guided project on retail data, completed as part of a Coursera Project Network course.

## Project Overview

### **Objective**

The goal of this project is to perform a thorough exploratory analysis of a retail dataset to uncover trends, patterns, and potential business insights. The focus is on understanding customer behavior, sales performance, and item popularity, which can help inform business decisions regarding inventory management, marketing, and customer engagement.

### **Dataset**

- **Source:** Dataset provided by Coursera Project Network
- **Content:** The dataset contains records of transactions from an online retail store for the period 2010 to 2011.
- **Key Features:**
  - `InvoiceNo`: Transaction identifier.
  - `StockCode`: Product identifier.
  - `Description`: Description of the product.
  - `Quantity`: Number of items purchased.
  - `InvoiceDate`: Date and time of the transaction.
  - `CustomerID`: Customer identifier.
  - `Country`: Country where the customer is located.
  - `UnitPrice`: Price of each item.
  - `TransactionType`: Indicates whether the transaction is a sale or a return.

### **Approach**

- **Data Cleaning:**
  - Handled missing values, particularly for `CustomerID`, which was labeled as 'UnknownCustomer' where not provided.
  - Filtered out irrelevant transactions, focusing only on valid sales with positive item quantities and prices.
  - Converted data types for accurate analysis (e.g., `InvoiceDate` to datetime).
  
- **Feature Engineering:**
  - Created a new column `ItemSales` by calculating the total sales for each transaction (`Quantity` * `UnitPrice`).
  - Grouped transactions by `InvoiceNo` to compute total sales per invoice.

- **Exploratory Data Analysis (EDA):**
  - **Sales Distribution:** Analyzed the distribution of total sales using log-transformed data for better visualization.
  - **Sales Trends Over Time:** Explored the variation in sales across months, days of the week, and specific time periods.
  - **Customer Insights:** Investigated sales performance by customer, identifying top customers and their contribution to revenue.
  - **Country Insights:** Analyzed sales performance by country, with a focus on the United Kingdom, the store's primary market.
  - **Item Popularity:** Identified the top 50 most sold items and the trends associated with product demand.

### **Key Findings:**

1. **Customer Behavior:**
   - The majority of the transactions lack customer identifiers, making it difficult to track specific customer behaviors. However, among identified customers, a few contribute significantly to total revenue.
   - The top 10 customers alone account for a large portion of sales, with most high-value customers coming from the United Kingdom and the Netherlands.

2. **Sales Insights:**
   - Sales peak on Tuesdays and Thursdays, while no transactions were recorded on Saturdays.
   - Despite consistent sales across months, several high-value outliers drive monthly performance.

3. **Popular Products:**
   - Items such as 'White Hanging Heart T-Light Holder' and 'Jumbo Bag Red Retrospot' were among the top-selling products, indicating trends in popular categories like home decor and gift items.

4. **Country Insights:**
   - The United Kingdom dominates the sales landscape, with other key markets like the Netherlands, Ireland, and Australia contributing significantly.

### **Visualizations:**

- **Sales Distribution:** A histogram of log-transformed invoice totals, showing the skewed distribution of sales.
- **Sales Trends:** Scatter plots and box plots visualizing invoice totals over time and by month.
- **Customer Analysis:** Bar plots highlighting the top customers by total sales and customer segmentation by country.
- **Country Sales:** A bar chart depicting the total sales by country, emphasizing the dominance of the UK market.
- **Popular Items:** A bar plot showing the 50 most purchased items, shedding light on product demand.

## Files in this Folder

- **notebooks/** - Contains the Jupyter notebooks used for data cleaning, feature engineering, and EDA.
- **data/** - Contains the dataset used in this analysis (if applicable).
- **plots/** - Contains all the generated visualizations, such as histograms, scatter plots, and bar charts.
- **README.md** - This file.
