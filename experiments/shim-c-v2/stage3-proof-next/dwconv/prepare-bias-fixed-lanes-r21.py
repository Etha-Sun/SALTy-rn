from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-lanes-r20';case=D/'bias-fixed-lanes-r21';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_memory_m4.c';s=p.read_text();needle='ensures next_m4_project_all:';assert s.count(needle)==1;extra=''.join(f'ensures next_m4_project_lane{j}: \\forall float x; next_m4_bias(*p,{j},x) ==> ext_same(p->lane[{j}],x);\n    ' for j in range(4));s=s.replace(needle,extra+needle)
needle='ensures next_m4_loaded_all:';assert s.count(needle)==1;extra=''.join(f'ensures next_m4_loaded_lane{j}: {j}<vl ==> next_m4_bias(\\result,{j},p[{j}]); ' for j in range(4));s=s.replace(needle,extra+needle);p.write_text(s)
p=work/'rvv.c';s=p.read_text();needle='      /*@ assert next_prestate_loaded_all:';assert s.count(needle)==1;extra=''.join(f'      /*@ assert next_prestate_loaded_lane{j}: {j}<vl ==> ext_same(vacc.lane[{j}],\\at(w[{j}],next_bias_before_load)); */\n' for j in range(1,4));s=s.replace(needle,extra+needle);p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r21 specialize actual loader and actual projection helper to four physical lanes while retaining original all16 contracts; prove conditional lane1..3 prestate cuts then original quantified relation, using original vl=min(c,4).')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard21');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
