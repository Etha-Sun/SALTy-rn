"""Regenerate each actual strategy goal and bind its already selected Coq source."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,re,subprocess
from prepare import ROOT
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--budget-runner',type=Path,required=True);a=p.parse_args();assert a.jobs==32
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();tool=Path('/tmp/qcp214-src/linux-binary/StrategyCheck')
def run(side):
 O=ROOT/'.build'/a.run/'strategy'/side;O.mkdir(parents=True,exist_ok=False);ns='QC4Rvv';dsl=ROOT/'shim'/side/'copy.strategies';header=ROOT/'shim'/side/'copy.h';expected=ROOT/'proof/coq'/ns/'copy_strategy_goal.v'
 cmd=['python3',str(a.budget_runner),'--out',str(O/'budget'),'--timeout','7230','--reserve-gib','16','--memory-gib','16','--',str(tool),'--input-file',str(dsl),'--coq-output-dir',str(O),'--coq-logic-path',ns,'--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info']
 with(O/'driver.log').open('w')as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,cwd=ROOT)
 goal=O/'copy_strategy_goal.v';passed=r.returncode==0 and goal.exists()and sha(goal)==sha(expected)
 out={'passed_generation':passed,'configured_jobs':32,'unit':side,'strategy_fields':len(re.findall(r'^\s*Axiom\s+',goal.read_text(),re.M))if goal.exists()else 0,'generated_goal_sha256':sha(goal)if goal.exists()else None,'dsl_sha256':sha(dsl),'header_sha256':sha(header),'tool_sha256':sha(tool),'proof_status':'exact generated-goal binding; Coq strategy proof belongs to complete compile run'};(O/'result.json').write_text(json.dumps(out,indent=2)+'\n');return out
with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:out=list(pool.map(run,['neon','rvv']))
assert all(x['passed_generation']for x in out)and all(x['strategy_fields']==12 for x in out) and len({x['generated_goal_sha256']for x in out})==1;print(out)
