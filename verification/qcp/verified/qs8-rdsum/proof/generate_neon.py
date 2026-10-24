#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,time
P=Path(__file__).resolve().parent;c=P.parent;ns='Qs8Rdsum';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
p=argparse.ArgumentParser();p.add_argument('--timeout',type=int,default=7200);p.add_argument('--stack-mib',type=int,default=256);p.add_argument('--trace',action='store_true');a=p.parse_args();run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=c/'.build'));raw=(c/'impl/testNEON.c').read_text();r=json.loads((P/'repair.json').read_text());assert sha(c/'impl/testNEON.c')==r['sides']['neon']['actual_sha256'];ann=json.loads((P/'c/neon.annotations.json').read_text());annotation_sha=sha(P/'c/neon.annotations.json');s=raw.replace('\n{','\n'+ann['contract']+'\n{',1)
for row in ann['invariants']:
 pattern=r'(?m)^'+re.escape(row['anchor'])+r'$';matches=list(re.finditer(pattern,s));assert len(matches)==1,(row['anchor'],len(matches));m=matches[0]
 if row.get('placement')=='do_condition':s=s[:m.start()]+'    }\n'+row['text']+'\n    while (channels != 0);'+s[m.end():]
 else:s=s[:m.start()]+row['text']+'\n'+s[m.start():]
for row in ann.get('assertions',[]):
 anchor=row['after'];assert s.count(anchor)==1,anchor;s=s.replace(anchor,anchor+'\n'+row['text'])
for call,where in ann['where'].items():
 assert call in s,call;s=s.replace(call,call+' /*@ where '+where+' */')
counters={};edits=[]
for row in ann['ordered_where']:
 call=row['call'];index=counters.get(call,0);matches=list(re.finditer(re.escape(call),s));assert index<len(matches),(call,index,len(matches));m=matches[index];counters[call]=index+1;edits.append((m.end(),' /*@ where '+row['where']+' */'))
for pos,text in sorted(edits,reverse=True):s=s[:pos]+text+s[pos:]
assert tokens(s)==tokens(raw);prefix='#include "'+str(c/'shim/neon_frontend.h')+'"\n'+''.join('#include \"'+str(c/'shim'/h)+'\"\n'for h in ann.get('additional_frontend_headers',[]))
for filename,text in [('annotated.c',s),('raw.c',raw)]:
 (run/filename).write_text(prefix+text)
for src,dst in [('annotated.c','neon_unit.c'),('raw.c','raw.expanded.c')]:subprocess.run(['gcc','-E','-P','-CC','-nostdinc',run/src,'-o',run/dst],cwd=run,check=True,timeout=60)
assert tokens((run/'neon_unit.c').read_text())==tokens((run/'raw.expanded.c').read_text());cmd=['prlimit','--as=17179869184:17179869184','--stack='+str(a.stack_mib*1048576)+':'+str(a.stack_mib*1048576),'--','/tmp/qcp214-src/linux-binary/symexec','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path='+ns];cmd=[x for x in cmd if not(a.trace and x=='--no-exec-info')];work=run/'qcp-work';work.mkdir();t=time.monotonic()
with(run/'qcp.log').open('w')as f:
 try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
 except subprocess.TimeoutExpired:code=124
goal=run/'neon_unit_goal.v';s={'generation_passed':code==0,'whole_kernel_verified':False,'scope':'repaired actual NEON kernel generation only','run_directory':str(run),'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'raw_c_sha256':sha(c/'impl/testNEON.c'),'annotation_sha256':annotation_sha,'same_raw_tokens':True,'same_frontend_cpp_tokens':True,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0,'cpp_sha256':sha(run/'neon_unit.c'),'goal_sha256':sha(goal)if goal.exists()else None}
for p in[run/'status.json',P/'neon-generation-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
print(json.dumps(s),flush=True)
if code:print((run/'qcp.log').read_text()[-5000:],flush=True)
raise SystemExit(code)
