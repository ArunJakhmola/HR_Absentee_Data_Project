-- create a join table
use absent_data_project;

-- optimize this query

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

