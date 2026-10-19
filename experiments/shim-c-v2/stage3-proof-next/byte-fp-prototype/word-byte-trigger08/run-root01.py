from pathlib import Path
import json,hashlib,subprocess,time,os,signal
H=Path(__file__).resolve().parent;R=H.parents[4];B=R/'experiments/shim-c-v2';F=B/'stage3-byte-fp-front-v20';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();watch=dict(json.loads((F/'experimental-inputs02.json').read_text())['files']);watch[str(H/'wordtriggers.mlw')]=sha(H/'wordtriggers.mlw');assert all(sha(Path(p))==s for p,s in watch.items());rows=[]
for j in range(4):
 cmd=[str(B/'environment-recovery-local/.build/opam/shim-local/bin/why3'),'prove','-L',str(F/'wp-share/why3'),'-a','rewrite checked_word_byte'+str(j),'-a','introduce_premises','-a','split_vc','-C',str(F/'why3-02.conf'),'-P','Z3,4.12.5','-t','10','-m','2048',str(H/'wordtriggers.mlw'),'-T','WordByteTriggers','-G','checked_word_byte'+str(j)+"_trigger'vc"]
 meta={'command':cmd,'source_sha256':sha(H/'wordtriggers.mlw'),'qualification':False};(H/('root01-'+str(j)+'-command.json')).write_text(json.dumps(meta,indent=2)+'\n');t=time.monotonic()
 with (H/('root01-'+str(j)+'.log')).open('x') as out:
  p=subprocess.Popen(cmd,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=p.wait(timeout=60)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 meta.update(exit=code,seconds=time.monotonic()-t,inputs_unchanged=all(sha(Path(p))==s for p,s in watch.items()));(H/('root01-'+str(j)+'-result.json')).write_text(json.dumps(meta,indent=2)+'\n');rows.append(meta);print(j,code,flush=True)
(H/'root01-summary.json').write_text(json.dumps({'all_four_body_goals_selected':True,'all_exits_zero':all(x['exit']==0 for x in rows),'qualification':False},indent=2)+'\n')
