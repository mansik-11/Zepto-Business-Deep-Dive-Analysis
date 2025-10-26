
<img width="808" height="632" alt="7b9b0e219825365 Y3JvcCwyNTYyLDIwMDQsNzkyLDI0MQ" src="https://github.com/user-attachments/assets/412c17ba-2fc6-483e-bac3-70b9b43051be" />

<div align="center">
  <h1>Zepto Quick Commerce: A Deep Dive Analysis</h1>
  <p>An end-to-end data analysis project uncovering actionable insights into Zepto's operations using SQL, Excel, and Power BI.</p>

  <p>
    <img src="https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white" alt="Excel"/>
    <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
    <img src="https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black" alt="Power BI"/>
  </p>

## 📖 Project Overview

Zepto operates in the hyper-competitive quick commerce market where data-driven strategy is the key to survival and growth. This project performs a comprehensive analysis of a relational dataset simulating Zepto's operations to uncover critical insights across customer behavior, product performance, and logistical efficiency.

> The goal is to dissect patterns in sales, payments, and customer feedback to formulate data-backed recommendations that can enhance profitability, improve customer retention, and streamline operations.

---

## 🎯 Key Objectives

This analysis aims to answer the following critical business questions:

1.  **Customer Behavior:** Who are our most valuable customers? What is the rate of customer churn, and what does the repeat purchase cycle look like?
2.  **Product & Sales Performance:** Which products, brands, and categories drive the most revenue? What are the peak sales periods (day of the week, time of day)? Which cities are the most profitable markets?
3.  **Operational Efficiency:** What is the success rate of various payment methods? Is there a significant bottleneck in our transaction process?
4.  **Logistics & Service Quality:** How do customers rate our delivery partners? Which partners are the most utilized and highest-rated?

---

## 🛠️ Technology Stack

* **Microsoft Excel:** Utilized for initial data inspection, cleaning, and preliminary validation to ensure data integrity before analysis.
* **MySQL:** Served as the core engine for data analysis. Used for complex querying, joining disparate tables, and aggregating data to derive Key Performance Indicators (KPIs).
* **Microsoft Power BI:** Employed as the visualization tool to build a dynamic, interactive dashboard that tells a compelling story and allows for easy exploration of the findings.



---

## 💾 The Dataset

The analysis is based on a structured relational dataset of approximately **15,000 records** distributed across six interconnected CSV files, simulating a real-world operational database.

* `Customer.csv`: Customer profiles (ID, name, location).
* `products.csv`: Product catalog (ID, name, category, brand, price).
* `order.csv`: Transactional order data (ID, customer ID, product ID, date, quantity).
* `transactions.csv`: Payment details for each order (ID, payment mode, status).
* `delivery.csv`: Information on delivery partners.
* `ratings.csv`: Customer ratings for products and delivery services associated with each order.

---

## 💡 Key Insights Uncovered

### 👤 Customer Behavior
* **High-Value Segment:** The top-spending customer, **Unni Walia**, contributed over **₹44.5K** in total revenue, highlighting the importance of power users.
* **Critical Churn Rate:** A significant **2,113 customers are one-time buyers**. The retention rate is low, with only **28%** of customers returning for a second purchase.
* **Long Purchase Cycle:** The average time between repeat orders is **84 days**, indicating a potential gap in customer engagement and loyalty.

### 💰 Sales & Product Performance
* **Top Performers:** **'Aut Juice'** is the highest revenue-generating product (₹61.4K), while **Haldiram's** is the top-performing brand.
* **Peak Demand:** **Wednesday** is the busiest day with 2,214 orders. Surprisingly, **3 AM** is the peak ordering hour (657 orders), revealing a strong late-night user base.
* **Key Market:** **Tezpur** stands out as the leading city by revenue, generating **₹6.19L**.

### ⚙️ Operations & Transactions
* **Critical Payment Failures:** An alarming **50.33% of all transactions failed**. This represents a massive point of friction and a significant loss of potential revenue.
* **Most Reliable Method:** **Debit Cards** show the highest transaction success rate among used methods, though it's still a low **10.12%**.
* **Top Delivery Partner:** **Xpressbees** is the most frequently rated delivery partner, with **2,586** customer ratings.

---

## 📈 Actionable Business Recommendations

1.  **Enhance Customer Retention & Loyalty:**
    * Deploy targeted **re-engagement campaigns** (email, push notifications with special offers) for the 2,113 one-time buyers.
    * Introduce a **loyalty program** with tiered rewards to incentivize repeat purchases and shorten the 84-day average purchase cycle.

2.  **Optimize Marketing & Sales Strategy:**
    * Run promotional campaigns on **Wednesdays** and during **late-night hours** (e.g., "Midnight Munchies" deals) to capitalize on existing peak demand.
    * Feature top-performing products like 'Aut Juice' and popular brands like 'Haldiram's' prominently within the app to boost sales.

3.  **Streamline Operational & Payment Processes:**
    * **Urgently investigate and overhaul the payment gateway.** A 50.33% failure rate is a critical business issue that needs immediate resolution to prevent customer frustration and revenue loss.
    * Strengthen the partnership with top-performing delivery services like **Xpressbees**. Analyze their operational model to set performance benchmarks for other logistics partners.

---

## 🚀 How to Use This Project

Follow these steps to explore the analysis on your own machine.

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/your-username/zepto-analysis.git](https://github.com/your-username/zepto-analysis.git)
    cd zepto-analysis
    ```

2.  **Set Up the Database:**
    * Ensure you have a MySQL server installed.
    * Create a new database (e.g., `zepto_db`).
    * Import the `.csv` files from the `/data` directory into their respective tables in your database.

3.  **Run the Analysis:**
    * Open the `analysis.sql` file in your preferred SQL client.
    * Execute the queries to replicate the findings and perform your own exploratory analysis.

4.  **Explore the Dashboard:**
    * Open the `.pbix` file in Microsoft Power BI.
    * Connect the dashboard to your local MySQL database to interact with the visualizations and explore the data dynamically.
