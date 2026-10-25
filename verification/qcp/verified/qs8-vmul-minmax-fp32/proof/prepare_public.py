#!/usr/bin/env python3
from pathlib import Path
import json,re,hashlib,subprocess,os,tempfile,time
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def toks(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
raw=(C/'spec.c').read_text();ann=raw
inv='/*@ Inv Assert 0<n && n<=18446744073709551615 && n==n@pre && left==left@pre && right==right@pre && 0<=i && i<=n && CharArray::full(left,n,L) * CharArray::full(right,n,L) */'
ann=ann.replace(' while(i<n){',inv+'\n while(i<n){')
where='/*@ where M=M,AZ=AZ,BZ=BZ,Scale=Scale,OZ=OZ,Lo=Lo,Hi=Hi */'
for side,out in [('neon','left'),('rvv','right')]:ann=ann.replace(f'test_{side}(n,input_a,input_b,{out},params);',f'test_{side}(n,input_a,input_b,{out},params) '+where+';')
ann=ann.replace('compare_outputs(n,left,right);','compare_outputs(n,left,right) /*@ where L=qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi) */;')
assert toks(raw)==toks(ann)
run=Path(tempfile.mkdtemp(prefix='public-goals-',dir=C/'.build'));(run/'raw.c').write_text(raw);src=run/'public_unit.input.c';src.write_text(ann);cpp=run/'public_unit.c';log=run/'cpp.log'
with log.open('w')as f:r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-DQCP_FORMAL','-I',str(C),str(src),'-o',str(cpp)],stdout=f,stderr=f)
assert r.returncode==0,log.read_text();env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};wd=run/'qcp-work';wd.mkdir();cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(run),'--coq-logic-path=Qs8Mul','-slp',str(C/'shim'),'Qs8Mul','-slp',str(P/'c'),'Qs8Mul'];t=time.monotonic()
with(run/'qcp.log').open('w')as f:
 try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=21600).returncode
 except subprocess.TimeoutExpired:code=124
goal=run/'public_unit_goal.v';st={'generation_passed':code==0,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'source_sha256':sha(C/'spec.c'),'cpp_sha256':sha(cpp),'annotation_sha256':hashlib.sha256(ann.encode()).hexdigest(),'same_raw_tokens':True,'goal_sha256':sha(goal)if goal.exists()else None,'actual_C_fields':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0};(run/'status.json').write_text(json.dumps(st,indent=2)+'\n');(P/'public-generation-status.json').write_bytes((run/'status.json').read_bytes());print(json.dumps(st,indent=2));raise SystemExit(0 if code==0 else 1)
