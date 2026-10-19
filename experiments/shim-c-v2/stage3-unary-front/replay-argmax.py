from pathlib import Path
import sys,json,subprocess,os,signal,time,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
case=HERE/'replay/f32-argmaxpool';digest=(case/'freeze-sha256.txt').read_text().strip();data,guard=checker.prepare(case,digest,'unary-selected01')
(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');assert guard['passed']
ann=Path(guard['annotated']);logs=case/'logs';logs.mkdir(exist_ok=True)
cmd=json.loads((ROOT/'experiments/shim-c-v2/stage3-pool-spmm/f32-argmaxpool/logs/diagnostic-01-command.json').read_text());cmd[0]=str(HERE/'frama-c.py');cmd[-1]=str(ann/'unit.c')
for key,value in [('-wp-driver',str(ann/data['driver'])),('-wp-report-json',str(logs/'unary-selected01.json')),('-wp-session',str(case/'.build/unary-selected01/session'))]:cmd[cmd.index(key)+1]=value
(logs/'unary-selected01-command.json').write_text(json.dumps({'command':cmd,'cwd':str(ann),'budget':240,'frozen_sha256':digest},indent=2)+'\n')
t=time.monotonic()
with (logs/'unary-selected01.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=ann,stdout=f,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'PATH':str(HERE.parent/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
 try:code=p.wait(timeout=240)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(logs/'unary-selected01-exit.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t})+'\n');print('selected',code,flush=True)
cmd=[sys.executable,str(ROOT/'tools/shim_c_campaign_v4.py'),str(case),'--frozen-sha256',digest,'--name','unary-full01','--framac',str(HERE/'frama-c.py'),'--prover-bin',str(HERE.parent/'handoff-solvers/.build/bin')]
(logs/'unary-full01-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
with (case/'full.stdout').open('x') as f:code=subprocess.run(cmd,cwd=ROOT,stdout=f,stderr=subprocess.STDOUT).returncode
(logs/'unary-full01-exit.json').write_text(json.dumps({'driver_exit':code})+'\n');print('full',code,flush=True)
