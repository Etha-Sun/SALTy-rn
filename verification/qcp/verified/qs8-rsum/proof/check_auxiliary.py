#!/usr/bin/env python3
"""Check auxiliary modules using explicitly recorded fresh component dependencies.

This is not the final source-fresh wholecase gate; exact reused dependency
sources/objects and their ordinary compilation records are bound below.
"""
from pathlib import Path
import os,json,re,subprocess,tempfile,time,hashlib,shutil,argparse
P=Path(__file__).resolve().parent;CASE=P.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists());pa=argparse.ArgumentParser();pa.add_argument('--core',type=Path,required=True);pa.add_argument('--module',choices=['NeonInit','WrapperChecked'],required=True);args=pa.parse_args();core=args.core.resolve();run=Path(tempfile.mkdtemp(prefix=args.module.lower()+'-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Rsum'];env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'Actual public caller complete5 C fields only'if args.module=='WrapperChecked'else'Actual NEON initial invariant3 fields only, not fullVC_Correct','run_directory':str(run),'records':records,'dependency_provenance':str(core),'dependency_source_sha256':{},'dependency_vo_sha256':{},'dependency_compile_records':[],'source_sha256':{}}
def cc(stem):
 log=run/(stem+'.log');cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(stem+'.v'))];t=time.monotonic()
 with log.open('w')as f:r=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=3600)
 records.append({'module':stem,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(stem,r.returncode,flush=True)
 if r.returncode:raise RuntimeError(log.read_text()[-3200:])
try:
 old=json.loads((core.parent/'records.json').read_text());byname={}
 for row in old:
  cmd=row.get('command',[])
  if 'coqc'in cmd and cmd[-1].endswith('.v')and row['exit_code']==0:byname[Path(cmd[-1]).stem]=row
 required=['Model','Types','MemoryModel','IntegerFacts','VectorModel','VectorFacts','PrefixFacts','ProgramFacts','VlModel','RvvProgramModel','NeonProgramModel','NeonFacts','FastFrame','ByteWindow','ByteFrame','NeonSupport','byte_arrays_strategy_goal','ByteStrategy','byte_arrays_strategy_proof']+(['neon_unit_goal']if args.module=='NeonInit'else[])
 for stem in required:
  assert stem in byname and(core/(stem+'.v')).is_file()and(core/(stem+'.vo')).is_file(),stem;row=byname[stem];assert sha(core.parent/(row['label']+'.log'))==row['log_sha256'];status['dependency_compile_records'].append(row)
  if(P/'coq'/(stem+'.v')).exists():assert sha(P/'coq'/(stem+'.v'))==sha(core/(stem+'.v')),'Current dependency differs: '+stem
  for suffix in ['.v','.vo']:
   source=core/(stem+suffix);shutil.copyfile(source,coq/source.name);status['dependency_'+('source'if suffix=='.v'else'vo')+'_sha256'][source.name]=sha(source)
 if args.module=='WrapperChecked':
  generation=json.loads((P/'wrapper-generation-status.json').read_text());assert generation['generation_passed']and generation['actual_c_vcs']==5 and sha(CASE/'spec.c')==generation['source_sha256'];goal=Path(generation['run_directory'])/'public_wrapper_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M);assert len(fields)==5 and all(n.startswith('equivalent_')for n in fields);shutil.copyfile(goal,coq/goal.name);cc('public_wrapper_goal');status.update(goal_sha256=sha(goal),spec_sha256=sha(CASE/'spec.c'))
 source=P/'coq'/(args.module+'.v');status['source_sha256'][str(source.relative_to(CASE))]=sha(source);shutil.copyfile(source,coq/source.name);cc(args.module);status.update(passed=True,actual_c_vcs=5 if args.module=='WrapperChecked'else 3,vc_correct_passed=args.module=='WrapperChecked',partial_interface_checked=args.module=='NeonInit')
 if args.module=='WrapperChecked':status['typed_instance']='Qs8Rsum.WrapperChecked.CheckedWrapper'
except Exception as e:status['error']=str(e);print(e,flush=True)
for p in[run/'status.json',P/('wrapper-proof-status.json'if args.module=='WrapperChecked'else'neon-init-status.json')]:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in['passed','run_directory','error']}),flush=True)
raise SystemExit(0 if status['passed']else 1)
