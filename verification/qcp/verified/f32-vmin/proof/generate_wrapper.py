#!/usr/bin/env python3
"""Generate goals for the public spec.c helper bodies and observational wrapper."""
import argparse,hashlib,json,re,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists());BASE=ROOT/'verification/qcp/verified/f32-vadd'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--timeout',type=int,default=600);args=p.parse_args();run=Path(tempfile.mkdtemp(prefix='wrapper-vcs-',dir=CASE/'.build'))
 raw=(CASE/'spec.c').read_text();source=raw
 inv=json.loads((BASE/'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0]
 source=source.replace(inv['before'],inv['text']+'\n  '+inv['before'],1)
 initial='''/*@ Assert n == (4*n)/4 && (4*n)%4 == 0 &&
 0 < 4*n && 4*n <= 18446744073709551603 && params != 0 &&
 n == n@pre && input_a == input_a@pre && input_b == input_b@pre &&
 left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387900 &&
 input_a != 0 && input_b != 0 && left != 0 && right != 0 &&
 store(&(params->_),char,pv) * FloatArray::full(input_a,n+3,A) *
 FloatArray::full(input_b,n+3,B) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */'''
 related='''/*@ Assert n == n@pre && input_a == input_a@pre && input_b == input_b@pre &&
 left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387900 &&
 outputs_related(mm_arm_values(n,A,B),mm_rvv_values(n,A,B)) &&
 store(&(params->_),char,pv) * FloatArray::full(input_a,n+3,A) *
 FloatArray::full(input_b,n+3,B) * FloatArray::full(left,n,mm_arm_values(n,A,B)) *
 FloatArray::full(right,n,mm_rvv_values(n,A,B)) */'''
 patches=[{'before':'test_neon(4*n,','text':initial},{'before':'return compare_outputs(n, left, right);','text':related}]
 for patch in patches:
  assert source.count(patch['before'])==1;source=source.replace(patch['before'],patch['text']+'\n  '+patch['before'],1)
 assert tokens(raw)==tokens(source),'Public C tokens changed'
 (HERE/'c/wrapper.annotations.json').write_text(json.dumps({'compare_outputs':[inv],'equivalent':patches},indent=2)+'\n')
 # Resolve includes against spec.c, then preprocess both with the same frontend.
 source=source.replace('"shim/program_model.h"','"'+str(CASE/'shim/program_model.h')+'"').replace('"shim/runtime.h"','"'+str(CASE/'shim/runtime.h')+'"')
 original=raw.replace('"shim/program_model.h"','"'+str(CASE/'shim/program_model.h')+'"').replace('"shim/runtime.h"','"'+str(CASE/'shim/runtime.h')+'"')
 source=source.replace('void test_neon(', '/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion) */\nvoid test_neon(',1)
 strategies=''.join('/*@ include strategies "'+n+'.strategies" */\n'for n in ['float_array','comparator','wrapper'])
 source=source.replace('void test_neon(',strategies+'void test_neon(',1)
 (run/'annotated.c').write_text(source);(run/'original.c').write_text(original)
 for a,b in [('annotated','wrapper_unit'),('original','original.expanded')]:subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-DQCP_FORMAL',str(run/(a+'.c')),'-o',str(run/(b+'.c'))],cwd=run,check=True,timeout=60)
 assert tokens((run/'wrapper_unit.c').read_text())==tokens((run/'original.expanded.c').read_text()),'Public CPP C tokens changed'
 cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit','1024','--input-file='+str(run/'wrapper_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=FMin']
 for d in sorted((BASE/'proof/c').iterdir()):
  if d.is_dir():cmd+=['-slp',str(d),d.name]
 cmd+=['-slp',str(CASE/'shim'),'FMin'];start=time.monotonic()
 with(run/'qcp.log').open('w')as out:
  try:code=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=args.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'wrapper_unit_goal.v';status={'generation_passed':code==0,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'public_spec_sha256':sha(CASE/'spec.c'),'same_frontend_cpp_tokens_identical':True,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0}
 for q in [run/'status.json',HERE/'wrapper-generation-status.json']:q.write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps(status,indent=2))
 if code:print((run/'qcp.log').read_text()[-6000:])
 raise SystemExit(code)
if __name__=='__main__':main()
