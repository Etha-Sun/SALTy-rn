#!/usr/bin/env python3
"""Private compatibility experiment; not a proof of the unchanged public impl.

Lower only named-local merge assignments to a checked ordinary in-place
helper. A final accepted variant must first be installed as a public current
implementation with its exact compatibility patch and fresh source binding.
"""
from pathlib import Path
import argparse,difflib,json,os,re,subprocess,tempfile,time
import generate_rvv_record_borrowed_kernel as N
import generate_kernels as G
C=N.C;R=N.R;sha=N.sha
def lower(t):
 matches=[]
 def replacement(m):
  assert m['candidate'][2:]==m['mask'][2:]
  matches.append(m[0])
  return m['indent']+'ap_record_rvv_merge_into32(&vmax,&'+m['candidate']+',&'+m['mask']+',vl);'
 pattern=r'(?m)^(?P<indent>[ \t]*)vmax\s*=\s*__riscv_vmerge_vvm_f32m8\(vmax,\s*(?P<candidate>vi[0-8]),\s*(?P<mask>vm[0-8]),\s*vl\)\s*;'
 result,count=re.subn(pattern,replacement,t);assert count==9,count
 return result,matches
def prefix():return N.prefix()+'#include "'+str(C/'shim/rvv_record_merge_into.h')+'"\n'
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=600);ap.add_argument('--prepare-only',action='store_true');a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 component=json.loads((C/'proof/rvv-record-merge-into-status.json').read_text());native=json.loads((C/'proof/record-merge-into-native-status.json').read_text());assert component['passed']and native['passed']
 assert json.loads((C/'proof/rvv-record-consumers-status.json').read_text())['passed']
 for n,h in component['source_sha256'].items():assert sha(C/'proof/coq'/(n+'.v'))==h,n
 for n,h in native['input_sha256'].items():assert sha(C/n)==h,n
 run=Path(tempfile.mkdtemp(prefix='rvv-inplace-compatible-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),Path(N.__file__),C/'proof/generate_compact_borrowed_kernels.py',C/'proof/generate_borrowed_kernels.py',C/'proof/generate_kernels.py',C/'impl/testRVV.c',C/'spec.c',C/'shim/rvv_record_merge_into.c',C/'proof/coq/RvvVectorRecords.v',C/'proof/coq/RecordAssignment.v',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths}
 s=dict(passed=False,whole_kernel_verified=False,scope='private_compatible_C_diagnostic_not_current_public_impl_proof',run_directory=str(run),records=records,input_sha256=inputs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,timeout_seconds=a.timeout,tokens_changed=True,current_public_impl_unchanged=True,public_impl_publication_required_before_final_admission=True)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  raw,ann=N.render();compatible,matches=lower(raw);annotated,_=lower(ann);assert G.tokens(compatible)==G.tokens(annotated);assert G.tokens(raw)!=G.tokens(compatible)
  (run/'compatible_testRVV.c').write_text(compatible);(run/'original_testRVV.c').write_text(raw)
  patch=run/'compatibility.patch';patch.write_text(''.join(difflib.unified_diff(raw.splitlines(keepends=True),compatible.splitlines(keepends=True),fromfile='impl/testRVV.c',tofile='impl/compatible-testRVV.c')))
  (run/'rvv_unit.c').write_text(prefix()+annotated);(run/'compatible_raw.c').write_text(prefix()+compatible)
  s.update(replaced_assignments=matches,compatibility_patch_sha256=sha(patch),compatible_source_sha256=sha(run/'compatible_testRVV.c'),original_source_sha256=sha(run/'original_testRVV.c'))
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'rvv_unit.c'),'-o',str(run/'rvv_unit.i')]),('compatible-raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'compatible_raw.c'),'-o',str(run/'compatible_raw.i')])]+([]if a.prepare_only else[('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'rvv_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]):
   if label=='qcp':assert G.tokens((run/'rvv_unit.i').read_text())==G.tokens((run/'compatible_raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-2000:]
  assert inputs=={n:sha(C/n)for n in inputs};s.update(passed=True,compatible_same_frontend_CPP_tokens_identical=True,prepare_only=a.prepare_only)
  if not a.prepare_only:
   goal=gen/'rvv_unit_goal.v';wrapper=run/'rvv_unit_def.v';wrapper.write_text('From ArgmaxPool Require Export RvvVectorRecords.\n')
   s.update(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)),raw_emitted_definition_rejected=True,definition_export_path=str(wrapper),definition_export_sha256=sha(wrapper))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
