#!/usr/bin/env python3
"""Actual C inline-control probe and universal math bridge, no kernel credit."""
from pathlib import Path
import argparse,concurrent.futures,hashlib,json,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent;NS="Qu8Add";P="qu";sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def body(var="raw",target="t"):
 return f"int32_t {target} = -({var} % 256);\n  if ({target} > 127) {target} -= 256;\n  if ({target} < -128) {target} += 256;"
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',required=True,type=Path);p.add_argument('--jobs',type=int,default=16);a=p.parse_args();assert 16<=a.jobs<=64
 r=Path(tempfile.mkdtemp(prefix='control-proof-',dir=C/'.build'));coq=r/'coq';coq.mkdir();files=['proof/check_control.py','proof/coq/Model.v','proof/coq/ControlFacts.v','shim/scalar.h'];inputs={n:sha(C/n)for n in files};records=[];s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,limits=dict(jobs=a.jobs,per_process_bytes=17179869184,timeout_seconds=600),records=records)
 def run(n,cmd):
  log=r/(n+'.log');t=time.monotonic()
  with log.open('w')as f:z=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=r,stdout=f,stderr=f,timeout=600)
  rec=dict(label=n,command=list(map(str,cmd)),exit_code=z.returncode,seconds=time.monotonic()-t,log_sha256=sha(log));records.append(rec);assert not z.returncode,log.read_text()[-2200:]
 try:
  source='#include "'+str(C/'shim/scalar.h')+'"\n/*@ Import Coq Require Import '+NS+'.ControlFacts */\n/*@ Extern Coq ('+P+'_ctrl:Z -> Z) */\nint32_t decode_control(int32_t raw)\n/*@ Require -2147483648<=raw && raw<=2147483647 && emp Ensure __return=='+P+'_ctrl(raw) && -128<=__return && __return<=127 && emp */\n{\n  '+body()+'\n  return t;\n}\n';(r/'input.c').write_text(source)
  run('cpp',['gcc','-E','-P','-CC','-nostdinc',r/'input.c','-o',r/'control.c']);run('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(r/'control.c'),'--coq-output-dir='+str(r),'--coq-logic-path='+NS,'-slp',C/'shim',NS]);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',(r/'control_goal.v').read_text(),re.M);assert len(fields)==16
  for name in ['Model','ControlFacts']:shutil.copyfile(C/'proof/coq'/(name+'.v'),coq/(name+'.v'))
  shutil.copyfile(r/'control_goal.v',coq/'control_goal.v');flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS]
  for name in ['Model','ControlFacts','control_goal']:run(name,[*flags,'-time',coq/(name+'.v')])
  imports='From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom '+NS+' Require Import ControlFacts control_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\n'
  for i,name in enumerate(fields):
   tactic='unfold '+NS+'.control_goal.'+name+';'+('left;'if name=='decode_control_safety_wit_1'or '_return_'in name else'')+'intros;pose proof('+P+'_neg_rem_bounds raw_pre)as Hr;'
   if '_return_'in name:tactic+='rewrite <-'+P+'_control_decode_correct;unfold '+P+'_control_decode;destruct(Z.ltb_spec 127(-Z.rem raw_pre 256));cbn zeta;destruct(Z.ltb_spec(-Z.rem raw_pre 256-256)(-128));destruct(Z.ltb_spec(-Z.rem raw_pre 256)(-128));entailer!.'
   else:tactic+='entailer!.'
   (coq/f'ControlPart{i:02}.v').write_text(imports+'Lemma proof_of_'+name+' : '+NS+'.control_goal.'+name+'.\nProof. '+tactic+' Qed.\n')
  def task(i):run(f'ControlPart{i:02}',[*flags,'-time',coq/f'ControlPart{i:02}.v'])
  with concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs)as pool:list(pool.map(task,range(len(fields))))
  gate='From '+NS+' Require Import '+ ' '.join(f'ControlPart{i:02}'for i in range(len(fields)))+'.\nModule CheckedControl : '+NS+'.control_goal.VC_Correct.\n'+''.join('Definition proof_of_'+n+' : '+NS+'.control_goal.'+n+' := '+NS+f'.ControlPart{i:02}.proof_of_'+n+'.\n'for i,n in enumerate(fields))+'End CheckedControl.\n'+''.join('Print Assumptions CheckedControl.proof_of_'+n+'.\n'for n in fields)+''.join('Print Assumptions '+NS+'.ControlFacts.'+n+'.\n'for n in re.findall(r'^Lemma (\w+)',(coq/'ControlFacts.v').read_text(),re.M));(coq/'ControlGate.v').write_text(gate);run('ControlGate',[*flags,'-time',coq/'ControlGate.v'])
  native='#include "'+str(C/'shim/scalar.h')+'"\nextern int puts(const char*);\nint32_t decoder(int32_t raw){'+body()+'return t;}\nint main(void){uint32_t seed=319;for(int i=0;i<1000000;i++){seed=seed*1664525u+1013904223u;int64_t wide=seed;if(wide>2147483647)wide-=4294967296LL;int32_t raw=(int32_t)wide;int64_t z=-(int64_t)raw;z%=256;if(z<0)z+=256;if(z>=128)z-=256;if(decoder(raw)!=z)return 1;}for(int i=0;i<3;i++){int32_t raw=i==0?(-2147483647-1):i==1?2147483647:0;uint32_t bits=(0u-(uint32_t)raw)&255u;int32_t expected=bits>=128?(int32_t)bits-256:(int32_t)bits;if(decoder(raw)!=expected)return 2;}puts("1000003 fullraw canonical controls passed");return 0;}\n';(r/'native.c').write_text(native);run('native-compile',['gcc','-std=c11','-fsanitize=undefined','-fno-sanitize-recover=all',r/'native.c','-o',r/'native']);run('native',[r/'native']);assert inputs=={n:sha(C/n)for n in files}
  s.update(passed=True,vc_correct_passed=True,actual_probe_c_vcs=len(fields),probe_not_callee_or_kernel_credit=True,checked_module=NS+'.ControlGate.CheckedControl',fields=fields,goal_sha256=sha(r/'control_goal.v'),cpp_sha256=sha(r/'control.c'),final_gate_sha256=sha(coq/'ControlGate.v'),final_assumptions_log_sha256=sha(r/'ControlGate.log'),pure_math_lemmas=6,no_component_vo_reused=True,native_cases=1000003)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/control-status.json'
 if dest.exists():(C/'proof/history'/('control-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_probe_c_vcs','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
