from pathlib import Path
import subprocess,json,time,os,signal,hashlib
H=Path(__file__).resolve().parent;R=H.parents[4];B=R/'experiments/shim-c-v2';F=B/'stage3-byte-fp-front-v19';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
watch=dict(json.loads((F/'experimental-inputs02.json').read_text())['files']);watch[str(H/'wordbytes.mlw')]=sha(H/'wordbytes.mlw');watch[str(Path(__file__).resolve())]=sha(Path(__file__));assert all(sha(Path(p))==s for p,s in watch.items())
cmd=[str(B/'environment-recovery-local/.build/opam/shim-local/bin/why3'),'prove','-L',str(F/'wp-share/why3'),'-a','compute_in_goal','-a','inline_goal','-a','introduce_premises','-a','split_vc','-C',str(F/'why3-02.conf'),'-P','CVC5,1.2.1','-t','30','-m','2048',str(H/'wordbytes.mlw')]
meta={'command':cmd,'source_sha256':sha(H/'wordbytes.mlw'),'qualified':False};(H/'root02-split-first-command.json').write_text(json.dumps(meta,indent=2)+'\n');t=time.monotonic()
with (H/'root02-split-first.log').open('x') as out:
 p=subprocess.Popen(cmd,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=600)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
meta.update(exit=code,seconds=time.monotonic()-t,inputs_unchanged=all(sha(Path(p))==s for p,s in watch.items()));(H/'root02-split-first-result.json').write_text(json.dumps(meta,indent=2)+'\n');print(meta)
