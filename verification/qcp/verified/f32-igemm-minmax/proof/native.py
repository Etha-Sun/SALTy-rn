#!/usr/bin/env python3
"""Actual F32 IGEMM pair and independently indexed scalar FMA oracle; not formal proof."""
from pathlib import Path
import argparse,json,hashlib,subprocess,os,time,re
T=Path(__file__).resolve().parents[1];p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);p.add_argument('--expect-counterexample',action='store_true');a=p.parse_args();assert a.jobs==32
O=T/'.build'/a.run/'native';O.mkdir(parents=True,exist_ok=False);N=T/'proof/native';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();inputs={str(f.relative_to(T)):sha(f)for f in [*N.glob('*'),*list((T/'impl').glob('*.c')),Path(__file__)]if f.is_file()};records=[]
cmd=['clang','-std=c11','-O1','-g','-Wall','-Wextra','-Wno-unused-parameter','-frounding-math','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-omit-frame-pointer',*map(str,sorted(N.glob('*.c'))),'-lm','-o',str(O/'program')]
for label,command in [('compile',cmd),('execute',[str(O/'program')]+(['--counterexample']if a.expect_counterexample else[]))]:
 start=time.monotonic()
 with (O/(label+'.log')).open('w')as log:r=subprocess.run(command,stdout=log,stderr=subprocess.STDOUT,timeout=600,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'})
 records.append({'phase':label,'exit':r.returncode,'seconds':time.monotonic()-start,'command':command})
 if r.returncode:break
unchanged=all(sha(T/f)==h for f,h in inputs.items());log=(O/'execute.log').read_text()if(O/'execute.log').exists()else'';m=re.search(r'PASS cases=(\d+) observations=(\d+)',log);result={'passed':all(x['exit']==0 for x in records)and len(records)==2 and unchanged and (('counterexample'in log)if a.expect_counterexample else m is not None),'mode':'original-counterexample'if a.expect_counterexample else'current-independent-oracle','configured_jobs':32,'source_hashes':inputs,'inputs_unchanged':unchanged,'records':records,'cases':int(m[1])if m else None,'logical_output_cells':int(m[2])if m else None,'whole_kernel_proved':False};(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items()if k not in ['source_hashes','records']});raise SystemExit(not result['passed'])
