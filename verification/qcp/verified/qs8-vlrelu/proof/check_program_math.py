#!/usr/bin/env python3
"""Fresh list/chunk and mask algebra; not C-body or whole-kernel verification."""
from pathlib import Path
import os,json,hashlib,subprocess,tempfile,time,shutil,re
case=Path(__file__).resolve().parent.parent;root=next(p for p in case.parents if(p/'.git').exists());run=Path(tempfile.mkdtemp(prefix='program-math-',dir=case/'.build'));coq=run/'coq';coq.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();config=root/'.build/simple-kernels-bootstrap/coq-flags.json';flags=json.loads(config.read_text())['flags'][2:]+['-Q',str(coq),'Qs8Lrelu'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[]
names=['Model','Types','ScalarFacts','LreluModel','LreluFacts','MemoryModel','NeonStoreModel','RvvModel','ProgramModel','ProgramFacts'];inputs={n:sha(case/n)for n in ['proof/check_program_math.py',*[f'proof/coq/{n}.v'for n in names]]};status={'passed':False,'whole_kernel_verified':False,'scope':'Mask and generic map/chunk facts over the four-parameter observation function; not C or kernel proof','run_directory':str(run),'records':records,'input_sha256':inputs,'config_sha256':sha(config),'per_process_memory_GiB':16}
def cc(n):
 cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(n+'.v'))];log=run/(n+'.log');t=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=3600).returncode
  except subprocess.TimeoutExpired:code=124
 records.append({'module':n,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});print(n,code,flush=True)
 assert code==0,log.read_text()[-3000:]
try:
 for n in names:
  shutil.copyfile(case/'proof/coq'/(n+'.v'),coq/(n+'.v'));cc(n)
 fields=[(m,n)for m in ['LreluFacts','ProgramFacts']for n in re.findall(r'^Lemma\s+(\w+)\s*:',(coq/(m+'.v')).read_text(),re.M)];assert len(fields)==len(set(fields))
 gate=coq/'ProgramMathGate.v';gate.write_text('From Qs8Lrelu Require Import LreluFacts ProgramFacts.\n'+''.join(f'Print Assumptions Qs8Lrelu.{m}.{n}.\n'for m,n in fields));cc('ProgramMathGate');assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'ProgramMathGate.log').read_text(),re.M))==len(fields)
 assert all(sha(case/n)==d for n,d in inputs.items())and sha(config)==status['config_sha256'];status.update(passed=True,ordinary_coq_modules=11,printed_lemmas=len(fields),compiled_source_sha256={p.name:sha(p)for p in coq.glob('*.v')},no_component_vo_reused=True)
except Exception as e:status['error']=str(e);print(e,flush=True)
p=case/'proof/program-math-status.json'
if p.exists():
 h=case/'proof/history';h.mkdir(exist_ok=True);shutil.copyfile(p,h/('program-math-status-'+sha(p)+'.json'))
for p in [run/'status.json',case/'proof/program-math-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print('RUN',run,flush=True);raise SystemExit(0 if status['passed']else 1)
