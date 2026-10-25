#!/usr/bin/env python3
"""Actual ordinary C readonly pointer-map adapter, fresh generated/typed."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='read-table-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Bits','Model','MemoryModel','MemoryFacts'];files=['proof/check_read_table.py','shim/read_table.c','shim/read_table.h']+['proof/coq/'+n+'.v'for n in mods];inputs={p:sha(C/p)for p in files};records=[];status=dict(passed=False,whole_kernel_verified=False,run_directory=str(r),input_sha256=inputs,records=records);env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool']
 def run(label,cmd):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=r/(label+'.log');t=time.monotonic()
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=label,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));(r/'status.json').write_text(json.dumps(status,indent=2)+'\n');assert p.returncode==0,log.read_text()[-3000:]
 try:
  for n in mods:shutil.copy2(C/'proof/coq'/(n+'.v'),coq/(n+'.v'));run(n,[*flags,'-time',coq/(n+'.v')])
  run('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/read_table.c','-o',r/'read_table.c']);gen=r/'generated';gen.mkdir();run('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(r/'read_table.c'),'--coq-output-dir='+str(gen),'--coq-logic-path=MaxPool','-slp',C/'shim','MaxPool']);goal=gen/'read_table_goal.v';shutil.copy2(goal,coq/goal.name);run('read_table_goal',[*flags,'-time',coq/goal.name]);fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==2
  source='From Coq Require Import ZArith.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom MaxPool Require Import MemoryModel MemoryFacts read_table_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope sac.\nLtac mp_intro := lazymatch goal with | |- _ |-- _ => idtac | |- forall _, _ => intro;mp_intro end.\nModule CheckedReadTable : MaxPool.read_table_goal.VC_Correct.\n'
  for f in fields:
   direction='proj1'if 'entail'in f else'proj2';source+='Lemma proof_of_'+f+' : MaxPool.read_table_goal.'+f+'.\nProof. unfold MaxPool.read_table_goal.'+f+';left;mp_intro;match goal with H:mp_ptr_present ?PT ?addr |- _=>sep_apply('+direction+'(mp_ptr_data_pop PT addr H)) end;entailer!. Qed.\n'
  source+='End CheckedReadTable.\n'+''.join('Print Assumptions CheckedReadTable.proof_of_'+f+'.\n'for f in fields)+'Print Assumptions MaxPool.MemoryFacts.mp_ptr_data_pop.\n';(coq/'ReadTableChecked.v').write_text(source);run('ReadTableChecked',[*flags,'-time',coq/'ReadTableChecked.v']);assert inputs=={p:sha(C/p)for p in inputs};status.update(passed=True,actual_c_vcs=2,fields=fields,checked_module='MaxPool.ReadTableChecked.CheckedReadTable',cpp_sha256=sha(r/'read_table.c'),goal_sha256=sha(goal),proof_sha256=sha(coq/'ReadTableChecked.v'),final_assumptions_log_sha256=sha(r/'ReadTableChecked.log'),no_component_vo_reused=True)
 except Exception as e:status['error']=str(e)
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=C/'proof/read-table-status.json'
 if dest.exists():(C/'proof/history'/('read-table-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:status.get(k)for k in ['passed','run_directory','actual_c_vcs','error']}));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
