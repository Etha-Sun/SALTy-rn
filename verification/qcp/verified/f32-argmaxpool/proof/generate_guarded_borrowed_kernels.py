#!/usr/bin/env python3
"""Keep the actual conditional-read guard in each annotation cut.

Only comments change. Each count<k is already a condition of the surrounding
C if. All previous constructors, goals and failed proof attempts are retained.
No public precondition or heap owner is changed.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
import generate_borrowed_kernels as B
C=B.C;R=B.R
sha=B.sha

def render(isa):
 module=B.Neon if isa=='neon'else B.Rvv;original=module.row_cut;changes=[]
 def guarded(count,before=False):
  text=original(count,before)
  if before and count>0:
   assert 1<=count<=8 and text.startswith('/*@ Assert ')
   text=text.replace('/*@ Assert ','/*@ Assert '+str(count)+'<k && ',1);changes.append(count)
  return text
 module.row_cut=guarded
 try:raw,annotated=B.render(isa)
 finally:module.row_cut=original
 assert changes==list(range(1,9)),changes
 assert B.Rvv.tokens(raw)==B.Rvv.tokens(annotated)
 return raw,annotated,changes

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 receipt=C/'proof/guard-cut-probe-status.json';r=json.loads(receipt.read_text());assert r['passed']and r['strict_vc_correct_passed']and r['actual_C_fields']==10
 checked=json.loads((C/'proof/borrowed-consumers-status.json').read_text());assert checked['passed']and checked['actual_C_fields']==20
 for n,h in checked['generation']['input_sha256'].items():assert sha(C/n)==h
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-guarded-borrowed-',dir=C/'.build'));gen=run/'generated';gen.mkdir();stem=a.isa+'_unit';records=[]
 paths=[Path(__file__),C/'proof/generate_borrowed_kernels.py',C/'proof/generate_neon_kernel.py',C/'proof/generate_kernels.py',receipt,C/'spec.c',C/'impl/testNEON.c',C/'impl/testRVV.c',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths};s=dict(passed=False,whole_kernel_verified=False,scope='actual C generation with explicit already-true conditional guards in annotation cuts',isa=a.isa,run_directory=str(run),input_sha256=inputs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,per_process_timeout_seconds=a.timeout,records=records)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  raw,annotated,guards=render(a.isa);oldraw,oldannotated=B.render(a.isa);assert raw==oldraw and B.Rvv.tokens(annotated)==B.Rvv.tokens(oldannotated)
  s.update(added_branch_guards=guards,public_precondition_unchanged=True,heap_owners_unchanged=True,C_tokens_changed=False)
  (run/(stem+'.c')).write_text(B.prefix(a.isa)+annotated);(run/'raw.c').write_text(B.prefix(a.isa)+raw);(run/'previous-annotations.c').write_text(B.prefix(a.isa)+oldannotated)
  commands=[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/(stem+'.c')),'-o',str(run/(stem+'.i'))]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]
  if not a.prepare_only:commands.append(('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/(stem+'.i')),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool']))
  for label,cmd in commands:
   if label=='qcp':assert B.Rvv.tokens((run/(stem+'.i')).read_text())==B.Rvv.tokens((run/'raw.i').read_text())
   command=['prlimit','--as=34359738368:34359738368','--',*cmd];log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(command,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=command,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-3000:]
  assert B.Rvv.tokens((run/(stem+'.i')).read_text())==B.Rvv.tokens((run/'raw.i').read_text());assert inputs=={n:sha(C/n)for n in inputs}
  s.update(passed=True,prepare_only=a.prepare_only,original_same_frontend_CPP_tokens_identical=True)
  if not a.prepare_only:
   goal=gen/(stem+'_goal.v');s.update(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 if not a.prepare_only:
  out=C/'proof'/(a.isa+'-guarded-generation-status.json')
  if out.exists():(C/'proof/history'/(out.stem+'-'+sha(out)+'.json')).write_bytes(out.read_bytes())
  out.write_bytes((run/'status.json').read_bytes())
 print(json.dumps({k:s.get(k)for k in['passed','run_directory','actual_C_fields','prepare_only','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
