#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,as_completed
import argparse,json,hashlib,shutil,subprocess,tempfile,re,os,time,threading
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());NS=json.loads((P/'originals.json').read_text())['namespace'];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();pa=argparse.ArgumentParser();pa.add_argument('--side',choices=['neon','rvv'],default='neon');pa.add_argument('--core',type=Path,required=True);pa.add_argument('--jobs',type=int,default=16);pa.add_argument('--timeout',type=int,default=1800);pa.add_argument('--support',default='NeonCallsTactics');pa.add_argument('--tactic',default='rd_caller');pa.add_argument('--status-path',type=Path);pa.add_argument('--select',default='(?:safety|partial_solve)');a=pa.parse_args();assert 1<=a.jobs<=16
run=Path(tempfile.mkdtemp(prefix=a.side+'-calls-',dir=C/'.build'));coq=run/'coq';corestate=json.loads((a.core.parent/'status.json').read_text());assert corestate['passed'];
if 'base_core'in corestate:
 base=json.loads((Path(corestate['base_core'])/'status.json').read_text());assert sha(Path(corestate['base_core'])/'status.json')==corestate['base_status_sha256'];corestate['source_sha256']={**base['source_sha256'],'rvv_unit_goal':corestate['goal_sha256']}
coq.mkdir()
for n,h in corestate['source_sha256'].items():
 for ext in ['.v','.vo','.vos','.vok']:
  pp=a.core/(n+ext)
  if pp.exists():shutil.copyfile(pp,coq/pp.name)
for n,h in corestate['source_sha256'].items():assert sha(coq/(n+'.v'))==h
support=['SelectedFacts','NeonCallsTactics']+(['NeonBitFacts','NeonWindowTactics']if a.support in ['NeonWindowTactics','PureResources','CallerCaps','CallerOrigin']else[])+(['PureResources']if a.support in ['PureResources','CallerCaps','CallerOrigin']else[])+(['CallerCaps']if a.support in ['CallerCaps','CallerOrigin']else[])+(['CallerOrigin']if a.support=='CallerOrigin'else[])
for n in support:shutil.copyfile(P/'coq'/(n+'.v'),coq/(n+'.v'))
flags=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(coq),NS];env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};goalname=a.side+'_unit_goal';g=(coq/(goalname+'.v')).read_text();gen=json.loads((P/(a.side+'-generation-status.json')).read_text());assert sha(coq/(goalname+'.v'))==gen['goal_sha256'];fields=[n for n in re.findall(r'^Axiom proof_of_(\w+)',g,re.M)if re.search(a.select,n)];records=[];lock=threading.Lock();state={'passed':False,'whole_kernel_verified':False,'partial_interface_checked':False,'scope':'Selected actual NEON caller and safety VC leaves only','run_directory':str(run),'side':a.side,'core_run':str(a.core.parent),'core_source_sha256':corestate['source_sha256'],'goal_sha256':sha(coq/(goalname+'.v')),'parallel_jobs':a.jobs,'per_process_memory_GiB':16,'fields':fields,'records':records,'succeeded':[],'failed':[]}
def cc(n):
 cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];wd=run/'jobs'/n;wd.mkdir(parents=True);log=run/(n+'.log');t=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 rec=dict(module=n,command=cmd,exit_code=code,seconds=time.monotonic()-t,log_sha256=sha(log),source_sha256=sha(coq/(n+'.v')))
 with lock:records.append(rec);(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
 print(n,code,flush=True);return code
try:
 for n in support:assert cc(n)==0,n
 def prove(n):
  leaf=a.side+'_call_'+n;aux=', '+NS+'.'+goalname+'.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
  s='From '+NS+' Require Import '+a.support+' '+goalname+'.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nLemma proof_of_'+n+' : '+NS+'.'+goalname+'.'+n+'.\nProof. unfold '+NS+'.'+goalname+'.'+n+aux+';try left;intros;subst;'+((('rd_pure_caller_origin'if a.support=='CallerOrigin'else('rd_pure_caller_cap'if a.support=='CallerCaps'else'rd_pure_caller'))if ('safety'in n or n.endswith('_pure'))else('rd_record_caller_origin'if a.support=='CallerOrigin'else('rd_record_caller_cap'if a.support=='CallerCaps'else'rd_record_caller')))if a.tactic=='auto'else a.tactic)+'. Qed.\nPrint Assumptions proof_of_'+n+'.\n';(coq/(leaf+'.v')).write_text(s);code=cc(leaf)
  return n,leaf,code
 with ThreadPoolExecutor(max_workers=a.jobs)as pool:
  for f in as_completed([pool.submit(prove,n)for n in fields]):
   n,leaf,code=f.result();state['failed'if code else'succeeded'].append(n)
   if code==0:shutil.copyfile(coq/(leaf+'.v'),P/'coq'/(leaf+'.v'))
   (run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 state.update(passed=not state['failed'],checked_count=len(state['succeeded']))
except Exception as e:state['error']=str(e);print(e,flush=True)
state['proof_source_sha256']={p.name:sha(p)for p in coq.glob(a.side+'_call_*.v')};state['support_source_sha256']={n:sha(coq/(n+'.v'))for n in support};state['current_public_support_sha256']={n:sha(P/'coq'/(n+'.v'))for n in support}
for p in [run/'status.json',a.status_path or P/(a.side+'-calls-status.json')]:p.write_text(json.dumps(state,indent=2)+'\n')
print(json.dumps({k:state.get(k)for k in ['passed','checked_count','run_directory','error']}),flush=True);raise SystemExit(0 if state['passed']else 1)
