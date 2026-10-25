# Relocation auditor migrated from x32-transposec c15e252c87be33534c1a26af05fbed6fd5afe5321d440b62f460fa2e9356081e; rerun here, no proof credit.
#!/usr/bin/env python3
"""Audit current depthwise CPP against immutable full evidence; no Coq replay."""
from pathlib import Path
import argparse,importlib.util,json,subprocess,tempfile,sys
def load(name,path):
 sys.path.insert(0,str(path.parent));spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--proof-run',type=Path);a=p.parse_args();here=Path(__file__).resolve().parent;case=here.parent;engine=load('transpose_relocation_engine',here/'record_status.py');inputs=load('transpose_relocation_inputs',here/'full_inputs.py');work=Path(tempfile.mkdtemp(prefix='relocation-identity-',dir=case/'.build'));report=dict(audit_passed=False,formal_proof_replayed=False,directory=str(work),scope='Current sources/CPP and archived source/goal/log/object-origin identity; not a second formal proof',cpp_records=[])
 try:
  h=engine.read(here/'frozen-full-handoff.json');f=engine.read(here/'full-status.json');archive=here/'evidence/full-run';run=a.proof_run.resolve()if a.proof_run else Path(f['run_directory'])
  engine.require((archive/'status.json').read_bytes()==(here/'full-status.json').read_bytes()and(archive/'frozen-full-handoff.json').read_bytes()==(here/'frozen-full-handoff.json').read_bytes(),'Original frozen receipt/archive differ')
  report['identity']=engine.identity(case,work,h);audit,artifacts=engine.validate(case,run,h,f);report['assumptions']=audit
  for source,target in artifacts:engine.require(source.read_bytes()==(archive/target).read_bytes(),'Archived original artifact differs: '+str(target))
  for record in f['records']:engine.require(engine.sha(archive/'logs'/(record['label']+'.log'))==record['log_sha256'],'Archived command log differs')
  current={u['stem']:u for u in inputs.iter_current_unit_texts()};engine.require(set(current)=={u['stem']for u in h['units']},'Live actual unit inventory differs');paths={}
  for unit in h['units']:
   stem=unit['stem'];source=current[stem];folder=work/stem;folder.mkdir();raw=folder/(stem+'.in.c');raw.write_text(source['text']);cpp=folder/(stem+'.c');command=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc','-I',str(case),*map(str,source['cpp_flags']),str(raw),'-o',str(cpp)];log=folder/'cpp.log'
   with log.open('w')as output:result=subprocess.run(command,cwd=folder,stdout=output,stderr=output,timeout=600)
   engine.require(result.returncode==0 and engine.sha(cpp)==unit['cpp_sha256']and cpp.read_bytes()==(run/'units'/stem/(stem+'.c')).read_bytes(),'Live CPP differs: '+stem)
   paths[stem]=cpp;report['cpp_records'].append(dict(stem=stem,command=command,exit_code=result.returncode,log_sha256=engine.sha(log),cpp_sha256=engine.sha(cpp)))
  coverage=load('transpose_live_coverage',here/'full_call_coverage.py');closure=json.loads(json.dumps(coverage.check(paths,engine.read(here/'intrinsic-ledger.json'))));original=f['call_closure']['source_audit'];engine.require(closure['source_closure_passed'],'Live ordinary body/call/contract closure failed')
  # Only absolute CPP locations differ after moving a complete case.
  engine.require({k:v for k,v in closure.items()if k!='units'}=={k:v for k,v in original.items()if k!='units'},'Live ordinary body/spec binding differs')
  engine.require({k:v['cpp_sha256']for k,v in closure['units'].items()}=={k:v['cpp_sha256']for k,v in original['units'].items()},'Live CPP inventory hashes differ')
  report.update(audit_passed=True,current_cpp_units=len(paths),ordinary_C_bodies=closure['unique_actual_C_definitions'],all_archived_sources_and_logs_identical=True,compiled_source_count_including_final=len(f['compiled_source_sha256']),published_certificates_modified=False)
 except Exception as error:report['error']=repr(error)
 (work/'status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));return 0 if report['audit_passed']else 1
if __name__=='__main__':raise SystemExit(main())
