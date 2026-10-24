#!/usr/bin/env python3
"""Fresh actual neon_arithmetic C/QCP/ordinary-Coq typed closure; no kernel claim."""
import argparse,concurrent.futures,hashlib,json,os,re,shutil,subprocess,tempfile,time,threading
from pathlib import Path
from coverage import _functions
NS='Qu8Add'
EXPECTED_FIELDS=162
EXPECTED_FUNCTIONS={'vmovl_s16', 'vdup_n_u8', 'vqmovn_s32', 'vmlaq_s32', 'vqaddq_s16', 'vcombine_s16', 'vqmovun_s16', 'vdupq_n_s32', 'vmin_u8', 'vget_low_s16', 'vmax_u8', 'vmulq_s32', 'vsubl_u8', 'vget_high_s16', 'vreinterpretq_s16_u16', 'vrshlq_s32', 'vdupq_n_s16'}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=600);a=p.parse_args();assert __debug__ and 16<=a.jobs<=64 and 0<a.timeout<=3600
 case=Path(__file__).resolve().parent.parent;run=Path(tempfile.mkdtemp(prefix='neon_arithmetic-proof-',dir=case/'.build'));local=run/'coq'/NS;local.mkdir(parents=True);records=[];lock=threading.Lock();names=['Model','ShiftFacts','UnsignedModel','UnsignedScalarModel','Types','NeonFrame','VectorModel','neon_arithmetic_goal','NeonArithmeticAutomation','NeonFastFrame',*[f'NeonArithmeticPart{i:02d}'for i in range(16)],'NeonArithmeticChecked'];inputs=['shim/neon_arithmetic.c','shim/neon_arithmetic.h','shim/unsigned_scalar.h','shim/scalar.h','shim/types.h','shim/types_def.h','proof/build_neon_arithmetic.py','proof/check_neon_arithmetic.py','proof/coverage.py','proof/neon-arithmetic-partitions.json',*[f'proof/coq/{n}.v'for n in names if n!='neon_arithmetic_goal']];hashes={n:sha(case/n)for n in inputs};state={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,'scope':'actual neon_arithmetic helper C bodies and complete typed interface','run_directory':str(run),'records':records,'parallel_jobs':a.jobs,'input_sha256':hashes,'external_libraries_rebuilt':False}
 def save():(run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 def execute(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];cwd=run/'jobs'/label;cwd.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:
   try:code=subprocess.run(cmd,cwd=cwd,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append({'label':label,'command':cmd,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+':'+log.read_text()[-3000:])
 try:
  tool={n:sha(Path(shutil.which(n)).resolve())for n in ['qcp','qcp-env','coqc','gcc','prlimit']};configsha=sha(a.config);flags=json.loads(a.config.read_text())['flags'][2:]+['-Q',str(local),NS]
  cpp=run/'expanded.c';execute('cpp',['gcc','-E','-P','-CC','-nostdinc',case/'shim/neon_arithmetic.c','-o',cpp]);source=run/'neon_arithmetic.c';source.write_bytes(cpp.read_bytes());gen=run/'generated';gen.mkdir();execute('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit','4096','--input-file='+str(source),'--coq-output-dir='+str(gen),'--coq-logic-path='+NS,'-slp',case/'shim',NS]);goal=gen/'neon_arithmetic_goal.v';fields=re.findall(r'Axiom proof_of_(\w+)\s*:',goal.read_text());assert len(fields)==EXPECTED_FIELDS and len(set(fields))==EXPECTED_FIELDS;partition=json.loads((case/'proof/neon-arithmetic-partitions.json').read_text());assert fields==partition['fields'] and sha(goal)==partition['actual_goal_sha256'];functions={n for n,signature,contract,calls in _functions(cpp.read_text(),'neon_arithmetic')if calls is not None};assert functions==EXPECTED_FUNCTIONS,(functions,EXPECTED_FUNCTIONS)
  for name in names:
   origin=goal if name=='neon_arithmetic_goal'else case/'proof/coq'/(name+'.v');text=origin.read_text()
   if name!='neon_arithmetic_goal':assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',re.sub(r'\(\*.*?\*\)','',text,flags=re.S)),name
   (local/(name+'.v')).write_bytes(origin.read_bytes())
  assert not list(local.glob('*.vo'))
  for name in ['Model','ShiftFacts','UnsignedModel','UnsignedScalarModel','Types','NeonFrame','VectorModel','neon_arithmetic_goal','NeonArithmeticAutomation','NeonFastFrame']:execute(name,['qcp-env','coqc','-time',*flags,local/(name+'.v')])
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(lambda n:execute(n,['qcp-env','coqc','-time',*flags,local/(n+'.v')]),[f'NeonArithmeticPart{i:02d}'for i in range(16)]))
  execute('NeonArithmeticChecked',['qcp-env','coqc','-time',*flags,local/'NeonArithmeticChecked.v']);gate=run/'NeonArithmeticGate.v';pure=[(n,x)for n in ['Model','ShiftFacts','UnsignedModel','UnsignedScalarModel','VectorModel']for x in re.findall(r'^Lemma\s+(\w+)\s*:',(local/(n+'.v')).read_text(),re.M)];text=f'From {NS} Require Import NeonArithmeticChecked VectorModel.\nModule ActualScalar : {NS}.neon_arithmetic_goal.VC_Correct := {NS}.NeonArithmeticChecked.CheckedNeonArithmetic.\n'+'\n'.join('Print Assumptions ActualScalar.proof_of_'+f+'.'for f in fields)+'\n'+'\n'.join('Print Assumptions '+NS+'.'+n+'.'+f+'.'for n,f in pure)+'\n';gate.write_text(text);execute('NeonArithmeticGate',['qcp-env','coqc','-time',*flags,gate]);reports=len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'NeonArithmeticGate.log').read_text(),re.M));assert reports==len(fields)+len(pure)
  assert all(sha(case/n)==d for n,d in hashes.items());assert sha(a.config)==configsha and all(sha(Path(shutil.which(n)).resolve())==d for n,d in tool.items());state.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fields),fields=fields,actual_functions=sorted(functions),checked_module=NS+'.NeonArithmeticChecked.CheckedNeonArithmetic',math_support_lemmas=len(pure),no_component_vo_reused=True,fresh_compiled_modules=len(names)+1,compiled_source_sha256={NS+'.'+n:sha(local/(n+'.v'))for n in names},cpp_sha256=sha(cpp),goal_sha256=sha(goal),final_gate_sha256=sha(gate),final_assumptions_log_sha256=sha(run/'NeonArithmeticGate.log'),tool_sha256=tool,config_sha256=configsha)
 except Exception as e:state['error']=str(e);print(e,flush=True)
 finally:
  save();dest=case/'proof/neon-arithmetic-status.json'
  if dest.exists():history=case/'proof/history';history.mkdir(exist_ok=True);(history/('neon_arithmetic-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
  dest.write_bytes((run/'status.json').read_bytes());print('RUN',run,flush=True)
 return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
