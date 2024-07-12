# HR Absentee Data Analysis

![](https://github.com/ArunJakhmola/arunjakhmola.github.io/blob/main/assets/hr_absentees%203.png)

## Project Overview

This project aims to analyze absenteeism data using Power BI to uncover insights and trends. The analysis includes data visualization and extracting key metrics to provide a comprehensive overview of absenteeism patterns.

## Introduction

The HR Absenteeism Data Analysis project involves analyzing absenteeism data to identify trends and patterns that can help in making informed business decisions. The project covers various aspects of data analysis including data preprocessing, exploratory data analysis, and visualization.

## Dataset

The dataset used in this project includes:

- **Absenteeism_at_work**: ID, Reason for absence, Month, Day, Seasons, Transportation expense, Distance to Work, Service time, Age, Work load Average/day, Hit target, Disciplinary failure, Education, Son, Social drinker, Social smoker, Pet, Weight, Height, Body mass index, Absenteeism time (hours)
- **compensation**: ID, Compensation per hour
- **Reasons**: Number, Reason

## Tools Used

The following tools are used in this project:

- **Power BI**: For data visualization and business intelligence
- **MYSQL**: For data Manipulation and collecting relevant data from big dataset

## Project Structure

The project files are structured as follows:

- Absentee_data_project.pbix: Power BI file containing the analysis
- sql_queries: SQL file containing the queries which were used to extract the relevant part of the data from the larger dataset
- Dataset in CSV format
- README.md: Project overview and documentation (this file)


##Processing

# SQL Queries

```sql
-- create a join table
use absent_data_project;

-- optimized query
select e.id, r.reason, month_of_absence, bmi,
case 
	when bmi < 18.5 then "underweight"
	when bmi between 18.5 and 25 then "healthy weight"
	when bmi between 25 and 30 then "overweight"
	when bmi > 30 then "obese"
    else "unknown" end as bmi_category,
seasons,
case
	when month_of_absence in (12,1,2) then "winter"
	when month_of_absence in (3,4,5) then "spring"
	when month_of_absence in (6,7,8) then "summer"
	when month_of_absence in (9,10,11) then "fall"
	else "unknown" end as season_name,
weekday,
Transportation_expense,
education,son, social_drinker, social_smoker, pet, disciplinary_failure, age, Avg_work_load, hours_absent
from employee_data e
left join reasons r
on e.reason_for_absence = r.number;
```

## Analysis Questions and Findings

### 1. What are the main reasons for absenteeism?

- The top reasons for employee absenteeism are:
  1. Medical consultation
  2. Dental consultation

### 2. What are the weekly and monthly absenteeism trends?
- Weekly
  
![](https://github.com/ArunJakhmola/arunjakhmola.github.io/blob/main/assets/Screenshot%202024-07-12%20143013.png)

- Monthly
  
![](https://github.com/ArunJakhmola/arunjakhmola.github.io/blob/main/assets/Screenshot%202024-07-12%20143025.png)

### 3. Are there any seasonal trends in the absenteeism data?

- Spring has the most amount of absent hours (Spring is month number 3, 4 and 5)
  
![](https://github.com/ArunJakhmola/arunjakhmola.github.io/blob/main/assets/Screenshot%202024-07-12%20143025.png)

### 4. How does the absenteeism performance vary across different BMI Categories of employees?
- There is a strange finding in the Bmi category, where the healthiest employees are the ones with the most absent hours

![](https://github.com/ArunJakhmola/arunjakhmola.github.io/blob/main/assets/Screenshot%202024-07-12%20150020.png)


## Results

The key findings from the analysis include:

- Identification of main reasons for absenteeism
- Monthly and yearly absenteeism trends
- Correlation between different variables

## Conclusion

The analysis provided valuable insights into absenteeism patterns. These insights can help in optimizing workforce management, developing targeted interventions, and improving overall employee productivity.

## Future Work

Potential future improvements and extensions of this project include:

- Incorporating additional data sources for a more comprehensive analysis
- Implementing advanced analytics for deeper insights
- Developing interactive dashboards for real-time absenteeism monitoring

## Thank you
