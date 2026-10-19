"""Summarize proof attempts, distinguishing missing final reports from zero goals."""
from pathlib import Path
import json,re,hashlib
b=Path(__file__).resolve().parents[1]
root=b.parents[2]
locked=json.loads((b/'locked.json').read_text())
rows=[]
for name in locked:
 variant=b/'model-variants'/(name+'-raw')
 d=variant if variant.exists() else b/'cases'/name
 reports=sorted((d/'logs').glob('*-summary.json'),key=lambda p:p.stat().st_mtime) if (d/'logs').exists() else []
 row={'case':name,'frozen_kernel_spec_unchanged':True,'whole_kernel_verified':False}
 original=json.loads((b/'cases'/name/'frozen.json').read_text())
 for item in original['files'].values():
  p=root/item['path']
  if hashlib.sha256(p.read_bytes()).hexdigest()!=item['sha256']:row['frozen_kernel_spec_unchanged']=False
 if reports:
  f=reports[-1];x=json.loads(f.read_text());log=f.with_name(f.name.replace('-summary.json','.log'));text=log.read_text()
  scheduled=re.findall(r'\[wp\]\s+(\d+) goals scheduled',text)
  row.update(status='complete' if x['complete'] else 'total-budget-timeout' if x['exit']==124 else 'pending-goals-or-tool-error',report=str(f.relative_to(root)),exit=x['exit'],seconds=x['seconds'],model=x['command'][x['command'].index('-wp-model')+1] if '-wp-model' in x['command'] else 'Typed',raw_obligations=x['raw_obligations'],raw_report_emitted=f.with_name(f.name.replace('-summary.json','.json')).exists(),scheduled_goals_from_log=int(scheduled[-1]) if scheduled else None,unchanged_at_run_end=x['unchanged'],timeout_goal_examples=re.findall(r'\[Timeout\]\s+(\S+)',text)[:12])
  row['proof_hashes_match_current']=all(hashlib.sha256((root/p).read_bytes()).hexdigest()==v for p,v in x['source_guard']['proof'].items())
  row['whole_kernel_verified']=bool(x['complete'] and row['proof_hashes_match_current'])
 else:
  logs=sorted((d/'logs').glob('*.log'),key=lambda p:p.stat().st_mtime) if (d/'logs').exists() else []
  row['status']='running-no-final-report' if logs else 'queued'
  if logs:
   text=logs[-1].read_text();scheduled=re.findall(r'\[wp\]\s+(\d+) goals scheduled',text);row['scheduled_goals_from_log']=int(scheduled[-1]) if scheduled else None
 rows.append(row)
(b/'proof-records/whole-kernel-status.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
