#!/usr/bin/env python3
"""Complete typed NEON interface over one exact, checked caller-component core.

This preserves the exact component object/source provenance. Final admission
separately regenerates C targets and recompiles every needed Coq module.
"""
from pathlib import Path
import os,json,subprocess,tempfile,time,hashlib,shutil,argparse
pa=argparse.ArgumentParser();pa.add_argument('--core',required=True,type=Path);args=pa.parse_args();case=Path(__file__).resolve().parent.parent;root=next(p for p in case.parents if(p/'.git').exists());core=args.core.resolve();run=Path(tempfile.mkdtemp(prefix='neon-interface-',dir=case/'.build'));coq=run/'coq';coq.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();inputs={};dep_records=[];deps={};records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'All actual NEON126 fields in the complete typed component; final wholecase must rebuild all sources','run_directory':str(run),'records':records,'dependency_compile_records':dep_records,'dependency_sha256':deps,'input_sha256':inputs};flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Rsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
try:
 old=json.loads((core.parent/'status.json').read_text());assert old['passed']and old['actual_c_vcs']==117 and old['partial_interface_checked'];inputs.update(old['input_sha256']);rows={Path(r['command'][-1]).stem:r for r in old['records']if r['exit_code']==0 and r.get('command',[])[-1].endswith('.v')}
 for p,d in inputs.items():assert sha(case/p)==d,'Current input drift '+p
 for obj in core.glob('*.vo'):
  src=obj.with_suffix('.v');stem=obj.stem;assert stem in rows;row=rows[stem];assert sha(core.parent/(row['label']+'.log'))==row['log_sha256'];dep_records.append(row);public=case/'proof/coq'/src.name
  if public.exists():assert sha(public)==sha(src),'Current proof source drift '+src.name;inputs[str(public.relative_to(case))]=sha(public)
  for p in [obj,src]:shutil.copyfile(p,coq/p.name)
  deps[stem]={'v_sha256':sha(src),'vo_sha256':sha(obj),'core':str(core)}
 for n in ['NeonInit','NeonInnerLoop','NeonOuterLoop','NeonRemainderLoop','NeonReturnSimple','NeonTailFacts','NeonTailReturn','NeonChecked']:
  source=case/'proof/coq'/(n+'.v');inputs[str(source.relative_to(case))]=sha(source);shutil.copyfile(source,coq/source.name);cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/source.name)];log=run/(n+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=7200)
  records.append({'label':n,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(n,r.returncode,flush=True)
  if r.returncode:raise RuntimeError(log.read_text()[-3200:])
 status.update(passed=True,actual_c_vcs=126,vc_correct_passed=True,typed_instance='Qs8Rsum.NeonChecked.CheckedNeon')
except Exception as e:status['error']=str(e);print(e,flush=True)
for p in [run/'status.json',case/'proof/neon-proof-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(run,flush=True);raise SystemExit(0 if status['passed']else 1)
