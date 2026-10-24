"""Generate ordinary assertion/read/NaN bridge/comparator/public caller actual C units."""
from pathlib import Path
import argparse,json,hashlib,subprocess,tempfile,time,re,concurrent.futures
C=Path(__file__).resolve().parent.parent;H=C/'proof';R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def unit_text(stem):
 if stem=='wrapper_unit':
  s=(C/'spec.c').read_text().replace('#include "shim/comparator.h"','#include "shim/comparator.h"\n/*@ include strategies "sqrt_public.strategies" */');entry='/*@ Assert sizeof(float)==4 && n==(n*sizeof(float))/4 && (n*sizeof(float))%4==0 && 0<n*sizeof(float) && n*sizeof(float)<=18446744073709551615 && n==n@pre && input==input@pre && left==left@pre && right==right@pre && 0<n && n<=4611686018427387903 && input!=0 && left!=0 && right!=0 && FloatArray::full(input,n+3,A)*FloatArray::undef_full(left,n)*FloatArray::undef_full(right,n) */';s=s.replace(' test_neon(n*sizeof(float),input,left,NULL);',entry+'\n test_neon(n*sizeof(float),input,left,NULL) /*@ where A=A */;').replace(' test_rvv(n*sizeof(float),input,right,NULL);',' test_rvv(n*sizeof(float),input,right,NULL) /*@ where A=A */;');anchor=' return compare_outputs(n,left,right);';cut='/*@ Assert n==n@pre && input==input@pre && left==left@pre && right==right@pre && 0<n && n<=4611686018427387903 && outputs_related(sqrt_arm_values(n,A),sqrt_rvv_values(n,A)) && FloatArray::full(input,n+3,A)*FloatArray::full(left,n,sqrt_arm_values(n,A))*FloatArray::full(right,n,sqrt_rvv_values(n,A)) */';assert s.count(anchor)==1;return s.replace('#include "shim/','#include "'+str(C/'shim')+'/').replace(anchor,cut+'\n'+anchor)
 return (C/'shim'/dict(assert_unit='assert.c',array_read='array_read.c',bridge='bridge.c',comparator='comparator.c')[stem]).read_text()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--stems',nargs='+',default=['assert_unit','array_read','bridge','comparator','wrapper_unit']);a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='public-gen-',dir=C/'.build'));records=[]
 def execute(stem):
  d=run/stem;d.mkdir();text=unit_text(stem);src=d/(stem+'.raw.c');src.write_text(text);cpp=d/(stem+'.c');rs=[]
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc','-I',C/'shim',src,'-o',cpp]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(d),'--coq-logic-path=Sqrt','-slp',C/'shim','Sqrt','-slp',H/'c','Sqrt',*sum((['-slp',p,p.name]for p in sorted((B/'proof/c').iterdir())if p.is_dir()),[])])]:
   log=d/(label+'.log');start=time.monotonic();command=['prlimit','--as=34359738368:34359738368','--',*map(str,cmd)]
   with log.open('w')as f:
    try:ec=subprocess.run(command,cwd=d,stdout=f,stderr=f,timeout=21600).returncode
    except subprocess.TimeoutExpired:ec=124
   rs.append(dict(label=label,command=command,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)))
   if ec:return dict(stem=stem,passed=False,records=rs)
  g=d/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);assert fields;return dict(stem=stem,passed=True,records=rs,cpp_sha256=sha(cpp),goal_sha256=sha(g),fields=fields,generated_c_vcs=len(fields),goal=str(g))
 with concurrent.futures.ThreadPoolExecutor(max_workers=32)as pool:
  for r in pool.map(execute,a.stems):records.append(r);print(r['stem'],r['passed'],r.get('generated_c_vcs'),flush=True)
 s=dict(passed=all(r['passed']for r in records),whole_kernel_verified=False,scope='actual_C_generation_only',run_directory=str(run),units=records);(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True)
if __name__=='__main__':main()
