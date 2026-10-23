#!/usr/bin/env python3
"""Check real signed-byte reads/load8/load32 and both CharArray strategies."""
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--module-timeout',type=int,default=2400);a=p.parse_args();run=Path(tempfile.mkdtemp(prefix='char-memory-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(coq),'Qs8Cvt'];status={'passed':False,'whole_kernel_verified':False,'scope':'Actual signed-byte memory helper C bodies and CharArray strategies only','run_directory':str(run),'records':records}
 def exe(cmd,label,budget=600):
  w=run/'jobs'/label;w.mkdir(parents=True);cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic()
  with(run/(label+'.log')).open('w')as f:
   try:code=subprocess.run(cmd,cwd=w,stdout=f,stderr=f,timeout=budget).returncode
   except subprocess.TimeoutExpired:code=124
  records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(run/(label+'.log'))});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
  if code:raise RuntimeError((run/(label+'.log')).read_text()[-4500:])
 def cc(n):
  if(HERE/'coq'/(n+'.v')).exists():shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'))
  exe(['qcp-env','coqc','-time',*flags,coq/(n+'.v')],n,a.module_timeout)
 try:
  for stem in ['memory_i8','memory_rvv_i8']:
   exe(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim'/(stem+'.c'),'-o',run/(stem+'.c')],stem+'-cpp');out=run/'generated'/stem;out.mkdir(parents=True);exe(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Cvt','-slp',CASE/'shim','Qs8Cvt','-slp',HERE/'c','Qs8Cvt'],stem+'-qcp');shutil.copyfile(out/(stem+'_goal.v'),coq/(stem+'_goal.v'))
  strat=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';out=run/'strategy';out.mkdir();exe([strat,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(HERE/'c/char_arrays.strategies'),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Cvt'],'StrategyCheck');shutil.copyfile(out/'char_arrays_strategy_goal.v',coq/'char_arrays_strategy_goal.v')
  for n in ['Model','Types','MemoryModel','CharFrame','CharWindow','char_arrays_strategy_goal','CharArraysStrategy','char_arrays_strategy_proof','memory_i8_goal','memory_rvv_i8_goal']:cc(n)
  # Frozen hand proofs are owned by this case; no sibling candidate is required.
  hand=(HERE/'coq/CheckedMemoryI8.v').read_text()
  blocks=re.findall(r'^Lemma proof_of_(\w+) :.*?^Qed\.',hand,re.M|re.S)
  texts=re.findall(r'^Lemma proof_of_\w+ :.*?^Qed\.',hand,re.M|re.S)
  mapping=dict(zip(blocks,texts))
  allnames={}
  for stem,mod in [('memory_i8','CheckedMemoryI8'),('memory_rvv_i8','CheckedMemoryRvvI8')]:
   g=(coq/(stem+'_goal.v')).read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',g,re.M);assert names;allnames[stem]=names
   text=f'''From Coq Require Import ZArith Lia.
From Qs8Cvt Require Import MemoryModel CharWindow CharFrame CharArraysStrategy {stem}_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac load_pure := intros;unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia.
Module {mod} : Qs8Cvt.{stem}_goal.VC_Correct.
Include Qs8Cvt.CharArraysStrategy.CheckedCharArrays.
'''
   for name in names:
    if stem=='memory_i8':assert name in mapping,name;text+=mapping[name]+'\n';continue
    aux=', Qs8Cvt.'+stem+'_goal.'+name+'_aux'if re.search(r'^Definition '+name+r'_aux\b',g,re.M)else''
    tactic='try left;load_pure'if '_safety_'in name or name.endswith('_pure')else'try left;intros;subst;neon_frame'
    text+=f'Lemma proof_of_{name} : Qs8Cvt.{stem}_goal.{name}.\nProof. unfold Qs8Cvt.{stem}_goal.{name}{aux};{tactic}. Qed.\n'
   text+='End '+mod+'.\n';(HERE/'coq'/(mod+'.v')).write_text(text);cc(mod)
  gate='From Qs8Cvt Require Import memory_i8_goal memory_rvv_i8_goal CheckedMemoryI8 CheckedMemoryRvvI8.\n'
  for stem,mod in [('memory_i8','CheckedMemoryI8'),('memory_rvv_i8','CheckedMemoryRvvI8')]:
   alias='Typed'+mod;gate+=f'Module {alias} : Qs8Cvt.{stem}_goal.VC_Correct := Qs8Cvt.{mod}.{mod}.\n'+''.join('Print Assumptions '+alias+'.proof_of_'+n+'.\n'for n in allnames[stem])
  gate+='Module TypedStrategy : Qs8Cvt.char_arrays_strategy_goal.char_arrays_Strategy_Correct := Qs8Cvt.CharArraysStrategy.CheckedCharArrays.\n'+''.join('Print Assumptions TypedStrategy.char_arrays_strategy'+str(i)+'_correctness.\n'for i in [1,2]);(coq/'FinalCharMemoryCheck.v').write_text(gate);cc('FinalCharMemoryCheck');status.update(passed=True,vc_correct_passed=True,units={k:len(v)for k,v in allnames.items()},actual_c_vcs=sum(map(len,allnames.values())),strategy_fields=2)
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  status['proof_sources_sha256']={p.name:sha(p)for p in coq.glob('*.v')}
  for p in [run/'status.json',HERE/'char-memory-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
