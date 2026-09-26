from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]; RAW=ROOT/'data/raw'; OUT=ROOT/'outputs'
def normalize(x):
    if pd.isna(x): return None
    s=str(x).upper().replace('  ',' ').strip()
    for a,b in [(' LTD',''),(' INC',''),(' TECH',' TECHNOLOGIES'),(' SOLNS',' SOLUTIONS')]:
        if s.endswith(a): s=s[:-len(a)]+b
    return s
def main():
    v=pd.read_csv(RAW/'vendor_master.csv'); t=pd.read_csv(RAW/'spend_transactions.csv')
    nm={normalize(n):i for i,n in zip(v.vendor_id,v.canonical_vendor_name)}
    cm=v.set_index('vendor_id').canonical_category.to_dict()
    t['normalized_vendor_name']=t.vendor_name.map(normalize)
    t['mapped_vendor_id']=t.normalized_vendor_name.map(nm).fillna(t.vendor_id)
    t['expected_category']=t.mapped_vendor_id.map(cm)
    t['classification_status']=t.raw_category.eq(t.expected_category).map({True:'MATCH',False:'MISMATCH'})
    t.loc[t.raw_category.isna(),'classification_status']='MISSING_CATEGORY'
    t['final_category']=t.expected_category.fillna(t.raw_category)
    t['duplicate_flag']=t.transaction_id.duplicated(False)
    t.to_csv(OUT/'enriched_spend_transactions.csv',index=False)
    print(f'Processed {len(t):,} transactions.')
if __name__=='__main__': main()
