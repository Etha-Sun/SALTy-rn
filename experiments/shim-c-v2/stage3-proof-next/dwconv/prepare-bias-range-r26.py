from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-index-r24';case=D/'bias-target-range-r26';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();s+=r'''
/*@ \wp::strategy DwPrefixLeaf: \prover("z3",10), \prover("cvc5",10);
    \wp::strategy DwPrefixRange4: \tactic("Wp.range",\ingoal(shift_float32(A,E)),\select(E),\param("inf",0),\param("sup",3),\children(DwPrefixLeaf)), DwPrefixLeaf;
    \wp::proof DwPrefixRange4: next_lane_prefix,next_prestate_loaded_all;
*/
''';p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r26 root independent targeted fork of r24: use existing checked Wp.range tactic over four lane indices, including both out-of-range branches. No new hypotheses or changes to existing assertions; all proof branches required.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard26');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
