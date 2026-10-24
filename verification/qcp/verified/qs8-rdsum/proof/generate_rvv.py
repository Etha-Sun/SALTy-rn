#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,time
P=Path(__file__).resolve().parent;c=P.parent;ns='Qs8Rdsum';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
p=argparse.ArgumentParser();p.add_argument('--timeout',type=int,default=7200);p.add_argument('--annotation-path',type=Path,default=P/'c/rvv.annotations.json');p.add_argument('--status-path',type=Path,default=P/'rvv-generation-status.json');a=p.parse_args();run=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=c/'.build'));raw=(c/'impl/testRVV.c').read_text();r=json.loads((P/'repair.json').read_text());assert sha(c/'impl/testRVV.c')==r['sides']['rvv']['actual_sha256'];ann=json.loads(a.annotation_path.read_text());annotation_sha=sha(a.annotation_path);s=raw.replace('\n{','\n'+ann['contract']+'\n{',1)
for row in ann['invariants']:
 assert s.count(row['anchor'])==1,row['anchor'];s=s.replace(row['anchor'],row['text']+'\n'+row['anchor'])
for row in ann.get('assertions',[]):
 anchor=row['after'];assert s.count(anchor)==1,anchor;s=s.replace(anchor,anchor+'\n'+row['text'])
for call,where in ann['where'].items():
 assert call in s,call;s=s.replace(call,call+' /*@ where '+where+' */')
assert tokens(s)==tokens(raw);prefix='#include "'+str(c/'shim/rvv_frontend.h')+'"\n'+''.join('#include \"'+str(c/'shim'/h)+'\"\n'for h in ann.get('additional_frontend_headers',[]))
for filename,text in [('annotated.c',s),('raw.c',raw)]:
 (run/filename).write_text(prefix+text)
for src,dst in [('annotated.c','rvv_unit.c'),('raw.c','raw.expanded.c')]:subprocess.run(['gcc','-E','-P','-CC','-nostdinc',run/src,'-o',run/dst],cwd=run,check=True,timeout=60)
assert tokens((run/'rvv_unit.c').read_text())==tokens((run/'raw.expanded.c').read_text());cmd=['prlimit','--as=17179869184:17179869184','--','/tmp/qcp214-src/linux-binary/symexec','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'rvv_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path='+ns];work=run/'qcp-work';work.mkdir();t=time.monotonic()
with(run/'qcp.log').open('w')as f:
 try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
 except subprocess.TimeoutExpired:code=124
goal=run/'rvv_unit_goal.v';s={'generation_passed':code==0,'whole_kernel_verified':False,'scope':'repaired actual RVV kernel generation only','run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'raw_c_sha256':sha(c/'impl/testRVV.c'),'annotation_sha256':annotation_sha,'annotation_path':str(a.annotation_path),'same_raw_tokens':True,'same_frontend_cpp_tokens':True,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0,'cpp_sha256':sha(run/'rvv_unit.c'),'goal_sha256':sha(goal)if goal.exists()else None}
for p in[run/'status.json',a.status_path]:p.write_text(json.dumps(s,indent=2)+'\n')
print(json.dumps(s),flush=True)
if code:print((run/'qcp.log').read_text()[-5000:],flush=True)
raise SystemExit(code)
