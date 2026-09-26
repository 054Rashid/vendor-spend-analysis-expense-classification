# Classification & QA Rules
1. Normalize vendor names.
2. Map normalized names to vendor master.
3. Use vendor-master category as expected classification.
4. Flag missing categories.
5. Flag raw-vs-expected category mismatches.
6. Flag duplicate transaction IDs.
7. Flag unusually large within-category transactions.
8. Flag department/category policy exceptions.
9. Preserve raw values and corrected values separately.
10. Route exceptions for review instead of silently deleting them.
