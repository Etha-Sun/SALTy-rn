#!/usr/bin/env python3
"""Fresh actual ordinary bit-observation helpers using reviewed NEON moves."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--config',type=Path,required=True);ap.add_argument('--jobs',type=int,default=32);a=ap.parse_args();assert 1<=a.jobs<=32;r=Path(tempfile.mkdtemp(prefix='compare-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Bits','Model','Types','MemoryModel','MemoryViews','PackModel','CompareTypes','CompareModel','CompareFacts'];files=['proof/check_compare.py','shim/compare.c','shim/compare.h','shim/compare_types.h','shim/compare_intrinsic_specs.h','shim/neon_specs.h','shim/formal_model.h','shim/formal_types.h']+['proof/coq/'+n+'.v'for n in mods];inputs={p:sha(C/p)for p in files};records=[];s=dict(passed=False,whole_kernel_verified=False,configured_jobs=a.jobs,maximum_actual_live_jobs=1,run_directory=str(r),input_sha256=inputs,records=records);env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool']
 def run(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert p.returncode==0,log.read_text()[-3500:]
 try:
  assert 'vgetq_lane_u32(b,0)'in(C/'shim/compare.c').read_text()
  for n in mods:shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n,[*flags,'-time',coq/(n+'.v')])
  (r/'input.c').write_text('#include "'+str(C/'shim/compare_intrinsic_specs.h')+'"\n#include "'+str(C/'shim/compare.c')+'"\n');run('cpp',['gcc','-E','-P','-CC','-nostdinc',r/'input.c','-o',r/'compare.c']);gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(r/'compare.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool']);goal=gen/'compare_goal.v';text=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert len(fields)==15;shutil.copy2(goal,coq/goal.name);run('compare_goal',[*flags,'-time',coq/goal.name]);proof='From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom MaxPool Require Import Types CompareTypes MemoryModel MemoryViews CompareModel CompareFacts compare_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope. Local Open Scope sac.\nLtac mp_intro := lazymatch goal with | |- _ |-- _=>idtac | |- forall _, _=>intro;mp_intro end.\nModule CheckedCompare : MaxPool.compare_goal.VC_Correct.\n'
  for f in fields:
   target='MaxPool.compare_goal.'+f;body='unfold '+target+';'
   if f=='mp_output_bits_at_return_wit_1':
    body+='left;mp_intro;match goal with HK:mp_out_known ?out ?ptr ?v,HL:mp_loaded_lane ?out ?ptr 0 ?value |- _=>unfold mp_out_known in HK;unfold mp_loaded_lane in HL;replace(ptr+4*0)with ptr in HL by lia;unfold mp_loaded in HL;rewrite HK in HL;subst value end;entailer!.'
   elif f.startswith('mp_same_output_at_return_wit_'):
    body+='left;mp_intro;unfold mp_word_equal;repeat match goal with |- context[Z.eqb ?x ?y]=>destruct(Z.eqb_spec x y) end;entailer!;congruence.'
   else:
    if f.endswith('_pure'):body+='mp_intro;'
    elif re.search(r'partial_solve_wit_[15]$',f)and f.startswith('mp_output_bits'):body+='intro Hpure;unfold MaxPool.compare_goal.'+f+'_aux;mp_intro;'
    elif re.search(r'partial_solve_wit_[12]$',f)and f.startswith('mp_same_output'):body+='intro Hpure;unfold MaxPool.compare_goal.'+f+'_aux;mp_intro;'
    else:body+='mp_intro;'
    body+='try change INT_MAX with 2147483647 in *;try change INT_MIN with (-2147483648) in *;unfold UndefStructPredfloat32x4_t,UndefStructPreduint32x4_t in *;rewrite ?mp_local_field_address;entailer!.'
   proof+='Lemma proof_of_'+f+' : '+target+'.\nProof. '+body+' Qed.\n'
  proof+='End CheckedCompare.\n'+''.join('Print Assumptions CheckedCompare.proof_of_'+f+'.\n'for f in fields)+''.join('Print Assumptions MaxPool.CompareFacts.'+f+'.\n'for f in ['mp_local_field_address','mp_loaded_known_lane_zero','mp_word_equal_bits']);(coq/'CompareChecked.v').write_text(proof);run('CompareChecked',[*flags,'-time',coq/'CompareChecked.v']);assert inputs=={p:sha(C/p)for p in inputs};s.update(passed=True,actual_c_vcs=len(fields),scope='ordinary actualC bit observer/comparator; reviewed LD1/reinterpret/lane0 specs are the only intrinsic exceptions',checked_module='MaxPool.CompareChecked.CheckedCompare',fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/'compare.c'),final_assumptions_log_sha256=sha(r/'CompareChecked.log'),no_component_vo_reused=True)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/compare-status.json'
 if dest.exists():(C/'proof/history'/('compare-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
