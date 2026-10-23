#!/usr/bin/env python3
"""Generate goals from the locked declared repaired NEON kernel with the public contract."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--timeout',type=int,default=3600);a=p.parse_args();run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=CASE/'.build'));raw=(CASE/'impl/testNEON.c').read_text();repair=json.loads((HERE/'repair.json').read_text());assert sha(CASE/'impl/testNEON.c')==repair['sides']['neon']['actual_sha256'];ann=json.loads((HERE/'c/neon.annotations.json').read_text());s=raw.replace('\n{','\n'+ann['contract']+'\n{',1)
 for anchor,key in [('  for (; batch >= 2048;', 'outer_invariant'),('    for (size_t current_batch = 2048;', 'inner_invariant'),('    for (; batch >= 16;', 'remainder_invariant')]:
  assert s.count(anchor)==1,(anchor,s.count(anchor));s=s.replace(anchor,ann[key]+'\n'+anchor,1)
 for call,bind in ann['where'].items():assert call in s,call;s=s.replace(call,call+' /*@ where '+bind+' */')
 assert tokens(s)==tokens(raw);prefix='#include "'+str(CASE/'shim/neon_frontend.h')+'"\n';(run/'annotated.c').write_text(prefix+s);(run/'original.c').write_text(prefix+raw)
 for src,dst in [('annotated.c','neon_unit.c'),('original.c','original.expanded.c')]:subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(run/src),'-o',str(run/dst)],cwd=run,check=True,timeout=60)
 assert tokens((run/'neon_unit.c').read_text())==tokens((run/'original.expanded.c').read_text());cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=Qs8Rsum']
 for d in sorted((BASE/'proof/c').iterdir()):
  if d.is_dir():cmd+=['-slp',str(d),d.name]
 cmd+=['-slp',str(CASE/'shim'),'Qs8Rsum','-slp',str(HERE/'c'),'Qs8Rsum'];work=run/'qcp-work';work.mkdir();t=time.monotonic()
 with(run/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'neon_unit_goal.v';d={'generation_passed':code==0,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'raw_c_sha256':sha(CASE/'impl/testNEON.c'),'same_frontend_cpp_tokens_identical':True,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 for p in [run/'status.json',HERE/'neon-generation-status.json']:p.write_text(json.dumps(d,indent=2)+'\n')
 print(json.dumps(d,indent=2),flush=True)
 if code:print((run/'qcp.log').read_text()[-5000:],flush=True)
 return code
if __name__=='__main__':raise SystemExit(main())
