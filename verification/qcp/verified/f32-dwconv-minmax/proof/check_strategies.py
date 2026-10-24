#!/usr/bin/env python3
"""Fresh source-based map strategies and actual map-access C component.
This component does not certify either complete convolution kernel.
"""
from pathlib import Path
import json,hashlib,subprocess,os,tempfile,shutil,time,re
C=Path(__file__).resolve().parents[1];R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 r=Path(tempfile.mkdtemp(prefix='map-strategies-',dir=C/'.build'));g=r/'generated';g.mkdir();env=os.environ.copy();env['PATH']=str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH'];tool=Path(shutil.which('qcp',path=env['PATH'])).resolve().parent/'StrategyCheck';recs=[];paths=[Path(__file__),C/'proof/check_coq.py',C/'shim/maps.h',C/'shim/map_access.c',C/'shim/output_rules.h',C/'proof/c/dw_maps.strategies',C/'proof/c/dw_output.strategies'];before={str(p.relative_to(C)):sha(p)for p in paths};s=dict(passed=False,whole_kernel_verified=False,run_directory=str(r),records=recs,input_sha256=before)
 def call(label,cmd,timeout=7200):
  t=time.monotonic();log=r/(label+'.log');cmd=['prlimit','--as=17179869184','--',*map(str,cmd)]
  try:
   with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=timeout)
   code=p.returncode
  except subprocess.TimeoutExpired:code=124
  recs.append(dict(label=label,command=cmd,exit_code=code,seconds=time.monotonic()-t,log_sha256=sha(log)));print(label,code,flush=True);(r/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert code==0,log.read_text()[-2000:]
 try:
  for name in ['dw_maps','dw_output']:
   call(name+'-StrategyCheck',[tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(C/'proof/c'/(name+'.strategies')),'--coq-output-dir='+str(g),'--coq-logic-path=Dwconv'])
   shutil.copy2(g/(name+'_strategy_goal.v'),C/'proof/coq'/(name+'_strategy_goal.v'))
  call('cpp',['gcc','-E','-P','-CC','-nostdinc',C/'shim/map_access.c','-o',r/'map_probe.c'])
  call('QCP',['qcp','--arch=64','--endian=little','--no-exec-info','--no-float-finite-vc','--input-file='+str(r/'map_probe.c'),'--coq-output-dir='+str(g),'--coq-logic-path=Dwconv','-slp',C/'shim','Dwconv','-slp',C/'proof/c','Dwconv'])
  shutil.copy2(g/'map_probe_goal.v',C/'proof/coq/map_probe_goal.v')
  call('fresh-ordinary-closure',['python3',C/'proof/check_coq.py','--targets','MapProbeChecked','OutputStrategyChecked','ProgramFacts','--jobs','32','--max-live','16','--timeout','7200'],timeout=14400)
  closure=json.loads((C/'.build/coq-status-MapProbeChecked-OutputStrategyChecked-ProgramFacts.json').read_text());assert closure['passed']
  assert all(sha(C/k)==v for k,v in before.items()),'source drift'
  s.update(passed=True,actual_c_vcs=4,strategy_fields=9,no_new_axioms=True,ordinary_closure=closure['run_directory'],goals_sha256={p.name:sha(p)for p in g.glob('*goal.v')},typed_modules=['Dwconv.MapProbeChecked.CheckedMapProbe','Dwconv.MapStrategyChecked.CheckedMaps','Dwconv.OutputStrategyChecked.CheckedOutputStrategy'])
 except Exception as e:s['error']=str(e)
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');p=C/'proof/strategies-status.json'
 if p.exists():(C/'proof/history'/('strategies-status-'+sha(p)+'.json')).write_bytes(p.read_bytes())
 p.write_bytes((r/'status.json').read_bytes());print(r,flush=True);raise SystemExit(0 if s['passed']else 1)
if __name__=='__main__':main()
