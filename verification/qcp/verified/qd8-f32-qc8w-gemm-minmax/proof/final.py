#!/usr/bin/env python3
"""Rebind all complete interfaces and audit each field using fresh local dependencies."""
from pathlib import Path
import argparse,datetime,hashlib,json,re,shutil,subprocess,time
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path);a=p.parse_args();assert a.jobs==32
C=ROOT/'.build'/a.compile_run/'compile';r=json.loads((C/'result.json').read_text());assert r['passed'],r.get('failed');sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();dep=json.loads((ROOT/'proof/dependencies.json').read_text())
assert json.loads((C/'manifest.json').read_text())==dep
for m in dep['modules']:
 assert sha(ROOT/m['path'])==m['sha256']==sha(C/m['path']),m['path']
for m in r['records']:assert sha((C/m['path']).with_suffix('.vo'))==m['vo_sha256']
O=ROOT/'.build'/a.run/'final';O.mkdir(parents=True,exist_ok=False);flags=json.loads((C/'flags.json').read_text());flags+=['-Q',str(O),'Qd8Admission'];records=[]
for name in ['ProofBoundary','FinalCheck']:
 source=ROOT/'proof/coq/Qd8Admission'/(name+'.v');dest=O/source.name;shutil.copy2(source,dest);cmd=['/usr/bin/prlimit','--as='+str(32*2**30),'--cpu=14400','--','/tmp/qcp-coq820-install/bin/coqc',*flags,str(dest)]
 if a.budget_runner:cmd=['python3',str(a.budget_runner),'--out',str(O/(name+'.budget')),'--timeout','14430','--reserve-gib','32','--memory-gib','32','--',*cmd]
 start=time.monotonic()
 with (O/(name+'.log')).open('w') as log:q=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=14460)
 records.append({'module':name,'exit':q.returncode,'seconds':time.monotonic()-start,'source_sha256':sha(source),'vo_sha256':sha(dest.with_suffix('.vo')) if dest.with_suffix('.vo').exists() else None,'command':cmd})
 if q.returncode:break
log=O/'FinalCheck.log'
if a.budget_runner:log=O/'FinalCheck.budget/command.log'
s=log.read_text() if log.exists() else '';reports=len(re.findall(r'(?m)^(?:Axioms:|Closed under the global context)',s));expected=json.loads((ROOT/'proof/final-reports.json').read_text())['count'];names=sorted(set(re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_.]*)\s*:',s))-{'Axioms'})
allowed=['CNotation.sizeof_union_type','CNotation.sizeof_struct_type','CNotation.sizeof_enum_type','CNotation.sizeof_alias_type','ClassicalDedekindReals.sig_not_dec','ClassicalDedekindReals.sig_forall_dec','PropExtensionality.propositional_extensionality','FunctionalExtensionality.functional_extensionality_dep','CNotation.eval_addr_expr_congr','CNotation.eval_addr_expr','SeparationLogic.Snaive_C_Rules64.eval_addr','Classical_Prop.classic','CNotation.RE_addr_of_congr','CNotation.LE_arrow_field_congr'];unexpected=sorted(set(names)-set(allowed))
r={'passed':len(records)==2 and all(x['exit']==0 for x in records) and reports==expected and not unexpected,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':a.jobs,'ready_tasks':1,'per_process_memory_gib':32,'compiled_dependency_run':a.compile_run,'dependency_status_sha256':sha(C/'result.json'),'fresh_local_dependencies':len(dep['modules']),'new_final_modules':len(records),'C_unit_fields':1914,'strategy_fields':12,'support_reports':15,'assumption_reports':reports,'expected_assumption_reports':expected,'inherited_assumption_names':names,'unexpected_assumptions':unexpected,'records':records};(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');(O/'flags.json').write_text(json.dumps(flags,indent=2)+'\n');print({k:v for k,v in r.items() if k!='records'});raise SystemExit(not r['passed'])
