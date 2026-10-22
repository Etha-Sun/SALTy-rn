from pathlib import Path
import ctypes as C,sys,subprocess,random,json
p=Path(__file__).resolve().parent;q=p.parents[1];root=q.parents[1]
sys.path.insert(0,str(q/'tools'))
from check import number,ptr,same
out=p/'.build/native';out.mkdir(exist_ok=True)
units={'value':'#include "'+str(p/'shim.c')+'"\n#include "'+str(p/'neon.c')+'"\n',
       'original':'\n'.join('#include "'+str(f)+'"' for f in [q/'shared/runtime/float_ops.c',q/'shared/runtime/vl.c',q/'cases/f32-vadd/mapper.c'])}
libs=[]
for name,source in units.items():
 f=out/(name+'.c');f.write_text(source);target=out/(name+'.so')
 r=subprocess.run(['gcc','-std=c11','-O0','-shared','-fPIC','-fno-fast-math','-ffp-contract=off','-frounding-math',str(f),'-o',str(target)],capture_output=True,text=True,timeout=30)
 if r.returncode:print(r.stderr);raise SystemExit(r.returncode)
 lib=C.CDLL(str(target));lib.test_neon.argtypes=[C.c_size_t,*([C.POINTER(C.c_float)]*3),C.c_void_p];libs.append(lib)
special=[0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00001,0x7fa00001,0x3f800000,0x40000000]
rng=random.Random(20261022);cases=0

def check(n,aa,bb):
 global cases
 a,b=(C.c_uint32*len(aa))(*aa),(C.c_uint32*len(bb))(*bb);before=bytes(a),bytes(b);outputs=[];params=C.c_char()
 for lib in libs:
  dst=(C.c_uint32*(n+2))(*([0x4d35cafe]*(n+2)))
  lib.test_neon(n*4,ptr(a),ptr(b),ptr(dst,1),C.byref(params))
  assert before==(bytes(a),bytes(b));assert dst[0]==dst[n+1]==0x4d35cafe
  outputs.append([number(dst[i+1]) for i in range(n)])
 assert all(same(x,y) for x,y in zip(*outputs));cases+=1
for n in list(range(1,71))+[95,96,97,127,128,129,257,1025]:
 check(n,[0x3f800000]*(n+3),[0x40000000]*(n+3))
 check(n,[special[i%len(special)] for i in range(n+3)],[special[(7*i+3)%len(special)] for i in range(n+3)])
 check(n,[rng.getrandbits(32) for _ in range(n+3)],[rng.getrandbits(32) for _ in range(n+3)])
for a in special:
 for b in special:check(1,[a]*4,[b]*4)
r={'cases':cases,'matches_original':True,'input_and_output_canaries':True,'scope':'Finite native regression, not a proof'}
(p/'native-status.json').write_text(json.dumps(r,indent=2)+'\n');print(r)
