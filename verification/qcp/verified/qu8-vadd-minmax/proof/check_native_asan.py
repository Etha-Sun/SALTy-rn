#!/usr/bin/env python3
"""Finite actual scalar-field body/caller ASan+UBSan replay in a checked16GiB cgroup."""
from pathlib import Path
import argparse,hashlib,json,re,shutil,subprocess,tempfile,time,shlex
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 r=Path(tempfile.mkdtemp(prefix='native-asan-',dir=C/'.build'));records=[];s=dict(passed=False,whole_kernel_verified=False,formal_proof=False,scope='finite actual scalar-field helper C+repaired kernels+public equivalent execution; unsigned64 self-contained TU; no ABI/ISA theorem',run_directory=str(r),records=records)
 prefix=['systemd-run', '--user', '--wait', '--pipe', '--quiet', '-p', 'MemoryMax=17179869184', '-p', 'MemorySwapMax=0', 'python3', '-c', "import pathlib,subprocess,sys,json;p=pathlib.Path('/proc/self/cgroup').read_text().strip().split('::',1)[1];d=pathlib.Path('/sys/fs/cgroup')/p.lstrip('/');m=(d/'memory.max').read_text().strip();s=(d/'memory.swap.max').read_text().strip();assert m=='17179869184'and s=='0';print(json.dumps({'actual_memory_max':m,'actual_memory_swap_max':s}),flush=True);sys.exit(subprocess.run(sys.argv[1:]).returncode)"]
 def execute(label,cmd,success=True):
  log=r/(label+'.log');t=time.monotonic()
  runtime=label.endswith('-run');command=[*prefix,*map(str,cmd)]if runtime else['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
  with log.open('w')as f:p=subprocess.run(command,cwd=r,stdout=f,stderr=f,timeout=600)
  records.append(dict(label=label,command=command,exit_code=p.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));assert(p.returncode==0)==success,label+':'+log.read_text()[-2000:];return log.read_text()
 try:
  dep=r/'dependencies.mk';execute('dependencies',['gcc','-nostdinc','-MM','-MT','fieldtest',C/'shim/native_field_kernel.c','-MF',dep]);paths=[Path(x).resolve()for x in shlex.split(dep.read_text().replace('\\\n',' ').split(':',1)[1])];assert paths and all(p.is_relative_to(C)for p in paths);files=sorted({str(p.relative_to(C))for p in paths}|{'proof/check_native_asan.py','proof/semantics.json','proof/coq/Model.v','proof/coq/ShiftFacts.v','proof/type-width-status.json'});inputs={n:sha(C/n)for n in files};s['input_sha256']=inputs;s['recursive_c_dependencies']=sorted(str(p.relative_to(C))for p in paths);assert json.loads((C/'proof/type-width-status.json').read_text())['passed']
  for variant in ['correct','shared-wrong-s32']:
   work=r/variant;work.mkdir()
   for p in paths:
    rel=p.relative_to(C);(work/rel).parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(p,work/rel)
   if variant!='correct':
    source=work/'shim/scalar.c';text=source.read_text();a=text.index('int32_t qcp_qu_s32(');brace=text.index('{',a);end=text.index('}',brace);original=text[brace:end+1];assert 'return' in original;source.write_text(text[:brace]+'{return 0;}'+text[end+1:]);s['wrong_result_mutation']=dict(function='qcp_qu_s32',original_body=original,replacement='{return 0;}')
   exe=work/'test';execute(variant+'-compile',['gcc','-std=c11','-O1','-g','-nostdinc','-Werror=implicit-function-declaration','-fsanitize=address,undefined','-fno-omit-frame-pointer','-fno-sanitize-recover=all',work/'shim/native_field_kernel.c','-o',exe]);output=execute(variant+'-run',[exe],variant=='correct')
   if variant=='correct':
    m=re.search(r'passed calls=(\d+) lanes_per_side=(\d+)',output);assert m and 'public_wrapper=1'in output and 'sizeof_size_t=8'in output;s.update(cases=int(m[1]),public_wrapper_cases=int(m[1]),lanes_per_side_per_path=int(m[2]),all256_low_byte_controls=True,unordered_bounds_sampled=True,input_param_and_output_canaries_checked=True,source_dtype='size_t unsigned long long64; no system size_t header or cross-TU size_t library prototype; printf formats explicitly ULL for ULL values')
   else:
    m=re.search(r'expected=(-?\d+) neon=(-?\d+) rvv=(-?\d+)',output);assert m and m[2]==m[3]and m[1]!=m[2];assert 'AddressSanitizer'not in output and 'LeakSanitizer'not in output;s['shared_wrong_result_rejected']=True
  assert inputs=={n:sha(C/n)for n in files};s.update(passed=True,ASan_UBSan=True,actual_memory_max=17179869184,actual_memory_swap_max=0,parallel_jobs=16)
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=C/'proof/native-asan-status.json'
 if dest.exists():(C/'proof/history'/('native-asan-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((r/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','cases','public_wrapper_cases','lanes_per_side_per_path','shared_wrong_result_rejected','run_directory','error']},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
