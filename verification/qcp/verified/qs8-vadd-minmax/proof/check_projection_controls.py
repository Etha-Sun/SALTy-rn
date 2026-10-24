#!/usr/bin/env python3
"""Fail-closed source projection controls; this is not a C/Coq proof."""
from pathlib import Path
import argparse,hashlib,importlib.util,json,re,shutil,tempfile
C=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--raw',type=Path,required=True);p.add_argument('--namespace',required=True);p.add_argument('--stem',required=True);a=p.parse_args();raw=a.raw.resolve();r=Path(tempfile.mkdtemp(prefix='projection-controls-current-',dir=C/'.build'))
 spec=importlib.util.spec_from_file_location('projection',C/'proof/split_goal.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
 positive=m.project(raw,r/'positive',a.namespace,a.stem);m.audit(raw,r/'positive',a.namespace,a.stem)
 data=raw.read_text();marks=list(re.finditer(r'^Definition (\w+)\s*:=',data,re.M));assert len(marks)>1
 controls={};failure={}
 for label,changed in [('intervening_local_scope',data[:marks[1].start()]+'Local Open Scope Z_scope.\n'+data[marks[1].start():]),('intervening_notation',data[:marks[1].start()]+'Local Notation bogus := 0.\n'+data[marks[1].start():]),('duplicate_original_definition',data[:marks[1].start()]+data[marks[0].start():marks[1].start()]+data[marks[1].start():])]:
  q=r/(label+'.v');q.write_text(changed)
  try:m.project(q,r/label,a.namespace,a.stem)
  except (AssertionError,ValueError)as e:controls[label]=True;failure[label]=str(e)
  else:raise AssertionError('Accepted negative '+label)
 # Deterministic regeneration must reject deletion, body changes, facade/interface changes and extra commands.
 target=r/'positive';chunk=target/(a.stem+'_goal_chunk00.v');saved=chunk.read_bytes()
 for label,changed in [('missing_chunk_definition',saved[:max(0,len(saved)-20)]),('changed_chunk_body',saved+b'\nDefinition injected := True.\n')]:
  chunk.write_bytes(changed)
  try:m.audit(raw,target,a.namespace,a.stem)
  except (AssertionError,ValueError)as e:controls[label]=True;failure[label]=str(e)
  else:raise AssertionError('Accepted negative '+label)
  chunk.write_bytes(saved)
 facade=target/(a.stem+'_goal.v');saved=facade.read_bytes();facade.write_bytes(saved+b'\nDefinition changed_interface := False.\n')
 try:m.audit(raw,target,a.namespace,a.stem)
 except (AssertionError,ValueError)as e:controls['changed_facade_or_interface']=True;failure['changed_facade_or_interface']=str(e)
 else:raise AssertionError('Accepted changed facade')
 facade.write_bytes(saved);m.audit(raw,target,a.namespace,a.stem)
 s=dict(passed=True,formal_proof=False,checked_c_vcs=0,kind='exact source projection context/reassembly controls',run_directory=str(r),input_sha256={'proof/split_goal.py':sha(C/'proof/split_goal.py'),'proof/check_projection_controls.py':sha(Path(__file__))},raw_goal_sha256=sha(raw),definition_count=positive['definition_count'],actual_c_fields=positive['actual_c_fields'],negative_controls_rejected=controls,rejection_details=failure,positive_exact_definition_and_alias_identity=m.identity(positive))
 (r/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof/goal-projection-controls-status.json'
 if out.exists():
  old=C/'proof/history'/('goal-projection-controls-status-'+sha(out)+'.json');old.parent.mkdir(exist_ok=True);shutil.copyfile(out,old)
 out.write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s[k]for k in ['passed','run_directory','definition_count','negative_controls_rejected']},indent=2))
if __name__=='__main__':main()
