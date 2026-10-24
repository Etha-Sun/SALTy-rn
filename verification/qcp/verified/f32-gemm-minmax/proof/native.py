#!/usr/bin/env python3
"""Current C pair/caller against an independent scalar oracle and a both-wrong control."""
from pathlib import Path
import argparse,json,hashlib,os,subprocess,time,re
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'native';O.mkdir(parents=True,exist_ok=False);N=ROOT/'proof/native';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
files=[ROOT/'spec.c',*list((ROOT/'impl').glob('*.c')),*list((ROOT/'contracts').rglob('*.h')),*list((ROOT/'shim').rglob('*.h')),*[p for p in N.iterdir() if p.is_file()],Path(__file__)]
inputs={str(f.relative_to(ROOT)):sha(f) for f in files};records=[];geometry=None
for mode in ['positive','both_wrong']:
 exe=O/mode
 cmd=['gcc','-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fno-builtin-fmaf','-fsanitize=address,undefined','-fno-omit-frame-pointer','-I',str(ROOT)]
 if mode=='both_wrong':cmd+=['-DBOTH_WRONG']
 cmd += [str(f) for f in sorted(N.glob('*.c'))]+['-lm','-o',str(exe)]
 for label,command in [('build',cmd),('execute',[str(exe)])]:
  started=time.monotonic();r=subprocess.run(command,text=True,capture_output=True,timeout=600,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0'))
  (O/(mode+'-'+label+'.log')).write_text(r.stdout+r.stderr);records.append({'mode':mode,'phase':label,'exit':r.returncode,'seconds':time.monotonic()-started,'command':command})
  if label=='build':assert r.returncode==0,r.stderr[-3000:]
  elif mode=='positive':assert r.returncode==0,r.stdout+r.stderr;geometry=json.loads(r.stdout)
  else:assert r.returncode==21 and 'oracle rejected caller=1' in r.stdout,r.stdout+r.stderr
unchanged=all(sha(ROOT/f)==h for f,h in inputs.items());assert unchanged
result={'passed':bool(geometry and geometry['passed'] and unchanged),'configured_jobs':32,'scope':'native current C kernels and public caller; independent scalar packed/FMA oracle; no formal or ISA evidence','source_hashes':inputs,'inputs_unchanged':unchanged,'geometry':geometry,'both_wrong_rejected_by_independent_oracle':True,'records':records}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print({k:v for k,v in result.items() if k not in ['source_hashes','records']})
