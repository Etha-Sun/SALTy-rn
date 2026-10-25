#!/usr/bin/env python3
"""Finite ISA-value replay; independent all-bits oracle, never whole-proof credit."""
from pathlib import Path
import argparse,hashlib,json,os,resource,subprocess,tempfile,time
CASE=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def limit():resource.setrlimit(resource.RLIMIT_AS,(16*1024**3,16*1024**3))
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--sanitizer',choices=['none','undefined','address'],default='undefined');args=ap.parse_args()
 run=Path(tempfile.mkdtemp(prefix='native-'+args.sanitizer+'-',dir=CASE/'.build'));records=[]
 cgroup=None
 if args.sanitizer=='address':
  rel=Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];cg=Path('/sys/fs/cgroup')/rel.lstrip('/');m=(cg/'memory.max').read_text().strip();sw=(cg/'memory.swap.max').read_text().strip();assert m=='17179869184' and sw=='0', 'ASan requires a real16GiB/Swap0 cgroup';cgroup={'path':str(cg),'actual_memory_max':m,'actual_memory_swap_max':sw}
 sources=[*sorted((CASE/'impl').glob('*.c')),CASE/'spec.c',CASE/'shim/kernel_runtime.h',CASE/'shim/propagate.c',CASE/'shim/propagate.h',CASE/'shim/read_table.c',CASE/'shim/read_table.h',CASE/'shim/compare.c',CASE/'shim/compare.h',CASE/'proof/native/isa_arrays.h',CASE/'proof/native/harness.c',*sorted((CASE/'proof/original').glob('*.c')),Path(__file__)]
 inputs={str(p.relative_to(CASE)):sha(p) for p in sources}
 flags=['gcc','-std=c11','-O2','-g','-Wall','-Wextra','-Wno-misleading-indentation','-fno-fast-math','-fno-strict-aliasing','-DQCP_NATIVE','-include',str(CASE/'proof/native/isa_arrays.h'),'-I',str(CASE/'proof/native'),'-I',str(CASE/'shim')]
 if args.sanitizer!='none':flags+=['-fsanitize='+args.sanitizer,'-fno-sanitize-recover=all','-fno-omit-frame-pointer']
 def call(cmd,label,expect=0):
  start=time.monotonic();p=subprocess.run(cmd,cwd=run,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=600,preexec_fn=None if args.sanitizer=='address' else limit,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=1:halt_on_error=1','UBSAN_OPTIONS':'halt_on_error=1:print_stacktrace=1'})
  log=run/(label+'.log');log.write_bytes(p.stdout);rec={'label':label,'command':list(map(str,cmd)),'exit_code':p.returncode,'seconds':time.monotonic()-start,'log':str(log),'log_sha256':sha(log)};records.append(rec)
  if (expect==0 and p.returncode!=0) or (expect=='nonzero' and p.returncode==0):raise RuntimeError(rec)
  return p.stdout.decode()
 def obj(src,name,defs=()):
  out=run/(name+'.o');call(flags+list(defs)+['-c',str(src),'-o',str(out)],'build-'+name);return str(out)
 # Every executable links the actual unchanged repaired .c files. Mutants live
 # only in this private run and preserve their full source/command identities.
 linear=(CASE/'proof/original/testRVV.c').read_text();old='for (int k = (int) kernel_elements - 9; k > 0; k -= 9)'
 assert linear.count(old)==1
 linear=linear.replace(old,'for (size_t k=kernel_elements>9?kernel_elements-9:0; k!=0; k=k>9?k-9:0)')
 for a,b in [('__riscv_vfmax_vv_f32m8','mp_max_vv'),('__riscv_vfmax_vf_f32m8','mp_max_vf'),('__riscv_vfmin_vf_f32m8','mp_min_vf')]:linear=linear.replace(a,b)
 lp=run/'linear-propagation-mutant.c';lp.write_text('#include "propagate.h"\n'+linear)
 normal=[obj(CASE/'impl/testNEON.c','neon'),obj(CASE/'impl/testRVV.c','rvv'),obj(CASE/'shim/propagate.c','propagate'),obj(CASE/'proof/original/testNEON.c','original-neon',['-Dtest_neon=original_neon']),obj(CASE/'proof/original/testRVV.c','original-rvv',['-Dtest_rvv=original_rvv']),obj(lp,'linear',['-Dtest_rvv=linear_rvv']),obj(CASE/'proof/native/harness.c','harness'),obj(CASE/'shim/read_table.c','read-table'),obj(CASE/'shim/compare.c','compare')]
 normal.append(obj(CASE/'spec.c','public-caller'))
 exe=run/'replay';call(['gcc',*(['-fsanitize='+args.sanitizer] if args.sanitizer!='none' else []),*normal,'-o',str(exe)],'link')
 counter=json.loads(call([str(exe),'counterexamples'],'counterexamples'))
 result=json.loads(call([str(exe)],'full-regression'))
 wrong=(CASE/'shim/propagate.c').read_text();needle='return __riscv_vmerge_vvm_f32m8(r,fa,sa,vl);';assert wrong.count(needle)==1;wrong=wrong.replace(needle,'return numeric; /* deliberate shared-wrong negative control */')
 wp=run/'shared-wrong-propagate.c';wp.write_text(wrong)
 wn=obj(CASE/'impl/testNEON.c','shared-wrong-neon',['-DMP_SHARED_WRONG']);wh=obj(wp,'shared-wrong-propagate');wexe=run/'shared-wrong'
 call(['gcc',*(['-fsanitize='+args.sanitizer] if args.sanitizer!='none' else []),wn,*normal[1:2],wh,*normal[3:],'-o',str(wexe)],'link-shared-wrong')
 control=json.loads(call([str(wexe),'shared-wrong'],'shared-wrong'))
 assert control['programs_agree'] and control['oracle_rejects']
 probe=run/'counter-prefix-ub.c';probe.write_text('#include <stdint.h>\n#include <stddef.h>\nint main(void){volatile size_t K=UINT64_C(2147483648);volatile int k=(int)K-9;return k>0;}\n')
 # This isolated arithmetic-prefix UBSan probe is not a whole-kernel run with
 # a table of 2^31 pointers. The exact, valid small-domain FP counterexample
 # above is a whole-kernel replay.
 ub=run/'counter-prefix-ub';call(['gcc','-std=c11','-O1','-fsanitize=undefined','-fno-sanitize-recover=all',str(probe),'-o',str(ub)],'build-count-ub')
 ubtext=call([str(ub)],'count-prefix-ub','nonzero');assert 'signed integer overflow' in ubtext
 assert all(sha(CASE/p)==s for p,s in inputs.items())
 status={'passed':True,'whole_kernel_verified':False,'scope':'finite executable ISA-value checks; no hardware/ABI/Coq proof credit','sanitizer':args.sanitizer,'memory_limit_GiB':16,'actual_cgroup':cgroup,'run_directory':str(run),'input_sha256':inputs,'original_counterexamples':counter,'counter_expression_probe':{'K':2147483648,'scope':'isolated arithmetic prefix, not full large-K kernel execution','UBSan_signed_overflow':True},'regression':result,'shared_wrong_control':control,'records':records,'private_mutant_sha256':{'linear':sha(lp),'shared_wrong':sha(wp)}}
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
 dest=CASE/'proof'/('native-status.json' if args.sanitizer=='undefined' else 'native-'+args.sanitizer+'-status.json')
 if dest.exists():
  hist=CASE/'proof/history'/('pre-'+dest.stem+'-'+str(time.time_ns())+'.json');hist.write_bytes(dest.read_bytes())
 dest.write_text(json.dumps(status,indent=2)+'\n')
 cp=CASE/'proof/original-counterexamples.json';cp.write_text(json.dumps({'original_source_sha256':{str(p.relative_to(CASE)):inputs[str(p.relative_to(CASE))] for p in (CASE/'proof/original').glob('*.c')},'whole_small_kernel_counterexample':counter['original_nan'],'propagating_linear_mutant_counterexample':counter['linear_tree_mutant'],'large_counter_UB_scope':status['counter_expression_probe'],'native_receipt':str(run/'status.json')},indent=2)+'\n')
 print(json.dumps({'passed':True,'run':str(run),'regression':result,'counterexamples':counter,'shared_wrong':control}))
if __name__=='__main__':main()
