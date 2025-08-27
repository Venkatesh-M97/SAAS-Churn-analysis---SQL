---1. Customers who hadnt paid in last 90 days (churned)
select t.customer_id, max(t.transaction_date) as Last_paid_date,c.name, c.email
from transactions t
left join customers c on t.customer_id = c.customer_id
group by t.customer_id, c.name, c.email
having MAX(t.transaction_date) < DATEADD(DAY, -90, GETDATE())

--------helps in reaching out to the customers who hadnt paid in last 3months and possibly winback few
-------------------------------------------------------------------------------------------------------
---Customers who hadnt engaged in last 90 days 
select u.customer_id, max(u.event_date) as last_logged_at, c.name, c.email
from user_activity1 u
left join customers c on u.customer_id = c.customer_id
where u.event_type = 'Login'
group by u.customer_id, c.name, c.email
having MAX(u.event_date) < DATEADD(DAY, -90, GETDATE())	

--------helps in reaching out to the customers who hadnt logged in last 3months to reachout 
--------and get to know the issues and help them to sort out.
-------------------------------------------------------------------------------------------------------
---Customers who hadnt engaged in last 90 days but paid the subscription
SELECT 
    u.customer_id, 
    MAX(u.event_date) AS last_logged_at, 
    MAX(t.transaction_date) AS Last_paid_date, 
    c.name,
    c.email
FROM user_activity1 u
LEFT JOIN transactions t 
    ON u.customer_id = t.customer_id
LEFT JOIN customers c 
    ON u.customer_id = c.customer_id
WHERE u.event_type = 'Login'
GROUP BY u.customer_id, c.name, c.email
HAVING MAX(u.event_date) < DATEADD(DAY, -90, GETDATE())	
   AND MAX(t.transaction_date) >= DATEADD(DAY, -90, GETDATE());
---Helps in identify the customers who might get churn soon and helps in to react proactively.
-------------------------------------------------------------------------------------------------------
---combining all
SELECT 
    c.customer_id, c.name, c.email,
    MAX(u.event_date) AS last_logged_at, 
    MAX(t.transaction_date) AS Last_paid_date, 
    s.status,
   (case 
   when (MAX(t.transaction_date) < DATEADD(DAY, -90, GETDATE())) then 'churn' 
   when (MAX(u.event_date) < DATEADD(DAY, -90, GETDATE()) and
   MAX(t.transaction_date) >= DATEADD(DAY, -90, GETDATE())) then 'Churn risk' else 'active' end) as Churn_flag
FROM customers c
LEFT JOIN transactions t 
    ON c.customer_id = t.customer_id
LEFT JOIN user_activity1 u
    ON c.customer_id = u.customer_id
LEFT JOIN subscriptions s
    ON c.customer_id = s.customer_id
WHERE u.event_type = 'Login'
GROUP BY c.customer_id, c.name, c.email, s.status

----helps in indetify the customer and run programs to increase the customer base
------------------------------------------------------------------------------------------------------
