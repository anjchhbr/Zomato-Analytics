# 🍽️ Zomato Restaurant Analytics | End-to-End Data Analytics Project

## 📌 Project Overview

This project focuses on analyzing Zomato restaurant data to uncover meaningful business insights related to restaurant distribution, customer ratings, pricing, cuisines, restaurant opening trends, and digital service availability.

The project follows an end-to-end data analytics workflow, starting with raw data preparation and SQL-based analysis, followed by interactive dashboard development using Microsoft Excel, Power BI, and Tableau.

The objective is to transform raw restaurant data into meaningful insights that can help understand restaurant market trends, customer preferences, and business performance.

## 🎯 Project Objectives

- Analyze restaurant distribution across different countries and cities.
- Identify restaurant opening trends across years, quarters, and months.
- Understand restaurant ratings and rating distributions.
- Analyze average cost for two and restaurant price categories.
- Identify the most popular cuisines and cities.
- Evaluate table booking and online delivery availability.
- Build interactive dashboards for business reporting and decision-making.
- Generate actionable insights through data visualization.

## 🛠️ Tools & Technologies Used

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning, transformation, Pivot Tables, KPIs, and interactive dashboard |
| SQL (MySQL) | Database creation, data validation, joins, aggregations, and business queries |
| Power BI | Interactive dashboards, DAX measures, slicers, maps, and data visualization |
| Tableau | Interactive visualizations, geographical analysis, and dashboard development |
| PowerPoint | Project presentation and business insights |

## 📂 Project Structure

The project contains the following deliverables:

```text
Zomato-Restaurant-Analytics/
│
├── README.md
│
├── SQL/
│   └── Zomato Project.sql
│
├── Excel/
│   └── Zomato Project Soln.xlsx
│
├── PowerBI/
│   └── Zomato Project Soln.pbix
│
├── Tableau/
│   └── Zomato Project Soln.twbx
│
└── Presentation/
    └── Zomato PPT.pptx
```

## 📊 Dataset Overview

The project uses a Zomato restaurant dataset containing **9,551 restaurant records** and **36 columns**.

The dataset includes information such as:

- Restaurant ID
- Restaurant Name
- Country Code
- City
- Address
- Locality
- Longitude and Latitude
- Cuisines
- Currency
- Table Booking Availability
- Online Delivery Availability
- Price Range
- Votes
- Average Cost for Two
- Restaurant Rating
- Restaurant Opening Date

Additional analytical tables were created to support geographical and time-based analysis.

### Supporting Tables

1. **Country Map Table:** Maps country codes to country names.
2. **Calendar Table:** Contains year, month, quarter, weekday, financial month, and financial quarter information.

## 🧹 Data Preparation & Data Cleaning

The project involved preparing the dataset for analysis through the following activities:

- Examined the dataset structure and column information.
- Checked total restaurant records and column counts.
- Identified duplicate restaurant IDs.
- Checked missing values in important columns.
- Validated restaurant ratings and price ranges.
- Examined missing and zero geographical coordinates.
- Created supporting country mapping and calendar tables.
- Prepared rating and price categories for analytical segmentation.

## 🗄️ SQL Analysis

SQL was used as the foundation for data validation, transformation, and business analysis.

### Key SQL Concepts Used

- CREATE DATABASE and CREATE TABLE
- LOAD DATA LOCAL INFILE
- SELECT, WHERE, ORDER BY
- GROUP BY and HAVING
- Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)
- Joins (LEFT JOIN and INNER JOIN)
- CASE Statements
- Subqueries
- DISTINCT
- Date Functions
- Data Validation and Duplicate Checks

### Business Questions Solved Using SQL

1. How many restaurants are available in the dataset?
2. How many unique cities and countries are covered?
3. Which cities have the highest number of restaurants?
4. Which cuisines have the highest restaurant counts?
5. How are restaurants distributed across different countries?
6. What are the restaurant opening trends by year, quarter, and month?
7. How are restaurants distributed across different rating categories?
8. What is the minimum, maximum, and average cost for two?
9. How many restaurants provide table booking facilities?
10. What percentage of restaurants offer online delivery?

## 📈 Excel Dashboard

An interactive Excel dashboard was developed to present restaurant analytics through KPIs, Pivot Tables, charts, and slicers.

### Key Features

- KPI Cards
- Restaurant Opening Trend Analysis
- Restaurant Distribution by Country
- Top 10 Cities by Restaurant Count
- Top 10 Cuisines by Restaurant Count
- Restaurant Rating Distribution
- Price Range Analysis
- Online Delivery Availability
- Table Booking Availability
- Year, Quarter, and Month Slicers
- Business Insights and Summary

