#!/usr/bin/env python3
"""Real C kernels in separately reviewed Arm/RVV finite ISA emulation.
The scalar oracle shares no vector implementation/helper with either path.
Native tests are not formal verification or execution on physical ISAs.
"""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time,threading,shlex
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--sanitizer',choices=['undefined','address'],default='undefined');ap.add_argument('--jobs',type=int,default=32);ap.add_argument('--backend',choices=['arrays','fields'],default='arrays');a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='native-'+a.backend+'-'+a.sanitizer+'-',dir=C/'.build'));records=[];lock=threading.Lock()
 files=['proof/native/isa_arrays.h','proof/native/regression.c','impl/testNEON.c','impl/testRVV.c','proof/check_native.py','shim/qm_scale_is_nan.c','shim/scalar_nan.h','shim/load_into.c','shim/load_into.h','spec.c','shim/public_types.h','shim/record_input_consumers.c','shim/record_fp_consumers.c','shim/record_compute.c','shim/record_compute.h','shim/record_sdk.h'];
 if a.backend=='fields':files+=['proof/native/isa_fields.h','proof/native/field_kernels.h','proof/native-field-source-ledger.json','proof/prepare_native_fields.py']+[str(p.relative_to(C))for p in sorted((C/'shim').glob('*'))if p.suffix in ['.c','.h']and str(p.relative_to(C))not in files]
 inputs={n:sha(C/n)for n in files}
 prefix=['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3','-c',"import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"]
 def execute(label,command,runtime=False):
  command=list(map(str,command));command=[*prefix,*command]if runtime and a.sanitizer=='address'else['prlimit','--as=17179869184:17179869184','--',*command];log=run/(label+'.log');start=time.monotonic()
  with log.open('w')as f:code=subprocess.run(command,cwd=run,stdout=f,stderr=f,timeout=7200).returncode
  row=dict(label=label,command=command,exit_code=code,seconds=time.monotonic()-start,log_sha256=sha(log))
  with lock:records.append(row);(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
  return code,log.read_text()
 def variant(kind):
  work=run/kind;work.mkdir()
  for n in files:
   target=work/n;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(C/n,target)
  p=work/('proof/native/isa_fields.h'if a.backend=='fields'else'proof/native/isa_arrays.h');s=p.read_text();mutation=None
  if kind=='wrong-one':
   old='int8x8_t vqmovn_s16(int16x8_t a){int8x8_t r;for(size_t j=0;j<8;j++)r.v[j]=qm_sat8(a.v[j]);return r;}'
   new=old.replace('qm_sat8(a.v[j])','0');assert s.count(old)==1;s=s.replace(old,new);mutation=dict(function='vqmovn_s16',old=old,new=new)
  if kind=='wrong-both':
   old='int8_t qm_sat8(int64_t x){return x>INT8_MAX?INT8_MAX:x<INT8_MIN?INT8_MIN:(int8_t)x;}'
   new='int8_t qm_sat8(int64_t x){return 0;}';assert s.count(old)==1;s=s.replace(old,new);mutation=dict(function='qm_sat8',old=old,new=new)
  p.write_text(s)
  depcmd=['gcc',*(['-DQM_FIELD_BACKEND']if a.backend=='fields'else[]),'-std=c11','-MM',str(work/'proof/native/regression.c')]
  dep=subprocess.run(depcmd,cwd=work,stdout=subprocess.PIPE,stderr=subprocess.PIPE,text=True,timeout=60);assert dep.returncode==0,dep.stderr
  (work/'local-dependencies.mk').write_text(dep.stdout);dependency_sha256={}
  for item in shlex.split(dep.stdout.replace('\\\n',' '))[1:]:
   f=Path(item).resolve();assert f.is_relative_to(work),str(f);key=str(f.relative_to(work));assert key in files,('unrecorded actual include',key);dependency_sha256[key]=sha(f)
  exe=work/'test';san='address,undefined'if a.sanitizer=='address'else'undefined';code,out=execute(kind+'-compile',['gcc',*(['-DQM_FIELD_BACKEND']if a.backend=='fields'else[]),'-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fsanitize='+san,'-fno-omit-frame-pointer','-fno-sanitize-recover=all',work/'proof/native/regression.c','-lm','-o',exe]);assert code==0,out[-2000:]
  code,out=execute(kind+'-run',[exe],True);expected={'correct':0,'wrong-one':2,'wrong-both':3}[kind];assert code==expected,out[-2000:];assert 'AddressSanitizer'not in out and'LeakSanitizer'not in out and'runtime error:'not in out
  if a.sanitizer=='address':assert '"actual_memory_max": "17179869184"'in out and'"actual_memory_swap_max": "0"'in out
  result=dict(kind=kind,passed=True,exit_code=code,mutation=mutation,generated_header_sha256=sha(p),actual_recursive_local_input_sha256=dependency_sha256,actual_recursive_local_input_count=len(dependency_sha256),dependency_command=depcmd,executable_sha256=sha(exe))
  if kind=='correct':
   m=re.search(r'passed cases=(\d+) lanes_per_side=(\d+) partial_alias_cases=(\d+) identical_input_cases=(\d+) exhaustive_pair_scales=(\d+) all65536_output_offsets=1',out);assert m;result.update(cases=int(m[1]),lanes_per_side=int(m[2]),partial_alias_cases=int(m[3]),identical_input_cases=int(m[4]),exhaustive_pair_scales=int(m[5]),all65536_output_offsets=True)
  else:
   m=re.search(r'expected=(-?\d+) neon=(-?\d+) rvv=(-?\d+)',out);assert m
   if kind=='wrong-both':assert m[2]==m[3]and m[1]!=m[2]
   else:assert m[2]!=m[3]
  print(kind,'passed',flush=True);return result
 state=dict(passed=False,whole_kernel_verified=False,scope='Finite independently distinct Arm/RVV emulation of actual repaired C kernels plus scalar oracle; not ISA execution or formal proof',sanitizer=a.sanitizer,backend=a.backend,configured_parallel_jobs=32,per_process_memory_GiB=16,run_directory=str(run),input_sha256=inputs,records=records)
 try:
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:variants=list(pool.map(variant,['correct','wrong-one','wrong-both']))
  assert inputs=={n:sha(C/n)for n in files};good=next(x for x in variants if x['kind']=='correct');state.update(passed=True,variants=variants,**{k:v for k,v in good.items()if k not in ['kind','passed','exit_code','mutation','generated_header_sha256']})
  if a.sanitizer=='address':state.update(ASan_UBSan=True,actual_memory_max=17179869184,actual_memory_swap_max=0)
 except Exception as e:state['error']=str(e)
 (run/'status.json').write_text(json.dumps(state,indent=2)+'\n');dest=C/'proof'/('native-'+('field-'if a.backend=='fields'else'')+a.sanitizer+'-status.json')
 if dest.exists():(C/'proof/history'/(dest.stem+'-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in state.items()if k not in ['records','input_sha256','variants']},indent=2));return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
