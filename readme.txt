# 🚲 Brno Cycling Analysis | SQL & Tableau

## 📌 Project Overview

This project analyzes cycling intensity across routes in Brno, Czech Republic, using **MySQL and Tableau**. The objective is to explore differences in cycling activity between weekdays and weekends, identify routes with higher cycling counts, and understand variations in cycling patterns across individual routes.

The project follows a data analytics workflow, from data validation and exploratory data analysis using SQL to visualizing patterns and communicating findings through Tableau.

## 🎯 Project Objectives

- Examine data quality by checking for missing values, duplicate records, and data consistency.
- Compare overall weekday and weekend cycling activity.
- Identify the top 10 routes by weekday and weekend cycling counts.
- Investigate route-level differences in cycling intensity.
- Visualize cycling patterns and distributions using Tableau.

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| MySQL | Data validation, querying, aggregation, and exploratory data analysis |
| Tableau | Data visualization and dashboard development |
| GitHub | Project documentation and version control |

## 🗃️ Dataset Description

The project uses the `cycling_intensity` dataset, which contains cycling intensity information for routes in Brno.

The main variables used in the analysis are:

| Column | Description |
|---|---|
| `objectid` | Object identifier |
| `no` | Route number |
| `vsedni_den_24` | Weekday cycling count |
| `vikend_24` | Weekend cycling count |
| `datum_exportu` | Data export date |
| `Shape__Length` | Route geometry length attribute |
| `GlobalID` | Global identifier |

## 🔍 SQL Analysis

SQL was used to validate the dataset, explore cycling activity, and calculate summary statistics before creating visualizations.

### 1. Data Quality & Validation

The initial analysis focused on understanding the dataset's structure and checking its reliability. The following checks were performed:

- Inspected column data types using `DESCRIBE`.
- Checked for duplicate records and repeated `objectid` and `GlobalID` values.
- Identified missing values across all columns.
- Examined minimum and maximum weekday and weekend cycling counts.
- Checked whether cycling counts were whole numbers.
- Investigated repeated route numbers and the number of distinct export dates.

### 2. Exploratory Data Analysis (EDA)

Further SQL queries were used to examine overall cycling activity and differences between routes. The analysis included:

- Calculating total and average weekday and weekend cycling counts.
- Measuring the absolute difference between weekday and weekend cycling volumes.
- Calculating the percentage contribution of weekday and weekend counts.
- Identifying the top 10 routes by weekday and weekend cycling counts.
- Comparing weekday and weekend counts for individual routes.
- Identifying routes with higher weekday or weekend activity.
- Calculating relative differences between weekday and weekend cycling counts.

## 📊 Tableau Visualizations

The results of the SQL analysis were explored through Tableau visualizations designed to make cycling patterns easier to compare and interpret.

| Visualization | Purpose |
|---|---|
| Weekday vs. Weekend Cycling Activity | Compares cycling counts between weekdays and weekends. |
| Top 10 Routes by Weekday Cycling | Compares weekday and weekend activity across the ten routes with the highest weekday counts. |
| Weekend Cycling Count Distribution | Examines the distribution of weekend cycling counts. |
| Route-Level Cycling Comparisons | Highlights differences in cycling intensity across individual routes. |

## 💡 Key Findings

The analysis aims to identify meaningful differences in cycling activity across weekdays, weekends, and individual routes. The final findings will be based on the SQL query results and Tableau visualizations.

Key areas of investigation include:

- **Overall Cycling Activity:** Whether total and average cycling counts differ between weekdays and weekends.
- **Popular Routes:** Which routes record the highest weekday and weekend cycling counts.
- **Route-Level Differences:** Which routes experience relatively higher cycling activity on weekdays or weekends.
- **Cycling Distribution:** How weekend cycling counts are distributed across the dataset.

*Specific numerical findings will be added after reviewing the final query results.*

## 📁 Repository Structure

The repository is organized to keep the SQL analysis, Tableau work, and project documentation easy to navigate.

```text
brno-cycling-analysis/
│
├── sql/
│   └── brno_cycling_analysis.sql
│
├── tableau/
│   └── brno_cycling_dashboard.twbx
│
├── visualizations/
│   └── dashboard_screenshot.png
│
├── data/
│   └── cycling_intensity.csv
│
└── README.md
```

*The structure above is illustrative. Update the folders and filenames to match your actual repository. Include the dataset only if redistribution is permitted.*

## 🚀 How to Explore the Project

To reproduce the analysis, open the SQL script in a MySQL environment and ensure the dataset is available under the expected database and table name. Execute the queries to review the data validation checks and cycling statistics. The Tableau workbook can then be opened to explore the visualizations, provided the workbook and any required data sources are available.

## 🔮 Future Improvements

Potential extensions include developing an interactive Tableau dashboard with route filters, investigating seasonal or monthly cycling trends if suitable data becomes available, and exploring the relationship between route length and cycling intensity.

## 👤 Author

**Zaina Khanum**

SQL | Tableau | Data Visualization

[Connect with me on LinkedIn](https://www.linkedin.com/in/zaina-khanum)

---

*This project demonstrates practical SQL querying, data validation, exploratory data analysis, and data visualization using an urban cycling dataset.*
