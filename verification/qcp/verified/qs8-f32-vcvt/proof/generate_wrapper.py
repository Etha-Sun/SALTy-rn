#!/usr/bin/env python3
"""Generate obligations for the exact public mixed byte/float caller bodies."""
import hashlib,json,re,subprocess,tempfile
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
BASE=ROOT/'verification/qcp/verified/f32-vadd'
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 run=Path(tempfile.mkdtemp(prefix='wrapper-vcs-',dir=CASE/'.build'));raw=(CASE/'spec.c').read_text()
 inv=json.loads((BASE/'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0]['text'].replace('4611686018427387900','4611686018427387903')
 assert raw.count('while(i<n)')==1;source=raw.replace('while(i<n)',inv+'\n while(i<n)',1);assert tokens(raw)==tokens(source)
 (CASE/'proof/c/wrapper.annotations.json').write_text(json.dumps({'compare_outputs':[{'before':'while(i<n)','text':inv}]},indent=2)+'\n')
 strategies=''.join('/*@ include strategies "'+n+'.strategies" */\n'for n in ['float_array','comparator','wrapper'])
 for name,src in [('original',raw),('wrapper_unit',source)]:
  src=re.sub(r'#include "([^\"]+)"',lambda m:'#include "'+str((CASE/m[1]).resolve())+'"',src)
  if name=='wrapper_unit':src=src.replace('void test_neon(',strategies+'void test_neon(',1)
  (run/(name+'.c')).write_text(src)
  subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-DQCP_FORMAL',run/(name+'.c'),'-o',run/(name+'.expanded.c')],check=True,timeout=60)
 assert tokens((run/'original.expanded.c').read_text())==tokens((run/'wrapper_unit.expanded.c').read_text())
 # Stable generated logical module basename.
 (run/'wrapper_unit.c').write_bytes((run/'wrapper_unit.expanded.c').read_bytes())
 cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit','1024','--input-file='+str(run/'wrapper_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=Qs8Cvt']
 for d in sorted((BASE/'proof/c').iterdir()):
  if d.is_dir():cmd+=['-slp',str(d),d.name]
 cmd+=['-slp',str(CASE/'shim'),'Qs8Cvt','-slp',str(CASE/'proof/c'),'Qs8Cvt']
 with(run/'qcp.log').open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=600)
 goal=run/'wrapper_unit_goal.v';s={'passed':r.returncode==0,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':r.returncode,'public_spec_sha256':hashlib.sha256((CASE/'spec.c').read_bytes()).hexdigest(),'same_frontend_cpp_tokens_identical':True,'actual_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 for p in [run/'status.json',CASE/'proof/wrapper-generation-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print(json.dumps(s,indent=2));print((run/'qcp.log').read_text()[-4500:]if r.returncode else '')
 return r.returncode
if __name__=='__main__':raise SystemExit(main())
