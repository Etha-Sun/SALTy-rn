#!/usr/bin/env python3
"""Mechanical partial-progress ledger, explicitly not an admission checker."""
from pathlib import Path
import argparse,datetime,hashlib,json,re
T=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',action='append');a=p.parse_args()
runs=a.run or ['neonproof01','neonmanual02','neonmanual03','neonretry01','neonretry02','neonretry03','neonretry04','neonretry05','neonretry06']
required=set(re.findall(r'Axiom proof_of_(test_neon_\w+)\s*:',(T/'proof/coq/Qs8Neon/neon_goal.v').read_text()))
assert len(required)==1261
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
fields={};summaries={}
for run in runs:
 B=T/'.build'/run/'compile';rp=B/'records.json';mp=B/'manifest.json'
 if not rp.exists():continue
 records=json.loads(rp.read_text());manifest=json.loads(mp.read_text());mods={m['path']:m for m in manifest['modules']}
 passed={r['path']:r for r in records if r['exit']==0 and r['proof_object_exists'] and (B/r['path']).with_suffix('.vo').is_file() and sha((B/r['path']).with_suffix('.vo'))==r['vo_sha256']};cache={}
 def livevalid(k):
  if k not in mods:return True
  if k in cache:return cache[k]
  if k not in passed:cache[k]=False;return False
  f=T/k;cache[k]=f.exists() and sha(f)==mods[k]['sha256'] and all(livevalid(d)for d in mods[k]['dependencies']);return cache[k]
 count=0
 for k,r in passed.items():
  if not livevalid(k):continue
  for field in re.findall(r'Lemma\s+\w+\s*:\s*(?:\w+\.)?(test_neon_\w+)\s*\.',(T/k).read_text()):
   if field not in required:continue
   fields.setdefault(field,[]).append({'run':run,'source':k,'source_sha256':mods[k]['sha256'],'vo_sha256':r['vo_sha256']});count+=1
 summaries[run]={'checked_fields':count,'completed_modules':len(passed),'total_modules':len(mods),'terminal':(B/'result.json').exists()}
out={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Compiled actual NEON field lemmas with matching current sources, transitive local imports and proof object hashes. No complete-kernel, recursive-check or admission claim. External toolchain binding checked separately at admission.','required_fields':len(required),'compiled_unique_fields':len(fields),'pending_fields':sorted(required-fields.keys()),'runs':summaries,'fields':fields}
(T/'proof/neon-field-progress.json').write_text(json.dumps(out,indent=2)+'\n')
print({k:v for k,v in out.items()if k not in ('fields','pending_fields')})
