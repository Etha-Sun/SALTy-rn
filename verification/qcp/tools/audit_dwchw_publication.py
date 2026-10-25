#!/usr/bin/env python3
"""Audit a relocated issued DWCHW package without modifying frozen proof inputs.

The frozen issuer compared a recorded strategy --input-file absolute path with
its current case path. A moved package has the same bound source bytes but a
new path. This adapter changes exactly that metadata comparison to the case
root of the *recorded original full run*. The original source hash checks,
strategy goal/command checks, actual C/Coq checks, archive/origin checks and live
CPP/call-closure audit are all retained. This is not a second formal replay.
"""
from pathlib import Path
import argparse,contextlib,hashlib,importlib.util,io,json,sys,tempfile,types

def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def load(name,path):
 sys.path.insert(0,str(path.parent))
 spec=importlib.util.spec_from_file_location(name,path)
 module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
 return module

def main():
 parser=argparse.ArgumentParser(description=__doc__)
 parser.add_argument('--case',type=Path,required=True)
 parser.add_argument('--proof-run',type=Path,required=True)
 args=parser.parse_args();case=args.case.resolve();proof=case/'proof'
 h=json.loads((proof/'frozen-full-handoff.json').read_text())
 f=json.loads((proof/'full-status.json').read_text())
 assert f['passed']is True and f['handoff_sha256']==sha(proof/'frozen-full-handoff.json')
 original=proof/'record_status.py'
 assert sha(original)==h['frozen_source_sha256']['proof/record_status.py']
 before="'--input-file='+str(case/expected['source'])in command"
 after="'--input-file='+str(Path(f['run_directory']).parents[1]/expected['source'])in command"
 source=original.read_text();assert source.count(before)==1
 # Existing validate() also checks every frozen input, including each strategy
 # source at its current case-relative location. The historical command must
 # still name that same relative source under the recorded original root.
 derived=source.replace(before,after,1)
 work=Path(tempfile.mkdtemp(prefix='portable-issuer-',dir=case/'.build'))
 derived_path=work/'record_status_portable.py';derived_path.write_text(derived)
 outer=load('dwchw_frozen_relocation',proof/'audit_relocation.py')
 frozen_load=outer.load;engine_loaded=[]
 def portable_load(name,path):
  if path.resolve()==original.resolve():
   module=types.ModuleType(name);module.__file__=str(derived_path)
   exec(compile(derived,str(derived_path),'exec'),module.__dict__)
   engine_loaded.append(name);return module
  return frozen_load(name,path)
 outer.load=portable_load
 previous=sys.argv;capture=io.StringIO()
 try:
  sys.argv=[str(proof/'audit_relocation.py'),'--proof-run',str(args.proof_run.resolve())]
  with contextlib.redirect_stdout(capture):code=outer.main()
 finally:sys.argv=previous
 report=json.loads(capture.getvalue());assert len(engine_loaded)==1
 report['publication_adapter']={
  'source':str(Path(__file__).resolve()),'source_sha256':sha(__file__),
  'frozen_issuer_sha256':sha(original),'derived_issuer_sha256':sha(derived_path),
  'derived_issuer':str(derived_path),'replacements':1,
  'changed_metadata_comparison':{'before':before,'after':after},
  'recorded_original_case':str(Path(f['run_directory']).parents[1]),
  'current_case':str(case),'frozen_proof_inputs_modified':False,
  'all_other_checks_retained':True,'new_formal_proof_credit':False}
 (Path(report['directory'])/'status.json').write_text(json.dumps(report,indent=2)+'\n')
 (work/'status.json').write_text(json.dumps(report,indent=2)+'\n')
 print(json.dumps(report,indent=2));return code
if __name__=='__main__':raise SystemExit(main())
