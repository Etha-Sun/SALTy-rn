"""Independent body review of common GEMM dependencies; diagnostic only."""
from pathlib import Path
import json,hashlib,os,subprocess,signal,time
H=Path(__file__).resolve().parent;R=H.parents[3];B=R/'experiments/shim-c-v2'
old=B/'stage3-inventory/f32-gemm-minmax/stream01';record=json.loads((old/'quick-helpers/command.json').read_text());previous_cwd=record['cwd'];case=H/'fma-r1';guard=json.loads((case/'source-guard.json').read_text());record['candidate']=str(case.relative_to(R));record['cwd']=guard['annotated'];record['frozen_sha256']=hashlib.sha256((case/'frozen.json').read_bytes()).hexdigest();manifest=json.loads((case/'frozen.json').read_text());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
expected={str(case/'frozen.json'):record['frozen_sha256']};expected.update({str(R/v['path']):v['sha256'] for v in manifest['files'].values()});expected.update({str(R/p):s for p,s in guard['proof'].items()});expected.update({str(Path(guard['annotated'])/p):s for p,s in guard['generated'].items()});lock=json.loads((R/manifest['files']['float_model_lock.json']['path']).read_text());expected.update({str(Path(p) if Path(p).is_absolute() else R/p):s for p,s in lock['files'].items()})
assert all(sha(Path(p))==s for p,s in expected.items())
out=case/'diagnostic01';out.mkdir(exist_ok=False);cmd=[x.replace(previous_cwd,record['cwd']) for x in record['command']]
for flag,value in [('-wp-fct','__riscv_vfmacc_vf_f32m4,vfmaq_f32'),('-wp-prover','tip,z3,cvc5'),('-wp-par','1'),('-wp-timeout','10'),('-wp-memlimit','2048'),('-wp-report-json',str(out/'raw.json')),('-wp-session',str(out/'.build/session'))]:cmd[cmd.index(flag)+1]=value
i=cmd.index('-wp-steps');del cmd[i:i+2]
record.update(command=cmd,budget=240,phase='root-body-review',scope='Both actual FMA helper bodies with checked array strategy; diagnostic only, not whole-kernel acceptance',runner_sha256=sha(Path(__file__)))
(out/'command.json').write_text(json.dumps(record,indent=2)+'\n');start=time.monotonic()
with (out/'run.log').open('x') as log:
 proc=subprocess.Popen(cmd,cwd=record['cwd'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'WP_OBSERVER_JSONL':str(out/'events.jsonl'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
 try:code=proc.wait(timeout=240)
 except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code=124
raw=json.loads((out/'raw.json').read_text()) if (out/'raw.json').exists() else None
record.update(exit=code,seconds=time.monotonic()-start,inputs_unchanged=all(sha(Path(p))==s for p,s in expected.items()),raw_total=len(raw) if raw is not None else None,raw_passed=sum(r['passed'] for r in raw) if raw is not None else None,pending=[r for r in raw if not r['passed']] if raw is not None else None)
(out/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({k:record[k] for k in ['exit','seconds','inputs_unchanged','raw_total','raw_passed']}))
