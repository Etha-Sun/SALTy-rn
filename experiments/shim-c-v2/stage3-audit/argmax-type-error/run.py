from pathlib import Path
import json,subprocess,os,signal,time,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[3]
case=ROOT/'experiments/shim-c-v2/stage3-pool-spmm/f32-argmaxpool'
base=json.loads((case/'logs/diagnostic-01-command.json').read_text())
ann=case/'.build/diagnostic-01/annotated'
for label,model in [('raw','Typed+raw+float'),('typed','Typed+float')]:
 out=HERE/label;out.mkdir(exist_ok=False);cmd=base[:]
 for key,value in [('-wp-model',model),('-wp-prop','stage3_group_count'),('-wp-timeout','5'),('-wp-report-json',str(out/'raw.json')),('-wp-session',str(out/'.build/session'))]:cmd[cmd.index(key)+1]=value
 cmd+=['-wp-print','-wp-out',str(out/'.build/generated')]
 (out/'command.json').write_text(json.dumps({'command':cmd,'cwd':str(ann),'budget':120,'note':'Configuration comparison only, not qualification or acceptance.'},indent=2)+'\n')
 hashes={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in ann.iterdir() if p.is_file()}
 start=time.monotonic()
 with (out/'run.log').open('x') as f:
  proc=subprocess.Popen(cmd,cwd=ann,stdout=f,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'PATH':str(ROOT/'experiments/shim-c-v2/handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=proc.wait(timeout=120)
  except subprocess.TimeoutExpired:os.killpg(proc.pid,signal.SIGKILL);proc.wait();code=124
 (out/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-start,'annotated_sha256':hashes},indent=2)+'\n')
 print(label,code,flush=True)
