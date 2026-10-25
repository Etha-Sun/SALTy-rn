#!/usr/bin/env python3
"""Freeze current complete replay inputs; this is no proof certificate.
Migrates the published transpose inventory/DAG discipline to the complete
13-unit depthwise case, including its three real strategy interfaces.
"""
from pathlib import Path
import argparse,json,re,subprocess,tempfile,time
from full_inputs import CASE as C,NS,iter_current_unit_texts,sha
import coverage,full_call_coverage
OUTPUTS={'proof/frozen-full-handoff.json','proof/full-status.json','proof/status.json',
 'proof/manifest.json','proof/assumption-audit.json','proof/full-preflight-status.json'}
MATH_ROOTS=['PublicObservation','PixelFacts','ProgramFactsFast','FmaSwap',
 'NeonKernelColumnFacts','RvvKernelPixelBridgeFacts','MemoryViewFacts','Mask7IndexFacts']
def inventory():
 return dict(sorted((str(p.relative_to(C)),sha(p))for p in C.rglob('*')
  if p.is_file()and not any(v in {'.build','__pycache__'}for v in p.relative_to(C).parts)
  and str(p.relative_to(C))not in OUTPUTS and p.suffix not in {'.vo','.vos','.vok','.glob','.aux','.pyc'}))
def source_closure(roots,generated):
 graph={}
 def visit(n):
  if n in graph:return
  p=generated.get(n,C/'proof/coq'/(n+'.v'));assert p.is_file(),'Missing current local source '+n
  text=re.sub(r'\(\*.*?\*\)','',p.read_text(),flags=re.S);deps=set();graph[n]=[]
  if n not in generated:assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort|Declare\s+Module)\b',text),n
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',text):
   prefix,body=m.groups()
   for word in body.split():
    full=(prefix+'.'+word)if prefix else word
    if full.startswith(NS+'.'):
     d=full[len(NS)+1:];assert '.'not in d;deps.add(d)
  graph[n]=sorted(deps)
  for d in deps:visit(d)
 for n in roots:visit(n)
 return graph
def mathematical_lemmas(text):
 return[n for n in re.findall(r'(?m)^(?:Lemma|Theorem)\s+(\w+)',text)
  if not n.startswith(('proof_of_','typed_','dw_proof_'))and n!='checked']
def validate_native():
 names=['proof/'+prefix+'native-'+san+'-status.json'
  for prefix in ['', 'public-']for san in ['undefined','address']]
 for name in names:
  s=json.loads((C/name).read_text());assert s['passed'],name
  assert all(sha(C/p)==h for p,h in s['input_sha256'].items()),name+' stale source'
  assert all(sha(C/p)==h for p,h in s['actual_recursive_local_input_sha256'].items()),name+' stale recursive input'
  assert s['cases']==128520 and s['lanes_per_side']==12247200 and s['aliased_cases']==102816
  assert s['both_wrong_still_equal_oracle_rejected']
  if 'address'in name:assert s['actual_memory_max']==17179869184 and s['actual_memory_swap_max']==0 and s['LSan_enabled']
 for name,source in [('rv64-buildability-status.json','impl/testRVV.c'),('neon-front-buildability-status.json','impl/testNEON.c')]:
  s=json.loads((C/'proof'/name).read_text());assert s['passed']and s['exit_code']==0,name
  for p,h in s.get('input_sha256',{}).items():assert sha(C/p)==h,name+' stale source '+p
  assert s.get('source_sha256',s.get('input_sha256',{}).get(source))==sha(C/source),name+' stale main'
 return names
def current_rows():
 old=json.loads((C/'proof/component-unit-inventory.json').read_text());rows={r['stem']:dict(r)for r in old['units']}
 for side in ['neon','rvv']:
  s=json.loads((C/'proof'/(side+'-generation-status.json')).read_text());r=rows[side+'_unit']
  assert s['generation_passed']and s['raw_c_sha256']==sha(C/r['source'])
  r.update(goal_path=str(Path(s['run_directory'])/(side+'_unit_goal.v')),goal_sha256=s['goal_sha256'])
 w=json.loads((C/'proof/width-status.json').read_text());assert w['passed']
 rows['type_width']=dict(stem='type_width',goal_path=str(C/'proof/coq/type_width_goal.v'),goal_sha256=w['goal_sha256'],typed_instance=w['typed_instance'])
 assert len(rows)==13
 strategies=[]
 for u in old['strategies']:
  u=dict(u);p=Path(u['goal_path']);text=p.read_text();fields=re.findall(r'^\s*(?:Axiom|Parameter)\s+(\w+)\s*:',text,re.M)
  assert sha(p)==u['goal_sha256']and sha(C/u['source'])==u['source_sha256']
  types=re.findall(r'^Module Type\s+(\w+)',text,re.M);assert len(types)==1
  u.update(fields=fields,module_type=types[0],checked_module=u['typed_instance']);strategies.append(u)
 assert len(strategies)==3 and sum(len(u['fields'])for u in strategies)==11
 return rows,strategies
