#!/usr/bin/env python3
"""Ordinary Coq checking for pure mathematical lemmas; zero C VC count."""
from pathlib import Path
import argparse,json,hashlib,subprocess,tempfile,shutil,time
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists())
def main():
 a=argparse.ArgumentParser();a.add_argument('--modules',nargs='+',default=['Bits','Model','NanFacts','BitCore']);args=a.parse_args();run=Path(tempfile.mkdtemp(prefix='math-',dir=C/'.build'));coq=run/'coq';coq.mkdir();cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),'' if p.name=='relations' else p.name] for p in sorted(dep.iterdir()) if p.is_dir()),[])+['-Q',str(coq),'Rndne'];records=[];s={'passed':False,'whole_kernel_verified':False,'checked_c_vcs':0,'scope':'pure_Coq_math_only','run_directory':str(run),'records':records}
 for n in args.modules:
  p=coq/(n+'.v');shutil.copyfile(H/'coq'/p.name,p);cmd=['prlimit','--as='+str(16*1024**3),'--']+flags+[str(p)];log=run/(n+'.log');start=time.monotonic()
  try:
   with log.open('w') as out:r=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=1200)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'module':n,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'source_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest()});print(n,ec,flush=True)
  if ec:break
 else:s['passed']=True
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'math-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
