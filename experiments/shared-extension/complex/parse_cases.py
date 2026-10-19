#!/usr/bin/env python3
from pathlib import Path
import subprocess,json,hashlib
R=Path(__file__).resolve().parent;B=R/'.build';B.mkdir(exist_ok=True);F='/zp_vegeta/scratch_sb/ycsun/verus/research/frama-c-qs8-rsum/toolchain/bundle/bin/frama-c';modules=json.loads((R/'shared/module-map.json').read_text());rows=[]
for name,mm in modules.items():
 d=R/'cases'/name;unit=B/(name+'-unit.c');unit.write_text(f'#include "{d}/spec.h"\n'+''.join(f'#include "{R}/shared/{m}"\n' for m in mm)+''.join(f'#include "{d}/{x}"\n' for x in ['neon.c','rvv.c','harness.c']))
 cmd=[F,'-machdep','gcc_x86_64','-cpp-extra-args=-I'+str(R/'shared')+' -I'+str(d),str(unit)];r=subprocess.run(cmd,capture_output=True,text=True,timeout=60);rows.append({'kernel':name,'returncode':r.returncode,'command':cmd,'output':r.stdout+r.stderr,'hashes':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in [d/x for x in ['neon.c','rvv.c','spec.h','harness.c']]+[R/'shared'/m for m in mm]+[R/'shared/native_types.h',R/'shared/fp_primitives.h']}});print(name,r.returncode,(r.stdout+r.stderr)[-1100:],flush=True)
(R/'all-parse-results.json').write_text(json.dumps(rows,indent=2)+'\n')
