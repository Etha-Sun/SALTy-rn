#!/usr/bin/env python3
"""Independently check actual NEON VC leaves over explicit coherent local models.
All failures remain recorded; no complete interface passes while any selected
leaf is missing. The final whole gate must rebuild every source from scratch.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--tactics-run',required=True);ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--max-live',type=int,default=4);ap.add_argument('--timeout',type=int,default=7200);ap.add_argument('--kinds',nargs='+',default=['safety','pure','call','which']);a=ap.parse_args();assert a.jobs==32 and 0<a.max_live<=6 and 0<a.timeout<=14400
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 base=Path(a.tactics_run).resolve();b=json.loads((base/'status.json').read_text());assert b['passed']and'NeonTactics'in b['targets'];run=Path(tempfile.mkdtemp(prefix='neon-leaves-',dir=C/'.build'));q=run/'coq';q.mkdir();reused={};sourcehash={};records=[]
 for n,h in b['source_sha256'].items():
  p=C/'proof/coq'/(n+'.v');assert sha(p)==h and sha(base/'coq'/p.name)==h,n
  for ext in ['.v','.vo']:
   p=base/'coq'/(n+ext);shutil.copy2(p,q/p.name);reused[p.name]=sha(p)
 text=(C/'proof/coq/neon_unit_goal.v').read_text();fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert len(fs)==268
 todo=[]
 for ix,n in enumerate(fs):
  kind='which'if'which_implies'in n else'safety'if'safety'in n else'pure'if n.endswith('_pure')else'memory'if'entail'in n or'return'in n else'call'
  if kind not in a.kinds:continue
  mod=f'NeonLeaf{ix:03d}';aux=n+'_aux';extra=(',ExpMinusMax.neon_unit_goal.'+aux)if re.search(r'^Definition '+aux+r'\b',text,re.M)else''
  src='From ExpMinusMax Require Import NeonTactics neon_unit_goal.\nImport Snaive_C_Rules64. Local Open Scope sac.\nModule Checked.\n'+f'Lemma proof_of_{n}:ExpMinusMax.neon_unit_goal.{n}.\nProof. unfold ExpMinusMax.neon_unit_goal.{n}'+extra+'.\n'
  if kind in ['pure','safety']:src+=' emk_pure_goal.\n'
  elif kind=='which':src+=' left;intros;first[apply em_record_stage_exact|apply em_record_stage_i4|apply em_record_stage_u4].\n'
  else:src+=' em_intro;emk_frame.\n'
  src+='Qed.\nEnd Checked.\n'+f'Print Assumptions Checked.proof_of_{n}.\n';p=C/'proof/coq'/(mod+'.v')
  if p.exists():assert p.read_text()==src,'existing leaf changed; retain explicit proof instead of overwriting: '+mod
  else:p.write_text(src)
  shutil.copy2(p,q/p.name);sourcehash[mod]=sha(p);todo.append((mod,n,kind))
 flags=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(q),'ExpMinusMax'];assert flags[:2]==['qcp-env','coqc']and not set(flags)&{'-vos','-vok','-quick','-vio'}
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 s=dict(passed=False,whole_kernel_verified=False,vc_correct_passed=False,scope='independent actual C VC leaves; explicit coherent local model reuse, no whole-case credit',run_directory=str(run),actual_goal_sha256=sha(C/'proof/coq/neon_unit_goal.v'),core_status_sha256=sha(base/'status.json'),configured_jobs=32,max_live_processes=a.max_live,per_process_memory_GiB=16,reused_source_object_sha256=reused,selected_actual_fields=[n for _,n,_ in todo],new_source_sha256=sourcehash,records=records)
 def compile(mod,field='',kind='dependency'):
  p=q/(mod+'.v');cwd=run/'jobs'/mod;cwd.mkdir(parents=True);log=run/(mod+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(p)];t=time.monotonic()
  try:
   with log.open('w')as f:ec=subprocess.run(cmd,cwd=cwd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:ec=124
  r=dict(module=mod,field=field,kind=kind,command=cmd,exit_code=ec,seconds=time.monotonic()-t,source_sha256=sha(p),log_sha256=sha(log));print(mod,field,ec,flush=True);return r
 try:
  deporder=[];seen=set()
  def visit(n):
   if n+'.vo'in reused or n in seen:return
   seen.add(n);p=C/'proof/coq'/(n+'.v');txt=re.sub(r'\(\*.*?\*\)','',p.read_text(),flags=re.S)
   for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',txt):
    prefix,body=m.groups()
    for word in body.split():
     name=prefix+'.'+word if prefix else word
     if name.startswith('ExpMinusMax.'):
      d=name[len('ExpMinusMax.'):];assert'.'not in d;visit(d)
   deporder.append(n)
  visit('neon_unit_goal')
  for n in deporder:
   p=C/'proof/coq'/(n+'.v');shutil.copy2(p,q/p.name);sourcehash[n]=sha(p);r=compile(n);records.append(r);assert not r['exit_code'],'dependency failed: '+n
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.max_live)as pool:
   futures={pool.submit(compile,*task):task for task in todo}
   for f in concurrent.futures.as_completed(futures):
    records.append(f.result());s['passed_actual_fields']=sum(r['exit_code']==0 and bool(r['field'])for r in records);s['failed_actual_fields']=[r['field']for r in records if r['field']and r['exit_code']];(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in sourcehash.items()),'leaf source drift';assert all(sha(base/'coq'/n)==h for n,h in reused.items()),'reused object/source drift';assert all(r['exit_code']==0 for r in records),'actual leaf failures remain'
  s['passed']=True
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/neon-leaf-status.json').write_bytes((run/'status.json').read_bytes());print(run,flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
