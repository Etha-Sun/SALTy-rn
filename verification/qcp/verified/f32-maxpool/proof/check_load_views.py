#!/usr/bin/env python3
"""Fresh actual caller probes for two original LD1 logical views; not kernel proof."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--config',type=Path,required=True);a=ap.parse_args();r=Path(tempfile.mkdtemp(prefix='load-views-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Bits','Model','Types','MemoryModel','MemoryViews','PackModel'];files=['proof/check_load_views.py','proof/c/load_view_probes.c','proof/c/intrinsic-views.json','shim/formal_model.h','shim/formal_types.h','shim/neon_specs.h']+['proof/coq/'+n+'.v'for n in mods];inputs={p:sha(C/p)for p in files};records=[];s=dict(passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,records=records);env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool']
 def run(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert p.returncode==0,log.read_text()[-3500:]
 try:
  # C-pointer arithmetic is scaled by the frontend. Byte addresses belong
  # inside Coq logic helpers, never p+4*j in source annotations.
  assert not re.search(r'\bp\s*\+', (C/'shim/neon_specs.h').read_text())
  for n in mods:shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n,[*flags,'-time',coq/(n+'.v')])
  run('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'proof/c/load_view_probes.c','-o',r/'load_views.c']);gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(r/'load_views.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool']);goal=gen/'load_views_goal.v';text=goal.read_text();assert 'sizeof(FLOAT)'not in text,'scaled byte address leaked into pure load-view formula';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text,re.M);assert len(fields)==8;shutil.copy2(goal,coq/goal.name);run('load_views_goal',[*flags,'-time',coq/goal.name]);proof='From SimpleC.SL Require Import Mem SeparationLogic.\nFrom MaxPool Require Import Types MemoryModel MemoryViews load_views_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope sac.\nModule CheckedLoadViews : MaxPool.load_views_goal.VC_Correct.\n'
  for f in fields:
   target='MaxPool.load_views_goal.'+f;body='unfold '+target+';'
   if f=='mp_probe_output_return_wit_1':body+='intros p O W record r3 r2 r1 r0 H0 H1 H2 H3 Hwin;Exists r3 r2 r1 r0;entailer!.'
   elif f.endswith('partial_solve_wit_1'):body+='intro Hpure;unfold MaxPool.load_views_goal.'+f+'_aux;intros;entailer!.'
   elif f.endswith('partial_solve_wit_2'):body+='intros;unfold UndefStructPredfloat32x4_t;entailer!.'
   else:body+='intros;entailer!.'
   proof+='Lemma proof_of_'+f+' : '+target+'.\nProof. '+body+' Qed.\n'
  proof+='End CheckedLoadViews.\n'+''.join('Print Assumptions CheckedLoadViews.proof_of_'+f+'.\n'for f in fields);(coq/'LoadViewsChecked.v').write_text(proof);run('LoadViewsChecked',[*flags,'-time',coq/'LoadViewsChecked.v']);assert inputs=={p:sha(C/p)for p in inputs};s.update(passed=True,actual_c_vcs=len(fields),scope='two ordinary actualC caller probes to source-reviewed original LD1 views; no LD1 body/ISA refinement proof credit',checked_module='MaxPool.LoadViewsChecked.CheckedLoadViews',fields=fields,goal_sha256=sha(goal),cpp_sha256=sha(r/'load_views.c'),final_assumptions_log_sha256=sha(r/'LoadViewsChecked.log'),contract_pointer_scaling_guard_passed=True,no_component_vo_reused=True,return_record_ownership='return witness preconditions contain four initialized record_return cells and map only; copy intermediate has distinct retval+record_return, no explicit same-address init+undef')
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/load-views-status.json'
 if dest.exists():(C/'proof/history'/('load-views-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
