-- Top vendors
SELECT mapped_vendor_id,vendor_name,COUNT(DISTINCT transaction_id) transactions,ROUND(SUM(amount_usd),2) spend_usd
FROM spend_transactions WHERE duplicate_flag=0 AND amount_usd>0
GROUP BY mapped_vendor_id,vendor_name ORDER BY spend_usd DESC LIMIT 20;

-- Category spend
SELECT final_category,COUNT(DISTINCT transaction_id) transactions,ROUND(SUM(amount_usd),2) spend_usd
FROM spend_transactions WHERE duplicate_flag=0 AND amount_usd>0
GROUP BY final_category ORDER BY spend_usd DESC;

-- Classification exceptions
SELECT transaction_id,vendor_name,raw_category,expected_category,amount_usd
FROM spend_transactions WHERE classification_status='MISMATCH';

-- Policy exceptions
SELECT department,final_category,COUNT(*) exception_count,ROUND(SUM(amount_usd),2) exception_spend
FROM spend_transactions WHERE department_policy_status='POLICY_EXCEPTION'
GROUP BY department,final_category ORDER BY exception_spend DESC;

-- Monthly trend
SELECT substr(transaction_date,1,7) month,COUNT(DISTINCT transaction_id) transactions,ROUND(SUM(amount_usd),2) spend_usd
FROM spend_transactions WHERE duplicate_flag=0 AND amount_usd>0
GROUP BY month ORDER BY month;
