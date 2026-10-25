import subprocess,os,json
from pathlib import Path
W=Path(__file__).parent
commands=[['gcc', '-std=c11', '-O1', '-fno-fast-math', '-ffp-contract=off', '-fsanitize=address,undefined', '-fno-omit-frame-pointer', '/srv/home/yuechunsun/tools/qcp-worker-qd8-verified/verification/qcp/candidates/qs8-qc8w-gemm-minmax-fp32/.build/native04/native/snapshot/proof/native/check.c', '-lm', '-o', '/srv/home/yuechunsun/tools/qcp-worker-qd8-verified/verification/qcp/candidates/qs8-qc8w-gemm-minmax-fp32/.build/native04/native/repaired/run'], ['/srv/home/yuechunsun/tools/qcp-worker-qd8-verified/verification/qcp/candidates/qs8-qc8w-gemm-minmax-fp32/.build/native04/native/repaired/run']]
expected=[0, 0]
results=[]
for i,cmd in enumerate(commands):
 with(W/('step'+str(i)+'.log')).open('w')as log:
  r=subprocess.run(['/usr/bin/prlimit','--cpu=180','--',*cmd],stdout=log,stderr=subprocess.STDOUT,timeout=210,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0','UBSAN_OPTIONS':'halt_on_error=1'})
 results.append({'command':cmd,'exit':r.returncode,'expected_exit':expected[i]})
 if r.returncode!=expected[i]:break
passed=len(results)==2 and all(r['exit']==r['expected_exit']for r in results)
(W/'result.json').write_text(json.dumps({'passed':passed,'results':results},indent=2)+'\n')
raise SystemExit(not passed)