## 📊 Power BI Dashboard

An interactive Power BI dashboard was developed to provide deeper business insights through dynamic visualizations and interactive filtering.

### Key Features

- KPI Cards for important business metrics
- Restaurant Distribution by Country and City
- Restaurant Opening Trends
- Rating Bucket Analysis
- Price Bucket Analysis
- Online Delivery Availability
- Table Booking Availability
- Cuisine Analysis
- Geographic Maps and Location Analysis
- Interactive Slicers and Filters
- Cross-filtering between visuals
- Page Navigation
- Overview, Geography, Restaurants, and Cuisine pages

### Interactive Capabilities

- Dynamic filtering using slicers.
- Drill-down and drill-up analysis.
- Interactive map visualizations.
- Page navigation buttons.
- Reset functionality for dashboard filters.
- Cross-visual interactions.

## 📉 Tableau Dashboard

Tableau was used to build interactive visualizations with a focus on geographical analysis and visual storytelling.

### Key Features

- Country-wise Restaurant Distribution Map
- Restaurant Density Map
- Restaurant Opening Trend by Year
- Top 10 Cities by Restaurant Count
- Top 10 Cuisines by Restaurant Count
- Average Rating by Price Range
- Average Cost vs Rating Analysis
- Interactive Country, City, Year, Quarter, and Month Filters

## 💡 Key Business Insights

Based on the analysis of 9,551 restaurant records, the following insights were identified:

### 1. Restaurant Distribution

- New Delhi has the highest number of restaurant records, with 5,473 restaurants.
- Gurgaon and Noida follow with 1,118 and 1,080 restaurants, respectively.
- New Delhi accounts for approximately 57.3% of all restaurant records.

### 2. Restaurant Ratings

- The 3.0–3.9 rating category represents the largest segment.
- 4,388 restaurants fall within this rating category.
- Approximately 45.9% of restaurants are in this segment.

### 3. Online Delivery

- Approximately 25.66% of restaurants offer online delivery.
- This indicates that online delivery availability is limited to a minority of restaurant records.

### 4. Table Booking

- Approximately 12.12% of restaurants provide table booking facilities.
- Most restaurant records do not indicate table booking availability.

### 5. Pricing Analysis

- The 251–500 average-cost bucket is the largest segment.
- It contains 3,469 restaurant records.

**Note:** These findings describe patterns within the available dataset. They do not establish revenue, profitability, or causal business relationships.

## 🚀 Business Recommendations

Based on the descriptive analysis, the following areas could be explored further:

- Analyze restaurant performance across different cities to identify geographical opportunities.
- Investigate customer ratings across cuisine and price categories.
- Compare online delivery adoption across cities and restaurant segments.
- Explore the relationship between restaurant ratings and customer votes.
- Identify areas with relatively low restaurant coverage.
- Analyze restaurant opening patterns to understand market expansion trends.

## 📌 Skills Demonstrated

Through this project, I demonstrated practical experience in:

- Data Cleaning and Data Preparation
- Exploratory Data Analysis (EDA)
- SQL Query Writing
- Data Validation
- Data Transformation
- Database Management
- Excel Pivot Tables and Dashboard Development
- Power BI Dashboard Development
- Data Modeling and DAX
- Tableau Visualization
- KPI Development
- Business Intelligence
- Data Visualization and Storytelling
- Analytical Thinking and Business Insights

## 📥 How to Explore This Project

You can explore the project using the following files:

| File | Description |
|---|---|
| `Zomato Project.sql` | SQL queries and analytical logic |
| `Zomato Project Soln.xlsx` | Excel workbook containing data and dashboard |
| `Zomato Project Soln.pbix` | Interactive Power BI report |
| `Zomato Project Soln.twbx` | Tableau packaged workbook |
| `Zomato PPT.pptx` | Complete project presentation |

### Requirements

- Microsoft Excel
- MySQL / MySQL Workbench
- Microsoft Power BI Desktop
- Tableau Desktop or Tableau Reader

**Important:** Review the SQL script before executing it. It contains database deletion and table truncation statements as well as the analytical queries. Execute the required setup and analysis sections selectively, preferably using a test database.

## 🎓 Project Conclusion

This project provided hands-on experience in building an end-to-end data analytics solution using multiple industry-relevant tools.

By integrating SQL, Excel, Power BI, and Tableau, raw restaurant data was transformed into structured information, interactive dashboards, and meaningful business insights.

The project demonstrates the complete analytics workflow:

**Raw Data → Data Cleaning → SQL Analysis → Data Visualization → Interactive Dashboards → Business Insights**

It highlights the importance of combining technical analytical skills with business understanding to support data-driven decision-making.
