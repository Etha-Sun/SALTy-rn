#!/usr/bin/env python3
"""Finite sanitizer regression using unchanged originals, public spec and independent oracle."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
LOCK={'neon':('kernels/source/f32-vcmul.c','impl/testNEON.c','7423e0c197640edfd66522ce2909e9e3e22571ee23c015b7feea32651b661294'),
      'rvv':('kernels/target/f32-vcmul.c','impl/testRVV.c','cc6c77956d0bbcc16d0ab84f78cc35c195634e25b6c02b9f2fd465b8c3c13486')}
def audit(overrides=None):
 overrides=overrides or {};original=json.loads((HERE/'originals.json').read_text())
 assert original['upstream_commit']=='be16280c7812a7459c26c3ce82a47339a3d07718'
 for side,(source,copy,digest)in LOCK.items():
  assert original['files'][side]=={'path':source,'copy':copy,'sha256':digest}
  selected=overrides.get(side,CASE/copy)
  if sha(selected)!=digest or sha(ROOT/source)!=digest or selected.read_bytes()!=(ROOT/source).read_bytes():raise ValueError('Original source identity mismatch: '+side)
def main():
 run=Path(tempfile.mkdtemp(prefix='native-',dir=CASE/'.build'));records=[]
 status={'passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records,
 'scope':'Finite native C-shim regression only; no complete kernel theorem or hardware execution.',
 'configuration':{'VLEN':128,'SEW':32,'LMUL':4,'VLMAX':16,'vl':'min(AVL,16)','rounding':'RNE','gradual_underflow':True},
 'observation':'Numerical equality or both NaN; independent oracle additionally checks exact non-NaN bits including zero sign.',
 'boundary':'Runtime array structs are distinct from formal scalar-field structs; no formal ABI or ISA correspondence proved.'}
 def execute(command,label,expected=0):
  command=list(map(str,command));start=time.monotonic();env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
  result=subprocess.run(command,cwd=run,env=env,capture_output=True,text=True,timeout=180)
  log=run/(label+'.log');log.write_text(result.stdout+result.stderr)
  records.append({'command':command,'label':label,'exit_code':result.returncode,'expected_exit_code':expected,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  if result.returncode!=expected:raise RuntimeError(label+': '+(result.stdout+result.stderr)[-6000:])
  return result.stdout,result.stderr
 try:
  audit();inputs=[CASE/'spec.c',HERE/'originals.json',HERE/'semantics.json',Path(__file__),CASE/'impl/testNEON.c',CASE/'impl/testRVV.c',CASE/'shim/runtime/intrinsics.h',CASE/'shim/runtime/harness.c']
  hashes={str(p.relative_to(CASE)):sha(p)for p in inputs};status['input_hashes']=hashes
  controls=[]
  for side,(_,copy,_)in LOCK.items():
   altered=run/('mutated-'+side+'.c');altered.write_bytes((CASE/copy).read_bytes()+b'\n/* identity negative control */\n')
   try:audit({side:altered})
   except ValueError as error:controls.append({'side':side,'rejected':True,'reason':str(error)})
   else:raise RuntimeError('Source identity control accepted mutation')
  cc=shutil.which('gcc');assert cc,'gcc missing'
  status['compiler']=subprocess.check_output([cc,'--version'],text=True).splitlines()[0]
  flags=['-std=c11','-O1','-g','-fno-pie','-no-pie','-fno-omit-frame-pointer','-fno-fast-math','-ffp-contract=off','-frounding-math','-fsanitize=address,undefined','-fno-sanitize-recover=all','-DQCP_VCMUL_RUNTIME','-include',CASE/'shim/runtime/intrinsics.h']
  sources=[CASE/'shim/runtime/harness.c',CASE/'spec.c',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c']
  binary=run/'native';execute([cc,*flags,*sources,'-lm','-o',binary],'build');stdout,_=execute([binary],'native')
  result=json.loads(stdout.strip().splitlines()[-1]);assert result['passed']and result['known_two_rounding_result_checked']and result['wrong_result_rejected']
  mutant=run/'fused';execute([cc,*flags,'-DVCMUL_FUSED_NEGATIVE_CONTROL',*sources,'-lm','-o',mutant],'fused-build')
  _,stderr=execute([mutant,'--fused-control'],'fused-control',1)
  assert 'oracle mismatch'in stderr and 'ERROR: AddressSanitizer'not in stderr and 'runtime error:'not in stderr,'Wrong control failure reason'
  shared=run/'wrong-shared-model';execute([cc,*flags,'-DVCMUL_WRONG_SHARED_MUL',*sources,'-lm','-o',shared],'shared-wrong-model-build')
  _,shared_stderr=execute([shared,'--shared-model-control'],'shared-wrong-model-control',1)
  assert 'oracle mismatch'in shared_stderr and 'ERROR: AddressSanitizer'not in shared_stderr and 'runtime error:'not in shared_stderr,'Shared model did not fail for the intended oracle mismatch'
  audit();assert all(sha(CASE/k)==v for k,v in hashes.items()),'Inputs changed'
  status.update(result,passed=True,source_mutation_controls=controls,fused_substitution_rejected=True,
    shared_wrong_multiply_rejected_by_oracle=True,sanitizers=['address','undefined'],input_and_padding_frame_preserved=True,params_frame_preserved=True,output_prefix_suffix_frame_preserved=True,
    input_allocation_floats='exactly 2*n+3 per input',output_observation_count='all 2*n outputs per side',
    oracle='Independent scalar: each finite product exact in binary64 and rounded to binary32 before scalar binary64 addition/subtraction and final binary32 rounding; both-NaN accepted.',execution_concurrency=1)
 except Exception as error:status['error']=str(error);raise
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'native-status.json').write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps({k:status[k]for k in ['passed','cases','output_lanes_per_side','fused_substitution_rejected','run_directory']}))
if __name__=='__main__':main()
