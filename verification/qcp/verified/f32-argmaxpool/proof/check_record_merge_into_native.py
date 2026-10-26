#!/usr/bin/env python3
"""Finite actual ordinary adapters plus an independent integer IEEE oracle."""
from pathlib import Path
import hashlib,json,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='record-merge-into-native-',dir=C/'.build'));records=[]
 names=['shim/rvv_record_consumers.c','shim/rvv_record_consumers.h','proof/native/record_merge_into_regression.c','proof/native/isa_arrays.h','shim/read_table.h','shim/read_previous.h','proof/check_record_merge_into_native.py','shim/record_consumers.c','shim/record_consumers.h','proof/coq/VectorRecords.v','proof/coq/RvvVectorRecords.v','proof/coq/NeonRecordCompareModel.v','shim/neon_record_compare.c','shim/neon_record_compare.h','shim/rvv_record_merge_into.c','shim/rvv_record_merge_into.h','proof/coq/RecordAssignment.v']
 inputs={n:sha(C/n)for n in names};s=dict(passed=False,whole_kernel_verified=False,scope='finite_actual_record_ordinary_helper_native_diagnostic_not_ISA_proof',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1)
 observer="""import pathlib,subprocess,sys,json
p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1]
d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/')
m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip()
assert m=='17179869184' and s=='0'
print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True)
sys.exit(subprocess.run(sys.argv[1:]).returncode)
"""
 def call(label,cmd,expected=0,asan=False):
  prefix=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',observer]if asan else['prlimit','--as=17179869184:17179869184','--']
  command=prefix+list(map(str,cmd));cwd=run/(label+'-cwd');cwd.mkdir();log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:p=subprocess.run(command,cwd=cwd,stdout=f,stderr=f,timeout=1800)
  records.append(dict(label=label,command=command,exit_code=p.returncode,expected_exit=expected,seconds=time.monotonic()-start,log_sha256=sha(log)))
  text=log.read_text();assert p.returncode==expected,(label,text[-2000:]);assert 'runtime error:'not in text and 'ERROR: AddressSanitizer'not in text and 'ERROR: LeakSanitizer'not in text
  print(label,p.returncode,flush=True);return text
 try:
  for mode,sanitizer in [('undefined','undefined'),('address','address,undefined')]:
   flags=['gcc','-std=c11','-O1','-g','-fno-fast-math','-frounding-math','-fsanitize='+sanitizer,'-fno-sanitize-recover=all','-fno-omit-frame-pointer']
   obj=run/(mode+'-adapter.o');exe=run/mode
   call(mode+'-compile',[*flags,'-include',C/'proof/native/isa_arrays.h','-DARGMAXPOOL_RVV_SPECS_H','-DARGMAXPOOL_NEON_SPECS_H','-c',C/'shim/rvv_record_consumers.c','-o',obj])
   record_obj=run/(mode+'-record.o');call(mode+'-record-compile',[*flags,'-include',C/'proof/native/isa_arrays.h','-DARGMAXPOOL_NEON_SPECS_H','-x','c','-c',C/'shim/record_consumers.c','-o',record_obj]);compare_obj=run/(mode+'-compare.o');call(mode+'-compare-compile',[*flags,'-include',C/'proof/native/isa_arrays.h','-DARGMAXPOOL_NEON_SPECS_H','-x','c','-c',C/'shim/neon_record_compare.c','-o',compare_obj]);into_obj=run/(mode+'-into.o');call(mode+'-into-compile',[*flags,'-include',C/'proof/native/isa_arrays.h','-DARGMAXPOOL_RVV_SPECS_H','-DARGMAXPOOL_NEON_SPECS_H','-x','c','-c',C/'shim/rvv_record_merge_into.c','-o',into_obj]);call(mode+'-link',[*flags,C/'proof/native/record_merge_into_regression.c',obj,record_obj,compare_obj,into_obj,'-lm','-o',exe])
   text=call(mode+'-positive',[exe],asan=mode=='address');counts=json.loads(text.splitlines()[-1]);assert counts['cases']==256*33 and counts['active_RVV_lanes']==256*sum(range(33));s[mode]=counts
   if mode=='address':assert '"actual_memory_max": "17179869184"'in text
   for name in ['one','both']:
    text=call(mode+'-negative-'+name,[exe,'--negative-'+name],expected=2,asan=mode=='address');assert 'oracle_rejected=1'in text
    if name=='both':assert 'both_comparator=1'in text
  assert s['undefined']==s['address'];assert inputs=={n:sha(C/n)for n in inputs};s.update(passed=True,independent_integer_oracle=True,shared_wrong_result_rejected=True,readonly_input_bytes_preserved=True,mutable_target_updated=True,all32_reference_assignment_bits_equal=True,inactive_values_not_compared=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof/record-merge-into-native-status.json'
 if out.exists():(C/'proof/history'/('record-native-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
