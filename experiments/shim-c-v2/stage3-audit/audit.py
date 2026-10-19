#!/usr/bin/env python3
"""Independent static/input/raw-report audit; does not upgrade diagnostics to proof."""
from pathlib import Path
import sys,json,hashlib,re
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
RUN=sys.argv[1] if len(sys.argv)>1 else 'root-audit01'
assert re.fullmatch(r'[a-zA-Z0-9_-]+',RUN)
assert not (HERE/(RUN+'.json')).exists(),'Use a fresh audit name'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
records=[]
for group in ['stage3-gemm','stage3-conv','stage3-pool-spmm']:
 for frozen in sorted((HERE.parent/group).rglob('frozen.json')):
  if '.build' in frozen.parts:continue
  case=frozen.parent;data=json.loads(frozen.read_text());name=data['name']
  base=HERE.parent/'v4-campaign'/name/'frozen.json'
  if not base.exists():
   candidates=[p for p in (HERE.parent/'v4-campaign').iterdir() if name.startswith(p.name+'-') and (p/'frozen.json').exists()]
   if not candidates:
    # Some independent candidates abbreviate minmax in their directory names.
    # Bind by all four frozen public/implementation file identities, not spelling.
    for p in (HERE.parent/'v4-campaign').iterdir():
     if not (p/'frozen.json').exists():continue
     b=json.loads((p/'frozen.json').read_text())
     if all(data['files'][k]==b['files'][k] for k in ['neon.c','rvv.c','spec.h','harness.c']):candidates.append(p)
    if len(candidates)!=1:raise ValueError(('Nonunique baseline identity',case,name,candidates))
   original_case=max(candidates,key=lambda p:len(p.name));name=original_case.name;base=original_case/'frozen.json'
  original=json.loads(base.read_text());checks={}
  for n,v in data['files'].items():
   p=ROOT/v['path'];checks[n]=p.exists() and sha(p)==v['sha256']
   if n.endswith(('.c','.h','.driver')):
    assert v['sha256']==original['files'][n]['sha256'],(case,n,'frozen C/spec/shim changed')
  assert all(checks.values()),(case,checks)
  _,guard=checker.prepare(case,sha(frozen),RUN)
  assert guard['passed'],case
  (case/(RUN+'-source-guard.json')).write_text(json.dumps(guard,indent=2)+'\n')
  raw=[]
  for p in sorted(case.rglob('*.json')):
   if '.build' in p.parts:continue
   try:rows=json.loads(p.read_text())
   except (ValueError,UnicodeError):continue
   if not isinstance(rows,list) or not rows or not all(isinstance(r,dict) and 'goal' in r and 'passed' in r for r in rows):continue
   raw.append({'path':str(p.relative_to(ROOT)),'sha256':sha(p),'passed':sum(r['passed'] is True for r in rows),'total':len(rows),'pending':[{'goal':r['goal'],'property':r.get('property'),'function':r.get('function'),'file':r.get('file'),'line':r.get('line'),'verdict':r.get('verdict')} for r in rows if r['passed'] is not True]})
  records.append({'case':str(case.relative_to(ROOT)),'kernel':name,'frozen_sha256':sha(frozen),'proof_sha256':{p:sha(ROOT/p) for p in data['proof_patches']},'all_frozen_files_match':all(checks.values()),'c_spec_shim_match_v4_baseline':True,'source_guard':guard['passed'],'raw_reports':raw,'whole_kernel_accepted':False})
report={'baseline_head':'3b96d1a','note':'Raw counts include selected-property diagnostics/global controls; no full-kernel acceptance inferred. Empty/missing body report is unknown, not zero goals.','cases':records}
(HERE/(RUN+'.json')).write_text(json.dumps(report,indent=2)+'\n')
print('audited',len(records),'candidate versions')
