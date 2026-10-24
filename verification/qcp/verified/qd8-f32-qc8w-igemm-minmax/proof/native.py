#!/usr/bin/env python3
"""Execute the current actual IGEMM pair/caller and independently indexed oracle."""
from pathlib import Path
import argparse,datetime,hashlib,json,os,re,shutil,subprocess,time
T=Path(__file__).resolve().parents[1];p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch('[A-Za-z0-9_-]+',a.run);O=T/'.build'/a.run/'native';O.mkdir(parents=True,exist_ok=False);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();files=[T/'impl/testNEON.c',T/'impl/testRVV.c',T/'spec.c',T/'proof/native.py',T/'proof/native/driver.c',T/'proof/native/shim.h'];hashes={str(p.relative_to(T)):sha(p) for p in files}
for side in ['NEON','RVV']:shutil.copy2(T/f'impl/test{side}.c',O/f'{side.lower()}.inc')
for n in ['driver.c','shim.h']:shutil.copy2(T/'proof/native'/n,O/n)
s=(T/'spec.c').read_text();s=s[s.index('float qd8_preserve_float('):];s=re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S);(O/'unit.c').write_text('#include "neon.inc"\n#include "rvv.inc"\n'+s)
flags=['clang','-std=c11','-O1','-g','-Wall','-Wextra','-Wno-unused-parameter','-fno-fast-math','-ffp-contract=off','-frounding-math','-fsanitize=address,undefined','-fno-omit-frame-pointer','-I'+str(O),str(O/'driver.c'),'-lm'];records=[]
def invoke(label,cmd):
 t=time.monotonic()
 with (O/(label+'.log')).open('w') as out:
  try:r=subprocess.run(cmd,stdout=out,stderr=subprocess.STDOUT,timeout=180,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'});rc=r.returncode
  except subprocess.TimeoutExpired:rc=124
 records.append({'label':label,'exit':rc,'seconds':time.monotonic()-t,'command':cmd});return rc
compile_rc=invoke('positive-compile',flags+['-o',str(O/'positive')]);rc=invoke('positive-execute',[str(O/'positive')]) if compile_rc==0 else -1
original=(O/'rvv.inc').read_text();controls={}
for name,old,new,signature in [('zero-offset','a0 = zero_data;','a0 = zero_data + a_offset;','mismatch'),('skip-offset','((uintptr_t) a0 + a_offset)','((uintptr_t) a0 + 0)','mismatch'),('packed-tail','w = (const int32_t*) w + 8;','w = (const int32_t*) w + vl;','mismatch'),('table-reset','((uintptr_t) a - ks)','((uintptr_t) a - 0)','AddressSanitizer: heap-buffer-overflow'),('ks-unit','size_t p = ks;','size_t p = ks / sizeof(void*);','AddressSanitizer: heap-buffer-overflow')]:
 assert original.count(old)==1,name
 (O/'rvv.inc').write_text(original.replace(old,new));c=invoke(name+'-compile',flags+['-o',str(O/name)]);r=invoke(name+'-execute',[str(O/name)]) if c==0 else -1;controls[name]=c==0 and r not in [0,124,-1] and signature in (O/(name+'-execute.log')).read_text()
(O/'rvv.inc').write_text(original)
# Both implementations share the deliberately corrupted native FMA shim;
# the separately indexed scalar oracle still calls host fmaf directly.
shim=(O/'shim.h').read_text();wrong='c.x[i]=fmaf(a.x[i],b.x[i],c.x[i]);';assert shim.count(wrong)==2
(O/'shim.h').write_text(shim.replace(wrong,'c.x[i]=0.0f;'))
c=invoke('both-wrong-compile',flags+['-o',str(O/'both-wrong')]);b=invoke('both-wrong-execute',[str(O/'both-wrong')]) if c==0 else -1
log=(O/'both-wrong-execute.log').read_text() if c==0 else ''
witness=re.search(r'left=([0-9a-f]+) right=([0-9a-f]+) ref=([0-9a-f]+)',log)
controls['both-wrong-oracle']=c==0 and b not in [0,124,-1] and witness is not None and witness[1]==witness[2] and witness[1]!=witness[3]
(O/'shim.h').write_text(shim)
match=re.search(r'PASS cases=(\d+) observations=(\d+)',(O/'positive-execute.log').read_text()) if compile_rc==0 else None;unchanged=all(sha(T/p)==h for p,h in hashes.items());result={'passed':rc==0 and all(controls.values()) and unchanged,'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':32,'source_hashes':hashes,'inputs_unchanged':unchanged,'records':records,'negative_controls':controls,'cases':int(match[1]) if match else None,'logical_output_cells':int(match[2]) if match else None,'whole_kernel_proved':False,'scope':'native current impl/caller, ASan/UBSan, independent scalar oracle, six repeated/overlapping/zero-table patterns; not a formal kernel proof'};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items() if k not in ['source_hashes','records']});raise SystemExit(not result['passed'])
