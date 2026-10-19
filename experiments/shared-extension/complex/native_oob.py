#!/usr/bin/env python3
"""Replay the unmasked negative-stride-address load with minimally padded inputs."""
from pathlib import Path
import subprocess,json,os,hashlib
R=Path(__file__).resolve().parent;D=R/'cases/f32-conv-hwc2chw';B=R/'.build';rows=[]
for variant in ['original_rvv.c','rvv.c']:
 p=D/variant;unit=B/('oob-'+variant);unit.write_text(f'#include <stdlib.h>\n#include "{R}/shared/native_fp.h"\n#include "{D}/neon.c"\n#include "{p}"\n'+'''int main(void){
float *a=calloc(6,4),*z=calloc(6,4),*w=calloc(112,4),*l=calloc(1,4),*r=calloc(1,4);
struct xnn_f32_minmax_params p={{-1,1}};
test_neon(1,1,0,1,a,z,w,l,1,1,4,4,&p);
test_rvv(1,1,0,1,a,z,w,r,1,1,4,4,&p);return 0;}
''');exe=B/('oob-'+variant+'.out');cmd=['gcc','-x','c','-std=c11','-O0','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined',str(unit),'-lm','-o',str(exe)];c=subprocess.run(cmd,capture_output=True,text=True);r=subprocess.run([str(exe)],capture_output=True,text=True,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'},timeout=20) if c.returncode==0 else None;rows.append({'variant':variant,'compile':c.returncode,'command':cmd,'returncode':None if r is None else r.returncode,'stderr':c.stderr if r is None else r.stderr,'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'shim_sha256':hashlib.sha256((R/'shared/native_fp.h').read_bytes()).hexdigest()});print(variant,rows[-1]['returncode'],rows[-1]['stderr'][:1700])
(R/'unmasked-load-counterexample.json').write_text(json.dumps(rows,indent=2)+'\n')
assert rows[0]['returncode']!=0 and rows[1]['returncode']==0
