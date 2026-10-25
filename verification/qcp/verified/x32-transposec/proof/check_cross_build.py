#!/usr/bin/env python3
"""Real AArch64/RVV C API buildability, not a compiler or ISA proof."""
from pathlib import Path
import argparse,hashlib,json,os,shlex,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--rvv-cc',default='/srv/home/yuechunsun/tools/lean/research/sail-binary-reduction/vendor/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc');p.add_argument('--neon-cc',default='/usr/bin/clang');a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='cross-api-build-',dir=C/'.build'));records=[]
 common='#define QCP_NATIVE 1\n#include <stddef.h>\n#include <stdint.h>\n#define XNN_OOB_READS\n#define XNN_UNPREDICTABLE(x) (x)\n#define assert(e) ((e)?(void)0:__builtin_trap())\n_Static_assert(sizeof(size_t)==8 && (size_t)-1>0, "uint64 size_t");\n_Static_assert(sizeof(uintptr_t)==8, "uint64 pointer integer");\n'
 rows=[('RVV',a.rvv_cc,['-march=rv64gcv','-mabi=lp64d','-fsignaling-nans'],'#include <riscv_vector.h>\n',['shim/strided_store.c','impl/testRVV.c','shim/observe.c','spec.c']),('NEON',a.neon_cc,['--target=aarch64-none-elf','-march=armv8-a+simd'],'#include <arm_neon.h>\n',['shim/scalar.c','impl/testNEON.c','shim/observe.c','spec.c'])]
 for label,cc,arch,header,files in rows:
  src=r/(label+'.c');src.write_text(common+header+''.join('#include "'+str(C/f)+'"\n'for f in files));obj=r/(label+'.o');dep=r/(label+'.d');cmd=['prlimit','--as=17179869184:17179869184','--',cc,*arch,'-std=c11','-ffreestanding','-O2','-fno-fast-math','-Wall','-Wextra','-MD','-MF',str(dep),'-c',str(src),'-o',str(obj)];t=time.monotonic();v=subprocess.run([cc,'--version'],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,check=True);(r/(label+'-version.log')).write_bytes(v.stdout)
  result=subprocess.run(cmd,cwd=r,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=600);log=r/(label+'.log');log.write_bytes(result.stdout);d=dict(label=label,command=cmd,exit_code=result.returncode,seconds=time.monotonic()-t,memory_limit_GiB=16,tool_sha256=sha(cc),version_sha256=sha(r/(label+'-version.log')),log_sha256=sha(log),translation_unit_sha256=sha(src));records.append(d)
  assert result.returncode==0,log.read_text()[-3000:]
  deps=shlex.split(dep.read_text().replace('\\\n',' ').split(':',1)[1]);d.update(object_sha256=sha(obj),dependencies_sha256={str(Path(x).resolve()):sha(Path(x).resolve())for x in deps},case_input_sha256={str(Path(x).resolve().relative_to(C)):sha(Path(x).resolve())for x in deps if Path(x).resolve().is_relative_to(C) and not Path(x).resolve().is_relative_to(r)})
 status=dict(passed=True,whole_kernel_verified=False,actual_c_vcs=0,scope='real source/API buildability under finite budgets only; no compiler/ABI/ISA refinement or Coq credit',assert_scope='failing assert maps to compiler trap in diagnostic TU; public P/C preconditions make asserts true',run_directory=str(r),script_sha256=sha(__file__),records=records)
 for d in records:
  assert all(sha(Path(x))==h for x,h in d['dependencies_sha256'].items())
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=C/'proof/cross-build-status.json'
 if dest.exists():(C/'proof/history'/('cross-build-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({'passed':True,'run':str(r),'targets':[x['label']for x in records]}))
if __name__=='__main__':main()
