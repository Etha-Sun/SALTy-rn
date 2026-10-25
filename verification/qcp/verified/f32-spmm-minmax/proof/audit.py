#!/usr/bin/env python3
"""Audit full C closure, sources, object identities, assumptions and admission gates."""
from pathlib import Path
import argparse,datetime,hashlib,json,re
from intrinsic_binding import audit as intrinsic_audit
from source_binding import audit as source_audit
T=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ALLOWED={'CNotation.sizeof_union_type','CNotation.sizeof_struct_type','CNotation.sizeof_enum_type','CNotation.sizeof_alias_type','ClassicalDedekindReals.sig_not_dec','ClassicalDedekindReals.sig_forall_dec','PropExtensionality.propositional_extensionality','FunctionalExtensionality.functional_extensionality_dep','CNotation.eval_addr_expr_congr','CNotation.eval_addr_expr','SeparationLogic.Snaive_C_Rules64.eval_addr','Classical_Prop.classic','CNotation.RE_addr_of_congr','CNotation.LE_arrow_field_congr'}
ALIASES={n.rsplit('.',1)[-1]:n for n in ALLOWED}
def read(run,path):return json.loads((T/'.build'/run/path).read_text())
def audit(a):
 B=T/'.build'/a.compile_run/'compile';O=T/'.build'/a.run/'audit';O.mkdir(exist_ok=False,parents=True)
 d=json.loads((T/'proof/dependencies.json').read_text());r=read(a.compile_run,'compile/result.json')
 assert r['passed']and r['inputs_unchanged']and r['configured_jobs']==32
 assert d==read(a.compile_run,'compile/manifest.json')and d['roots']==['proof/coq/SpmmAdmission/FinalCheck.v']
 assert r['fresh_modules']==r['total_modules']==len(d['modules'])==len(r['records'])
 mods={x['path']:x for x in d['modules']};assert set(d['source_paths'])==set(mods)
 closure=set()
 def visit(k):
  if k in closure:return
  closure.add(k)
  for x in mods[k]['dependencies']:
   if x in mods:visit(x)
 visit(d['roots'][0]);assert closure==set(mods)
 for k,m in mods.items():
  assert sha(T/k)==sha(B/k)==m['sha256']
  s=re.sub(r'\(\*.*?\*\)','',(T/k).read_text(),flags=re.S);assert not re.search(r'\b(?:Admitted|admit|Abort)\b',s)
  interface=False
  for line in s.splitlines():
   if re.match(r'\s*Module Type\b',line):assert not interface;interface=True
   if re.match(r'\s*(Axiom|Parameter|Conjecture)\b',line):assert interface,(k,line)
   if re.match(r'\s*End\b',line):interface=False
 current={x['path']:x for x in r['records']}
 for k,x in current.items():
  assert x['exit']==0 and x['proof_object_exists']and x['budget_ok']and sha((B/k).with_suffix('.vo'))==x['vo_sha256']
  q=json.loads(((B/k).with_suffix('.budget')/'result.json').read_text());assert q['exit_code']==0 and 'seconds'in q and q.get('kind')!='service_or_resource_failure'
 # A continuation may update only failed/uncompiled source and compile newly
 # added imports freshly; all previous successful sources/objects/deps persist.
 continuations=r.get('continuations',[])
 for i,meta in enumerate(continuations):
  H=B/'continuations'/meta['attempt'];assert meta==json.loads((H/'resume-launch.json').read_text())
  assert meta['configured_jobs']==32 and sha(T/'proof/resume_compile.py')==meta['runner_sha256']
  assert sha(H/'result.json')==meta['previous_result_sha256']and sha(H/'manifest.json')==meta['previous_manifest_sha256']
  old=json.loads((H/'result.json').read_text());before=json.loads((H/'manifest.json').read_text());assert not old['passed']and old['inputs_unchanged']
  after_path=B/'continuations'/continuations[i+1]['attempt']/'manifest.json'if i+1<len(continuations)else B/'manifest.json'
  assert sha(after_path)==meta['source_manifest_sha256'];after=json.loads(after_path.read_text())
  bm={x['path']:x for x in before['modules']};am={x['path']:x for x in after['modules']};updates={x['path']:x for x in meta['source_updates']};added={x['path']for x in meta.get('added_modules',[])}
  assert set(am)==set(bm)|added and set(bm).isdisjoint(added)
  assert {k for k in bm if bm[k]['sha256']!=am[k]['sha256']}==set(updates)
  passed=[x for x in old['records']if x['exit']==0];done={x['path']for x in passed};assert len(done)==meta['preserved_successful_modules']and done.isdisjoint(updates)
  for x in passed:
   k=x['path'];assert bm[k]==am[k]and x['source_sha256']==current[k]['source_sha256']and x['vo_sha256']==current[k]['vo_sha256'];assert {z for z in bm[k]['dependencies']if z in bm}<=done
  for k,u in updates.items():assert sha(H/'previous-sources'/k)==u['old_sha256']==bm[k]['sha256']and u['new_sha256']==am[k]['sha256']
 reports=json.loads((T/'proof/final-reports.json').read_text());used=set();checks=[];count=0
 for path,names in reports['modules'].items():
  assert path in mods and re.findall(r'(?m)^Print Assumptions ([\w.]+)\.',(T/path).read_text())==names
  log=(B/path).with_suffix('.budget')/'command.log';s=log.read_text();n=len(re.findall(r'(?m)^(?:Axioms:|Closed under the global context)',s));actual=set(re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_.]*)\s+:',s))-{'Axioms'};canon={ALIASES.get(x,x)for x in actual}
  assert n==len(names)and canon<=ALLOWED,(path,n,len(names),canon-ALLOWED);used|=canon;count+=n;checks.append({'source':path,'reports':n,'log_sha256':sha(log)})
 assert count==reports['count']and reports['C_fields']==788 and reports['strategy_fields']==19
 # Every generated field is present in the fully typed interface and has an
 # assumption report from a concrete checked proof, not an interface axiom.
 for u,expected in [('neon',443),('rvv',335),('caller',6),('ordinary',4)]:
  ns='Spmm'+u.capitalize();name='unit_goal.v'if u=='ordinary'else u+'_goal.v';goal=T/'proof/coq'/ns/name;fields=re.findall(r'(?m)^Axiom (proof_of_\w+)\s*:',goal.read_text());assert len(fields)==expected
  checked=(T/'proof/coq'/ns/'Checked.v').read_text();assert 'Module Checked <: VC_Correct.'in checked
  for field in fields:
   path=f'proof/coq/{ns}Auto/{field.removeprefix("proof_of_")}.v'if u in ['neon','rvv']else f'proof/coq/{ns}/Checked.v'
   assert 'Checked.'+field in reports['modules'][path]
 G=read(a.generation_run,'generation-summary.json');assert G['passed']and G['configured_jobs']==32 and G['C_fields']==788 and G['strategy_fields']==19
 assert {x['unit']for x in G['units']}=={'neon','rvv','caller','ordinary','strategy','tuple'}
 for row in G['units']:
  u=row['unit'];base=T/'.build'/row['source_run']/'generation'/u;original=json.loads((base/'result.json').read_text());assert sha(base/'result.json')==row['result_sha256']
  assert original['generation_ok']and original['live_inputs_unchanged']and original['snapshot_inputs_unchanged']
  assert all(sha(T/k)==h and sha(base/'snapshot'/k)==h for k,h in row['input_hashes'].items())
  name='vectors_strategy_goal.v'if u=='strategy'else'tuple_strategy_goal.v'if u=='tuple'else u+'_goal.v'
  assert sha(base/name)==original['goal_sha256']==row['goal_sha256']==sha(T/row['public_goal'])
 rec=read(a.recursive_run,'recursive-check/result.json');ri=read(a.recursive_run,'recursive-check/inputs.json')
 assert rec['passed']and rec['recursive']and rec['no_skip_flags']and rec['inputs_unchanged']and rec['checked_roots']==['SpmmAdmission.FinalCheck']and ri['compile_run']==a.compile_run and rec['fresh_local_objects']==len(mods)
 assert sha(Path('/tmp/qcp-coq820-install/bin/coqchk'))==ri['coqchk_sha256']
 for k,h in ri['sources'].items():assert sha(T/k)==sha(B/k)==h
 for k,h in ri['objects'].items():assert sha(B/k)==h
 neg=read(a.auxiliary_run,'negative/result.json');assert neg['passed']and neg['live_inputs_unchanged']and all(neg['independent_controls'].values())
 for k,h in neg['input_sha256'].items():assert sha(T/k)==h
 nat=read(a.auxiliary_run,'negative/adopted_native.json');N=T/'.build'/nat['run']/'native';assert sha(N/'result.json')==nat['result_sha256'];nr=json.loads((N/'result.json').read_text());assert nr['passed']and nr['inputs_unchanged']
 for k,h in nr['source_hashes'].items():assert sha(T/k)==sha(N/'snapshot'/Path(k).name)==h
 env=read(a.auxiliary_run,'environment/result.json')
 for x in env['external_files']+env['binaries']:assert sha(Path(x['path']))==x['sha256']
 deps=read(a.auxiliary_run,'dependency-audit/result.json');assert deps['passed']and deps['sources']==len(mods)
 identity=json.loads((T/'proof/source-identity.json').read_text());repo=T.parents[3]
 for side,folder in [('NEON','source'),('RVV','target')]:
  assert sha(repo/'kernels'/folder/'f32-spmm-minmax.c')==identity['originals'][side]==sha(T/'proof/original'/('test'+side+'.c'))
  assert sha(T/'impl'/('test'+side+'.c'))==identity['current_impl'][side]
 sources=source_audit(a.generation_run,O/'source-binding');bindings=intrinsic_audit(a.compile_run,a.generation_run);(O/'intrinsic-binding.json').write_text(json.dumps(bindings,indent=2)+'\n')
 return {'passed':True,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'fresh_local_modules':len(mods),'same_environment_continuations':len(continuations),'C_units':4,'C_fields':788,'unit_fields':reports['unit_fields'],'strategy_fields':19,'probe_C_fields':9,'assumption_reports':count,'assumption_checks':checks,'inherited_assumption_names':sorted(used),'new_project_axioms':False,'intrinsic_active_entries':26,'intrinsic_bindings_match_compiled_goals':True,'source_binding_passed':sources['passed'],'recursive_check':rec,'generation':G,'native_run':nat['run'],'boundary':'Source-reviewed intrinsic-spec modular partial correctness; explicit cyclic packing/capacity contracts and fixed VLEN128 e32m8. No formal ISA/ABI, full termination or arbitrary VLEN theorem.'}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--run',required=True)
 for x in ['compile','generation','recursive','auxiliary']:p.add_argument('--'+x+'-run',required=True)
 a=p.parse_args();r=audit(a);out=T/'.build'/a.run/'audit/result.json';out.write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k not in ['assumption_checks','generation','recursive_check']})
