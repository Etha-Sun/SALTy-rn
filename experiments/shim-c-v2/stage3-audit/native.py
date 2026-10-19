#!/usr/bin/env python3
"""Finite counterexample search on frozen modular C and public wrappers, not proof."""
from pathlib import Path
import importlib.util,json,hashlib,subprocess,os,re,sys
ROOT=Path(__file__).resolve().parents[3]
OUT=Path(__file__).resolve().parent
if '--out' in sys.argv:
 OUT=OUT/sys.argv[sys.argv.index('--out')+1];OUT.mkdir(exist_ok=False)
STRESS='--stress' in sys.argv
if STRESS:
 OUT=OUT/'stress01';OUT.mkdir(exist_ok=False)
if (OUT/'native-results.json').exists():
 raise SystemExit('Existing run preserved; choose a fresh --out directory')
SRC=ROOT/'experiments/shared-extension/complex'
spec=importlib.util.spec_from_file_location('historical_native',SRC/'native_wide.py')
mod=importlib.util.module_from_spec(spec);spec.loader.exec_module(mod)
NAMES=['f32-gemm-minmax','f32-igemm-minmax','qd8-f32-qc4w-gemm-minmax','f32-conv-hwc2chw','f32-dwconv-minmax','f32-dwconv2d-chw','f32-maxpool','f32-argmaxpool','f32-spmm-minmax']
CALLS={
'f32-gemm-minmax':'equivalent(mr,nc,k,a,w,left,right,p.scalar.min,p.scalar.max)',
'f32-igemm-minmax':'equivalent(nc,k,ks,tab,w,l,r,p.scalar.min,p.scalar.max)',
'qd8-f32-qc4w-gemm-minmax':'equivalent(nc,k,a,buf,l,r,q.zero_point,q.inv_scale,p.scalar.min,p.scalar.max)',
'f32-conv-hwc2chw':'equivalent(h,w,nc,a,wt,z,l,r,p.scalar.min,p.scalar.max)',
'f32-dwconv-minmax':'equivalent(1,c,tab,w,l,r,p.scalar.min,p.scalar.max)',
'f32-dwconv2d-chw':'equivalent(h,w,a,weight,z,l,r,p.scalar.min,p.scalar.max)',
'f32-maxpool':'equivalent(1,k,c,tab,l,r,p.scalar.min,p.scalar.max)',
'f32-argmaxpool':'equivalent(1,k,c,tab,l,r,li,ri)',
'f32-spmm-minmax':'equivalent(m,nc,a,w,dm,nz,l,r,p.scalar.min,p.scalar.max)'}
rows=[]
for name in NAMES:
 d=SRC/'cases'/name; out=OUT/name;out.mkdir(exist_ok=True)
 main=mod.MAINS[name]
 if STRESS:
  if name in ('f32-maxpool','f32-argmaxpool'):
   main=main.replace('int main(void){','int main(void){for(size_t pixels=1;pixels<=3;pixels++)')
   main=main.replace('k*(c+3)','pixels*k*(c+3)').replace('malloc(k*sizeof(float*))','malloc(pixels*k*sizeof(float*))').replace('j<k;j++','j<pixels*k;j++')
   main=main.replace('calloc(c+3,4)','calloc(pixels*c+3,4)')
   CALLS[name]=CALLS[name].replace('equivalent(1,','equivalent(pixels,')
  if name=='qd8-f32-qc4w-gemm-minmax':
   main=main.replace('q={3,0.25f}','q={INT32_MIN+(int32_t)nc,frombits(UINT32_C(0x7f7fffff))}')
   main=main.replace('ks=(int32_t)(i*16)','ks=INT32_MAX-(int32_t)(i*16)')
  if name=='f32-gemm-minmax':
   main=main.replace('(float)((int)(i%9)-4)*0.125f','frombits((uint32_t)(i*2654435761u))')
   main=main.replace('(float)((int)(i%13)-6)*0.0625f','frombits((uint32_t)(i*2246822519u))')
 main,n=re.subn(r'test_neon\([^;]+;\s*test_rvv\([^;]+;',f'if(!{CALLS[name]}){{fprintf(stderr,"wrapper mismatch\\\\n");return 2;}}',main)
 assert n==1,(name,n)
 main=main.replace('bits(left[at])!=bits(right[at])','!same(left[at],right[at])')
 # Match the public minimum allocation extents, rather than historic generous padding.
 if name=='f32-gemm-minmax':
  main=main.replace('4*k+16','4*k').replace('wn+16','wn').replace('4*nc+16','4*nc')
 elif name=='f32-igemm-minmax':main=main.replace('nc+8','nc')
 elif name=='qd8-f32-qc4w-gemm-minmax':main=main.replace('nc+16','nc')
 elif name=='f32-dwconv-minmax':main=main.replace('*l=calloc(c+3,4),*r=calloc(c+3,4)','*l=calloc(c,4),*r=calloc(c,4)')
 elif name=='f32-dwconv2d-chw':
  main=main.replace('(h+5)*w+8','h*w+3').replace('w+8','w+3').replace('h*w+8','h*w')
 elif name=='f32-conv-hwc2chw':
  main=main.replace('(h+6)*w*3+32','h*w*3+3').replace('*a=abase+8','*a=abase').replace('w*3+32','w*3+3').replace('*z=zbase+8','*z=zbase').replace('(nc+4)*oh*ow+16','nc*oh*ow')
 elif name=='f32-spmm-minmax':main=main.replace('calloc(nc*2,4)','calloc(nc*2+32,4)')
 main=re.sub(r'int main\(void\)\s*\{','int main(void){if(fegetround()!=FE_TONEAREST)return 3;',main)
 unit=out/'test.c'
 common=mod.COMMON
 if STRESS:
  common=common.replace('((float)(int)((i*7+seed)%23)-11.0f)/9.0f','frombits((uint32_t)(i*2654435761u+seed*2246822519u))')
 unit.write_text('#include <stdio.h>\n#include <stdlib.h>\n#include <fenv.h>\n#include "unit.c"\n'+common+main)
 binary=out/'.build/test';binary.parent.mkdir(exist_ok=True)
 cmd=['gcc','-std=c11','-O0','-g','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-sanitize-recover=all','-fno-omit-frame-pointer','-I'+str(d),'-I'+str(SRC/'shared'),str(unit),'-lm','-o',str(binary)]
 c=subprocess.run(cmd,text=True,capture_output=True)
 (out/'compile.log').write_text(c.stdout+c.stderr)
 r=subprocess.run([str(binary)],text=True,capture_output=True,timeout=120,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'}) if c.returncode==0 else None
 if r:(out/'run.log').write_text(r.stdout+r.stderr)
 frozen=json.loads((ROOT/'experiments/shim-c-v2/complex-v3-next'/name/'frozen.json').read_text())
 hashes={v['path']:hashlib.sha256((ROOT/v['path']).read_bytes()).hexdigest() for k,v in frozen['files'].items() if k.endswith(('.c','.h'))}
 assert all(hashes[v['path']]==v['sha256'] for k,v in frozen['files'].items() if k.endswith(('.c','.h')))
 row={'kernel':name,'command':cmd,'compile_exit':c.returncode,'run_exit':r.returncode if r else None,'stdout':r.stdout if r else None,'frozen_c_hashes':hashes,'test_sha256':hashlib.sha256(unit.read_bytes()).hexdigest(),'kind':'finite native counterexample search; not formal verification'}
 rows.append(row);(out/'result.json').write_text(json.dumps(row,indent=2)+'\n')
 print(name,c.returncode,r.returncode if r else None,r.stdout if r else c.stderr[:400],flush=True)
(OUT/'native-results.json').write_text(json.dumps(rows,indent=2)+'\n')
