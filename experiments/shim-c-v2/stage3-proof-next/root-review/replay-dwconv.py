"""Root independent replay: all row cursor cuts, all lemmas, positive/negative controls."""
from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as c
case=H.parent/'dwconv/r4';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();digest=json.loads((case/'freeze.json').read_text())['frozen_sha256'];m,g=c.prepare(case,digest,'root-replay01');A=Path(g['annotated']);out=H/'dwconv-replay01';out.mkdir();(out/'guard.json').write_text(json.dumps(g,indent=2)+'\n');original=json.loads((case/'logs/rows30-command.json').read_text());base=[x.replace(original['cwd'],str(A)) for x in original['command']]
expected={str(case/'frozen.json'):digest,str(case/'proof.patch'):json.loads((case/'freeze.json').read_text())['proof_sha256'],str(Path(__file__)):sha(Path(__file__))};expected.update({str(R/v['path']):v['sha256'] for v in m['files'].values()});expected.update({str(A/n):s for n,s in g['generated'].items()});lock=json.loads((R/m['files']['float_model_lock.json']['path']).read_text());expected.update({str(Path(p) if Path(p).is_absolute() else R/p):s for p,s in lock['files'].items()});obs=Path(base[base.index('-load-module')+1]);expected[str(obs)]='df62e27ec11d707f2dee90423f3f42e485784b0dd7182a8848f3fd53f9de6d96';assert all(sha(Path(p))==s for p,s in expected.items())
for phase in ['selected','globals','control']:
 dest=out/phase;dest.mkdir();cmd=base[:]
 if '-wp-session' not in cmd:cmd+=['-wp-session',str(dest/'.build/session')]
 for flag,val in [('-wp-par','1'),('-wp-report-json',str(dest/'raw.json')),('-wp-session',str(dest/'.build/session'))]:cmd[cmd.index(flag)+1]=val
 if phase=='globals':
  i=cmd.index('-wp-fct');del cmd[i:i+2];cmd[cmd.index('-wp-prop')+1]='@lemma'
 if phase=='control':
  i=cmd.index('-wp-fct');del cmd[i:i+2]
  i=cmd.index('-wp-prop');del cmd[i:i+2]
  control=dest/'control.c';control.write_text('#include '+json.dumps(str(A/'unit.c'))+'\n/*@ assigns \\nothing; ensures \\true; */\nvoid root_true(void){}\n/*@ assigns \\nothing; ensures \\false; */\nvoid root_false(void){}\n');cmd[cmd.index(str(A/'unit.c'))]=str(control);cmd+=['-wp-fct','root_true,root_false']
 record={'command':cmd,'cwd':str(A),'budget':180,'frozen_sha256':digest,'proof_sha256':sha(case/'proof.patch'),'model_lock_sha256':sha(R/m['files']['float_model_lock.json']['path']),'runner_sha256':sha(Path(__file__)),'scope':'Independent selected proof replay, not whole-kernel acceptance'};(dest/'command.json').write_text(json.dumps(record,indent=2)+'\n');t=time.monotonic()
 with (dest/'run.log').open('x') as log:
  p=subprocess.Popen(cmd,cwd=A,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'WP_OBSERVER_JSONL':str(dest/'events.jsonl'),'PATH':str(R/'experiments/shim-c-v2/handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=p.wait(timeout=180)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 rows=json.loads((dest/'raw.json').read_text()) if (dest/'raw.json').exists() else [];record.update(exit=code,seconds=time.monotonic()-t,raw_total=len(rows),raw_passed=sum(x['passed'] for x in rows),inputs_unchanged=all(sha(Path(p))==s for p,s in expected.items()),pending=[x for x in rows if not x['passed']]);(dest/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(phase,code,record['raw_passed'],record['raw_total'],flush=True)
