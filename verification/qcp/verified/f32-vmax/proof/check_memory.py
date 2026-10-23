#!/usr/bin/env python3
"""Regenerate and bind concrete RVV load/store/control C helpers to typed Coq proofs."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__)
 for n in ['config','dependency-dir','scalar-dir','vector-dir','rvv-dir']:p.add_argument('--'+n,type=Path,required=True)
 p.add_argument('--jobs',type=int,choices=range(1,17),default=16)
 args=p.parse_args();run=Path(tempfile.mkdtemp(prefix='memory-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 assert(HERE/'coq/RvvStrategy.v').read_bytes()==(args.rvv_dir/'RvvStrategy.v').read_bytes()
 flags=json.loads(args.config.read_text())['flags'][2:]
 for d in sorted(args.dependency_dir.resolve().iterdir()):
  if d.is_dir():flags+=['-Q',str(d),''if d.name=='relations'else d.name]
 for d in [args.scalar_dir,args.vector_dir,args.rvv_dir,coq]:flags+=['-Q',str(d.resolve()),'FMax']
 status={'passed':False,'whole_kernel_verified':False,'scope':'RVV concrete memory and fixed-vl control bodies only','run_directory':str(run),'records':records,'parallel_jobs':args.jobs,'independent_memory_units':3}
 def execute(cmd,label,budget=600):
  work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as out:
   try:code=subprocess.run(cmd,cwd=work,stdout=out,stderr=out,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-6000:])
 def compile_module(n):execute(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n)
 try:
  targets={};modules={}
  stems=['memory_rvv_load','memory_rvv_store','rvv_control']
  def check_unit(stem):
   unit=run/(stem+'.unit.c');unit.write_text('#include "'+str(CASE/'shim/program_model.h')+'"\n#include "'+str(CASE/'shim'/(stem+'.c'))+'"\n')
   execute(['gcc','-E','-P','-CC','-nostdinc',unit,'-o',run/(stem+'.c')],stem+'-cpp',60)
   cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit','1024','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(coq),'--coq-logic-path=FMax']
   for d in sorted((ROOT/'verification/qcp/verified/f32-vadd/proof/c').iterdir()):
    if d.is_dir():cmd+=['-slp',str(d),d.name]
   cmd+=['-slp',str(CASE/'shim'),'FMax','-slp',str(HERE/'c'),'FMax'];execute(cmd,stem+'-qcp',600);compile_module(stem+'_goal')
   names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/(stem+'_goal.v')).read_text(),re.M);assert names and len(names)==len(set(names));targets[stem]=names
   text='''From FMax Require Import Types rvv_fmax_strategy_proof {goal}.
From QcpRvv32 Require Import rvv_load_checked rvv_store_checked rvv_loop_pure_checked.
From ByvalueRvv Require Import shim_checked.
Module Checked{stem} : FMax.{goal}.VC_Correct.
Include QcpRvv32.rvv_arrays_strategy_proof.CheckedRvvArray.
Include QcpRvv32.rvv_store_strategy_proof.CheckedRvvStoreStrategy.
Include QcpRvv32.rvv_loop_strategy_proof.CheckedRvvLoopStrategy.
Include FMax.RvvStrategy.CheckedRvvFmaxStrategy.
'''.format(goal=stem+'_goal',stem=stem)
   for n in names:
    if n.startswith('qcp_byvalue_load_'):base='ByvalueRvv.shim_checked.Checked'
    elif n.startswith('qcp_rvv_read_lane_')or n.startswith('__riscv_vle32_'):base='QcpRvv32.rvv_load_checked.CheckedRvvLoad'
    elif n.startswith('qcp_rvv_get32_')or n.startswith('qcp_rvv_store_next_')or n.startswith('__riscv_vse32_'):base='QcpRvv32.rvv_store_checked.CheckedRvvStore'
    elif n.startswith('__riscv_vsetvl_'):base='QcpRvv32.rvv_loop_pure_checked.CheckedRvvLoopPure'
    else:raise ValueError('Unexpected actual C memory VC: '+n)
    text+=f'Lemma proof_of_{n} : FMax.{stem}_goal.{n}.\nProof. exact {base}.proof_of_{n}. Qed.\n'
   text+='End Checked'+stem+'.\n';module=stem+'_checked';modules[stem]=module;(coq/(module+'.v')).write_text(text);shutil.copyfile(coq/(module+'.v'),HERE/'coq'/(module+'.v'));compile_module(module)
  with ThreadPoolExecutor(max_workers=args.jobs) as pool:
   futures=[pool.submit(check_unit,stem) for stem in stems]
   for future in futures:future.result()
  gate='From FMax Require Import '+' '.join(s+'_goal '+modules[s] for s in stems)+'.\n'
  for stem in stems:
   module=modules[stem]
   name='Final_'+stem;gate+=f'Module {name} : FMax.{stem}_goal.VC_Correct := FMax.{module}.Checked{stem}.\n';gate+='\n'.join('Print Assumptions '+name+'.proof_of_'+n+'.'for n in targets[stem])+'\n'
  (coq/'FinalMemoryCheck.v').write_text(gate);compile_module('FinalMemoryCheck');status.update(passed=True,actual_c_vcs={s:len(ns)for s,ns in targets.items()},vc_correct_passed=True)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_source_sha256']={q.name:sha(q)for q in coq.glob('*.v')};status['source_sha256']={str(q.relative_to(CASE)):sha(q)for q in [CASE/'shim'/n for n in ['memory_rvv_load.c','memory_rvv_store.c','memory_rvv.h','rvv_control.c']]}
  for q in [run/'status.json',HERE/'memory-proof-status.json']:q.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
