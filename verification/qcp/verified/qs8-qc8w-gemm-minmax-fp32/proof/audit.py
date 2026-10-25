#!/usr/bin/env python3
"""Complete-case admission audit: fresh objects, actual goals, assumptions and source bindings."""
from pathlib import Path
import argparse,datetime,gzip,hashlib,json,re,subprocess,sys
from intrinsic_binding import audit as intrinsic_audit
from source_binding import audit as source_audit
T=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ALLOWED={'CNotation.sizeof_union_type','CNotation.sizeof_struct_type','CNotation.sizeof_enum_type','CNotation.sizeof_alias_type','ClassicalDedekindReals.sig_not_dec','ClassicalDedekindReals.sig_forall_dec','PropExtensionality.propositional_extensionality','FunctionalExtensionality.functional_extensionality_dep','CNotation.eval_addr_expr_congr','CNotation.eval_addr_expr','SeparationLogic.Snaive_C_Rules64.eval_addr','Classical_Prop.classic','CNotation.RE_addr_of_congr','CNotation.LE_arrow_field_congr'}
ALIASES={name.rsplit('.',1)[-1]:name for name in ALLOWED}
def read(run,path):return json.loads((T/'.build'/run/path).read_text())
def audit(a):
 O=T/'.build'/a.compile_run/'audit-attempts'/a.attempt;O.mkdir(exist_ok=False,parents=True)
 B=T/'.build'/a.compile_run/'compile';d=json.loads((T/'proof/dependencies.json').read_text());r=read(a.compile_run,'compile/result.json')
 assert r['passed']and r['inputs_unchanged']and r['configured_jobs']==32
 assert d==read(a.compile_run,'compile/manifest.json')and d['roots']==['proof/coq/Qs8Admission/FinalCheck.v']
 assert r['fresh_modules']==len(d['modules'])==len(r['records'])
 for m in d['modules']:
  assert sha(T/m['path'])==sha(B/m['path'])==m['sha256']
  source=re.sub(r'\(\*.*?\*\)','',(T/m['path']).read_text(),flags=re.S)
  interface=False
  for line in source.splitlines():
   if re.match(r'\s*Module Type\b',line):assert not interface;interface=True
   if re.match(r'\s*(Axiom|Parameter|Conjecture)\b',line):assert interface,(m['path'],line)
   if re.match(r'\s*End\b',line):interface=False

 for m in r['records']:
  assert m['exit']==0 and m['proof_object_exists']and m['budget_ok']and sha((B/m['path']).with_suffix('.vo'))==m['vo_sha256']
  q=json.loads(((B/m['path']).with_suffix('.budget')/'result.json').read_text());assert q['exit_code']==0 and 'seconds'in q and q.get('kind')!='service_or_resource_failure'
 continuations=r.get('continuations',[])
 current_records={x['path']:x for x in r['records']}
 for ci,meta in enumerate(continuations):
  H=B/'continuations'/meta['attempt'];assert meta==json.loads((H/'resume-launch.json').read_text())
  assert meta['configured_jobs']==32 and sha(T/'proof/resume_compile.py')==meta['runner_sha256']
  assert sha(H/'result.json')==meta['previous_result_sha256']and sha(H/'manifest.json')==meta['previous_manifest_sha256']
  before=json.loads((H/'manifest.json').read_text());prior=json.loads((H/'result.json').read_text());assert not prior['passed']and prior['inputs_unchanged']
  after=json.loads((B/'continuations'/continuations[ci+1]['attempt']/'manifest.json').read_text())if ci+1<len(continuations)else d
  after_path=B/'continuations'/continuations[ci+1]['attempt']/'manifest.json'if ci+1<len(continuations)else B/'manifest.json'
  assert sha(after_path)==meta['source_manifest_sha256']
  assert {k:v for k,v in before.items()if k!='modules'}=={k:v for k,v in after.items()if k!='modules'}
  before_modules={x['path']:x for x in before['modules']};after_modules={x['path']:x for x in after['modules']};assert before_modules.keys()==after_modules.keys()
  expected_updates={x['path']:x for x in meta['source_updates']}
  assert {k for k in before_modules if before_modules[k]['sha256']!=after_modules[k]['sha256']}==set(expected_updates)
  for k,oldmod in before_modules.items():
   newmod=after_modules[k];assert {x:y for x,y in oldmod.items()if x!='sha256'}=={x:y for x,y in newmod.items()if x!='sha256'}
   if k in expected_updates:assert expected_updates[k]['new_sha256']==newmod['sha256']

  passed_before=[x for x in prior['records']if x['exit']==0];done_before={x['path']for x in passed_before}
  assert len(done_before)==meta['preserved_successful_modules']
  for x in passed_before:
   current=current_records[x['path']];assert x['source_sha256']==current['source_sha256']and x['vo_sha256']==current['vo_sha256']
  updates={x['path']:x for x in meta['source_updates']};assert done_before.isdisjoint(updates)
  oldmods={x['path']:x for x in before['modules']}
  for k,u in updates.items():assert sha(H/'previous-sources'/k)==u['old_sha256']==oldmods[k]['sha256']
  # Sources used by preserved objects and their closed dependency graph are unchanged.
  assert all({x for x in oldmods[k]['dependencies']if x in oldmods}<=done_before for k in done_before)
 if continuations:
  initial_run=a.compile_run.removesuffix('-compile');initial=read(initial_run,'result.json');assert initial['compile_run']==a.compile_run
  initial_env=read(initial['auxiliary_run'],'environment/result.json')
  for x in initial_env['external_files']+initial_env['binaries']:assert sha(Path(x['path']))==x['sha256']
 reports=json.loads((T/'proof/final-reports.json').read_text());inherited=set();checks=[];count=0
 for path,names in reports['modules'].items():
  source=(T/path).read_text();assert re.findall(r'(?m)^Print Assumptions ([\w.]+)\.',source)==names
  log=(B/path).with_suffix('.budget')/'command.log';s=log.read_text();n=len(re.findall(r'(?m)^(?:Axioms:|Closed under the global context)',s));used=set(re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_.]*)\s*:',s))-{'Axioms'}
  canonical={ALIASES.get(x,x)for x in used};assert n==len(names)and canonical<=ALLOWED,(path,n,len(names),canonical-ALLOWED);inherited|=canonical;count+=n;checks.append({'source':path,'reports':n,'log_sha256':sha(log)})
 assert count==reports['count']and reports['C_fields']==1531 and reports['strategy_fields']==16
 selection=json.loads((T/'proof/neon-final-selection.json').read_text())['fields'];required=set(re.findall(r'Axiom proof_of_(test_neon_\w+)\s*:',(T/'proof/coq/Qs8Neon/neon_goal.v').read_text()));assert len(selection)==len(required)==1261 and {x['field']for x in selection}==required
 assert all(x['source']in reports['modules']for x in selection)
 for x in selection:assert sha(T/x['source'])==x.get('final_source_sha256',x['source_sha256'])
 G=read(a.generation_run,'generation-summary.json');assert G['passed']and G['configured_jobs']==32 and G['C_fields']==1531 and G['strategy_fields']==16
 for row in G['units']:
  unit=row['unit'];base=T/'.build'/row['source_run']/'generation'/unit;original=json.loads((base/'result.json').read_text());assert sha(base/'result.json')==row['result_sha256']
  assert original['generation_ok']and original['live_inputs_unchanged']and original['snapshot_inputs_unchanged']
  assert all(sha(T/p)==h and sha(base/'snapshot'/p)==h for p,h in row['input_hashes'].items())
  name='copy_strategy_goal.v'if unit=='strategy'else unit+'_goal.v';assert sha(base/name)==row['goal_sha256']==original['goal_sha256']
  if unit=='neon':assert hashlib.sha256(gzip.decompress((T/'proof/generated/neon_goal.v.gz').read_bytes())).hexdigest()==row['goal_sha256']
  else:assert sha(T/'proof/coq'/('Qs8Strategy'if unit=='strategy'else'Qs8'+unit.capitalize())/name)==row['goal_sha256']
 subprocess.run([sys.executable,str(T/'proof/partition_neon_goal.py'),'--verify'],cwd=T,check=True)
 rec=read(a.recursive_run,'recursive-check/result.json');ri=read(a.recursive_run,'recursive-check/inputs.json')
 assert rec['passed']and rec['recursive']and rec['no_skip_flags']and rec['inputs_unchanged']and rec['checked_roots']==['Qs8Admission.FinalCheck']and ri['compile_run']==a.compile_run and rec['fresh_local_objects']==len(d['modules'])
 assert sha(Path('/tmp/qcp-coq820-install/bin/coqchk'))==ri['coqchk_sha256']
 for p,h in ri['sources'].items():assert sha(T/p)==sha(B/p)==h
 for p,h in ri['objects'].items():assert sha(B/p)==h
 negative=read(a.negative_run,'negative/result.json');assert negative['passed']and negative['live_inputs_unchanged']
 for p,h in negative['input_sha256'].items():assert sha(T/p)==h
 adopted=read(a.negative_run,'negative/adopted_native.json');nb=T/'.build'/adopted['run']/'native'
 assert sha(nb/'result.json')==adopted['result_sha256'];native=json.loads((nb/'result.json').read_text())
 assert native['passed']and native['live_inputs_unchanged']and native['snapshot_unchanged']
 for p,h in native['source_hashes'].items():assert sha(T/p)==sha(nb/'snapshot'/p)==h
 for variant in ['original','repaired','both_wrong']:
  nr=json.loads((nb/variant/'result.json').read_text());budget=json.loads((nb/variant/'budget/result.json').read_text())
  assert nr['passed']and len(nr['results'])==2 and all(x['exit']==x['expected_exit']for x in nr['results'])
  assert budget['exit_code']==0 and 'seconds'in budget and budget.get('kind')!='service_or_resource_failure'
 assert json.loads((nb/'both_wrong/result.json').read_text())['results'][1]['exit']==21
 env=read(a.environment_run,'environment/result.json')
 for item in env['external_files']+env['binaries']:assert sha(Path(item['path']))==item['sha256'],item['path']
 deps=read(a.dependency_run,'dependency-audit/result.json');assert deps['passed']and deps['sources']==len(d['modules'])
 identity=json.loads((T/'proof/source-identity.json').read_text());repo=T.parents[3]
 for side,item in identity['originals'].items():assert sha(repo/item['path'])==item['sha256']==sha(T/'proof/original'/('test'+side+'.c'))
 assert sha(T/'impl/testNEON.c')==identity['originals']['NEON']['sha256']
 source_bindings=source_audit(a.generation_run,O/'source-binding')
 bindings=intrinsic_audit(a.compile_run,a.generation_run)
 (O/'intrinsic-binding.json').write_text(json.dumps(bindings,indent=2)+'\n')
 return {'passed':True,'attempt':a.attempt,'source_binding_passed':source_bindings['passed'],'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'fresh_local_modules':len(d['modules']),'same_environment_continuations':len(continuations),'source_updates_in_uncompiled_modules':sum(len(x['source_updates'])for x in continuations),'C_units':4,'C_fields':1531,'unit_fields':reports['unit_fields'],'strategy_fields':16,'assumption_reports':count,'assumption_checks':checks,'inherited_assumption_names':sorted(inherited),'new_project_axioms':False,'complete_interfaces':'Qs8Admission.FinalCheck: NEON, RVV, Caller, Ordinary, Copy','intrinsic_active_entries':52,'intrinsic_bindings_match_compiled_goals':True,'recursive_check':rec,'generation':G,'negative_run':a.negative_run,'environment_run':a.environment_run,'dependency_run':a.dependency_run,'boundary':'Source-reviewed intrinsic-spec modular partial correctness. Explicit memory/capacity contracts, fixed hardware configuration. No formal ISA/ABI or termination theorem.'}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--attempt',default='audit01')
 for opt in ['compile','generation','recursive','negative','environment','dependency']:p.add_argument('--'+opt+'-run',required=True)
 a=p.parse_args();r=audit(a);o=T/'.build'/a.compile_run/'audit.json';assert not o.exists();o.write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k not in ['assumption_checks','generation','recursive_check']})
