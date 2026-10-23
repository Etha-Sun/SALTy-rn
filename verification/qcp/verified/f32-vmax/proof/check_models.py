#!/usr/bin/env python3
"""Fresh ordinary Coq check of distinct Arm/RVV models and the NaN-aware relation."""
import argparse,hashlib,json,os,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir']:p.add_argument('--'+n,type=Path,required=True)
 args=p.parse_args();run=Path(tempfile.mkdtemp(prefix='models-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 flags=json.loads(args.config.read_text())['flags'][2:]
 for d in sorted(args.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 for d in [args.scalar_dir,args.vector_dir,coq]:flags+=['-Q',str(d.resolve()),'FMax']
 scalar=json.loads((args.scalar_dir.parent/'status.json').read_text())
 assert scalar['passed']and scalar['checked_c_vcs']==124
 assert(args.vector_dir/'Types.vo').exists()and(args.vector_dir/'VectorModel.vo').exists()
 for name,d in [('Bits.v',args.scalar_dir),('Model.v',args.scalar_dir),('Types.v',args.vector_dir),('VectorModel.v',args.vector_dir)]:
  assert (HERE/'coq'/name).read_bytes()==(d/name).read_bytes(),'Compiled model source drift: '+name
 status={'passed':False,'whole_kernel_proved':False,'scope':'Mathematical pointwise/list observation only; no kernel C VC','run_directory':str(run),'records':records}
 try:
  names=['NanFacts','ProgramModel','Observation']
  for name in names:
   shutil.copyfile(HERE/'coq'/(name+'.v'),coq/(name+'.v'));work=run/'jobs'/name;work.mkdir(parents=True)
   cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(name+'.v'))];start=time.monotonic()
   with(run/(name+'.log')).open('w')as out:
    try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=180).returncode
    except subprocess.TimeoutExpired:code=124
   records.append({'name':name,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'source_sha256':sha(coq/(name+'.v')),'log_sha256':sha(run/(name+'.log'))});print(name,code,flush=True)
   if code:raise RuntimeError((run/(name+'.log')).read_text()[-6000:])
  status['passed']=True
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['dependencies']={'scalar':str(args.scalar_dir.resolve()),'vector':str(args.vector_dir.resolve())}
  for target in [run/'status.json',HERE/'models-status.json']:target.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
