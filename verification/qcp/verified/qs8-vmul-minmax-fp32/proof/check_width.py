#!/usr/bin/env python3
from pathlib import Path
import subprocess,json,hashlib,tempfile,re,os,shutil
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();run=Path(tempfile.mkdtemp(prefix='width64-',dir=C/'.build'));src=C/'proof/c/type_width.c';cpp=run/'type_width.c';env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[]
def call(label,cmd,timeout=3600):
 log=run/(label+'.log');wd=run/(label+'-work');wd.mkdir();
 with log.open('w')as f:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)],cwd=wd,env=env,stdout=f,stderr=f,timeout=timeout)
 records.append({'label':label,'command':list(map(str,cmd)),'exit_code':r.returncode,'log_sha256':sha(log)});return r.returncode
assert call('CPP',['gcc','-E','-P','-CC','-nostdinc',src,'-o',cpp])==0
assert call('QCP',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(run),'--coq-logic-path=Qs8Mul'])==0
goal=run/'type_width_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==13
q=run/'coq';q.mkdir();shutil.copyfile(goal,q/goal.name);shutil.copyfile(P/'coq/Width64Checked.v',q/'Width64Checked.v');flags=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags']+['-Q',str(q),'Qs8Mul']
for mod in ['type_width_goal','Width64Checked']:assert call(mod,[*flags,q/(mod+'.v')])==0
assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'Width64Checked.log').read_text(),re.M))==13
native='#include "'+str(C/'shim/public_types.h')+'"\n#define QS8MUL_TYPES_H\n#include "'+str(C/'shim/type_width_probe.h')+'"\nint main(void){return !(width_size_t()==8 && width_i8()==1 && width_i16()==2 && width_i32()==4 && width_i64()==8 && width_u16()==2 && width_u32()==4 && width_pointer()==8 && width_size_t_unsigned()==1);}\n'
for label,code in [('native64',native),('wrong32',native.replace('#define QS8MUL_TYPES_H','#define QS8MUL_TYPES_H\n#define size_t unsigned int'))]:
 f=run/(label+'.c');f.write_text(code);exe=run/label;assert call(label+'-compile',['gcc','-std=c11',f,'-o',exe])==0;ret=call(label+'-run',[exe]);assert ret==(0 if label=='native64'else 1)
state={'passed':True,'whole_kernel_verified':False,'scope':'Actual C width and signedness probes under QCP arch64/little-endian plus independent native-width checks and rejected unsigned32 negative projection','actual_C_fields':13,'actual_C_functions':9,'typed_instance':'Qs8Mul.Width64Checked.CheckedWidth','run_directory':str(run),'goal_sha256':sha(goal),'generated_CPP_sha256':sha(cpp),'input_sha256':{str(p.relative_to(C)):sha(p)for p in [src,C/'shim/type_width_probe.h',C/'shim/types.h',P/'coq/Width64Checked.v',Path(__file__)]},'records':records,'Print_reports':13};(run/'status.json').write_text(json.dumps(state,indent=2)+'\n');(P/'width64-status.json').write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in state.items()if k not in ['records','input_sha256']},indent=2))
