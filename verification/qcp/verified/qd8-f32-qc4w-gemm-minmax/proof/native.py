#!/usr/bin/env python3
from pathlib import Path
import argparse,subprocess,json,hashlib,time,os
ROOT=Path(__file__).resolve().parents[1];p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32
O=ROOT/'.build'/a.run;O.mkdir(parents=True,exist_ok=False);sources={str(f.relative_to(ROOT)):hashlib.sha256(f.read_bytes()).hexdigest() for f in [*list((ROOT/'impl').rglob('*')),*list((ROOT/'proof/native').rglob('*')),ROOT/'proof/evidence/original-rvv.c',ROOT/'proof/source-identity.json',Path(__file__)] if f.is_file()};records=[];results={}
for name,src in [('original','counterexample.c'),('repaired','driver.c')]:
 for phase,cmd in [('build',['gcc','-std=c11','-O1','-frounding-math','-ffp-contract=off','-fno-builtin-fmaf','-fsanitize=address,undefined',str(ROOT/'proof/native'/src),'-lm','-o',str(O/name)]),('execute',[str(O/name)])]:
  start=time.monotonic();r=subprocess.run(cmd,text=True,capture_output=True,timeout=600,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0'));(O/(name+'-'+phase+'.log')).write_text(r.stdout+r.stderr);records.append({'mode':name,'phase':phase,'command':cmd,'exit':r.returncode,'seconds':time.monotonic()-start});assert r.returncode==0,r.stdout+r.stderr
  if phase=='execute':results[name]=json.loads(r.stdout)
unchanged=all(hashlib.sha256((ROOT/f).read_bytes()).hexdigest()==h for f,h in sources.items());assert unchanged
result={'passed':results['original']['same']==False and results['repaired']['passed'] and unchanged,'configured_jobs':32,'scope':'native actual original-counterexample and repaired kernels vs independent scalar packed/nibble/mod32/shift/FMA oracle; not full formal proof','sources':sources,'inputs_unchanged':unchanged,'results':results,'records':records,'whole_kernel_proved':False};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items() if k not in ['sources','records']})
