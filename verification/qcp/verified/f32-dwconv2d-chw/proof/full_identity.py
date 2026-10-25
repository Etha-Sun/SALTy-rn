"""Independent finite native/SDK and original-to-current patch identity audit.
Does not execute a proof, infer universal correctness from tests, or issue a certificate.
"""
from pathlib import Path
import hashlib,json,re,shutil,subprocess
from full_inputs import sha
import full_call_coverage
def read(p):return json.loads(Path(p).read_text())
def require(v,msg):
 if not v:raise ValueError(msg)
def source_hashes(case,pins):
 require(bool(pins),'Empty current source identity map')
 for name,h in pins.items():
  p=case/name;require(not Path(name).is_absolute()and p.resolve().is_relative_to(case.resolve()),'Source escapes case')
  require(sha(p)==h,'Current source changed '+name)
def native_log(case,status_name,s,record):
 p=Path(s['run_directory'])/(record['label']+'.log')
 return p if p.exists()else case/'proof/evidence/native'/Path(status_name).stem/p.name
def sdk_file(case,name,s,filename):
 p=Path(s['run_directory'])/filename
 return p if p.exists()else case/'proof/evidence/sdk'/Path(name).stem/filename
def identity(case,work,handoff=None):
 P=case/'proof';repair=read(P/'repair.json');originals=read(P/'originals.json')['originals'];replay=work/'repair-replay'
 (replay/'impl').mkdir(parents=True);(replay/'shim').mkdir();records=[]
 for side in ['NEON','RVV']:
  src=P/'original'/('test'+side+'.c');entry=originals[side.lower()]
  require(sha(src)==entry['sha256']==repair['original_'+side.lower()+'_sha256'],'Original identity differs '+side)
  require(sha(case/'impl'/src.name)==repair['repaired_'+side.lower()+'_sha256'],'Repaired identity differs '+side)
  shutil.copyfile(src,replay/'impl'/src.name)
 patch=P/'repair.patch';require(sha(patch)==repair['combined_patch_sha256'],'Repair patch changed')
 destinations=re.findall(r'^\+\+\+ (\S+)',patch.read_text(),re.M)
 patch_audit=read(P/'repair-inventory-audit.json')
 require(len(destinations)==len(set(destinations))==patch_audit['actual_patch_file_count']==6,'Repair patch file inventory differs')
 require(patch_audit['repair_json_sha256']==sha(P/'repair.json')and patch_audit['patch_sha256']==sha(patch),'Patch correction identity differs')
 require(set(destinations)==set(patch_audit['patched_file_sha256']),'Exact patch destinations differ')
 cmd=['prlimit','--as=17179869184:17179869184','--','patch','--batch','--forward','--fuzz=0','-p0','-i',str(patch)];log=work/'repair-patch.log'
 with log.open('w')as f:r=subprocess.run(cmd,cwd=replay,stdout=f,stderr=f,timeout=300)
 require(r.returncode==0,'Exact patch replay failed')
 for name in destinations:require((replay/name).read_bytes()==(case/name).read_bytes(),'Repair bytes differ '+name)
 records.append(dict(label='exact-repair-patch',command=cmd,exit_code=0,log_sha256=sha(log)))
 source_hashes(case,repair['ordinary_helper_source_sha256'])
 views=full_call_coverage.registered_views(read(P/'intrinsic-ledger.json'))
 native=[];names=handoff['native_statuses']if handoff else['proof/'+prefix+'native-'+san+'-status.json'for prefix in ['', 'public-']for san in ['undefined','address']]
 modes=set()
 for name in names:
  s=read(case/name);require(s['passed']and s['whole_kernel_verified']is False,'Finite native receipt required')
  require(s['per_process_memory_GiB']==16 and s['configured_jobs']==32,'Unexpected native resource profile')
  source_hashes(case,s['input_sha256']);source_hashes(case,s['actual_recursive_local_input_sha256']);modes.add(s['sanitizer'])
  require(s['cases']==128520 and s['lanes_per_side']==12247200 and s['aliased_cases']==102816 and s['vl_modes']==3 and s['inactive_modes']==2,'Native matrix differs')
  require(s['both_wrong_still_equal_oracle_rejected'],'Common-wrong negative control absent')
  if s['sanitizer']=='address':require(int(s['actual_memory_max'])==17179869184 and int(s['actual_memory_swap_max'])==0 and s['LSan_enabled'],'Actual ASan16GiB/swap0/LSan absent')
  labels={r['label']for r in s['records']}
  expected_labels={'dependencies','compile-correct','run-correct','compile-wrong-one','run-wrong-one','compile-wrong-both','run-wrong-both'}
  if 'public-native-'in name:expected_labels|={'public-caller-dependencies','compile-public-caller'}
  require(labels==expected_labels and len(labels)==len(s['records']),'Native command inventory differs')
  for r in s['records']:
   expected=2 if r['label']in ['run-wrong-one','run-wrong-both']else 0
   require(r['exit_code']==expected,'Native command failed '+r['label']);p=native_log(case,name,s,r);require(sha(p)==r['log_sha256'],'Native log changed')
   if not r['label'].startswith('run-'):continue
   lines=p.read_text().strip().splitlines();require(len(lines)==(2 if s['sanitizer']=='address'else 1),'Unexpected native runtime output')
   if s['sanitizer']=='address':require(json.loads(lines[0])=={'actual_memory_max':'17179869184','actual_memory_swap_max':'0'},'Runtime memory cgroup observer differs')
   if r['label']=='run-correct':require(lines[-1]=='passed cases=128520 lanes_per_side=12247200 aliased_cases=102816 vl_modes=3 inactive_modes=2','Native executed coverage differs')
   else:
    a='42280000';b='42280000'if r['label']=='run-wrong-both'else'3f800000';comparison='1'if r['label']=='run-wrong-both'else'0'
    require(lines[-1]=='mismatch H=1 N=1 pattern=0 alias=0 vl=0 tail=0 y=0 x=0 neon='+a+' rvv='+b+' oracle=3f800000 compare='+comparison,'Executed negative control differs')
  native.append(dict(path=name,sha256=sha(case/name)))
 require(modes=={'undefined','address'}and len(native)==4,'Both private/public sanitizer pairs required')
 sdk=[]
 for name in ['rv64-buildability-status.json','neon-front-buildability-status.json']:
  s=read(P/name);require(s['passed']and s['exit_code']==0 and s['dependency_command_exit_code']==0,'Current SDK build failed')
  source_hashes(case,s['input_sha256']);require(sha(case/s['replay_script'])==s['runner_sha256'],'SDK runner changed')
  require(s['command'][:3]==['prlimit','--as=17179869184:17179869184','--'],'Finite SDK resource bound absent')
  require(sha(sdk_file(case,name,s,'compile.log'))==s['log_sha256'],'SDK compile log changed')
  require(sha(sdk_file(case,name,s,'unit.c'))==s['generated_unit_sha256'],'SDK compilation unit changed')
  for row in s['source_mapping']:require(sha(case/row['source'])==row['source_sha256'],'SDK actual source mapping changed')
  sdk.append(dict(path='proof/'+name,sha256=sha(P/name)))
 if handoff:source_hashes(case,handoff['frozen_source_sha256'])
 return dict(formal_proof_replayed=False,repair_patch_records=records,native_statuses=native,
  sdk_statuses=sdk,source_reviewed_intrinsic_views=len(views),exact_patch_file_count=len(destinations),
  historical_patch_file_count=repair['patch_file_count'],patch_count_correction='proof/repair-inventory-audit.json',
  human_intrinsic_review='pending',ordinary_helpers_require_actual_fresh_body_proofs=True)
