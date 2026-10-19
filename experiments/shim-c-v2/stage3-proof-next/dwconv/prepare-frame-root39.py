from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root37';case=D/'frame-root39';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
needle=r'/*@ assert next_weight_distinct_base:'
assert s.count(needle)==1
extra=r'''/*@ assert dw39_weight_range_pre: \valid_read{Pre}(\at(w,Here)+(0..\at(vl,Here)-1)); */
      /*@ assert dw39_weight_one_pre: \valid_read{Pre}(\at(w,Here)); */
      '''
p.write_text(s.replace(needle,extra+needle))
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW39 explicitly evaluates the cursor and VL at Here while checking allocation validity at Pre. It proves original-prestate read validity of the current weight cursor to expose allocation facts needed by the retained distinct-base goal. Both added validity assertions are explicit debts. All original goals retained; no new requires or model change.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard39');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
