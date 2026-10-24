#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor,as_completed
import argparse,json,hashlib,shutil,tempfile,subprocess,time,os,re
P=Path(__file__).resolve().parent;C=P.parent;R=next(x for x in C.parents if(x/'.git').exists());NS=json.loads((P/'originals.json').read_text())['namespace'];sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
ap=argparse.ArgumentParser();ap.add_argument('--side',choices=['neon','rvv'],required=True);ap.add_argument('--calls-run',type=Path,required=True);ap.add_argument('--patch-run',type=Path);ap.add_argument('--patch-prefix',default='neon_focused_');ap.add_argument('--patch-support',action='append');ap.add_argument('--jobs',type=int,default=16);ap.add_argument('--timeout',type=int,default=1800);a=ap.parse_args();assert 1<=a.jobs<=16
run=Path(tempfile.mkdtemp(prefix=a.side+'-caller-interface-',dir=C/'.build'));coq=run/'coq';coq.mkdir();srcs={};reused={};records=[];gn=a.side+'_unit_goal';module=a.side.capitalize()+'CallsChecked';checked='Checked'+a.side.capitalize()+'Calls';status={'passed':False,'whole_kernel_verified':False,'partial_interface_checked':False,'scope':'Fully qualified caller/safety subset only. Explicit checked-object reuse; unified whole case must rebuild every source fresh. Print counts audited here; fail-closed canonical assumption audit belongs to full gate.','run_directory':str(run),'side':a.side,'records':records,'reused_ordinary_modules':reused,'source_sha256':srcs,'parallel_jobs':a.jobs,'per_process_memory_GiB':16}
flags=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(coq),NS];env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
def write_status():
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
def copy_checked(n,h,base):
 assert sha(base/(n+'.v'))==h,n
 for ext in ['.v','.vo','.vos','.vok']:
  f=base/(n+ext)
  if f.exists():shutil.copyfile(f,coq/f.name)
 assert(coq/(n+'.vo')).is_file(),n
 srcs[n]=h;reused[n]={'source_sha256':h,'vo_sha256':sha(coq/(n+'.vo')),'from':str(base)}
def cc(n):
 wd=run/'jobs'/n;wd.mkdir(parents=True);log=run/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];t=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 rec={'module':n,'exit_code':code,'seconds':time.monotonic()-t,'command':cmd,'log_sha256':sha(log),'source_sha256':sha(coq/(n+'.v'))};records.append(rec);print(n,code,flush=True);return code
try:
 d=json.loads((a.calls_run/'status.json').read_text());assert d['side']==a.side;assert len(set(d['fields']))==len(d['fields']);goal=(a.calls_run/'coq'/(gn+'.v'));g=goal.read_text();gen=json.loads((P/(a.side+'-generation-status.json')).read_text());assert sha(goal)==gen['goal_sha256']==d['goal_sha256'];status['goal_sha256']=sha(goal);status['calls_receipt_sha256']=sha(a.calls_run/'status.json')
 expected=[n for n in re.findall(r'^Axiom proof_of_(\w+)',g,re.M)if re.search('safety|partial_solve',n)];assert set(expected)==set(d['fields']);base=a.calls_run/'coq'
 for n,h in {**d['core_source_sha256'],**d['support_source_sha256']}.items():copy_checked(n,h,base)
 mapping={}
 for n in d['succeeded']:
  leaf=a.side+'_call_'+n;h=d['proof_source_sha256'][leaf+'.v'];rec=next(x for x in d['records']if x['module']==leaf);assert rec['exit_code']==0 and rec['source_sha256']==h and sha(a.calls_run/(leaf+'.log'))==rec['log_sha256'];copy_checked(leaf,h,base);mapping[n]=leaf
 pending=[]
 if d['failed']:
  assert a.patch_run is not None;patch=json.loads((a.patch_run/'status.json').read_text());assert patch['passed'];status['patch_receipt_sha256']=sha(a.patch_run/'status.json');patchsrc=patch['source_sha256'];patchbase=a.patch_run/'coq'
  for n in (a.patch_support or (['CallerFocused']if a.side=='neon'else[])):
   f=patchbase/(n+'.v');assert sha(f)==patchsrc[n];shutil.copyfile(f,coq/f.name);srcs[n]=sha(f);assert sha(P/'coq'/f.name)==srcs[n]
  for n in (a.patch_support or (['CallerFocused']if a.side=='neon'else[])):assert cc(n)==0
  for n in d['failed']:
   leaf=a.patch_prefix+n;f=patchbase/(leaf+'.v');assert sha(f)==patchsrc[leaf];assert any(x['module']==leaf and x['exit_code']==0 for x in patch['records']);shutil.copyfile(f,coq/f.name);srcs[leaf]=sha(f);mapping[n]=leaf;pending.append(leaf)
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:assert all(x==0 for x in pool.map(cc,pending))
 assert set(mapping)==set(expected)
 text='From '+NS+' Require Import '+gn+' '+' '.join(mapping[n]for n in expected)+'.\nModule '+checked+'.\n'
 for n in expected:text+='Definition proof_of_'+n+' : '+NS+'.'+gn+'.'+n+' := '+NS+'.'+mapping[n]+'.proof_of_'+n+'.\n'
 text+='End '+checked+'.\n';(coq/(module+'.v')).write_text(text);srcs[module]=sha(coq/(module+'.v'));assert cc(module)==0
 prints=[]
 for k in range(min(a.jobs,len(expected))):
  name=module+'Assumptions'+str(k).zfill(2);s='From '+NS+' Require Import '+module+'.\n'
  for n in expected[k::min(a.jobs,len(expected))]:s+='Print Assumptions '+NS+'.'+module+'.'+checked+'.proof_of_'+n+'.\n'
  (coq/(name+'.v')).write_text(s);srcs[name]=sha(coq/(name+'.v'));prints.append(name)
 with ThreadPoolExecutor(max_workers=a.jobs)as pool:assert all(x==0 for x in pool.map(cc,prints))
 count=sum(len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/(n+'.log')).read_text(),re.M))for n in prints);assert count==len(expected),(count,len(expected))
 for n,h in srcs.items():assert sha(coq/(n+'.v'))==h
 for n,leaf in mapping.items():assert sha(P/'coq'/(leaf+'.v'))==srcs[leaf]
 shutil.copyfile(coq/(module+'.v'),P/'coq'/(module+'.v'))
 status.update(passed=True,partial_interface_checked=True,actual_c_vcs=len(expected),fields=expected,field_source=mapping,Print_reports=count,typed_module=NS+'.'+module+'.'+checked)
except Exception as e:status['error']=str(e);print(repr(e),flush=True)
write_status();(P/(a.side+'-caller-interface-status.json')).write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','actual_c_vcs','Print_reports','run_directory','error']}),flush=True);raise SystemExit(0 if status['passed']else 1)
