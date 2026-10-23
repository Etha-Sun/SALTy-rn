#!/usr/bin/env python3
"""Fresh signed-byte reinterpret, LE stores, nested tail wrappers and typed gate."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time

CASE=Path(__file__).resolve().parent.parent
FUNCTIONS=['qcp_s8_store_word32','qcp_s8_store_word16','qcp_s8_pack16','qcp_s8_pack32','vreinterpret_u32_s8','qcp_s8_store_u32_0','original_tail_store32','vreinterpret_u16_s8','qcp_s8_store_u16_0','original_tail_store16']
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
NATIVE=r'''
#include "signed_tail.c"
extern int printf(const char *, ...);
static unsigned char area[16];
static int8x8_t current;
static unsigned pc,vc,offset;
static void *next_output(void){pc++;return area+offset;}
static int8x8_t next_vector(void){vc++;return current;}
int main(void){
 unsigned long cases=0;
 for(unsigned a=0;a<256;a++)for(unsigned b=0;b<256;b++){
 current.s0=(signed char)a; current.s1=(signed char)b;
 current.s2=(signed char)(a+17);current.s3=(signed char)(b+71);
 current.s4=(signed char)(a+137);current.s5=(signed char)(b+197);
 current.s6=(signed char)(a^b);current.s7=(signed char)(a-b);
 unsigned char expect[4]={(unsigned char)current.s0,(unsigned char)current.s1,(unsigned char)current.s2,(unsigned char)current.s3};
 for(offset=1;offset<=2;offset++)for(unsigned width=2;width<=4;width+=2){
  for(unsigned j=0;j<16;j++)area[j]=165;
  if(width==4)original_tail_store32((int8_t *)(area+offset),current);
  else original_tail_store16((int8_t *)(area+offset),current);
  for(unsigned j=0;j<16;j++)if(area[j]!=(j>=offset&&j<offset+width?expect[j-offset]:165))return 1;
  for(unsigned j=0;j<16;j++)area[j]=165;
  pc=vc=0;
  if(width==4){vst1_lane_u32(next_output(),vreinterpret_u32_s8(next_vector()),0);}
  else {vst1_lane_u16(next_output(),vreinterpret_u16_s8(next_vector()),0);}
  if(pc!=1||vc!=1)return 2;
  for(unsigned j=0;j<16;j++)if(area[j]!=(j>=offset&&j<offset+width?expect[j-offset]:165))return 3;
  cases++;
 }
 }
 printf("passed %lu cases; signed patterns, offsets 1/2, widths 2/4, canaries, single evaluation\n",cases);
 return cases==262144?0:4;
}
'''
def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',type=Path,required=True);args=ap.parse_args()
    (CASE/'.build').mkdir(exist_ok=True)
    run=Path(tempfile.mkdtemp(prefix='signed-tail-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();out=run/'generated';out.mkdir();strategies=run/'strategies';strategies.mkdir()
    records=[];status={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,'scope':'actual signed-byte tail C-shim component; no ISA theorem','run_directory':str(run),'records':records}
    def execute(cmd,label,expected=0,budget=300):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');start=time.monotonic()
        with log.open('w') as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=budget)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'expected_success':expected==0,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        if (r.returncode==0)!=(expected==0):raise RuntimeError(label+': '+log.read_text()[-4000:])
        return log
    try:
        names=['shim/signed_tail.c','shim/signed_tail.h','shim/signed_tail.strategies','shim/types.h','shim/types_def.h','proof/coq/Model.v','proof/coq/Types.v','proof/coq/ByteBridge.v','proof/coq/SignedTailChecked.v','proof/coq/signed_tail_strategy_proof.v','proof/check_signed_tail.py']
        inputs={n:sha(CASE/n) for n in names}
        src=run/'signed_tail.c'
        execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'shim/signed_tail.c','-o',src],'cpp')
        execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp','-slp',CASE/'shim','S8Clamp'],'qcp')
        tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck'
        execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'shim/signed_tail.strategies'),'--coq-output-dir='+str(strategies),'--coq-logic-path=S8Clamp'],'strategy-generation')
        goal=out/'signed_tail_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
        if len(fields)!=41:raise ValueError('Expected ten actual bodies / 41 C fields, got '+str(len(fields)))
        generated_functions=sorted(set(re.sub(r'_(?:safety|return|partial_solve|entail)_wit_.*$','',f) for f in fields))
        if generated_functions!=sorted(FUNCTIONS):raise ValueError('Actual generated C function coverage mismatch')
        sg=strategies/'signed_tail_strategy_goal.v';sf=re.findall(r'^  Axiom (\w+)_correctness :',sg.read_text(),re.M)
        if len(sf)!=2:raise ValueError('Expected two freshly checked strategies')
        for n in ['Model','Types','ByteBridge','SignedTailChecked','signed_tail_strategy_proof']:shutil.copy2(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        for p in [goal,sg]:shutil.copy2(p,coq/p.name)
        flags=[*json.loads(args.config.read_text())['flags'],'-time','-Q',str(coq),'S8Clamp']
        modules=['Model','Types','ByteBridge','signed_tail_strategy_goal','signed_tail_strategy_proof','signed_tail_goal','SignedTailChecked']
        for n in modules:execute([*flags,coq/(n+'.v')],n,budget=1200 if n=='SignedTailChecked' else 300)
        gate=['Require Import S8Clamp.signed_tail_goal S8Clamp.SignedTailChecked S8Clamp.ByteBridge S8Clamp.signed_tail_strategy_goal S8Clamp.signed_tail_strategy_proof.',
              'Module Typed : S8Clamp.signed_tail_goal.VC_Correct := S8Clamp.SignedTailChecked.CheckedSignedTail.',
              'Module TypedStrategy : S8Clamp.signed_tail_strategy_goal.signed_tail_Strategy_Correct := S8Clamp.signed_tail_strategy_proof.CheckedSignedTailStrategy.']
        gate+=['Print Assumptions Typed.proof_of_'+f+'.' for f in fields]
        gate+=['Print Assumptions TypedStrategy.'+f+'_correctness.' for f in sf]
        math=re.findall(r'^Lemma (\w+)',(coq/'ByteBridge.v').read_text(),re.M)
        gate+=['Print Assumptions S8Clamp.ByteBridge.'+f+'.' for f in math]
        (coq/'SignedTailGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'SignedTailGate.v'],'SignedTailGate')
        (run/'native.c').write_text(NATIVE.replace('#include "signed_tail.c"', '#include "'+str(CASE/'shim/signed_tail.c')+'"'))
        execute(['gcc','-std=c11','-O2','-Wall','-Wextra','-Werror','-I',CASE/'shim',run/'native.c','-o',run/'native'],'native-build')
        native_log=execute([run/'native'],'native')
        if not native_log.read_text().startswith('passed 262144 cases;'):raise ValueError('Unexpected native result')
        for lane in ['1','lane']:
            p=run/('negative-'+lane+'.c');p.write_text('#include "'+str(CASE/'shim/signed_tail.c')+'"\nvoid bad(void *p,uint32x2_t v,int lane){ (void)lane; vst1_lane_u32(p,v,'+lane+'); }\n')
            log=execute(['gcc','-std=c11','-Werror=implicit-function-declaration','-I',CASE/'shim','-c',p,'-o',run/('negative-'+lane+'.o')],'reject-lane-'+lane,expected=1)
            if 'qcp_s8_store_u32_'+lane not in log.read_text():raise ValueError('Negative lane failed for an unexpected reason')
        if inputs!={n:sha(CASE/n) for n in names}:raise ValueError('Component source changed during proof')
        modules+=['SignedTailGate']
        status.update(passed=True,vc_correct_passed=True,actual_c_functions=FUNCTIONS,checked_c_vcs=len(fields),checked_strategies=len(sf),fields=fields,checked_module='S8Clamp.SignedTailChecked.CheckedSignedTail',math_support_lemmas=len(math),input_sha256=inputs,cpp_sha256=sha(src),goal_sha256=sha(goal),strategy_goal_sha256=sha(sg),no_component_vo_reused=True,compiled_source_sha256={n:sha(coq/(n+'.v')) for n in modules},native_cases=262144,native_scope='host C byte view/store tests; separate from formal proof and ISA semantics',pinned_reference_commit='9dd92b6b',address_alignment_required=False,config_sha256=sha(args.config),qcp_tool_sha256=sha(Path(shutil.which('qcp')).resolve()),strategy_tool_sha256=sha(tool),external_libraries_rebuilt=False)
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=CASE/'proof/signed-tail-status.json';history=CASE/'proof/history';history.mkdir(exist_ok=True)
    if dest.exists():
        old=dest.read_bytes();(history/('signed-tail-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error'),'checked_c_vcs':status.get('checked_c_vcs')},indent=2))
    return 0 if status['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
