from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'conv-cursor-inline-r3';case=D/'conv-cursor-inline-r4';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_index.c';s=p.read_text();helper=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_index_successor_relation: i<n ==> (size_t)(i+1)<=n; @/
 static void next_index_successor(size_t i,size_t n) {}
*/
''';s=helper+s
needle='for(size_t i=0;i<vl;i++){uint32_t u;memcpy(&u,&a.lane[i],4);u+=(uint32_t)x;'
assert s.count(needle)==1;s=s.replace(needle,'for(size_t i=0;i<vl;i++){ /*@ ghost next_index_successor(i,vl); */ uint32_t u;memcpy(&u,&a.lane[i],4);u+=(uint32_t)x;');p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Conv r4: conditional body-proved uint64 index successor helper instantiated inside actual signed-add loop; retained original selected and all inline debts')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard04');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
