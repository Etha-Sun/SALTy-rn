"""Regenerate all four actual units and compare checked goals and C/CPP tokens."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,subprocess,time
from prepare import ROOT,UNITS,tokens
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32
D=ROOT/'.build'/a.run;D.mkdir(exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(unit):
 U=UNITS[unit];O=D/'generation'/unit
 cmd=['python3',str(a.budget_runner),'--out',str(D/(unit+'-budget')),'--timeout','21630','--reserve-gib','64','--memory-gib','64','--','python3',str(ROOT/'proof/generate.py'),unit,'--run',a.run,'--jobs','32']
 with(D/(unit+'-driver.log')).open('w')as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,cwd=ROOT)
 record=json.loads((O/'result.json').read_text());assert r.returncode==0 and record['generation_passed'],unit
 expected=ROOT/'proof/coq'/U['namespace']/(U['base']+'_goal.v');actual=O/(U['base']+'_goal.v');assert sha(actual)==sha(expected),(unit,'goal differs')
 if unit in ['neon','rvv']:
  impl=ROOT/'impl'/('testNEON.c'if unit=='neon'else'testRVV.c');plain=O/'plain.c';plain.write_text('#include "shim/'+unit+'/api.h"\n'+impl.read_text());cpp=O/'plain-cpp.c'
  subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-I',str(ROOT),'-I',str(ROOT/'shim'),str(plain),'-o',str(cpp)],check=True)
  assert [x.group()for x in tokens(cpp.read_text())]==[x.group()for x in tokens((O/(U['base']+'.c')).read_text())],(unit,'CPP token mismatch')
 return {'unit':unit,'passed':True,'actual_C_fields':record['vc_fields'],'goal_sha256':sha(actual),'generation_result':str((O/'result.json').relative_to(ROOT)),'plain_annotated_CPP_tokens_equal':unit in ['neon','rvv']}
start=time.monotonic()
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:records=list(pool.map(run,UNITS))
subprocess.run(['python3',str(ROOT/'proof/strategy_binding.py'),'--run',a.run,'--jobs','32','--budget-runner',str(a.budget_runner)],check=True,cwd=ROOT)
out={'passed':all(r['passed']for r in records),'configured_jobs':32,'units':records,'C_fields':sum(r['actual_C_fields']for r in records),'seconds':time.monotonic()-start,'whole_kernel_proved':False};assert out['C_fields']==593
(D/'generation-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
