#!/usr/bin/env python3
"""Clean relocation without private build outputs/compiled objects. No proof credit."""
from pathlib import Path
import argparse,json,os,shutil,subprocess,tempfile
from full_inputs import CASE,ROOT,sha,read,require
from build_full_handoff import inventory

def main():
 p=argparse.ArgumentParser();p.add_argument('--negative-controls',action='store_true');a=p.parse_args()
 work=Path(tempfile.mkdtemp(prefix='ap-clean-relocation-',dir=ROOT/'.build'));dest=work/CASE.name;dest.mkdir();pins=inventory();records=[];state=dict(passed=False,formal_proof_replayed=False,whole_kernel_verified=False,directory=str(work),records=records,input_sha256=pins,no_private_build_copied=True,no_component_vo_copied=True)
 def execute(command,label,expected=0):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];log=work/(label+'.log')
  with log.open('w')as f:r=subprocess.run(cmd,stdout=f,stderr=f,timeout=600,env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']})
  records.append(dict(label=label,command=cmd,exit_code=r.returncode,expected_exit=expected,log_sha256=sha(log)));require(r.returncode==expected,label+': '+log.read_text()[-1200:]);return log
 try:
  for n,h in pins.items():
   q=dest/n;q.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(CASE/n,q);require(sha(q)==h,'Copy input identity '+n)
  require(not(dest/'.build').exists()and not list(dest.rglob('*.vo')),'Private/compiled dependency copied');(dest/'.build').mkdir()
  execute(['python3',dest/'proof/build_full_handoff.py','--prepare-only'],'clean-prepare')
  before=read(CASE/'proof/component-unit-inventory.json');after=read(dest/'proof/component-unit-inventory.json');require(len(after['units'])==10,'Relocated TU inventory differs')
  for old,new in zip(before['units'],after['units']):
   for k in ['stem','fields','cpp_sha256','goal_sha256','goal_archive_sha256','source_sha256','typed_instance','construction']:
    require(old[k]==new[k],'Relocated input identity '+old['stem']+'/'+k)
  execute(['python3',dest/'proof/record_status.py','--preflight'],'clean-issuer-preflight')
  code="""import json,sys,pathlib
sys.path.insert(0,sys.argv[1]);import full_inputs as F,build_full_handoff as B
rows=F.inventory_units();generated={};cache=F.CASE/'.build/closure';cache.mkdir()
for row in rows:
 generated[row['stem']+'_goal']=F.goal_source(row)
 text=F.definition_source(row['stem'])
 if text:
  p=cache/(row['stem']+'_def.v');p.write_text(text);generated[row['stem']+'_def']=p
roots=[r['provider_root']for r in rows]+['APPublicModel','APProgramObservation']+sorted(generated);dag=B.source_closure(roots,generated);reports=F.mathematical_support_reports(F.CASE/'proof/coq',[n for n in dag if n not in generated])
print(json.dumps(dict(source_modules=len(dag),generated_modules=len(generated),mathematical_reports=len(reports),source_dag=dag),sort_keys=True))
"""
  log=execute(['python3','-c',code,dest/'proof'],'clean-source-dag');dag=json.loads(log.read_text());require(dag['source_modules']==630 and dag['generated_modules']==16 and dag['mathematical_reports']>0,'Incomplete clean source closure');state.update(source_closure=dag,prepared_TUs=10,unique_ordinary_bodies=14,actual_C_fields=2362)
  if a.negative_controls:
   repair=dest/'proof/repair.json';original=repair.read_bytes();obj=read(repair);obj['sides']['rvv']['original_sha256']='0'*64;repair.write_text(json.dumps(obj));log=execute(['python3',dest/'proof/record_status.py','--preflight'],'reject-original-ledger-drift',1);require(json.loads(log.read_text())['error']=="ValueError('Repair ledger drift rvv')",'Wrong original-identity rejection');repair.write_bytes(original)
   cp=dest/'proof/evidence/native/native-status/undefined-negative-both.log';data=cp.read_bytes();cp.write_bytes(b'negative comparator=1 oracle_rejected=0\n');log=execute(['python3',dest/'proof/record_status.py','--preflight'],'reject-negative-control-drift',1);require(json.loads(log.read_text())['error']=="ValueError('Native execution log drift proof/native-status.json')",'Wrong oracle-log rejection');cp.write_bytes(data)
   log=execute(['python3',dest/'proof/record_status.py','--dry-run'],'reject-missing-full-proof',1);require(json.loads(log.read_text())['error']=="ValueError('Complete frozen handoff required')",'Wrong missing-evidence rejection')
   state['negative_controls_passed']=True
  state['passed']=True
 except Exception as e:state['error']=str(e)
 (work/'status.json').write_text(json.dumps(state,indent=2)+'\n');print(json.dumps({k:v for k,v in state.items()if k not in['source_closure','records','input_sha256']},indent=2));return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
