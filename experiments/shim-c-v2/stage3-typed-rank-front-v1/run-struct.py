"""Unqualified isolated rank repair comparison, never an old-freeze acceptance."""
from pathlib import Path
import json,hashlib,sys,subprocess,os,time,signal
H=Path(__file__).resolve().parent;B=H.parent
run=sys.argv[1];budget=int(sys.argv[2]);out=H/'controls'/run;out.mkdir(parents=True,exist_ok=False)
case=B/'stage3-proof-next/gemm/candidate14';old=json.loads((case/'logs/helper01/command.json').read_text());cmd=old['command'];cmd[0]=str(H/'.build/install/bin/frama-c');cmd[cmd.index('-wp-session')+1]=str(out/'.build/session');cmd[cmd.index('-wp-report-json')+1]=str(out/'raw.json')
cmd+=['-cpp-command','gcc -E -C -I'+str(B/'model-plus/libc')+' -I.','-cpp-frama-c-compliant'];di=cmd.index('-wp-driver')+1;cmd[di]=str(B/'model-fma/fma.driver')+','+cmd[di]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();watch=old['input_sha256_before'].copy();watch[str(H/'.build/install/bin/frama-c')]=sha(H/'.build/install/bin/frama-c');watch[str(H/'source-audit.json')]=sha(H/'source-audit.json');watch[str(Path(__file__).resolve())]=sha(Path(__file__).resolve());assert all(sha(Path(p))==s for p,s in watch.items())
meta={'command':cmd,'cwd':old['cwd'],'budget':budget,'inputs_before':watch,'qualification':False,'scope':'Diagnostic real structcopy body only, candidate14 proof under independent new binary; no kernel acceptance.'};(out/'command.json').write_text(json.dumps(meta,indent=2)+'\n')
t=time.monotonic()
with (out/'run.log').open('x') as log:
 p=subprocess.Popen(cmd,cwd=old['cwd'],stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env=os.environ|{'OCAMLPATH':str(H/'.build/install/lib'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH'],'WP_OBSERVER_JSONL':str(out/'events.jsonl')})
 try:code=p.wait(timeout=budget)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
raw=json.loads((out/'raw.json').read_text()) if (out/'raw.json').exists() else None
meta.update(exit=code,seconds=time.monotonic()-t,raw_total=len(raw) if raw is not None else None,raw_passed=sum(bool(x['passed']) for x in raw) if raw is not None else None,inputs_unchanged=all(sha(Path(p))==s for p,s in watch.items()))
(out/'result.json').write_text(json.dumps(meta,indent=2)+'\n');print({k:meta[k] for k in ['exit','seconds','raw_total','raw_passed','inputs_unchanged']},flush=True)
