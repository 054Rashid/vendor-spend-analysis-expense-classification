from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]
def test_sources():
    assert (ROOT/'data/raw/vendor_master.csv').exists()
    assert (ROOT/'data/raw/spend_transactions.csv').exists()
def test_defects():
    assert len(pd.read_csv(ROOT/'data/reference/classification_defect_manifest.csv'))>=100
def test_outputs():
    assert all((ROOT/'outputs'/x).exists() for x in ['kpis.csv','vendor_spend.csv','category_spend.csv','expense_classification_exceptions.csv'])
