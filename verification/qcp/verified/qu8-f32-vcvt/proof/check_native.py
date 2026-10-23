#!/usr/bin/env python3
"""Finite actual repaired/original kernel regression; not a formal proof."""
import hashlib,json,subprocess,tempfile,time,os
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent;HERE=CASE/'proof'
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
run=Path(tempfile.mkdtemp(prefix='native-ubsan-',dir=CASE/'.build'));records=[]
def execute(cmd,label):
 cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic();p=subprocess.run(cmd,cwd=run,capture_output=True,text=True,timeout=1800,env=dict(os.environ,UBSAN_OPTIONS='halt_on_error=1'));log=run/(label+'.log');log.write_text(p.stdout+p.stderr);records.append({'label':label,'command':list(map(str,cmd)),'exit_code':p.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)});return p
base=['gcc','-std=c11','-O1','-g','-frounding-math','-ffp-contract=off','-fsanitize=undefined','-fno-sanitize-recover=all'];src=CASE/'shim/harness.c';repaired=run/'repaired';original=run/'original'
assert execute([*base,src,'-lm','-o',repaired],'compile-repaired').returncode==0
assert execute([*base,'-DQCP_ORIGINAL_NEON',src,'-lm','-o',original],'compile-original').returncode==0
bad=execute([original,'boundary'],'original-boundary');assert bad.returncode!=0 and 'negation of -2147483648'in bad.stderr
ok=execute([repaired,'boundary'],'repaired-boundary');assert ok.returncode==0
alltest=execute([repaired],'repaired-regression');assert alltest.returncode==0 and 'failures=0'in alltest.stdout
repair=json.loads((HERE/'repair.json').read_text());repair['counterexample'].update(ubsan_run_pending=False,ubsan_output=bad.stdout+bad.stderr,ubsan_log_sha256=hashlib.sha256((bad.stdout+bad.stderr).encode()).hexdigest());(HERE/'repair.json').write_text(json.dumps(repair,indent=2)+'\n')
s={'passed':True,'whole_kernel_verified':False,'scope':'Actual original INT32_MIN UB counterexample and repaired array-C-shim/public-wrapper finite UBSan oracle/frame/negative-control regression. Not formal ISA or full proof.','run_directory':str(run),'original_ubsan_exit_code':bad.returncode,'repaired_ubsan_exit_code':ok.returncode,'ubsan_output':alltest.stdout,'records':records,'input_sha256':{str(p.relative_to(CASE)):sha(p)for p in[src,CASE/'shim/runtime.h',CASE/'impl/testNEON.c',CASE/'impl/testRVV.c',CASE/'spec.c',HERE/'original/testNEON.c',HERE/'original/testRVV.c',HERE/'repair.patch',HERE/'rvv-compatibility.patch']}}
for p in[run/'status.json',HERE/'repair-native-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
print(json.dumps(s,indent=2))
