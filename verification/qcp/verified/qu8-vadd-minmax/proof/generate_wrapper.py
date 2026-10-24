#!/usr/bin/env python3
"""Generate the live public unsigned-byte comparator/caller C obligations."""
import hashlib,json,re,subprocess,tempfile
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 run=Path(tempfile.mkdtemp(prefix='wrapper-vcs-',dir=CASE/'.build'))
 raw=(CASE/'spec.c').read_text()
 inv='''/*@ Inv n==n@pre && left==left@pre && right==right@pre &&
 0<n && n<=18446744073709551608 && 0<=i && i<=n &&
 UCharArray::full(left,n,L) * UCharArray::full(right,n,L) */'''
 assert raw.count('while(i<n)')==1
 annotated=raw.replace('while(i<n)',inv+'\n  while(i<n)',1)
 assert tokens(raw)==tokens(annotated)
 (CASE/'proof/c/wrapper.annotations.json').write_text(json.dumps({'compare_outputs':[{'before':'while(i<n)','text':inv}]},indent=2)+'\n')
 prefix='#include "'+str(CASE/'shim/control.c')+'"\n'
 for name,src in [('original',raw),('wrapper',annotated)]:
  src=re.sub(r'#include "(shim/[^\"]+)"',lambda m:'#include "'+str(CASE/m[1])+'"',src)
  (run/(name+'.c')).write_text(prefix+src)
  subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-DQCP_FORMAL',run/(name+'.c'),'-o',run/(name+'.expanded.c')],check=True,timeout=60)
 assert tokens((run/'original.expanded.c').read_text())==tokens((run/'wrapper.expanded.c').read_text())
 (run/'wrapper.c').write_bytes((run/'wrapper.expanded.c').read_bytes())
 cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(run/'wrapper.c'),'--coq-output-dir='+str(run),'--coq-logic-path=Qu8Add','-slp',str(CASE/'proof/c'),'Qu8Add','-slp',str(CASE/'shim'),'Qu8Add']
 with(run/'qcp.log').open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=600)
 goal=run/'wrapper_goal.v'
 s={'passed':r.returncode==0,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':r.returncode,'public_spec_sha256':hashlib.sha256((CASE/'spec.c').read_bytes()).hexdigest(),'same_frontend_cpp_tokens_identical':True,'actual_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 for p in [run/'status.json',CASE/'proof/wrapper-generation-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print(json.dumps(s,indent=2));print((run/'qcp.log').read_text()[-4000:]if r.returncode else '')
 return r.returncode
if __name__=='__main__':raise SystemExit(main())
