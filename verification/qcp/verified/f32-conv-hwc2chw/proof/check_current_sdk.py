from pathlib import Path
import json,hashlib,subprocess,tempfile,shutil,re
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
run=Path(tempfile.mkdtemp(prefix='current-sdk-both-',dir=C/'.build'))
prefix='''#include <stddef.h>
#include <stdint.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
#define round_down_po2(n,q) hc_round_down4(n)
#define doz hc_doz
struct xnn_f32_minmax_params {struct {float min,max;}scalar;};
'''
configs=[('rv64','/srv/home/yuechunsun/tools/lean/research/sail-binary-reduction/vendor/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc',['-march=rv64gcv','-mabi=lp64d'],'riscv_vector.h',['shim/support.c','shim/copy_float.c','shim/nan_helpers.c','shim/read_scalar.c','shim/rvv_rows_fma3.c','shim/hc_rvv_pixel9.c','impl/testRVV.c','spec.c'],'rv64-buildability-status.json'),('neon','/usr/bin/clang',['--target=aarch64-none-elf','-march=armv8.2-a+simd'],'arm_neon.h',['shim/support.c','shim/neon3_helpers.c','shim/store_half.c','shim/neon_rows_pixel.c','impl/testNEON.c','spec.c'],'neon-front-buildability-status.json')]
allrec=[]
for side,cc,opts,sdk,sources,receipt in configs:
 wd=run/side;wd.mkdir();unit=wd/'unit.c';pieces=[prefix+'#include <'+sdk+'>\n'+'void test_neon(size_t,size_t,size_t,size_t,const float*,const float*,const float*,float*,size_t,size_t,size_t,size_t,const struct xnn_f32_minmax_params*);\nvoid test_rvv(size_t,size_t,size_t,size_t,const float*,const float*,const float*,float*,size_t,size_t,size_t,size_t,const struct xnn_f32_minmax_params*);\n'];mapping=[]
 for n in sources:
  source=(C/n).read_text();dropped=[l for l in source.splitlines()if re.match(r'\s*#include\b',l)];body=re.sub(r'^\s*#include[^\n]*\n','',source,flags=re.M);pieces.append('\n#line 1 "'+str(C/n)+'"\n'+body);mapping.append({'source':n,'source_sha256':sha(C/n),'omitted_include_lines':dropped,'included_source_sha256':hashlib.sha256(body.encode()).hexdigest()})
 unit.write_text('\n'.join(pieces));cmd=['prlimit','--as=17179869184:17179869184','--',cc,*opts,'-std=c11','-ffreestanding',*(['-frounding-math']if side=='rv64'else[]),'-ffp-contract=off','-Wall','-Werror','-Wno-unused-variable','-c',str(unit),'-o',str(wd/'unit.o')]
 with(wd/'compile.log').open('w')as f:r=subprocess.run(cmd,cwd=wd,stdout=f,stderr=f,timeout=180)
 rec={'passed':r.returncode==0,'exit_code':r.returncode,'scope':'Current actual C bodies, real target ISA SDK compile only; no execution, semantic/ABI refinement or formal program credit. Formal declaration headers replaced by real SDK declarations; include-only source transformation is explicit.','run_directory':str(wd),'command':cmd,'compiler_sha256':sha(cc),'input_sha256':{n:sha(C/n)for n in sources},'source_mapping':mapping,'generated_unit_sha256':sha(unit),'log_sha256':sha(wd/'compile.log'),'object_sha256':sha(wd/'unit.o')if(wd/'unit.o').exists()else None,'runner_sha256':sha(__file__)}
 # Complete transitive compiler-visible header inventory.
 dep=subprocess.run([cc,*opts,'-std=c11','-ffreestanding','-M',str(unit)],cwd=wd,capture_output=True,text=True,timeout=60);(wd/'dependencies.log').write_text(dep.stdout+dep.stderr);deps={}
 if dep.returncode==0:
  for n in dep.stdout.replace('\\\n',' ').split(':',1)[1].split():
   p=Path(n)
   if p.is_file():deps[str(p.resolve())]=sha(p)
 rec['sdk_dependency_sha256']=deps;rec['dependency_command_exit_code']=dep.returncode;rec['passed']=rec['passed']and dep.returncode==0
 old=C/'proof'/receipt
 if old.exists():
  hist=C/'proof/history/current-sdk-replay';hist.mkdir(exist_ok=True,parents=True);shutil.copy2(old,hist/(sha(old)+'-'+receipt))
 old.write_text(json.dumps(rec,indent=2)+'\n');(wd/'status.json').write_bytes(old.read_bytes());allrec.append(rec);print(side,rec['passed'],r.returncode,wd,flush=True)
(run/'status.json').write_text(json.dumps({'passed':all(r['passed']for r in allrec),'records':allrec},indent=2)+'\n')
raise SystemExit(0 if all(r['passed']for r in allrec)else 1)
