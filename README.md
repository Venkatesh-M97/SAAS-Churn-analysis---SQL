# Customer Churn & Engagement Analysis  

This project demonstrates how SQL can be used to analyze **customer churn, engagement, and retention** for a subscription-based business.  
The queries classify customers into **Active, Churn Risk, and Churned**, enabling proactive engagement strategies.  

---

## 🔍 Objective  
- Identify customers who have **not paid in the last 90 days** (Churned).  
- Identify customers who have **not logged in during the last 90 days** (Inactive).  
- Detect customers who are **paying but not engaging** (Churn Risk).  
- Build a **churn classification model** using SQL queries.  
---

## 🛠️ Approach  
Using SQL queries with:  
- **Joins** → Combine customer, transaction, subscription, and activity data  
- **Group By & Aggregations** → Calculate last login/payment dates  
- **CASE Statements** → Assign churn categories
   
# Customer Churn & Engagement Analysis  
This project demonstrates how SQL can be used to analyze **customer churn, engagement, and retention** for a subscription-based business.  
The queries classify customers into **Active, Churn Risk, and Churned**, enabling proactive engagement strategies.  

---
## Sample logic glimpse: 
```sql
CASE 
   WHEN last_payment < 90_days THEN 'Churn'
   WHEN last_login < 90_days AND last_payment >= 90_days THEN 'Churn Risk'
   ELSE 'Active'
END
```

---
## 📈 Business Impact  
- **Churned Customers** → Targeted win-back campaigns  
- **Churn Risk Customers** → Proactive engagement before they leave  
- **Active Customers** → Strengthen loyalty through rewards/upselling  

✅ This analysis helps reduce churn, improve **Customer Lifetime Value (CLTV)**, and increase retention.  

---

## 🚀 Key Outcomes  
- Designed SQL queries to detect churn and engagement patterns  
- Built a **churn flag model** (Active, Churn Risk, Churned)  
- Helped create actionable insights for **customer success teams**  

---

## 📂 Repository Structure  
- `README.md` → Project overview & business context  
- `SAAS data.sql` → Contains detailed SQL queries used  

---

## 📬 Contact  
👤 **Venkatesh M**  
MBA (HR & Finance) | Business Analyst @ Freshworks  

📧 **venkateshmurali1597@gmail.com**  
🔗 [linkedin.com/in/venkatesh-m15](https://www.linkedin.com/in/venkatesh-m15?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3Bi9ze2bGJQDOxKLwuJFkiAA%3D%3D)

---


