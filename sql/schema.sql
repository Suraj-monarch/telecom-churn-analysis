create database churn_db;
use churn_db;

CREATE TABLE customer_data(
Customer_ID VARCHAR(50),
Gender VARCHAR(10),
Age INT,
Married VARCHAR(10),
State VARCHAR(30),
Number_of_Referrals INT,
Tenure_in_Months INT,
Value_deal VARCHAR(20),
Phone_Service VARCHAR(10),
Multiple_Lines VARCHAR(20),
Internet_Service VARCHAR(20),
Internet_Type VARCHAR(30),
Online_Security VARCHAR(10),
Online_Backup VARCHAR(10),
Device_Protection_Plan VARCHAR(10),
Premium_Support VARCHAR(10),
Streaming_TV VARCHAR(10),
Streaming_Movies VARCHAR(10),
Streaming_Music VARCHAR(10),
Unlimited_Data VARCHAR(10),
Contract VARCHAR(20),
Paperless_Billing VARCHAR(10),
Payment_Method VARCHAR(30),
Monthly_Charge FLOAT,
Total_charges FLOAT,
Total_Refunds FLOAT,
Total_Extra_Data_charges INT,
Total_Long_Distance_Charges FLOAT,
Total_Revenue FLOAT,
Customer_Status VARCHAR(20),
Churn_Category VARCHAR(30),
Churn_Reason VARCHAR(200)
);

show tables;
select * from customer_data
limit 10;