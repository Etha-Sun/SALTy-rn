#!/usr/bin/env python3
"""Small actual read/cursor caller: old versus branch-preserving cut only.
Probe-only memory window 9 is not a new public kernel precondition.
"""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(t):return re.findall(r'[A-Za-z_]\w*|\d+|==|!=|<=|>=|\+\+|\+=|&&|\|\||\S',re.sub(r'/\*.*?\*/|//[^\n]*',' ',t,flags=re.S))
def main():
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='guard-cut-probe-',dir=C/'.build'));records=[];env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 s=dict(passed=False,whole_kernel_verified=False,scope='generation only: real ordinary ap_read_table body plus conditional cursor caller; small-probe memory domain only',run_directory=str(run),configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16,records=records)
 src='''#include "HEADER"
#include "READBODY"
/*@ Import Coq Require Import ArgmaxPool.ProgramModel */
/*@ Extern Coq (ap_ptr_window:APPtrMap->Z->Z->Prop) */
const float** ap_guard_cut_probe(const float** p,size_t k)
/*@ With (P:APPtrMap) n base
 Require 0<k && k==n && p==base && ap_ptr_window(P,base,9) && ap_ptr_data(P)
 Ensure ((n<=8 && __return==base+64)||(8<n && __return==base+72)) && ap_ptr_data(P) */
{
 const float** id=p+8;
 if(8<k){
 /*@ Assert GUARD k==n && p==base && id==base+64 && ap_ptr_window(P,base,9) && id!=0 && ap_ptr_present(P,id) && ap_ptr_data(P) */
 const float* ignored=ap_read_table(id);
 id+=1;
 }
 return id;
}
'''.replace('HEADER',str(C/'shim/neon_kernel_frontend.h')).replace('READBODY',str(C/'shim/read_table.c'))
 try:
  cpp=[]
  for label,guard in[('old',''),('guarded','8<k &&')]:
   d=run/label;d.mkdir();gen=d/'generated';gen.mkdir();inp=d/'guard_probe.input.c';inp.write_text(src.replace('GUARD',guard));out=d/'guard_probe.c'
   for phase,cmd in[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(inp),'-o',str(out)]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(out),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]:
    command=['prlimit','--as=17179869184:17179869184','--',*cmd];log=d/(phase+'.log');start=time.monotonic()
    try:
     with log.open('w')as f:r=subprocess.run(command,cwd=d,env=env,stdout=f,stderr=f,timeout=180).returncode
    except subprocess.TimeoutExpired:r=124
    records.append(dict(label=label+'-'+phase,command=command,exit_code=r,seconds=time.monotonic()-start,log_sha256=sha(log)));assert r==0,log.read_text()[-2000:]
   goal=gen/'guard_probe_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;s[label]=dict(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(fields),fields=fields,input_sha256=sha(inp),cpp_sha256=sha(out));cpp.append(tokens(out.read_text()))
  assert cpp[0]==cpp[1];s.update(passed=True,actual_CPP_tokens_identical=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in['passed','run_directory','old','guarded','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
