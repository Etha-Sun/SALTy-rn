#!/usr/bin/env python3
"""Fresh actual sizeof C bodies establish the selected shim's unsigned64 size_t.
This is a width/interface guard, not a C ABI or instruction refinement theorem.
"""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,shutil,time
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',required=True,type=Path);a=p.parse_args();ns=re.search(r'Import Coq Require Import (\w+)\.Model',(C/'shim/scalar.h').read_text())[1];r=Path(tempfile.mkdtemp(prefix='type-width64-',dir=C/'.build'));coq=r/'coq';coq.mkdir();records=[];files=['shim/scalar.h','proof/coq/Model.v','proof/check_type_width.py'];inputs={n:sha(C/n)for n in files};s=dict(passed=False,whole_kernel_verified=False,scope='selected shim width projection only; no ABI/ISA theorem and no general unsigned-long width claim',run_directory=str(r),input_sha256=inputs,records=records)
 def run(label,cmd):
  log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=r,stdout=f,stderr=f,timeout=600)
  records.append(dict(label=label,command=list(map(str,cmd)),exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));assert not p.returncode,log.read_text()[-2000:]
 try:
  assert 'typedef unsigned long long size_t;'in(C/'shim/scalar.h').read_text();types=[('size_t','size_t',8),('i8','int8_t',1),('u8','uint8_t',1),('i16','int16_t',2),('i32','int32_t',4),('u32','uint32_t',4),('i64','int64_t',8),('pointer','void*',8)];src='#include "'+str(C/'shim/scalar.h')+'"\n'+''.join(f'int width_{n}()\n/*@ Require emp Ensure __return=={v} && emp */\n{{return sizeof({t});}}\n'for n,t,v in types);(r/'input.c').write_text(src);run('cpp',['gcc','-E','-P','-CC','-nostdinc',r/'input.c','-o',r/'width64.c']);run('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(r/'width64.c'),'--coq-output-dir='+str(r),'--coq-logic-path='+ns,'-slp',C/'shim',ns]);goal=r/'width64_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==8;shutil.copyfile(goal,coq/goal.name);shutil.copyfile(C/'proof/coq/Model.v',coq/'Model.v');flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),ns]
  proof='From SimpleC.SL Require Import Mem SeparationLogic.\nFrom '+ns+' Require Import width64_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope sac.\nModule CheckedWidth : '+ns+'.width64_goal.VC_Correct.\n'+''.join('Lemma proof_of_'+f+' : '+ns+'.width64_goal.'+f+'.\nProof. unfold '+ns+'.width64_goal.'+f+';entailer!. Qed.\n'for f in fields)+'End CheckedWidth.\n'+''.join('Print Assumptions CheckedWidth.proof_of_'+f+'.\n'for f in fields);(coq/'Width64Checked.v').write_text(proof)
  for n in ['Model','width64_goal','Width64Checked']:run(n,[*flags,'-time',coq/(n+'.v')])
  native='#include "'+str(C/'shim/scalar.h')+'"\nextern int printf(const char*,...);\nint main(void){printf("size_t=%lu pointer=%lu i64=%lu native_ulong=%lu\\n",(unsigned long)sizeof(size_t),(unsigned long)sizeof(void*),(unsigned long)sizeof(int64_t),(unsigned long)sizeof(unsigned long));return '+ ' || '.join(f'sizeof({t})!={v}'for _,t,v in types)+' || sizeof(unsigned long)!=8;}\n';(r/'native.c').write_text(native);run('native-compile',['gcc','-std=c11',r/'native.c','-o',r/'native']);run('native-width',[r/'native']);assert inputs=={n:sha(C/n)for n in files};s.update(passed=True,selected_model_widths={n:v for n,_,v in types},native_selected_widths_equal=True,original_lp64_unsigned_long_width=8,known_qcp_unused_ulong_width=4,alias_value_domain='all integers0..18446744073709551615; no32-bit n limit',actual_width_c_vcs=8,checked_module=ns+'.Width64Checked.CheckedWidth',fields=fields,goal_sha256=sha(goal),final_gate_sha256=sha(coq/'Width64Checked.v'),final_assumptions_log_sha256=sha(r/'Width64Checked.log'),native_log_sha256=sha(r/'native-width.log'),no_component_vo_reused=True)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/type-width-status.json'
 if dest.exists():(C/'proof/history'/('type-width-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_width_c_vcs','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
