from pathlib import Path
import hashlib,json,subprocess,os,time,signal
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';H=B/'stage3-byte-fp-front-v16';L=H/'qualification01/loop-export01';L.mkdir();lock=H/'experimental-inputs02.json';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();watch=json.loads(lock.read_text())['files'];watch[str(lock)]=sha(lock);assert all(sha(Path(p))==s for p,s in watch.items())
old=B/'stage3-byte-fp-front-v11';cmd=json.loads((old/'qualification01/memory-export01/command.json').read_text())['command'];cmd=[x.replace(str(old),str(H)).replace('memory-export01','loop-export01') for x in cmd];cmd[cmd.index('-wp-timeout')+1]='1';cmd[cmd.index('-wp-fct')+1]='positive_loop'
(L/'command.json').write_text(json.dumps({'command':cmd,'scope':'Actual SMT export with one-second solver diagnostic; not qualification','lock_sha256':sha(lock)},indent=2)+'\n')
env=os.environ|{'OCAMLPATH':str(B/'stage3-byte-fp-front-v1/.build/install/lib'),'PATH':str(B/'handoff-solvers/.build/bin')+':'+os.environ['PATH']};t=time.monotonic()
with (L/'run.log').open('w') as out:
 p=subprocess.Popen(cmd,cwd=H,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=90)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
(L/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t,'inputs_unchanged':all(sha(Path(p))==s for p,s in watch.items()),'qualification':False},indent=2)+'\n')
