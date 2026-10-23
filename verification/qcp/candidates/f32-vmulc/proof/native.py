#!/usr/bin/env python3
"""Finite native checks with a one-float broadcast buffer; not a proof."""
from pathlib import Path
import ctypes as C,json,math,random,subprocess,tempfile
HERE=Path(__file__).resolve().parent
CASE=HERE.parent
BUILD=CASE/'.build';BUILD.mkdir(exist_ok=True)
RUN=Path(tempfile.mkdtemp(prefix='native-',dir=BUILD))
unit=RUN/'entry.c'
unit.write_text('\n'.join('#include "'+str(p)+'"' for p in [CASE/'shim/runtime/float_ops.c',CASE/'shim/runtime/vl.c',CASE/'spec.c',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c'])+'\nfloat scalar_oracle(float x,float c){return x*c;}\n')
subprocess.run(['gcc','-std=c11','-O0','-shared','-fPIC','-fno-fast-math','-ffp-contract=off','-frounding-math',str(unit),'-o',str(RUN/'entry.so')],capture_output=True,check=True,timeout=30)
dll=C.CDLL(str(RUN/'entry.so'))
ptr=lambda p,o=0:C.cast(C.byref(p,o*4),C.POINTER(C.c_float))
dll.equivalent.argtypes=[C.c_size_t]+[C.POINTER(C.c_float)]*4;dll.equivalent.restype=C.c_int
dll.scalar_oracle.argtypes=[C.c_float,C.c_float];dll.scalar_oracle.restype=C.c_float
special=[0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc00001,0x7fa00001,0x3f800000,0x40000000]
rng=random.Random(20261022);cases=0
same=lambda a,b:a==b or math.isnan(a) and math.isnan(b)
def check(n,aa,cbits):
 global cases
 a=(C.c_uint32*(n+3))(*aa);b=(C.c_uint32*1)(cbits)
 left,right=[(C.c_uint32*(n+2))(*([0x4d35cafe]*(n+2))) for _ in range(2)]
 before=bytes(a),bytes(b)
 assert dll.equivalent(n,ptr(a),ptr(b),ptr(left,1),ptr(right,1))==1
 assert (bytes(a),bytes(b))==before
 assert left[0]==right[0]==left[n+1]==right[n+1]==0x4d35cafe
 for i in range(n):
  expected=dll.scalar_oracle(ptr(a)[i],ptr(b)[0])
  assert same(ptr(left,1)[i],expected) and same(ptr(right,1)[i],expected)
 cases+=1
for n in list(range(1,71))+[95,96,97,127,128,129,257,1025]:
 check(n,[0x3f800000]*(n+3),0x40000000)
 check(n,[special[i%len(special)] for i in range(n+3)],special[n%len(special)])
 check(n,[rng.getrandbits(32) for _ in range(n+3)],rng.getrandbits(32))
for x in special:
 for c in special:check(1,[x]*4,c)
(HERE/'native-status.json').write_text(json.dumps({'passed':True,'scope':'finite native only','cases':cases,'broadcast_buffer_floats':1,'scalar_oracle_matches':True,'originals_directly_included':True,'whole_kernel_verified':False,'run_directory':str(RUN)},indent=2)+'\n')
print('Native',cases,'cases; B buffer exactly one float; scalar oracle matches')
