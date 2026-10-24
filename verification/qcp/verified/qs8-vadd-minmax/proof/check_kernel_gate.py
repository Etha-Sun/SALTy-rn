#!/usr/bin/env python3
"""Close one actual kernel interface in its recorded fresh preparation environment.
The independent full-case runner subsequently regenerates all C and recompiles every .v.
"""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,re,shutil,subprocess,tempfile,time,threading
from prepare_neon import imports
from split_goal import audit,identity
C=Path(__file__).resolve().parent.parent;NS='Qs8Add'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--config',type=Path,required=True);p.add_argument('--coq-dir',type=Path,required=True);p.add_argument('--partition-status',action='append',type=Path,default=[]);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=7200);a=p.parse_args();assert 16<=a.jobs<=64 and 0<a.timeout<=14400
 isa=a.isa;cap=isa.capitalize();coq=a.coq_dir.resolve();prep=json.loads((coq.parent/'status.json').read_text());assert prep['prepared'] and prep['no_component_vo_reused'];g=coq/(isa+'_unit_goal.v');assert sha(g)==prep['goal_sha256'];gen=json.loads((C/'proof'/(isa+'-generation-status.json')).read_text());assert gen['generation_passed'] and gen['raw_source_unchanged'] and gen['same_frontend_cpp_tokens_identical'];assert sha(C/'impl'/('test'+('NEON'if isa=='neon'else'RVV')+'.c'))==gen['raw_c_sha256'];gr=Path(gen['run_directory']);actual_goal_sha=prep.get('actual_goal_sha256',prep['goal_sha256']);assert sha(gr/g.name)==actual_goal_sha
 if prep.get('goal_projection'):audit(gr/g.name,coq,NS,isa+'_unit')
 r=Path(tempfile.mkdtemp(prefix=isa+'-kernel-gate-',dir=C/'.build'));(r/'actual').mkdir();shutil.copyfile(gr/g.name,r/'actual'/g.name);shutil.copyfile(gr/(isa+'_unit.c'),r/'actual'/(isa+'_unit.c'));records=[];lock=threading.Lock();sources={};leaf={};compiled=set();guard={}
 for n,d in prep['source_sha256'].items():
  assert sha(coq/(n+'.v'))==d['sha256'] and (coq/(n+'.vo')).exists();sources[n]=d['sha256'];compiled.add(n)
 for path in a.partition_status:
  d=json.loads(path.read_text());assert Path(d['fresh_preparation_directory']).resolve()==coq.parent and d['goal_sha256']==prep['goal_sha256']
  for x in d['records']:
   if x['exit_code']!=0:continue
   n=x['label'];assert sha(coq/(n+'.v'))==x['source_sha256'] and sha(C/'proof/coq'/(n+'.v'))==x['source_sha256'] and (coq/(n+'.vo')).exists();leaf[n]=x;sources[n]=x['source_sha256'];compiled.add(n)
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS];s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,scope='single complete actual C kernel interface; final all-callee case gate pending',run_directory=str(r),fresh_preparation_directory=str(coq.parent),partition_status_inputs={str(p):sha(p)for p in a.partition_status},parallel_jobs=a.jobs,per_process_memory_GiB=16,records=records)
 def execute(n):
  log=r/(n+'.log');cwd=r/(n+'-cwd');cwd.mkdir();cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];t=time.monotonic()
  with log.open('w')as f:
   try:z=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:z=124
  x=dict(label=n,command=cmd,exit_code=z,seconds=time.monotonic()-t,source_sha256=sha(coq/(n+'.v')),log_sha256=sha(log))
  with lock:records.append(x);print(n,z,flush=True);(r/'status.json').write_text(json.dumps(s,indent=2)+'\n')
  assert not z,log.read_text()[-3000:]
 def visit(n):
  if n in compiled:return
  src=C/'proof/coq'/(n+'.v');text=src.read_text();clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S);assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
  for dep in imports(text):visit(dep)
  sources[n]=sha(src);guard[n]=sha(src);shutil.copyfile(src,coq/src.name);execute(n);compiled.add(n)
 try:
  root=cap+'KernelChecked';visit(root);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);assert len(fields)==gen['generated_c_vcs'];module=NS+'.'+root+'.Checked'+cap+'Kernel';interface=cap+'KernelInterface';(coq/(interface+'.v')).write_text(f'Require Import {NS}.{root}.\nModule Actual : {NS}.{isa}_unit_goal.VC_Correct := {module}.\n');execute(interface)
  names=[]
  for i in range(16):
   n=cap+f'KernelAssumptionsPart{i:02d}';names.append(n);text=f'From {NS} Require Import {interface}.\n'+'\n'.join('Print Assumptions '+NS+'.'+interface+'.Actual.proof_of_'+f+'.'for f in fields[i::16])+'\n';(coq/(n+'.v')).write_text(text)
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(execute,names))
  for i,n in enumerate(names):assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',(r/(n+'.log')).read_text(),re.M))==len(fields[i::16])
  final=cap+'KernelFinal';(coq/(final+'.v')).write_text(f'From {NS} Require Import '+ ' '.join([interface,*names])+f'.\nModule Actual : {NS}.{isa}_unit_goal.VC_Correct := {NS}.{interface}.Actual.\n');execute(final)
  assert all(sha(coq/(n+'.v'))==h for n,h in sources.items());assert all(sha(C/'proof/coq'/(n+'.v'))==h for n,h in guard.items());assert sha(gr/g.name)==actual_goal_sha;assert sha(C/'impl'/('test'+('NEON'if isa=='neon'else'RVV')+'.c'))==gen['raw_c_sha256']
  s.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fields),fields=fields,checked_module=module,goal_sha256=actual_goal_sha,compiled_goal_sha256=sha(g),cpp_sha256=sha(gr/(isa+'_unit.c')),compiled_source_sha256={NS+'.'+n:h for n,h in sources.items()},existing_checked_leaf_records=leaf,no_component_vo_reused_in_preparation=True,final_gate_source_sha256=sha(coq/(final+'.v')),assumption_reports=len(fields))
  if prep.get('goal_projection'):
   audit(gr/g.name,coq,NS,isa+'_unit');s['goal_projection']=prep['goal_projection'];s['goal_projection_identity']=identity(prep['goal_projection'])
 except Exception as e:s['error']=str(e);print(e,flush=True)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof'/(isa+'-proof-status.json')
 if out.exists():(C/'proof/history'/(isa+'-proof-status-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','checked_c_vcs','run_directory','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