def main():
 pa=argparse.ArgumentParser();pa.add_argument('--freeze',action='store_true');a=pa.parse_args()
 quota=json.loads((C.parents[3]/'.build/memory/quota/state.json').read_text());assert not quota['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='full-handoff-',dir=C/'.build'));records=[]
 state=dict(passed=False,whole_kernel_verified=False,formal_proof_replayed=False,
  scope='Source/CPP/body/callee/fresh-replay inventory only; no proof credit',run_directory=str(run),records=records,quota_state_at_start=quota)
 try:
  inputs=inventory();native=validate_native();rows,strategies=current_rows();units=[];cpps={};generated={}
  for u in iter_current_unit_texts():
   stem=u['stem'];row=rows[stem];src=run/(stem+'.input.c');src.write_text(u['text']);cpp=run/(stem+'.c')
   cmd=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc','-I',str(C),*u['cpp_flags'],str(src),'-o',str(cpp)]
   t=time.monotonic();p=subprocess.run(cmd,capture_output=True,timeout=300);log=run/(stem+'-cpp.log');log.write_bytes(p.stdout+p.stderr)
   records.append(dict(label=stem+'-cpp',command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));assert p.returncode==0,log.read_text()[-2000:]
   goal=Path(row['goal_path']);assert sha(goal)==row['goal_sha256'],stem+' target drift'
   fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields and len(fields)==len(set(fields))
   functions=sorted(n for n,_,_,edges in coverage._functions(cpp.read_text(),stem)if edges is not None);assert functions
   provider=row['typed_instance'];assert provider.startswith(NS+'.')
   units.append(dict(label=stem,stem=stem,fields=fields,checked_module=provider,typed_instance=provider,
    cpp_sha256=sha(cpp),goal_sha256=sha(goal),functions_defined=functions,cpp_snapshot=str(cpp),goal_source=str(goal)))
   generated[stem+'_goal']=goal;cpps[stem]=cpp
  for st in strategies:generated[st['stem']]=Path(st['goal_path'])
  assert len(units)==13 and sum(len(u['fields'])for u in units)==1167
  closure=full_call_coverage.check(cpps,json.loads((C/'proof/intrinsic-ledger.json').read_text()))
  assert closure['source_closure_passed']and closure['unique_actual_C_definitions']==37,closure['errors']
  roots=[u['typed_instance'].split('.')[1]for u in units+strategies]+MATH_ROOTS
  graph=source_closure(roots,generated);own=sorted(graph);assert set(generated)<=set(own)
  math=[n for n in own if n not in generated and mathematical_lemmas((C/'proof/coq'/(n+'.v')).read_text())]
  assert 'PublicObservation'in math and inputs==inventory(),'Sources changed during preparation'
  h=dict(schema=1,namespace=NS,whole_kernel_verified=False,scope='Frozen complete replay inputs only; not certificate',
   units=units,strategies=strategies,own_modules=own,math_modules=math,source_dag=graph,
   actual_c_function_count=37,total_actual_c_vcs=1167,total_strategy_fields=11,
   frozen_source_sha256=inputs,native_statuses=native,limits=json.loads((C/'proof/semantics.json').read_text()),
   call_closure=closure,preparation_run=str(run))
  (run/'handoff.json').write_text(json.dumps(h,indent=2)+'\n')
  if a.freeze:
   target=C/'proof/frozen-full-handoff.json';assert not target.exists(),'Preserve any existing H explicitly; never overwrite'
   target.write_bytes((run/'handoff.json').read_bytes());state['frozen_handoff_sha256']=sha(target)
  state.update(passed=True,actual_c_units=13,actual_c_vcs=1167,ordinary_input_modules=len(own),mathematical_modules=len(math),frozen_inputs=len(inputs))
 except Exception as e:state['error']=str(e)or'failed complete inventory guard'
 (run/'status.json').write_text(json.dumps(state,indent=2)+'\n');(C/'proof/full-preflight-status.json').write_bytes((run/'status.json').read_bytes())
 print(json.dumps({k:state.get(k)for k in ['passed','run_directory','actual_c_units','actual_c_vcs','ordinary_input_modules','error']}));return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
