from pathlib import Path
import os,subprocess,json,hashlib,tempfile,time,re
P=Path(__file__).resolve().parent;c=P.parent;root=next(p for p in c.parents if(p/'.git').exists());run=Path(tempfile.mkdtemp(prefix='wrapper-vcs-',dir=c/'.build'));env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();src=c/'spec.c';cpp=run/'public_wrapper.c';subprocess.run(['gcc','-E','-P','-CC','-nostdinc',src,'-o',cpp],check=True,cwd=run);cmd=['prlimit','--as=17179869184:17179869184','--','qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(run),'--coq-logic-path=Qu8Rsum','-slp',str(P/'c'),'Qu8Rsum'];t=time.monotonic()
with(run/'qcp.log').open('w')as f:r=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=3600)
g=run/'public_wrapper_goal.v';d={'generation_passed':r.returncode==0,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'source_sha256':sha(src),'cpp_sha256':sha(cpp),'actual_c_vcs':len(re.findall(r'^Axiom proof_of_',g.read_text(),re.M))if g.exists()else 0}
for p in [run/'status.json',P/'wrapper-generation-status.json']:p.write_text(json.dumps(d,indent=2)+'\n')
print(json.dumps(d,indent=2),flush=True)
if r.returncode:print((run/'qcp.log').read_text()[-2000:],flush=True)
raise SystemExit(r.returncode)
