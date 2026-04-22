CREATE TABLE customer_churn
(
    customer_id VARCHAR(50),
    gender VARCHAR(10),
    senior_citizen INT,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INT,
    phone_service VARCHAR(10),
    multiple_lines VARCHAR(20),
    internet_service VARCHAR(20),
    online_security VARCHAR(20),
    online_backup VARCHAR(20),
    device_protection VARCHAR(20),
    tech_support VARCHAR(20),
    streaming_TV VARCHAR(20),
    streaming_movies VARCHAR(20),
    contract VARCHAR(20),
    paperless_billing VARCHAR(10),
    payment_method VARCHAR(50),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    churn VARCHAR(10),
    churn_flag INT,
    yearly_revenue DECIMAL(10,2),
    tenure_group VARCHAR(20)
);


DROP TABLE customer_churn;


select * from customer_churn;


\copy customer_churn FROM 
'C:\Users\mopid\Desktop\Telco_customer_churn\data\cleaned_churn.csv' DELIMITER ',' CSV HEADER;


SELECT COUNT(*) FROM customer_churn;


-------- 1. Churn rate

SELECT COUNT(
	CASE 
		WHEN churn_flag = 1 THEN 1
	END
) * 100.0 / COUNT(*) AS churn_rate
FROM customer_churn;



------- 2. Revenue loss

SELECT SUM(yearly_revenue) AS revenue_lost
FROM customer_churn
WHERE churn_flag = 1;



-------- 3. Churn by contract

SELECT contract,
		COUNT(*) AS total_customers,
		SUM(churn_flag) AS churned,
		ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY contract;


-------- 4. Customer segmentation

SELECT customer_id,
		monthly_charges,
		NTILE(4) OVER (ORDER BY monthly_charges DESC) AS segment
FROM customer_churn;


------- 5. Tenure vs Churn

SELECT tenure_group,
		COUNT(*) AS total,
		SUM(churn_flag) AS churned,
		ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY tenure_group;


----- 6. High-risk customers

SELECT * FROM customer_churn 
WHERE contract = 'Month-to-month'
AND monthly_charges > 70
AND churn_flag = 1;


------ 7. Running revenue

SELECT tenure,
		SUM(yearly_revenue) OVER (ORDER BY tenure) AS cummulative_revenue
FROM customer_churn;





------- 1. Churn rate by multiple dimensions

SELECT contract,
		internet_service,
		ROUND(AVG(churn_flag) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY contract, internet_service
ORDER BY churn_rate DESC;



-------- 2. Top revenue genrating customers

SELECT customer_id,
		SUM(yearly_revenue) AS total_revenue
FROM customer_churn
GROUP BY customer_id
ORDER BY total_revenue
LIMIT 10;



------- 3. Customer lifetime value

SELECT customer_id,
		tenure, monthly_charges,
		(tenure * monthly_charges) AS lifetime_value 
FROM customer_churn
ORDER BY lifetime_value DESC;



------- 4. Churn contribution by segment

SELECT tenure_group,
		COUNT(*) AS total_customers,
		SUM(churn_flag) AS churned_customers,
		ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;




-------- 5. Rank customers by spending 

SELECT customer_id,
		monthly_charges,
		RANK() OVER (ORDER BY monthly_charges DESC) AS spending_rank
FROM customer_churn;




-------- 6. Running toatl revenue

SELECT tenure,
		SUM(yearly_revenue) OVER(ORDER BY tenure) AS cummulative_revenue
FROM customer_churn;



-------- 7. Churn rate with window function

SELECT contract,
		COUNT(*) AS toatl_cuatomers,
		SUM(churn_flag) AS churned,
		ROUND(SUM(churn_flag) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS overall_contribution
FROM customer_churn
GROUP BY contract;


-------- 8. High value but high risk customers

SELECT * FROM customer_churn
WHERE monthly_charges > (
		SELECT AVG(monthly_charges) FROM customer_churn
		)
AND churn_flag = 1;



--------- 9. Rentention by contract

SELECT contract,
		COUNT(*) AS toatl,
		COUNT(*) - SUM(churn_flag) AS retained,
		ROUND(COUNT(*) - SUM(churn_flag) * 100.0 / COUNT(*), 2) AS retention_rate
FROM customer_churn
GROUP BY contract;




-------- 10. Most common payment method among churned users

SELECT payment_method,
		COUNT(*) AS churn_count
FROM customer_churn
WHERE churn_flag =1
GROUP BY payment_method
ORDER BY churn_count DESC;



------- 11. Correlation-like analysis

SELECT 
	CASE 
		WHEN monthly_charges < 50 THEN 'Low'
		WHEN monthly_charges BETWEEN 50 AND 80 THEN 'Medium'
		ELSE 'High'
	END AS charge_category,
	ROUND(AVG(churn_flag) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY charge_category;


