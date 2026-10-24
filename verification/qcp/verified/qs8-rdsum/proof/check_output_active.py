#!/usr/bin/env python3
"""Fresh actual C control targets; exact typed interface is required for admission."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
P=Path(__file__).resolve().parent;c=P.parent;root=next(p for p in c.parents if(p/'.git').exists());ns=json.loads((P/'originals.json').read_text())['namespace'];pa=argparse.ArgumentParser();pa.add_argument('--generate-only',action='store_true');a=pa.parse_args();run=Path(tempfile.mkdtemp(prefix='output-active-proof-',dir=c/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),ns];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();records=[];s={'passed':False,'vc_correct_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records}
def execute(cmd,label):
 command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
 with log.open('w')as f:r=subprocess.run(command,cwd=work,env=env,stdout=f,stderr=f,timeout=3600)
 records.append(dict(label=label,command=command,exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));print(label,r.returncode,flush=True)
 if r.returncode:raise RuntimeError(log.read_text()[-2500:])
def cc(stem):execute(['qcp-env','coqc','-time',*flags,coq/(stem+'.v')],stem)
try:
 for stem in ['Model','Types','OutputModel']:
  shutil.copyfile(P/'coq'/(stem+'.v'),coq/(stem+'.v'));cc(stem)
 src=c/'shim/output_active.c';expanded=run/'output_active.c';execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',expanded],'cpp');execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(expanded),'--coq-output-dir='+str(coq),'--coq-logic-path='+ns],'qcp');cc('output_active_goal');names=re.findall(r'^Axiom proof_of_(\w+) :',(coq/'output_active_goal.v').read_text(),re.M);assert names;s.update(generation_passed=True,actual_c_vcs=len(names),fields=names,goal_sha256=sha(coq/'output_active_goal.v'),cpp_sha256=sha(expanded))
 if not a.generate_only:
  shutil.copyfile(P/'coq/OutputActiveChecked.v',coq/'OutputActiveChecked.v');cc('OutputActiveChecked');final=coq/'FinalOutputActiveCheck.v';final.write_text('From '+ns+' Require Import output_active_goal OutputActiveChecked.\nModule Actual : '+ns+'.output_active_goal.VC_Correct := '+ns+'.OutputActiveChecked.CheckedOutputActive.\n'+''.join('Print Assumptions Actual.proof_of_'+n+'.\n'for n in names));cc('FinalOutputActiveCheck');text=(run/'FinalOutputActiveCheck.log').read_text();assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',text,re.M))==len(names);s.update(passed=True,vc_correct_passed=True,typed_instance=ns+'.OutputActiveChecked.CheckedOutputActive')
except Exception as e:s['error']=str(e);print(e,flush=True)
s['input_sha256']={str(p.relative_to(c)):sha(p)for p in [*list((c/'shim').glob('*.h')),c/'shim/output_active.c',P/'coq/OutputModel.v',P/'coq/Model.v']}
for p in [run/'status.json',P/('output-active-generation-status.json'if a.generate_only else'output-active-status.json')]:p.write_text(json.dumps(s,indent=2)+'\n')
print(json.dumps({k:s.get(k)for k in ['passed','generation_passed','actual_c_vcs','run_directory','error']}),flush=True);raise SystemExit(0 if(s.get('generation_passed')if a.generate_only else s['passed'])else 1)
