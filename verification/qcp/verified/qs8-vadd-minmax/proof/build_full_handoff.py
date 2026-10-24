#!/usr/bin/env python3
"""Construct/audit all live C units and recursive local .v inventory.
Without --freeze this produces only a private diagnostic preview, not a proof.
"""
import argparse,hashlib,json,re,subprocess,tempfile
from pathlib import Path
from full_inputs import CASE,NS,units,render_unit,sha,tokens,strategy_units
import coverage
from split_goal import project,identity
from audit_return_ownership import require_clean
from check_neon_composed import source_guard
STRATEGIES=None

def all_runs():
 result=[]
 for p in (CASE/'proof').glob('*status.json'):
  d=json.loads(p.read_text());r=d.get('run_directory')
  if d.get('passed') and r and Path(r).is_dir():result.append(Path(r))
 return result

def goal_for(u):
 stem=u['stem'];d=json.loads((CASE/'proof'/(u['status_name']+'.json')).read_text());r=Path(d['run_directory']);hits=[p for p in r.rglob(stem+'_goal.v')if sha(p)==u['goal_sha256']]
 if not hits:raise ValueError('No exact current actual goal in successful component '+stem)
 return hits[0]

def dependency_closure(us,ss,generated):
 sources={p.stem:p for p in (CASE/'proof/coq').glob('*.v')};roots={u['typed_instance'].split('.')[1]for u in us}|{s['typed_instance'].split('.')[1]for s in ss}|set(generated);pending=list(roots);needed=set()
 while pending:
  n=pending.pop()
  if n in needed:continue
  if n not in sources and n not in generated:raise ValueError('Missing local .v '+n)
  needed.add(n);p=generated[n]if n in generated else sources[n];text=re.sub(r'\(\*.*?\*\)','',p.read_text(),flags=re.S)
  if n not in generated and re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',text):raise ValueError('Unchecked declaration in own source '+n)
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',text):
   prefix,body=m.groups()
   for w in body.split():
    q=(prefix+'.'+w)if prefix else w
    if q.startswith(NS+'.'):
     local=q[len(NS)+1:]
     if '.'in local:raise ValueError('Unexpected subnamespace '+q)
     pending.append(local)
 return sorted(needed)
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--freeze',action='store_true');a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='full-preflight-',dir=CASE/'.build'));result=dict(passed=False,scope='input/closure diagnostic only, not QCP or Coq proof',run_directory=str(run));h={}
 try:
  source_guard();control=json.loads((CASE/'proof/goal-projection-controls-status.json').read_text());assert control['passed'] and not control['formal_proof'];assert all(control['negative_controls_rejected'].values());assert all(sha(CASE/n)==x for n,x in control['input_sha256'].items()),'Projection guard controls stale'
  us=[];generated={};definitions={};declarations={};calls=[]
  for u in units():
   rendered=render_unit(u);p=run/(u['stem']+'.c');p.write_text(rendered['text']);cpp=run/(u['stem']+'.expanded.c');subprocess.run(['gcc','-E','-P','-CC','-nostdinc',*rendered['cpp_flags'],'-I',str(CASE),p,'-o',cpp],check=True,timeout=120)
   if rendered['identity_text']:
    raw=run/(u['stem']+'.raw.c');raw.write_text(rendered['identity_text']);out=run/(u['stem']+'.raw.expanded.c');subprocess.run(['gcc','-E','-P','-CC','-nostdinc',*rendered['cpp_flags'],raw,'-o',out],check=True,timeout=120);assert tokens(out.read_text())==tokens(cpp.read_text())
   goal=goal_for(u);require_clean(goal);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==u['expected_fields'],(u['stem'],len(fields));generated[u['stem']+'_goal']=goal
   if u.get('goal_projection_identity'):
    pr=run/('projection-'+u['stem']);pd=project(goal,pr,NS,u['stem']);assert identity(pd)==u['goal_projection_identity'],'Projection source identity differs'
    for artifact in pr.glob('*.v'):generated[artifact.stem]=artifact
   body=[]
   for name,sig,contract,edges in coverage._functions(cpp.read_text(),u['stem']):
    pair=(sig,contract)
    if name in declarations and declarations[name]!=pair:raise ValueError('C signature/Require/Ensure mismatch '+name)
    declarations[name]=pair
    if edges is not None:definitions.setdefault(name,[]).append(u['stem']);body.append(name);calls.extend((name,e)for e in edges)
   us.append({**u,**dict(fields=fields,goal_sha256=sha(goal),goal_artifact=str(goal),cpp_sha256=sha(cpp),functions_defined=sorted(body),cpp_flags=rendered['cpp_flags'])})
  missing=sorted(set(declarations)-set(definitions));unbound=sorted({e for _,e in calls}-set(definitions));assert not missing and not unbound,(missing,unbound);assert len(definitions)==len(set(definitions))
  ss=[]
  for item in strategy_units():
   file=item['source'];proof=item['typed_instance'];count=item['expected_fields']
   stem=Path(file).stem;hits=[]
   for r in all_runs():hits.extend(r.rglob(stem+'_strategy_goal.v'))
   assert hits,stem;assert len({sha(p)for p in hits})==1,stem;goal=hits[0];fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M);assert len(fields)==count,(stem,len(fields));typ=re.findall(r'^Module Type (\w+)\.',goal.read_text(),re.M);assert len(typ)==1;generated[stem+'_strategy_goal']=goal;ss.append(dict(file=file,stem=stem,namespace=NS,module_type=typ[0],typed_instance=proof,fields=fields,goal_sha256=sha(goal),goal_artifact=str(goal)))
  own=dependency_closure(us,ss,generated);native=json.loads((CASE/'proof/field-native-status.json').read_text());assert native['passed']
  for n,d in native['input_sha256'].items():assert sha(CASE/n)==d,'Native stale '+n
  h=dict(namespace=NS,units=us,strategies=ss,total_actual_c_vcs=sum(len(u['fields'])for u in us),actual_c_function_count=len(definitions),whole_kernel_bodies_required=['test_neon','test_rvv','compare_outputs','equivalent'],own_modules=own,generated_modules=sorted(generated),native_status='proof/field-native-status.json',native_status_sha256=sha(CASE/'proof/field-native-status.json'),limits=dict(public_parameters='all int32 multipliers/rawshift/bias including INT32_MIN; all int16 outputzero; byte inputzeros/bounds; no ordered-bounds premise',length='0<n<=UINT64_MAX-7, input n+7, distinct writable outputs n',hardware='chosen VLEN128, e8m2/e16m4/e32m8 VLMAX32, min AVL32, inactive zero',scope='C-shim partial correctness; termination/ISA/ABI refinement and QC/vxsat outside result',composition='exact three frozen pure-variable expressions; borrowed pointer copies eight fields in actual checked C before canonical nested payload'))
  names=['spec.c','proof/repair.json','proof/repair.patch','proof/semantics.json','proof/native-status.json','proof/field-native-status.json','proof/native-asan-status.json','proof/neon-composed-status.json','proof/type-width-status.json','proof/type-width-repair.json','proof/control-status.json','proof/repair-replay-status.json','proof/evidence/original-counterexamples.json']+[str(p.relative_to(CASE))for folder in ['shim','impl','proof/original','proof/c']for p in(CASE/folder).rglob('*')if p.is_file()]+[str(p.relative_to(CASE))for p in(CASE/'proof').glob('*.py')if p.name not in ['record_status.py','audit_relocation.py']]+['proof/coq/'+n+'.v'for n in own if n not in generated]+['proof/'+u['status_name']+'.json'for u in us]+['proof/rvv-kernel-strategy-status.json','proof/neon-memory-strategy-status.json']
  names += ['proof/goal-projection-controls-status.json']
  names += [str(p.relative_to(CASE)) for pattern in ['*repair*.json','*original*.json','*provenance*.json','*units.json','*partition*.json'] for p in (CASE/'proof').glob(pattern) if p.is_file()]
  h['frozen_source_sha256']={n:sha(CASE/n)for n in sorted(set(names))};result.update(passed=True,actual_c_units=len(us),actual_c_fields=h['total_actual_c_vcs'],actual_c_bodies=len(definitions),own_modules=len(own),strategy_fields=sum(len(s['fields'])for s in ss),call_closure=dict(definitions=definitions,calls=sorted(set(calls)),unbound_callees=unbound,declarations_without_checked_body=missing,exact_contract_and_signature_match=True));h['preflight']=result;h['proof_root_policy']='Only the complete typed unit/strategy dependency closure, with16 RVV vector leaves, is freshly compiled; separate historical monolithic alternatives carry no full-run credit.'
  if a.freeze:(CASE/'proof/frozen-full-handoff.json').write_text(json.dumps(h,indent=2)+'\n')
 except Exception as e:result['error']=str(e)
 (run/'preview-handoff.json').write_text(json.dumps(h,indent=2)+'\n');(run/'status.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items()if k!='call_closure'},indent=2));return 0 if result['passed']else 1
if __name__=='__main__':raise SystemExit(main())
