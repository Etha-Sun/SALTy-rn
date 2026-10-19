from pathlib import Path
import re,subprocess,json,hashlib
r=Path(__file__).resolve().parents[3];e=r/'experiments/shared-extension';b=e/'integer/.build/rvv-syntax';b.mkdir(parents=True,exist_ok=True)
h=(e/'integer/shared/shim.h').read_text();structs='\n'.join(re.findall(r'(?:struct|union) xnn_\w+ \{.*?\n\};',h,re.S));pre='#include <stddef.h>\n#include <stdint.h>\n#include <riscv_vector.h>\n#define assert(x) ((void)0)\n#define XNN_OOB_READS\n#define XNN_UNLIKELY(x) (x)\n#define XNN_UNPREDICTABLE(x) (x)\n#define __RISCV_VXRM_RNU 0\n#define __RISCV_VXRM_RDN 2\n#define min(a,b) ((a)<(b)?(a):(b))\n#define doz(a,b) ((a)>(b)?(a)-(b):0)\n'+structs+'\nstruct xnn_u8_minmax_params {struct {uint32_t min,max;} scalar;};\n'
rows=[]
paths=sorted(p for p in (e/'integer').iterdir() if (p/'rvv.c').exists() and not re.search(r'-v[23]$',p.name))+[e/'unsigned/u8-vclamp-v3']
for d in paths:
 s=(d/'rvv.c').read_text();aliases=[]
 for n in sorted(set(re.findall(r'\b(__riscv_\w+)\s*\(',s))):
  old=n.removeprefix('__riscv_');aliases.append(f'#define {n}(a,b,m,vl) {old}(m,a,b,vl)' if 'vmerge_vvm' in n or 'vmerge_vxm' in n else f'#define {n} {old}')
 p=b/(d.name+'.c');p.write_text(pre+'\n'.join(aliases)+'\n'+s);cmd=['clang-14','--target=riscv64','-march=rv64gcv','-ffreestanding','-fsyntax-only','-Werror=implicit-function-declaration',str(p)];result=subprocess.run(cmd,capture_output=True,text=True,timeout=30);row={'kernel':d.name,'source_sha256':hashlib.sha256((d/'rvv.c').read_bytes()).hexdigest(),'command':cmd,'exit':result.returncode,'stderr':result.stderr,'compatibility_aliases':aliases};rows.append(row);print(d.name,result.returncode,result.stderr[:180])
(e/'integer/rvv-syntax-results.json').write_text(json.dumps({'scope':'clang14 real header syntax only. Legacy name/merge-order aliases; explicit modern rounding-mode API deliberately not rewritten. Failure may be installed header/API mismatch, not semantic counterexample.','records':rows},indent=2)+'\n')
