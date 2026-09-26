# Data Dictionary
vendor_master: vendor_id, canonical_vendor_name, canonical_category, contracted_flag.
spend_transactions: transaction_id, transaction_date, vendor_id, vendor_name, department, raw_category, amount_usd, payment_method, source_system.
Derived: normalized_vendor_name, mapped_vendor_id, expected_category, classification_status, final_category, amount_zscore, anomaly_flag, department_policy_status, duplicate_flag.
