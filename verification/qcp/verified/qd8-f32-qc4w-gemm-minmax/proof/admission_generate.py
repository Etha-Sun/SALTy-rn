"""Generate all actual C units and bind exact goals plus C/CPP token identity.

An explicitly selected completed NEON generation can be adopted if every captured
input is still identical. This preserves its execution time and provenance; it is
never represented as a newly executed generator job. Default replay regenerates all.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,subprocess,time,shutil,re
from prepare import ROOT,UNITS,tokens
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);p.add_argument('--reuse-neon-run');p.add_argument('--wait-reused-neon-seconds',type=int,default=0,help='finite wait for an already running generation and its exact checked-goal adoption; starts no extra NEON job');a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
assert 0<=a.wait_reused_neon_seconds<=21600 and (not a.wait_reused_neon_seconds or a.reuse_neon_run)
if a.reuse_neon_run:assert re.fullmatch(r'[A-Za-z0-9_-]+',a.reuse_neon_run)and a.reuse_neon_run!=a.run
D=ROOT/'.build'/a.run;D.mkdir(exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def validate_inputs(record):
 assert record['generation_passed']and record['inputs_unchanged']
 assert all(sha(ROOT/f)==h for f,h in record['input_hashes'].items())
def run(unit):
 U=UNITS[unit];O=D/'generation'/unit;origin=None
 if unit=='neon'and a.reuse_neon_run:
  G=ROOT/'.build'/a.reuse_neon_run/'generation/neon';deadline=time.monotonic()+a.wait_reused_neon_seconds
  while not (G/'result.json').exists() and time.monotonic()<deadline:time.sleep(5)
  record=json.loads((G/'result.json').read_text());validate_inputs(record)
  expected=ROOT/'proof/coq'/U['namespace']/'neon_goal.v'
  while a.wait_reused_neon_seconds and (not expected.exists() or sha(expected)!=record['goal_sha256']) and time.monotonic()<deadline:time.sleep(5)
  assert expected.exists() and sha(expected)==record['goal_sha256'],'Completed NEON goal has not been adopted exactly'
  assert sha(G/'neon_goal.v')==record['goal_sha256'];shutil.copytree(G,O);origin=str(G.relative_to(ROOT))
  (D/'neon-adoption.json').write_text(json.dumps({'source':origin,'generation_utc':record['utc'],'generation_seconds':record['seconds'],'input_hashes_still_current':True,'new_generator_execution':False,'goal_sha256':record['goal_sha256']},indent=2)+'\n')
 else:
  cmd=['python3',str(a.budget_runner),'--out',str(D/(unit+'-budget')),'--timeout','21630','--reserve-gib','64','--memory-gib','64','--','python3',str(ROOT/'proof/generate.py'),unit,'--run',a.run,'--jobs','32']
  with(D/(unit+'-driver.log')).open('w')as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,cwd=ROOT)
  assert r.returncode==0,unit
  record=json.loads((O/'result.json').read_text());validate_inputs(record)
 expected=ROOT/'proof/coq'/U['namespace']/(U['base']+'_goal.v');actual=O/(U['base']+'_goal.v');assert sha(actual)==record['goal_sha256']==sha(expected),(unit,'goal differs')
 if unit in ['neon','rvv']:
  impl=ROOT/'impl'/('testNEON.c'if unit=='neon'else'testRVV.c');plain=O/'plain.c';plain.write_text('#include "shim/'+unit+'/api.h"\n'+impl.read_text());cpp=O/'plain-cpp.c'
  subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-I',str(ROOT),'-I',str(ROOT/'shim'),str(plain),'-o',str(cpp)],check=True)
  assert [x.group()for x in tokens(cpp.read_text())]==[x.group()for x in tokens((O/(U['base']+'.c')).read_text())],(unit,'CPP token mismatch')
 return {'unit':unit,'passed':True,'actual_C_fields':record['vc_fields'],'goal_sha256':sha(actual),'generation_utc':record['utc'],'generation_result':str((O/'result.json').relative_to(ROOT)),'adopted_from':origin,'new_generator_execution':origin is None,'plain_annotated_CPP_tokens_equal':unit in ['neon','rvv']}
start=time.monotonic()
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:records=list(pool.map(run,UNITS))
subprocess.run(['python3',str(ROOT/'proof/strategy_binding.py'),'--run',a.run,'--jobs','32','--budget-runner',str(a.budget_runner)],check=True,cwd=ROOT)
out={'passed':all(r['passed']for r in records),'configured_jobs':32,'units':records,'C_fields':sum(r['actual_C_fields']for r in records),'distinct_copy_strategy_fields':12,'seconds':time.monotonic()-start,'whole_kernel_proved':False}
(D/'generation-summary.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
