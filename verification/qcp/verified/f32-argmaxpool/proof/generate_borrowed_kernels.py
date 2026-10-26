#!/usr/bin/env python3
"""Actual source with checked ordinary read-borrow adapters and original models.

The runtime instruction calls and their argument values are unchanged. This
formal frontend exposes named local addresses to checked ordinary adapters;
the original intrinsic declarations and the old failed runs remain preserved.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
import generate_kernels as Rvv
import generate_neon_kernel as Neon
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
SELECTED={'rvv':{'__riscv_vmfgt_vv_f32m8_b4':3,'__riscv_vmerge_vvm_f32m8':4},'neon':{'vbslq_f32':3}}
def prefix(isa):
 header='kernel_frontend.h'if isa=='rvv'else'neon_kernel_frontend.h'
 return '#include "'+str(C/'shim'/header)+'"\n#include "'+str(C/'shim/borrowed_bindings.h')+'"\n'
def render(isa):
 raw=(C/'impl'/('testRVV.c'if isa=='rvv'else'testNEON.c')).read_text()
 annotated=Rvv.render('rvv')if isa=='rvv'else Neon.render()
 annotated=annotated.split('\n',1)[1]
 for name,arity in SELECTED[isa].items():
  calls=re.findall(r'\b'+name+r'\(([^()]*?)\)',raw)
  assert calls,(isa,name)
  for args in calls:
   values=[v.strip()for v in args.split(',')];assert len(values)==arity
   vector_values=values[:-1]if isa=='rvv'else values
   assert all(re.fullmatch(r'[A-Za-z_]\w*',v)for v in vector_values),(name,args)
   assert len(set(vector_values))==len(vector_values),(name,'unexpected object alias',args)
  pattern=r'('+name+r'\([^;\n]+?\))\s*/\*@\s*where\s+[^*]+\*/'
  annotated,count=re.subn(pattern,lambda m:m[1],annotated);assert count==len(calls),(name,count,len(calls))
 assert Rvv.tokens(raw)==Rvv.tokens(annotated),'annotation-only C source identity'
 return raw,annotated
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['rvv','neon'],required=True);ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args()
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 checked=json.loads((C/'proof/borrowed-consumers-status.json').read_text());native=json.loads((C/'proof/borrowed-native-status.json').read_text());assert checked['passed']and native['passed'];assert checked['actual_C_fields']==20
 for n,h in checked['generation']['input_sha256'].items():assert sha(C/n)==h,('adapter input changed',n)
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-borrowed-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[];stem=a.isa+'_unit'
 paths=[Path(__file__),C/'proof/generate_kernels.py',C/'proof/generate_neon_kernel.py',C/'spec.c',C/'impl/testRVV.c',C/'impl/testNEON.c',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths};s=dict(passed=False,whole_kernel_verified=False,scope='actual_C_kernel_goal_generation_with_checked_ordinary_borrow_adapters_only',run_directory=str(run),isa=a.isa,input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  raw,annotated=render(a.isa);(run/(stem+'.c')).write_text(prefix(a.isa)+annotated);(run/'raw.c').write_text(prefix(a.isa)+raw)
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/(stem+'.c')),'-o',str(run/(stem+'.i'))]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]+([]if a.prepare_only else[('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/(stem+'.i')),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]):
   if label=='qcp':assert Rvv.tokens((run/(stem+'.i')).read_text())==Rvv.tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:p=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout)
    ec=p.returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-3000:]
  assert Rvv.tokens((run/(stem+'.i')).read_text())==Rvv.tokens((run/'raw.i').read_text());assert inputs=={n:sha(C/n)for n in inputs}
  s.update(passed=True,original_same_frontend_CPP_tokens_identical=True,ordinary_adapter_provider=checked['typed_module'],prepare_only=a.prepare_only)
  if not a.prepare_only:
   goal=gen/(stem+'_goal.v');s.update(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof'/(a.isa+'-borrowed-generation-status.json')
 if not a.prepare_only:
  if out.exists():(C/'proof/history'/(out.stem+'-'+sha(out)+'.json')).write_bytes(out.read_bytes())
  out.write_bytes((run/'status.json').read_bytes())
 print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','prepare_only','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
