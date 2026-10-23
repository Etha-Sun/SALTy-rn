#!/usr/bin/env python3
"""Replay original C negation UB with both INT_MIN parameter fields."""
from pathlib import Path
import os,json,hashlib,subprocess,tempfile,time,resource
resource.setrlimit(resource.RLIMIT_CORE,(0,0));case=Path(__file__).resolve().parent.parent;run=Path(tempfile.mkdtemp(prefix='original-negation-',dir=case/'.build'));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[];sources=[case/'proof/original/testNEON.c',case/'proof/original/testRVV.c',case/'shim/runtime.h',case/'shim/scalar.h',case/'shim/scalar.c'];before={str(p.relative_to(case)):sha(p)for p in sources};status={'passed':False,'formal_proof':False,'whole_kernel_verified':False,'scope':'Original unary-negation UB only; native runtime is finite C-shim context, not an ISA proof','run_directory':str(run),'records':records}
def execute(cmd,label,expected):
 command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
 with log.open('w')as f:r=subprocess.run(command,cwd=run,stdout=f,stderr=f,timeout=1800)
 records.append({'label':label,'command':command,'exit_code':r.returncode,'expected_exit_code':expected,'seconds':time.monotonic()-t,'log_sha256':sha(log)});assert r.returncode==expected,(label,r.returncode,log.read_text()[-2000:]);return log.read_text()
try:
 for side,label in [('neon','NEON'),('rvv','RVV')]:
  code='#include <stdio.h>\n#include <limits.h>\n#include "'+str(case/'shim/runtime.h')+'"\n#include "'+str(case/'proof/original'/('test'+label+'.c'))+'"\nint main(int argc,char**argv){struct xnn_qs8_lrelu_params p={{0,0,0,0}};if(argc>1&&argv[1][0]==\'p\')p.scalar.positive_multiplier=INT_MIN;else p.scalar.negative_multiplier=INT_MIN;int8_t input[8]={0},output[1]={0};test_'+side+'(1,input,output,&p);printf("%d\\n",(int)output[0]);return 0;}\n';src=run/(side+'.c');src.write_text(code);exe=run/side;execute(['gcc','-DQCP_NATIVE','-O1','-g','-std=c11','-fsanitize=undefined','-fno-sanitize-recover=all',src,case/'shim/scalar.c','-o',exe],side+'-compile',0)
  for field,arg in [('positive_multiplier','p'),('negative_multiplier','n')]:
   text=execute([exe,arg],side+'-'+field,1);assert 'negation of -2147483648'in text and 'cannot be represented'in text
 assert all(sha(case/n)==v for n,v in before.items());snapshot=run/'input-sources';snapshot.mkdir();
 for n in before:
  dest=snapshot/n;dest.parent.mkdir(parents=True,exist_ok=True);dest.write_bytes((case/n).read_bytes())
 status.update(passed=True,input_sha256=before,source_identity_stable=True,system_headers_not_hashed=True,counterexamples=4,input={'n':1,'input':[0],'input_padding_zeros':7,'input_zero_point':0,'output_zero_point':0,'one_multiplier':-2147483648,'other_multiplier':0})
except Exception as e:status['error']=str(e);print(e,flush=True)
destination=case/'proof/evidence/original-negation.json'
if destination.exists():
 history=case/'proof/history';history.mkdir(exist_ok=True);(history/('original-negation-'+sha(destination)+'.json')).write_bytes(destination.read_bytes())
(run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(case/'proof/evidence/original-negation.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','counterexamples','run_directory','error']}));raise SystemExit(0 if status['passed']else 1)
