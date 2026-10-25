#!/usr/bin/env python3
"""Fresh actual width/count C bodies and exact fully-qualified typed interface."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='scalar-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();records=[];files=['proof/check_scalar.py','shim/formal_model.h','shim/type_width.c','shim/count.c','shim/assert.c','proof/coq/Bits.v','proof/coq/Model.v','proof/coq/CountFacts.v'];inputs={p:sha(C/p)for p in files};env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool']
 def run(label,cmd):
  log=r/(label+'.log');start=time.monotonic();cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-start,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(dict(passed=False,whole_kernel_verified=False,records=records,input_sha256=inputs),indent=2)+'\n');assert p.returncode==0,log.read_text()[-4000:]
 for n in ['Bits','Model','CountFacts']:
  shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n,[*flags,'-time',coq/(n+'.v')])
 units=[]
 for stem in ['type_width','count','assert']:
  inp=r/(stem+'.in.c');inp.write_text('#include "'+str(C/'shim'/(stem+'.c'))+'"\n');cpp=r/(stem+'.c');run(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc',inp,'-o',cpp]);gen=r/(stem+'-generated');gen.mkdir();run(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool']);goal=gen/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;shutil.copy2(goal,coq/goal.name);run(stem+'_goal',[*flags,'-time',coq/goal.name]);module={'type_width':'CheckedWidth','count':'CheckedCount','assert':'CheckedAssert'}[stem];name={'type_width':'WidthChecked','count':'CountChecked','assert':'AssertChecked'}[stem]
  source='From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom MaxPool Require Import Model CountFacts '+stem+'_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope. Local Open Scope sac.\nModule '+module+' : MaxPool.'+stem+'_goal.VC_Correct.\n'
  for f in fields:
   tactic='entailer!.' if stem=='type_width'else 'try left;intros;unfold mp_remaining;repeat match goal with |- context[Z.ltb ?a ?b]=>destruct(Z.ltb_spec a b) end;try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;entailer!;lia.'
   source+='Lemma proof_of_'+f+' : MaxPool.'+stem+'_goal.'+f+'.\nProof. unfold MaxPool.'+stem+'_goal.'+f+';'+tactic+' Qed.\n'
  source+='End '+module+'.\n'+''.join('Print Assumptions '+module+'.proof_of_'+f+'.\n'for f in fields);(coq/(name+'.v')).write_text(source);run(name,[*flags,'-time',coq/(name+'.v')]);units.append(dict(stem=stem,fields=fields,actual_c_vcs=len(fields),checked_module='MaxPool.'+name+'.'+module,cpp_sha256=sha(cpp),goal_sha256=sha(goal),proof_sha256=sha(coq/(name+'.v')),assumptions_log_sha256=sha(r/(name+'.log'))))
 native=r/'native-width.c';native.write_text('#include <stdint.h>\n#include <stddef.h>\n#include <float.h>\nextern int printf(const char*,...);\nint main(void){printf("size_t=%lu uintptr=%lu u32=%lu float=%lu pointer=%lu i32=%lu i64=%lu u64=%lu\\n",(unsigned long)sizeof(size_t),(unsigned long)sizeof(uintptr_t),(unsigned long)sizeof(uint32_t),(unsigned long)sizeof(float),(unsigned long)sizeof(void*),(unsigned long)sizeof(int),(unsigned long)sizeof(int64_t),(unsigned long)sizeof(unsigned long long));return sizeof(size_t)!=8||sizeof(uintptr_t)!=8||sizeof(uint32_t)!=4||sizeof(float)!=4||sizeof(void*)!=8||sizeof(int)!=4||sizeof(int64_t)!=8||sizeof(unsigned long long)!=8||(size_t)-1!=UINT64_MAX||FLT_RADIX!=2||FLT_MANT_DIG!=24||FLT_MAX_EXP!=128;}\n');run('native-compile',['gcc','-std=c11',native,'-o',r/'native-width']);run('native-width',[r/'native-width']);assert inputs=={p:sha(C/p)for p in inputs}
 status=dict(passed=True,whole_kernel_verified=False,scope='actual selected-width guards and count helper, not whole-kernel proof or ABI theorem',run_directory=str(r),input_sha256=inputs,units=units,actual_c_vcs=sum(x['actual_c_vcs']for x in units),records=records,formal_native_unsigned64_checked=True,native_log_sha256=sha(r/'native-width.log'))
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');(C/'proof/scalar-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({'passed':True,'run':str(r),'actual_C_VCs':status['actual_c_vcs']}))
if __name__=='__main__':main()
