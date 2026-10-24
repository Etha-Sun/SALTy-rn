#!/usr/bin/env python3
"""Source/goal-bound incremental field coverage, never a whole-kernel certificate."""
from pathlib import Path
import argparse,datetime,hashlib,json,re
T=Path(__file__).resolve().parents[1]
sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
read=lambda f:json.loads(f.read_text())
p=argparse.ArgumentParser();p.add_argument('side',choices=['rvv','neon']);p.add_argument('--base-run',default='rvvbase05');p.add_argument('--batches',nargs='*',default=[]);p.add_argument('--manual',nargs='*',default=[]);a=p.parse_args()
goal=T/'proof/coq'/('IGemm'+a.side.title())/(a.side+'_goal.v');goal_hash=sha(goal)
required=set(re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M));bindings={}
B=T/'.build'/a.base_run/'compile';base=read(B/'result.json');assert base['passed'] and base['inputs_unchanged']
def add(source,h,run):
 f=T/source;assert sha(f)==h,(source,'source changed')
 s=f.read_text();assert not re.search(r'\b(?:Admitted|admit|Abort)\b',s),(source,'incomplete proof')
 for n in re.findall(r'Lemma proof_of_(\w+)\s*:',s):
  if n in required:bindings.setdefault(n,{'source':source,'source_sha256':h,'run':run})
if a.side=='rvv':
 assert sha(B/'proof/coq/IGemmRvv/rvv_goal.v')==goal_hash
 for r in base['records']:
  if not r['exit']:add(r['path'],r['source_sha256'],a.base_run)
for run in a.batches:
 O=T/'.build'/run/'fields';status=read(O/'result.json');assert status['inputs_unchanged']
 dep=read(O/'base.json');base_dir=T/'.build'/dep['run']/'compile'
 assert dep['result_sha256']==sha(base_dir/'result.json')
 assert dep['manifest_sha256']==sha(base_dir/'manifest.json')
 records=read(O/'records.json')
 if a.side=='rvv':assert sha(base_dir/'proof/coq/IGemmRvv/rvv_goal.v')==goal_hash
 else:
  record=next(r for r in records if r['source']=='proof/coq/IGemmNeon/neon_goal.v')
  assert record['exit']==0 and record['sha256']==goal_hash
 for r in records:
  if r['exit']==0:add(r['source'],r['sha256'],run)
for run in a.manual:
 O=T/'.build'/run;r=read(O/'result.json');assert r['passed'] and r['inputs_unchanged'] and r['current_goal_matches_base'] and r['goal_sha256']==goal_hash
 add(r['source'],r['source_sha256'],run)
d={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'goal_sha256':goal_hash,'required_fields':len(required),'checked_fields':len(bindings),'remaining_fields':sorted(required-bindings.keys()),'bindings':bindings,'whole_kernel_proved':False,'scope':'Incremental actual C-field coverage only; full interface/fresh admission remains required','base_run':a.base_run,'batch_runs':a.batches,'manual_runs':a.manual}
(T/'proof/evidence'/(a.side+'-current-coverage.json')).write_text(json.dumps(d,indent=2)+'\n')
print(a.side,len(bindings),'/',len(required),'remaining',len(required)-len(bindings))
