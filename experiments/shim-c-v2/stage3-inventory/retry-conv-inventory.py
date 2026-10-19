"""Read-only, solver-free retry of an incomplete inventory; no acceptance claim."""
from pathlib import Path
import json,hashlib,subprocess,os,signal,time
H=Path(__file__).resolve().parent;R=H.parents[2];old=H/'f32-conv-hwc2chw/stream01/inventory-body';out=H/'f32-conv-hwc2chw/inventory-body-retry01';out.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
original=json.loads((old/'command.json').read_text());guard=json.loads((old.parent/'guard.json').read_text());case=R/original['candidate'];manifest=case/'frozen.json';m=json.loads(manifest.read_text());ann=Path(original['cwd']);lockpath=R/m['files']['float_model_lock.json']['path'];lock=json.loads(lockpath.read_text());cmd=list(original['command']);observer=Path(cmd[cmd.index('-load-module')+1]);observer_source=observer.parent.parent/'observer.ml'
assert sha(manifest)==original['frozen_sha256'];assert sha(lockpath)==original['model_lock_sha256'];assert sha(observer)==original['observer_sha256'];assert sha(observer_source)==original['observer_source_sha256'];assert sha(H/'stream.py')==original['runner_sha256']
expected={str(manifest):original['frozen_sha256'],str(lockpath):original['model_lock_sha256'],str(observer):original['observer_sha256'],str(observer_source):original['observer_source_sha256'],str(H/'stream.py'):original['runner_sha256']}
expected.update({str(R/v['path']):v['sha256'] for v in m['files'].values()});expected.update({str(ann/n):v for n,v in guard['generated'].items()});expected.update({str(R/n):v for n,v in guard['proof'].items()});expected.update({str(Path(n) if Path(n).is_absolute() else R/n):v for n,v in lock['files'].items()});expected[str(Path(__file__).resolve())]=sha(Path(__file__));assert all(sha(Path(p))==s for p,s in expected.items())
assert cmd[cmd.index('-wp-prover')+1]=='none';assert '-wp-no-qed' in cmd and '-wp-no-clean' in cmd
cmd[cmd.index('-wp-report-json')+1]=str(out/'raw.json');cmd[cmd.index('-wp-session')+1]=str(out/'.build/session')
record={**original,'phase':'inventory-body-retry01','command':cmd,'budget':900,'runner_sha256':sha(Path(__file__)),'original_runner_sha256':original['runner_sha256'],'original_failed_phase':str(old.relative_to(R)),'input_sha256_before':expected,'scope':'Solver-free WPO enumeration only. Original frozen implementation/spec/model/proof/observer unchanged. Not kernel proof or canonical acceptance.'}
(out/'command.json').write_text(json.dumps(record,indent=2)+'\n');t=time.monotonic()
with (out/'run.log').open('x') as log:
 p=subprocess.Popen(cmd,cwd=ann,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'WP_OBSERVER_JSONL':str(out/'events.jsonl'),'PATH':str(H.parent/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
 try:code=p.wait(timeout=900)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
elapsed=time.monotonic()-t;ep=out/'events.jsonl';text=ep.read_text() if ep.exists() else '';truncated=bool(text and not text.endswith('\n'));lines=text.splitlines();events=[json.loads(l) for l in (lines[:-1] if truncated else lines) if l.strip()];finals=[e for e in events if e['event']=='final'];ids={e['goal'] for e in finals};marker=events[-1] if events and events[-1]['event']=='normal_exit' else None
now={n:sha(Path(n)) for n in expected};same=now==expected;complete=code==0 and marker is not None and len(finals)==len(ids)==marker['goal_count'] and same
cfg=[e for e in finals if e['results'] and all(r['prover']=='cfg' for r in e['results'])]
record.update(exit=code,seconds=round(elapsed,3),normal_exit_marker=marker,input_sha256_after=now,inputs_unchanged=same,truncated_jsonl_line=truncated,final_count=len(finals),unique_final_count=len(ids),cfg_only_count=len(cfg),logic_wpo_count=len(finals)-len(cfg),inventory_complete=complete,kernel_complete=False,observed_unique_count=len({e['goal'] for e in events if 'goal' in e}))
(out/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps({k:record[k] for k in ['exit','seconds','inventory_complete','final_count','cfg_only_count','logic_wpo_count','inputs_unchanged']}),flush=True)
