DROP VIEW IF EXISTS vw_vendor_spend;
CREATE VIEW vw_vendor_spend AS
SELECT mapped_vendor_id vendor_id,vendor_name,COUNT(DISTINCT transaction_id) transaction_count,ROUND(SUM(amount_usd),2) spend_usd
FROM spend_transactions WHERE duplicate_flag=0 AND amount_usd>0 GROUP BY mapped_vendor_id,vendor_name;

DROP VIEW IF EXISTS vw_category_spend;
CREATE VIEW vw_category_spend AS
SELECT final_category expense_category,COUNT(DISTINCT transaction_id) transaction_count,ROUND(SUM(amount_usd),2) spend_usd
FROM spend_transactions WHERE duplicate_flag=0 AND amount_usd>0 GROUP BY final_category;
