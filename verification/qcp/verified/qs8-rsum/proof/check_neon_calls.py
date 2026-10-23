#!/usr/bin/env python3
"""Fresh ordinary proofs of all actual repaired-NEON126 fields; not fullcase."""
import hashlib,json,os,re,shutil,subprocess,tempfile,time,threading
from concurrent.futures import ThreadPoolExecutor,as_completed
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists());NS='Qs8Rsum';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='neon-calls-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),NS];env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[];lock=threading.Lock();sources={};status={'passed':False,'whole_kernel_verified':False,'scope':'All actual repaired NEON callee/safety117 fields only, excludes nine loop/return fields','run_directory':str(run),'records':records,'parallel_jobs':16,'per_process_memory_GiB':16}
 def execute(cmd,label):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,env=env,cwd=work,stdout=f,stderr=f,timeout=7200).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-4500:])
 def cc(stem):execute(['qcp-env','coqc','-time',*flags,coq/(stem+'.v')],stem)
 def copy(stem):
  p=CASE/'proof/coq'/(stem+'.v');sources[str(p.relative_to(CASE))]=sha(p);shutil.copyfile(p,coq/p.name)
 try:
  generation=json.loads((CASE/'proof/neon-generation-status.json').read_text());assert generation['generation_passed']and generation['same_frontend_cpp_tokens_identical']and generation['generated_c_vcs']==126;assert generation['raw_c_sha256']==sha(CASE/'impl/testNEON.c');gen=Path(generation['run_directory']);source=gen/'neon_unit_goal.v';assert re.findall(r'^Axiom proof_of_(\w+) :',source.read_text(),re.M)and all(n.startswith('test_neon_')for n in re.findall(r'^Axiom proof_of_(\w+) :',source.read_text(),re.M));shutil.copyfile(source,coq/source.name)
  for stem in ['Model','Types','MemoryModel','IntegerFacts','VectorModel','VectorFacts','PrefixFacts','ProgramFacts','VlModel','RvvProgramModel','NeonProgramModel','NeonFacts','FastFrame','ByteWindow','ByteFrame','NeonSupport']:copy(stem);cc(stem)
  strategy=CASE/'proof/c/byte_arrays.strategies';sources[str(strategy.relative_to(CASE))]=sha(strategy);execute(['/tmp/qcp214-src/linux-binary/StrategyCheck','--arch=64','--endian=little','--no-exec-info','--input-file='+str(strategy),'--coq-output-dir='+str(coq),'--coq-logic-path='+NS],'strategy-generation');cc('byte_arrays_strategy_goal')
  for stem in ['ByteStrategy','byte_arrays_strategy_proof']:copy(stem);cc(stem)
  cc('neon_unit_goal');g=(coq/'neon_unit_goal.v').read_text();fields=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert len(fields)==126;fields=[n for n in fields if '_entail_'not in n and '_return_'not in n];assert len(fields)==117;parts=[fields[i::16]for i in range(16)];common='From Coq Require Import ZArith Lia List.\nFrom '+NS+' Require Import NeonSupport neon_unit_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\n'
  def prove(n):
   stem='neon_'+n;s=common
   aux=', '+NS+'.neon_unit_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   s+=f'Lemma proof_of_{n} : {NS}.neon_unit_goal.{n}.\nProof. unfold {NS}.neon_unit_goal.{n}{aux};try left;rs_neon_simple. Qed.\n'
   (coq/(stem+'.v')).write_text(s);cc(stem);shutil.copyfile(coq/(stem+'.v'),CASE/'proof/coq'/(stem+'.v'));return stem
  completed={};failed={}
  with ThreadPoolExecutor(max_workers=16)as pool:
   futures={pool.submit(prove,n):n for n in fields}
   for future in as_completed(futures):
    n=futures[future]
    try:completed[n]=future.result()
    except Exception as e:failed[n]=str(e)
    (run/'field-status.json').write_text(json.dumps({'passed_fields':sorted(completed),'failed_fields':failed,'pending':sorted(set(fields)-set(completed)-set(failed))},indent=2)+'\n')
  status.update(individual_fields_passed=sorted(completed),individual_fields_failed=failed)
  if failed:raise ValueError(str(len(failed))+' actual NEON fields require targeted proofs; no full typed interface claim')
  names=[completed[n]for n in fields]
  s=common+'From '+NS+' Require Import '+' '.join(names)+'.\nModule CheckedNeonCalls.\nInclude '+NS+'.ByteStrategy.CheckedByteArrays.\n'
  for n in fields:
   owner=completed[n];s+=f'Definition proof_of_{n} : {NS}.neon_unit_goal.{n} := {NS}.{owner}.proof_of_{n}.\n'
  s+='End CheckedNeonCalls.\n'+''.join('Print Assumptions CheckedNeonCalls.proof_of_'+n+'.\n'for n in fields);(coq/'NeonCallsChecked.v').write_text(s);cc('NeonCallsChecked');shutil.copyfile(coq/'NeonCallsChecked.v',CASE/'proof/coq/NeonCallsChecked.v');status.update(passed=True,vc_correct_passed=False,partial_interface_checked=True,actual_c_vcs=117,goal_sha256=sha(coq/'neon_unit_goal.v'))
 except Exception as e:status['error']=str(e);print(status['error'],flush=True)
 for directory in ['impl','shim','proof/c']:
  for p in(CASE/directory).rglob('*'):
   if p.is_file()and p.suffix in{'.c','.h','.json','.strategies'}:sources[str(p.relative_to(CASE))]=sha(p)
 status['input_sha256']=sources;status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};(run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(CASE/'proof/neon-calls-status.json').write_text(json.dumps(status,indent=2)+'\n');print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
