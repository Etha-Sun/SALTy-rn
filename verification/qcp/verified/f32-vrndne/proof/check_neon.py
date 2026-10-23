#!/usr/bin/env python3
"""Fresh ordinary Coq proofs for actual original NEON goals; no admitted leaves."""
from pathlib import Path
import json,hashlib,re,shutil,subprocess,tempfile,time,concurrent.futures,argparse
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--generation-dir',type=Path);ap.add_argument('--jobs',type=int,default=16);args=ap.parse_args();gen=args.generation_dir or Path(json.loads((H/'neon-generation-status.json').read_text())['run_directory']);assert json.loads((gen/'generation-status.json').read_text())['generation_passed'];run=Path(tempfile.mkdtemp(prefix='neon-proof-',dir=C/'.build'));coq=run/'coq';coq.mkdir();cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),'' if p.name=='relations' else p.name] for p in sorted(dep.iterdir()) if p.is_dir()),[])+['-Q',str(coq),'Rndne'];records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'original_neon_pure_and_call_leaves_only','run_directory':str(run),'records':records,'goal_sha256':sha(gen/'neon_unit_goal.v')}
 def execute(cmd,label,budget=1800):
  cmd=list(map(str,cmd));log=run/(label+'.log');cwd=run/'jobs'/label;cwd.mkdir(parents=True,exist_ok=True);start=time.monotonic()
  try:
   with log.open('w') as out:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=cwd,stdout=out,stderr=out,timeout=budget)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 try:
  mods=['Bits','Model','Types','VectorModel','VectorSupport','ProgramModel','rndne_memory_strategy_goal','RndneStrategy','rndne_memory_strategy_proof','KernelSupport']
  for n in mods:shutil.copyfile(H/'coq'/(n+'.v'),coq/(n+'.v'));assert execute(flags+[coq/(n+'.v')],n)==0,n
  shutil.copyfile(gen/'neon_unit_goal.v',coq/'neon_unit_goal.v');assert execute(flags+[coq/'neon_unit_goal.v'],'neon_unit_goal')==0
  goal=(coq/'neon_unit_goal.v').read_text();allfields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal,re.M);fields=[f for f in allfields if 'entail' not in f and 'return' not in f];memory=[f for f in allfields if f not in fields];names=[]
  for i in range(args.jobs):
   name='NeonCallPart'+str(i);names.append(name);text='From Coq Require Import ZArith Lia List.\nFrom QcpNeon Require Import NeonBridge.\nFrom QcpNeonLoop Require Import NeonLoopBridge.\nFrom Rndne Require Import KernelSupport neon_unit_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nModule Checked'+name+'.\n'
   for f in fields[i::args.jobs]:
    aux=', Rndne.neon_unit_goal.'+f+'_aux' if re.search(r'Definition '+re.escape(f)+r'_aux\s*:=',goal) else ''
    script='rndne_kernel_finish'
    num=int(f.rsplit('_',1)[-1]) if 'partial_solve_wit_' in f and not f.endswith('_pure') else -1
    pre='intros; rewrite ?rndne_local_field_address; cbn [sizeof_front_end_type sizeof_front_end_type_of_ptr_size]; '
    if num in [8,24,25,26]:
     script=pre+'sep_apply_l_atomic (float_full_open4 input (Z.quot batch 4+3) (fp32_slice k (Z.quot batch_pre 4+3) A) __default_fp32); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold fp32_slice;rndne_kernel_frame]'
    elif num in [23,75,76,82]:
     width=4 if num==23 else (1 if num==82 else 2)
     script=pre+f'sep_apply_l_atomic (float_undef_open{width} output (Z.quot batch 4)); [dump_pre_spatial;try rewrite sizeof_float in *;lia|unfold StoreFloatAsElement.undefstoreA;rewrite ?sizeof_float;try replace (output+0*4) with output by lia;rndne_kernel_frame]'
    elif num==81:
     script=pre+'rewrite (FloatArray.undef_seg_unfold output 2 (Z.quot batch 4) ltac:(lia));unfold StoreFloatAsElement.undefstoreA;rndne_kernel_frame'
    text+=f'Lemma proof_of_{f} : Rndne.neon_unit_goal.{f}.\nProof. unfold Rndne.neon_unit_goal.{f}{aux};{script}. Qed.\n'
   (coq/(name+'.v')).write_text(text+'End Checked'+name+'.\n')
  codes=list(concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs).map(lambda n:execute(flags+[coq/(n+'.v')],n,3600),names));s.update(actual_goal_fields=len(allfields),pure_call_fields=len(fields),memory_remaining=memory,parts_passed=sum(x==0 for x in codes),parts_total=len(names))
  assert all(ec==0 for ec in codes),'NEON pure/call proof group failed'
  for n in names+['neon_unit_goal']:shutil.copyfile(coq/(n+'.v'),H/'coq'/(n+'.v'))
  s['leaves_passed']=True;s['all_pure_call_vcs_proved']=fields
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'neon-leaves-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s.get('leaves_passed') else 1)
if __name__=='__main__':main()
