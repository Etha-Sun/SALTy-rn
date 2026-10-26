#!/usr/bin/env python3
"""Retain original immutable batch Carg and final input/output local frames.
Private alternate actual generation; no C/spec/model domain changes.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
import generate_rvv as B
C=B.C;R=B.R;sha=B.sha;tokens=B.tokens
old_permanent=B.permanent
def render():
 previous=B.permanent
 B.permanent=lambda:old_permanent()+'*store(&batch,size_t,4*N)'
 try:raw,s,meta=B.render()
 finally:B.permanent=previous
 anchor='(Y:fp32),max==M';assert s.count(anchor)==1
 s=s.replace(anchor,'(Y:fp32)(FinalInput:Z)(FinalOutput:Z),input==FinalInput&&output==FinalOutput&&max==M')
 valid='em_valid(F,W,P,M,Q,S,N)'
 s=s.replace('em_data(F) which implies store(M,float,em_get(F,M))*em_data(em_pop(F,M))',valid+'&&em_data(F) which implies '+valid+'&&store(M,float,em_get(F,M))*em_data(em_pop(F,M))')
 s=s.replace('store(M,float,em_get(F,M))*em_data(em_pop(F,M)) which implies em_data(F)',valid+'&&store(M,float,em_get(F,M))*em_data(em_pop(F,M)) which implies '+valid+'&&em_data(F)')
 s=s.replace('emp which implies em_rvv_readable',valid+'&&0<=N%4&&N%4<4&&emp which implies em_rvv_readable')
 assert tokens(s)==tokens(raw)
 return raw,s,meta

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--timeout',type=int,default=600);a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();raw,body,meta=render();prefix='#include "'+str(C/'shim/rvv_program_model.h')+'"\n';(run/'rvv_unit.c').write_text(prefix+body);(run/'raw.c').write_text(prefix+raw)
 paths=[Path(__file__),C/'proof/generate_neon.py',C/'proof/generate_rvv.py',C/'impl/testRVV.c',C/'spec.c',*sorted((C/'shim').glob('*.h')),*sorted((C/'proof/coq').glob('*.v'))];inputs={str(p.relative_to(C)):sha(p)for p in paths};records=[]
 s=dict(passed=False,whole_kernel_verified=False,scope='actual current repaired RVV C generation only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,timeout_seconds=a.timeout,operand_bindings=meta)
 try:
  cmds=[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'rvv_unit.c'),'-o',str(run/'rvv_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]
  if not a.prepare_only:cmds.append(('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'rvv_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ExpMinusMax','-slp',str(C/'shim'),'ExpMinusMax']))
  for label,cmd in cmds:
   if label=='qcp':assert tokens((run/'rvv_unit.i').read_text())==tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--',*cmd];log=run/(label+'.log');t=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']},stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)));assert ec==0,log.read_text()[-4000:]
  assert inputs=={n:sha(C/n)for n in inputs},'generation input drift';assert tokens((run/'rvv_unit.i').read_text())==tokens((run/'raw.i').read_text())
  s.update(passed=True,prepare_only=a.prepare_only,CPP_sha256=sha(run/'rvv_unit.i'),current_C_CPP_tokens_identical=True)
  if not a.prepare_only:
   gp=gen/'rvv_unit_goal.v';s.update(goal_path=str(gp),goal_sha256=sha(gp),actual_C_fields=len(re.findall(r'^Axiom proof_of_',gp.read_text(),re.M)))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'.build/rvv-framed-generation-status.json'
 if out.exists():(C/'proof/history'/('rvv-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1

if __name__=='__main__':raise SystemExit(main())
