"""Finite unary regression; libc sqrtf is an explicitly unproved dependency."""
from pathlib import Path
import ctypes as C,json,random,subprocess,tempfile
CASE=Path(__file__).resolve().parent.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
RUNTIME=REPO/'verification/qcp/shared/runtime'
run=Path(tempfile.mkdtemp(prefix='sqrt-native-'))
entry=run/'entry.c'
entry.write_text('\n'.join('#include "'+str(p)+'"' for p in [RUNTIME/'float_ops.c',RUNTIME/'vl.c',CASE/'shim/sqrt_ops.c',CASE/'spec.c',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c']))
library=run/'entry.so'
subprocess.run(['gcc','-std=c11','-O0','-shared','-fPIC','-fno-fast-math','-ffp-contract=off',str(entry),'-lm','-o',str(library)],check=True)
dll=C.CDLL(str(library));dll.equivalent.argtypes=[C.c_size_t]+[C.POINTER(C.c_float)]*3;dll.equivalent.restype=C.c_int
ptr=lambda a,k=0:C.cast(C.byref(a,k*4),C.POINTER(C.c_float))
special=[0,0x80000000,1,0x80000001,0x7f800000,0xff800000,0x7fc00001,0x7fa00001,0x3f800000,0x40800000,0xbf800000,0x7f7fffff]
rng=random.Random(20261022);count=0
for n in list(range(1,71))+[95,96,97,127,128,129,257,1025]:
 for bits in [[special[i%len(special)] for i in range(n+3)],[rng.getrandbits(32) for _ in range(n+3)]]:
  a=(C.c_uint32*(n+3))(*bits);before=bytes(a);left,right=[(C.c_uint32*(n+2))(*([0x4d35cafe]*(n+2))) for _ in range(2)]
  assert dll.equivalent(n,ptr(a),ptr(left,1),ptr(right,1))==1
  assert bytes(a)==before and left[0]==left[n+1]==right[0]==right[n+1]==0x4d35cafe
  count+=1
status={'passed':True,'cases':count,'scope':'Finite native shim regression; libc sqrtf unproved; no kernel theorem.'}
(CASE/'proof/native-status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status))
