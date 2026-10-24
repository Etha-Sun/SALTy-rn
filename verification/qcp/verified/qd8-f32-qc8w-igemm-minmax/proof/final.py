#!/usr/bin/env python3
"""Complete interfaces, then 32 independent assumption-report shards; fresh dependencies only."""
from pathlib import Path
import argparse,concurrent.futures,datetime,hashlib,json,re,shutil,subprocess,time
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--compile-run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();C=ROOT/'.build'/a.compile_run/'compile';status=json.loads((C/'result.json').read_text());assert status['passed'] and status['inputs_unchanged']
D=json.loads((ROOT/'proof/dependencies.json').read_text());assert D==json.loads((C/'manifest.json').read_text())
for m in D['modules']:assert sha(ROOT/m['path'])==sha(C/m['path'])==m['sha256'],m['path']
for r in status['records']:assert sha((C/r['path']).with_suffix('.vo'))==r['vo_sha256']
O=ROOT/'.build'/a.run/'final';O.mkdir(parents=True,exist_ok=False);flags=json.loads((C/'flags.json').read_text())+['-Q',str(O),'IGemmAdmission'];reports=json.loads((ROOT/'proof/final-reports.json').read_text());files=sorted((ROOT/'proof/coq/IGemmAdmission').glob('*.v'));inputs={p.name:sha(p)for p in files}
for f in files:shutil.copy2(f,O/f.name)
(O/'inputs.json').write_text(json.dumps(inputs,indent=2)+'\n');(O/'flags.json').write_text(json.dumps(flags,indent=2)+'\n')
allowed=['CNotation.sizeof_union_type','CNotation.sizeof_struct_type','CNotation.sizeof_enum_type','CNotation.sizeof_alias_type','ClassicalDedekindReals.sig_not_dec','ClassicalDedekindReals.sig_forall_dec','PropExtensionality.propositional_extensionality','FunctionalExtensionality.functional_extensionality_dep','CNotation.eval_addr_expr_congr','CNotation.eval_addr_expr','SeparationLogic.Snaive_C_Rules64.eval_addr','Classical_Prop.classic','CNotation.RE_addr_of_congr','CNotation.LE_arrow_field_congr']
def check(name):
 mem=32 if name=='FinalCheck' else 16;seconds=14400 if mem==32 else 7200;start=time.monotonic();cmd=['python3',str(a.budget_runner),'--out',str(O/(name+'.budget')),'--timeout',str(seconds+30),'--reserve-gib',str(mem),'--memory-gib',str(mem),'--','/usr/bin/prlimit','--as='+str(mem*2**30),'--cpu='+str(seconds),'--','/tmp/qcp-coq820-install/bin/coqc',*flags,str(O/(name+'.v'))]
 with (O/(name+'.log')).open('w')as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT)
 s=(O/(name+'.budget/command.log')).read_text()if(O/(name+'.budget/command.log')).exists()else'';count=len(re.findall(r'(?m)^(?:Axioms:|Closed under the global context)',s));names=sorted(set(re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_.]*)\s*:',s))-{'Axioms'});unexpected=sorted(set(names)-set(allowed));expected=reports['chunks'].get(name,0)
 return {'module':name,'passed':r.returncode==0 and count==expected and not unexpected,'exit':r.returncode,'seconds':time.monotonic()-start,'assumption_reports':count,'expected_assumption_reports':expected,'inherited_assumption_names':names,'unexpected_assumptions':unexpected,'source_sha256':sha(O/(name+'.v')),'vo_sha256':sha(O/(name+'.vo'))if(O/(name+'.vo')).exists()else None,'command':cmd}
records=[check('FinalCheck')]
if records[0]['passed']:
 with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:
  futures=[pool.submit(check,name)for name in reports['chunks']]
  for f in concurrent.futures.as_completed(futures):
   records.append(f.result());(O/'progress.json').write_text(json.dumps({'completed':len(records),'passed':sum(x['passed']for x in records),'total':33},indent=2)+'\n')
unchanged=all(sha(ROOT/'proof/coq/IGemmAdmission'/n)==h==sha(O/n)for n,h in inputs.items());count=sum(r['assumption_reports']for r in records);result={'passed':len(records)==33 and all(r['passed']for r in records)and count==reports['count']and unchanged,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'fresh_local_dependencies':len(D['modules']),'compiled_dependency_run':a.compile_run,'dependency_status_sha256':sha(C/'result.json'),'new_final_modules':len(records),'C_unit_fields':1381,'strategy_fields':15,'assumption_reports':count,'expected_assumption_reports':reports['count'],'inherited_assumption_names':sorted(set(n for r in records for n in r['inherited_assumption_names'])),'unexpected_assumptions':sorted(set(n for r in records for n in r['unexpected_assumptions'])),'inputs_unchanged':unchanged,'records':records};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items()if k!='records'});raise SystemExit(not result['passed'])
