#!/usr/bin/env python3
"""Rebuild a complete current actual-kernel interface and audit every field.
This is a component receipt; the independent fresh full-case gate admits it.
"""
from pathlib import Path
import argparse,datetime,hashlib,json,re,subprocess,sys,tempfile
P=Path(__file__).resolve().parent;C=P.parent;NS=json.loads((P/'originals.json').read_text())['namespace']
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
a=argparse.ArgumentParser();a.add_argument('--side',choices=['neon','rvv'],required=True);a.add_argument('--core',type=Path,required=True);a.add_argument('--jobs',type=int,default=32);a.add_argument('--memory-gib',type=int,choices=[16,32],default=16);a.add_argument('--timeout',type=int,default=7200);a.add_argument('--live-jobs-file',type=Path);args=a.parse_args();assert 1<=args.jobs<=32
side=args.side;name=side.capitalize();goal=side+'_unit_goal';checked=name+'Checked';module='Checked'+name
gf=P/(side+'-generation-status.json');g=json.loads(gf.read_text());assert g['generation_passed']and g['same_raw_tokens']and g['same_frontend_cpp_tokens'];generation_sha=sha(gf)
raw=C/'impl'/('testNEON.c'if side=='neon'else'testRVV.c');ann=P/'c'/(side+'.annotations.json');assert sha(raw)==g['raw_c_sha256']and sha(ann)==g['annotation_sha256'];assert sha(args.core/(goal+'.v'))==g['goal_sha256']
fields=re.findall(r'^Axiom proof_of_(\w+) :',(args.core/(goal+'.v')).read_text(),re.M);assert len(fields)==g['generated_c_vcs']and len(set(fields))==len(fields)
assert re.search(r'Module '+module+r'\s*:\s*'+re.escape(NS+'.'+goal+'.VC_Correct')+r'\.',(P/'coq'/(checked+'.v')).read_text())
run=Path(tempfile.mkdtemp(prefix=side+'-complete-interface-',dir=C/'.build'));state={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,'whole_case_verified':False,'scope':'Complete actual kernel component only; independent full-case fresh C/Coq admission remains required.','run_directory':str(run),'side':side,'actual_c_vcs':len(fields),'goal_sha256':g['goal_sha256'],'records':[]}
def execute(core,mod,label):
 log=run/(label+'.log');cmd=[sys.executable,str(P/'check_modules.py'),'--core',str(core),'--module',mod,'--jobs',str(args.jobs),'--memory-gib',str(args.memory_gib),'--timeout',str(args.timeout)]
 if args.live_jobs_file:cmd+=['--live-jobs-file',str(args.live_jobs_file)]
 with log.open('w')as f:r=subprocess.run(cmd,cwd=C,stdout=f,stderr=f,timeout=172800)
 lines=log.read_text().splitlines();last=next(json.loads(s)for s in reversed(lines)if s.startswith('{')and'run_directory'in s);receipt=Path(last['run_directory'])/'status.json';d=json.loads(receipt.read_text());state['records'].append({'label':label,'command':cmd,'exit_code':r.returncode,'status':str(receipt),'status_sha256':sha(receipt),'log':str(log),'log_sha256':sha(log)})
 assert r.returncode==0 and d['passed'],str(log);return d,receipt
try:
 typed,tp=execute(args.core,checked,'typed-complete');typedcore=Path(typed['run_directory'])/'coq'
 partnames=[]
 for i in range(32):
  n=name+'Assumptions'+f'{i:02d}';partnames.append(n);selected=fields[i::32];text='From '+NS+' Require Import '+checked+' '+goal+'.\n'+''.join('Print Assumptions '+NS+'.'+checked+'.'+module+'.proof_of_'+f+'.\n'for f in selected);(P/'coq'/(n+'.v')).write_text(text)
 final='Final'+name+'Check';text='From '+NS+' Require Import '+checked+' '+goal+' '+' '.join(partnames)+'.\nModule ExactFinal'+name+' : '+NS+'.'+goal+'.VC_Correct := '+NS+'.'+checked+'.'+module+'.\n';(P/'coq'/(final+'.v')).write_text(text)
 printed,pp=execute(typedcore,final,'all-field-assumptions');assert printed['Print_reports']==len(fields)
 sources={}
 for d in [typed,printed]:
  for n,h in d['source_sha256'].items():
   p=P/'coq'/(n+'.v')
   if p.exists():assert sha(p)==h,n;sources[str(p.relative_to(C))]=h
 assert sha(gf)==generation_sha and sha(raw)==g['raw_c_sha256']and sha(ann)==g['annotation_sha256']
 out={'passed':True,'vc_correct_passed':True,'kernel_vc_correct_passed':True,'whole_kernel_verified':False,'whole_case_verified':False,'scope':'Complete repaired actual '+name+' kernel C-shim VC_Correct under the existing visible valid non-wrapping row-footprint contract; whole-case fresh C/Coq admission remains pending.','run_directory':printed['run_directory'],'typed_run_directory':typed['run_directory'],'typed_instance':NS+'.'+checked+'.'+module,'actual_c_vcs':len(fields),'fields':fields,**{k:g[k]for k in ['goal_sha256','cpp_sha256','raw_c_sha256','annotation_sha256']},'generation_status_sha256':generation_sha,'typed_receipt_sha256':sha(tp),'Print_receipt_sha256':sha(pp),'Print_reports':len(fields),'Print_modules':partnames,'typed_new_ordinary_modules':typed['new_compiled_modules'],'Print_new_ordinary_modules':printed['new_compiled_modules'],'proof_source_sha256':sources,'input_sha256':{str(p.relative_to(C)):sha(p)for p in [raw,ann,C/'shim'/(side+'_frontend.h')]},'ordinary_component_log_records':typed['records'],'Print_log_records':printed['records'],'typed_base_reuse':'Explicit coherent checked core reuse; all remaining required proof sources ordinary compiled in one dependency DAG. No unchecked artifact mixing. Independent full-case gate rebuilds all required sources.','parallel_limit_history':printed['parallel_limit_history'],'peak_active_jobs':printed['peak_active_jobs'],'assumption_audit':'Every fully qualified actual field has a Print report; final canonical14/external import closure audit remains mandatory in the full case gate.','time_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
 target=P/(side+'-proof-status.json');assert not target.exists(),'Preserve/explicitly invalidate any old canonical receipt before a replay';target.write_text(json.dumps(out,indent=2)+'\n');state.update(passed=True,vc_correct_passed=True,canonical_status=str(target),canonical_status_sha256=sha(target),Print_reports=len(fields))
except Exception as e:state['error']=str(e)
(run/'status.json').write_text(json.dumps(state,indent=2)+'\n');print(json.dumps(state),flush=True);raise SystemExit(0if state['passed']else 1)
