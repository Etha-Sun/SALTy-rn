#!/usr/bin/env python3
"""Audit live RSUM CPP/source identities against a completed proof; no proof replay."""
import argparse,importlib.util,json,tempfile
from pathlib import Path
P=Path(__file__).resolve().parent;CASE=P.parent
def module(n,p):
 s=importlib.util.spec_from_file_location(n,p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
def main():
 pa=argparse.ArgumentParser(description=__doc__);pa.add_argument('--preflight',action='store_true');pa.add_argument('--proof-run',type=Path);a=pa.parse_args();engine=module('rsum_relocation_record',P/'record_status.py');run=Path(tempfile.mkdtemp(prefix='relocation-identity-',dir=CASE/'.build'));report={'audit_passed':False,'formal_proof_replayed':False,'kind':'live_source_cpp_and_compiled_source_identity_only','audit_directory':str(run)}
 try:
  h=engine.read(P/'frozen-full-handoff.json');report['identity']=engine.identity(CASE,run,h);report['live_cpp']=engine.live_cpp(CASE,run,h)
  if not a.preflight:
   full=engine.read(P/'full-status.json');proof=a.proof_run.resolve()if a.proof_run else CASE/'proof/evidence/full-run';report['assumptions']=engine.validate(CASE,proof,h,full);manifest=engine.read(P/'manifest.json');status=engine.read(P/'status.json');engine.require(status['whole_kernel_verified']and engine.sha(P/'manifest.json')==status['manifest_sha256'],'Issued status identity');engine.require(engine.sha(proof/'status.json')==status['full_evidence_sha256'],'Immutable archive status identity')
   for row in manifest['files']:engine.require(engine.sha(CASE/row['path'])==row['sha256'],'Manifest file changed '+row['path'])
  report['audit_passed']=True
 except Exception as e:report['error']=str(e)
 (run/'status.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2));return 0 if report['audit_passed']else 1
if __name__=='__main__':raise SystemExit(main())
