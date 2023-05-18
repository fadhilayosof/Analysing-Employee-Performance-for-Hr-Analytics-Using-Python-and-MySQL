
/*Task1: Find the average age of employees in each department and gender group. ( Round average  age up to two decimal places if needed)*/

select 
department, gender,ROUND(avg(age),2) As average_age
FROM employee
group by department, gender;

/*Task2: List the top 3 departments with the highest average training scores. ( Round average scores up to two decimal places if needed)*/

SELECT department, round(AVG(avg_training_score),2) as department_training_score 
FROM employee
group by department
ORDER BY department_training_score DESC
limit 3;

/*Task3: Find the percentage of employees who have won awards in each region. (Round percentages up to two decimal places if needed)*/

select region, round(count(*) *100/(select sum(awards_won) from employee),2 )as award_percentage
from employee
where awards_won != 0 
group by region

/*Task4: Show the number of employees who have met more than 80% of KPIs for each recruitment channel and education level.*/ 

SELECT recruitment_channel, education, COUNT(*) as employee_count
from employee
where KPIs_met_more_than_80!=0 
group by recruitment_channel, education

/*Task5: Find the average length of service for employees in each department, considering only employees
 with previous year ratings greater than or equal to 4. ( Round average length up to two decimal places if needed)*/
 
SELECT department,round(avg(length_of_service),2) as average_lenghth_of_service
from employee
where previous_year_rating >=4
group by department

/*Task6: List the top 5 regions with the highest average previous year ratings.
 ( Round average ratings up to two decimal places if needed)*/

select region , round(avg(previous_year_rating),2)  as average_previous_year_rating
from employee
group by region
order by average_previous_year_rating DESC
limit 5

/*Task7: List the departments with more than 100 employees having a length of service greater than 5 years */
select department, count(*) as employee_count 
from employee
where length_of_service >5
group by department 
having count(*)>100

/*Task8: Show the average length of service for employees who have attended more than 3 trainings, grouped by department and gender. 
( Round average length up to two decimal places if needed)*/
select department, gender, round(avg(length_of_service),2) as average_length_of_service 
from employee
where no_of_trainings >3
group by department, gender

/*Task9: Find the percentage of female employees who have won awards, per department.
 Also show the number of female employees who won awards and total female employees.
 ( Round percentage up to two decimal places if needed)*/
 
select department,  round(count(case when awards_won is true then 1 ELSE null end ) /count(employee_id )*100,2)  as female_award_winners_precentage, count(employee_id),
COUNT(CASE when awards_won is true then 1 ELSE  NULL END) AS no_of_award
from employee
where  gender = 'F'
GROUP BY department

/*Task10: Calculate the percentage of employees per department who have a length of service between 5 and 10 years.
 ( Round percentage up to two decimal places if needed)*/ 
 
select department, round(sum(case when length_of_service between 5 and 10 then 1 else null end )/count(*)*100,2 ) as service_percentage 
from employee
group by department

/*Task11: Find the top 3 regions with the highest number of employees who have met more than 80% of their KPIs and received at least one award, 
grouped by department and region.*/

select  department, region  ,count(*) AS total_employees  from employee
where KPIs_met_more_than_80 is True and awards_won >= 1 
group by  department , region 
order by total_employees desc
limit 3

/*Task12: Calculate the average length of service for employees per education level and gender, considering only those employees who have completed more than 2 trainings and have an average training score greater than 75 
( Round average length up to two decimal places if needed)*/

select education, gender, round(avg(length_of_service),2) as average_serviec
from employee
where no_of_trainings>2  and avg_training_score>75
group by education, gender

/*Task13: For each department and recruitment channel, find the total number of employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, 
and have a length of service greater than 10 years.*/

select department, recruitment_channel,count(*)
from employee
where KPIs_met_more_than_80!=0 
and previous_year_rating=5 and length_of_service >10
group by department, recruitment_channel

/*Task14: Calculate the percentage of employees in each department who have received awards, have a previous_year_rating of 4 or 5, and an average training score above 70, grouped by department and gender 
( Round percentage up to two decimal places if needed).*/
select department, gender, round(sum( case when awards_won=1 and previous_year_rating >=4 and avg_training_score>70  then 1 else 0 end) /count(*)*100 ,2 ) as award_precentage
from employee
group by department,gender

/*Task15: List the top 5 recruitment channels with the highest average length of service for employees who have met more than 80% of their KPIs, have a previous_year_rating of 5, and an age between 25 and 45 years, grouped by department and recruitment channel.
 ( Round average length up to two decimal places if needed).*/
 
 select department, recruitment_channel,  round(avg(length_of_service),2) as avarage_service_length
from employee
where KPIs_met_more_than_80 !=0
and previous_year_rating =5
and age between 25 and 45
group by department, recruitment_channel
order by avarage_service_length DESC
limit 5