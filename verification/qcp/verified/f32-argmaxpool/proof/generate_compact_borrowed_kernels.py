#!/usr/bin/env python3
"""Same checked adapters and C, fewer redundant nullable-readiness disjunctions.

All owners/control variables remain. Readability is a real pending call VC,
proved from the previous pass state, rather than asserted in sixteen branches.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
import generate_borrowed_kernels as B
import generate_kernels as G
C=B.C;R=B.R;sha=B.sha
def render(isa):
 raw,t=B.render(isa);removed={}
 if isa=='rvv':
  state_out=G.current('output',done=G.DONE);state_index=G.current('index',done=G.DONE)
  clauses=['(current_ab==0 || ap_output_readable('+state_out+',current_ab,vl))','(current_ib==0 || ap_index_readable('+state_index+',current_ib,vl))','(current_ab==0 || ap_write_window(W,current_ab,vl))','(current_ib==0 || ap_write_window(WI,current_ib,vl))']
  for p in clauses:
   assert t.count(p)==1,p;t=t.replace(p+' && ','');removed[p]=1
  p='(0<k || '+G.GROUP+'==app_groups(pooling_elements))';count=t.count(p);assert count;t=t.replace(p+' && ','');removed[p]=count
 assert G.tokens(raw)==G.tokens(t)
 return raw,t,removed
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['rvv','neon'],required=True);ap.add_argument('--timeout',type=int,default=600);ap.add_argument('--prepare-only',action='store_true');a=ap.parse_args()
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 c=json.loads((C/'proof/borrowed-consumers-status.json').read_text());assert c['passed']
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-compact-borrowed-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[];stem=a.isa+'_unit'
 paths=[Path(__file__),Path(B.__file__),C/'proof/generate_kernels.py',C/'proof/generate_neon_kernel.py',C/'spec.c',C/'impl/testNEON.c',C/'impl/testRVV.c',*sorted((C/'shim').glob('*.h'))];inputs={str(p.relative_to(C)):sha(p)for p in paths}
 s=dict(passed=False,whole_kernel_verified=False,scope='actual_C_compact_derived_annotations_goal_generation_only',run_directory=str(run),isa=a.isa,input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,timeout_seconds=a.timeout)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  raw,t,removed=render(a.isa);s['removed_derived_assert_clauses']=removed;(run/(stem+'.c')).write_text(B.prefix(a.isa)+t);(run/'raw.c').write_text(B.prefix(a.isa)+raw)
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/(stem+'.c')),'-o',str(run/(stem+'.i'))]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]+([]if a.prepare_only else[('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/(stem+'.i')),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]):
   if label=='qcp':assert G.tokens((run/(stem+'.i')).read_text())==G.tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout)
    ec=p.returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-2500:]
  assert inputs=={n:sha(C/n)for n in inputs};s.update(passed=True,original_same_frontend_CPP_tokens_identical=True,prepare_only=a.prepare_only)
  if not a.prepare_only:
   goal=gen/(stem+'_goal.v');s.update(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','prepare_only','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
