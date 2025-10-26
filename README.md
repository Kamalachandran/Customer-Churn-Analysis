# 📊 Customer Churn Analysis Project  

![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg?logo=python)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811.svg?logo=powerbi)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue.svg?logo=mysql)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## 🧩 Overview

This project demonstrates a **complete end-to-end customer churn analysis pipeline** — from **data cleaning** and **SQL integration** to **machine learning predictions** and **Power BI visualization**.

It automates the data flow, builds a predictive model to detect potential churners, and visualizes actionable insights for business decision-making.

---

## 🗂️ Repository Structure

```bash
├── cleaning_and_load_to_sql.ipynb      # Cleans raw data and loads to MySQL
├── churn_prediction_model.ipynb        # Trains Random Forest model and predicts churn
├── Churn Analaysis.pbix              # Power BI dashboard (business insights)
├── customer_churn.csv               # Input dataset
└── README.md                        # Project documentation
```

---

## ⚙️ 1. Data Cleaning & SQL Loading

**File:** `cleaning_and_load_to_sql.ipynb`  
**Goal:** Clean and prepare customer data, then load it into a MySQL database.

**Key Steps:**
- Import raw dataset (`customer_churn.csv`)
- Rename columns and handle missing values
- Remove duplicates and export the cleaned data (`churn.csv`)
- Create and load a SQL table named **`churn`** under **`customer`** database

**Libraries Used:**  
`pandas`, `missingno`, `re`, `pymysql`


---

## 🤖 2. Machine Learning Model – Churn Prediction

**File:** `churn_prediction_model.ipynb`  
**Goal:** Build and evaluate a machine learning model to predict customer churn.

**Key Steps:**
- Load data from MySQL (`joined` & `churned` tables)
- Encode categorical variables using `LabelEncoder`
- Train a **Random Forest Classifier**
- Evaluate with **accuracy, confusion matrix, and feature importance**
- Export predictions to `prediction.csv`
- Visualize decision trees with `graphviz`

**Libraries Used:**  
`pandas`, `numpy`, `sklearn`, `matplotlib`, `seaborn`, `graphviz`, `pymysql`


---

## 📈 3. Power BI Dashboard

**File:** `Churn Analaysis.pbix`

The Power BI dashboard provides interactive analytics, including:
- 📉 Churn rates by demographics and subscription type  
- 💰 Revenue and profit loss from churned customers  
- 🧭 Retention trends and risk segmentation  

**Preview:** *(See `Churn Analaysis.pdf` for visuals and insights)*

---

## 🧠 Key Insights

- Customers with **month-to-month contracts** churn the most.  
- Lack of **premium support** correlates with higher churn.  
- **Internet type** is a strong predictor of churn.  
- Random Forest achieved **~85% accuracy** in predictions.

---

## 🛠️ Tech Stack

| Category | Tools Used |
|-----------|-------------|
| Language | Python |
| Database | MySQL |
| Visualization | Power BI |
| ML Algorithm | Random Forest Classifier |
| Libraries | pandas, numpy, sklearn, seaborn, matplotlib, pymysql, graphviz |

---

## 🚀 How to Run

1. Clone the repository  
   ```bash
   git clone https://github.com/<your-username>/customer-churn-analysis.git
   cd customer-churn-analysis
   ```

2. Install dependencies  
   ```bash
   pip install -r pandas  numpy sklearn matplotlib seaborn graphviz pymysql missingno
   ```

3. Configure your MySQL credentials inside the Python files.  
   (Default user: `root`, password: `"use your MYSQL password"`)

4. Run the data cleaning script  
   ```bash
   python cleaning_and_load_to_sql.py
   ```

5. Run the ML model script  
   ```bash
   python churn_prediction_model.py
   ```

6. Open `Churn Analaysis.pdf` for visualization.
