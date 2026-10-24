#!/usr/bin/env python3
"""Finite native regression of live kernels/caller against a separate scalar loop."""
from pathlib import Path
import argparse,datetime,hashlib,json,os,subprocess,time
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run/'native';O.mkdir(parents=True,exist_ok=False);sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
inputs={str(f.relative_to(ROOT)):sha(f) for folder in ['impl','shim','contracts','proof/native'] for f in (ROOT/folder).rglob('*') if f.is_file()};inputs['spec.c']=sha(ROOT/'spec.c');inputs['proof/native.py']=sha(Path(__file__))
results=[]
for name,defs,expected in [('positive',[],0),('both_wrong',['-DBOTH_WRONG'],21)]:
 binary=O/name;commands=[['gcc','-std=c11','-O1','-fno-fast-math','-ffp-contract=off','-fno-strict-aliasing','-fsanitize=address,undefined','-fno-omit-frame-pointer',*defs,'-I',str(ROOT),str(ROOT/'proof/native/check.c'),'-lm','-o',str(binary)],[str(binary)]]
 for label,cmd in zip(['compile','execute'],commands):
  t=time.monotonic()
  with (O/(name+'-'+label+'.log')).open('w') as log:r=subprocess.run(['/usr/bin/prlimit','--cpu=120','--',*cmd],stdout=log,stderr=subprocess.STDOUT,timeout=150,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0','UBSAN_OPTIONS':'halt_on_error=1'})
  results.append({'variant':name,'step':label,'command':cmd,'exit':r.returncode,'seconds':time.monotonic()-t,'expected_exit':0 if label=='compile' else expected})
  if r.returncode!=(0 if label=='compile' else expected):break
assert len(results)==4
r={'passed':all(x['exit']==x['expected_exit'] for x in results),'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'configured_jobs':a.jobs,'ready_tasks':2,'cases':4992,'output_cells':70272,'sanitizers':['address','undefined'],'independent_reference':'scalar modular32 dot product + separate RNE mul + libm fused fmaf + NaN-propagating max then min; no vector helper used by oracle','both_wrong_control':'both vector FMA adapters return zero; independent oracle must reject although caller accepts equality','native_not_formal_evidence':True,'hardware_ISA_execution':False,'source_hashes':inputs,'inputs_unchanged':all(sha(ROOT/f)==h for f,h in inputs.items()),'results':results};r['passed'] &= r['inputs_unchanged'];(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items() if k not in ('source_hashes','results')},indent=2));raise SystemExit(not r['passed'])
