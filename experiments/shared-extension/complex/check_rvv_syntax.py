#!/usr/bin/env python3
"""Use the real clang14 RVV header, adapting only its older API spelling/order."""
from pathlib import Path
import re,subprocess,json,hashlib
R=Path(__file__).resolve().parent;B=R/'.build';rows=[]
for d in sorted((R/'cases').iterdir()):
 p=d/'rvv.c'
 if not p.exists():continue
 s=p.read_text();names=sorted(set(re.findall(r'\b(__riscv_\w+)\s*\(',s)))
 pre='''#include <stddef.h>
#include <stdint.h>
#include <riscv_vector.h>
#define assert(x) ((void)0)
#define XNN_OOB_READS
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_LIKELY(x) (x)
struct xnn_f32_minmax_params { struct { float min,max; } scalar; };
struct xnn_f32_default_params { char unused; };
struct xnn_qd8_quantization_params { int32_t zero_point;float inv_scale; };
struct xnn_f32_qc4w_minmax_params { struct { float min,max;int32_t kernel_zero_point; } scalar; };
static size_t round_up_po2(size_t n,size_t q) { return (n+q-1)&~(q-1); }
'''
 for n in names:
  old=n.removeprefix('__riscv_')
  if 'vfmerge_vfm' in n:pre+=f'#define {n}(v,x,m,vl) {old}(m,v,x,vl)\n'
  elif 'vmerge_vvm' in n or 'vmerge_vxm' in n:pre+=f'#define {n}(a,b,m,vl) {old}(m,a,b,vl)\n'
  elif 'vlse32_v_f32m1_m' in n:pre+=f'#define {n}(m,p,s,vl) {old}(m,vfmv_v_f_f32m1(0.0f,vl),p,s,vl)\n'
  else:pre+=f'#define {n} {old}\n'
 unit=B/(d.name+'-isa-syntax.c');unit.write_text(pre+s);cmd=['clang','--target=riscv64','-march=rv64gcv','-ffreestanding','-fsyntax-only','-Werror=implicit-function-declaration',str(unit)];r=subprocess.run(cmd,capture_output=True,text=True,timeout=30);rows.append({'kernel':d.name,'returncode':r.returncode,'command':cmd,'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'stdout':r.stdout,'stderr':r.stderr,'compatibility_prelude':pre});print(d.name,r.returncode,r.stderr[:700],flush=True)
(R/'rvv-syntax-results.json').write_text(json.dumps(rows,indent=2)+'\n')
