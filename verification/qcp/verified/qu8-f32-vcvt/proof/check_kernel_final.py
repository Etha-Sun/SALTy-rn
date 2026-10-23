#!/usr/bin/env python3
"""Assemble every actual kernel field into its fully qualified typed interface."""
from pathlib import Path
import argparse,json,hashlib,re,subprocess,tempfile,shutil,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--calls-run',type=Path,required=True);p.add_argument('--memory-run',type=Path);p.add_argument('--timeout',type=int,default=1800);a=p.parse_args();isa=a.isa;calls=a.calls_run.resolve();previous=json.loads((calls/'status.json').read_text());assert previous['passed']and previous['source_identity_checked']
 for row in previous['results']:assert row['source_sha256']==sha(HERE/'coq'/(row['module']+'.v'))==sha(calls/'coq'/(row['module']+'.v'))
 generation=Path(previous['generation_dir']);assert sha(generation/(isa+'_unit_goal.v'))==sha(calls/'coq'/(isa+'_unit_goal.v'));gen=json.loads((generation/'status.json').read_text());assert gen['generation_passed']
 impl=CASE/'impl'/('testNEON.c'if isa=='neon'else'testRVV.c');assert sha(impl)==gen['raw_c_sha256']
 run=Path(tempfile.mkdtemp(prefix=isa+'-kernel-final-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];template=next(x['command']for x in json.loads((calls/'records.json').read_text())if x['label']=='KernelBounds');cmd=template[:-1]
 if a.memory_run:cmd+=['-Q',str(a.memory_run.resolve()/'coq'),'Qu8Cvt']
 cmd+=['-Q',str(coq),'Qu8Cvt'];status={'passed':False,'whole_kernel_verified':False,'scope':'Complete actual '+isa.upper()+' kernel typed VC_Correct and all per-field assumptions; full fresh C-helper/wrapper closure remains mandatory','run_directory':str(run),'generation_dir':str(generation),'calls_run':str(calls),'memory_run':str(a.memory_run)if a.memory_run else None,'records':records}
 try:
  modules=['NeonChecked','FinalNeonCheck']if isa=='neon'else['UnsignedProgramFacts','RvvResult','RvvMemory','RvvChecked','FinalRvvCheck']
  for n in modules:
   shutil.copyfile(HERE/'coq'/(n+'.v'),coq/(n+'.v'));work=run/'jobs'/n;work.mkdir(parents=True);call=cmd+[str(coq/(n+'.v'))];start=time.monotonic();log=run/(n+'.log')
   with log.open('w')as f:
    try:code=subprocess.run(call,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
    except subprocess.TimeoutExpired:code=124
   records.append({'label':n,'command':call,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(n,code,flush=True)
   if code:raise RuntimeError(log.read_text()[-5000:])
  fields=re.findall(r'^Axiom proof_of_(\w+) :',(calls/'coq'/(isa+'_unit_goal.v')).read_text(),re.M);gate=coq/('FinalNeonCheck.v'if isa=='neon'else'FinalRvvCheck.v');own=2 if isa=='neon'else 6;log=run/(gate.stem+'.log');text=log.read_text();printed=len(re.findall(r'^Axioms:|^Closed under the global context',text,re.M));assert printed==len(fields)+own,(printed,len(fields)+own)
  assert not re.search(r'^\S*proof_of_\S*\s*:',text,re.M),'A generated proof field remained an assumption'
  status.update(passed=True,vc_correct_passed=True,kernel_c_vcs=len(fields),own_strategy_fields=own,assumptions_printed=printed,goal_sha256=sha(calls/'coq'/(isa+'_unit_goal.v')),proof_source_sha256={n:sha(HERE/'coq'/(n+'.v'))for n in modules})
 except Exception as e:status['error']=str(e);print(e,flush=True)
 finally:
  for p in[run/'status.json',HERE/(isa+'-proof-status.json')]:p.write_text(json.dumps(status,indent=2)+'\n')
 print('RUN',run,flush=True);return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
