from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root34';case=D/'frame-root35';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
for j in range(4):
 marker=f'/*@ ghost if ({j} < vl) dw33_common_right_x(vacc.lane[{j}]); */';assert s.count(marker)==1
 s=s.replace(marker,f'/*@ assert dw35_ghost_read{j}: {j} < vl ==> \\valid_read(&vacc.lane[{j}]); */\n      '+marker)
strategies=re.findall(r'\\wp::strategy\s+(\w+)\s*:\s*(.*?);',s,re.S);names=[n for n,b in strategies if '"Wp.havoc"' in b and 'memcpy(' in b];assert len(names)==1,names
s += '\n/*@ \\wp::proof '+names[0]+': '+','.join(f'dw34_lane{j}_frame' for j in range(4))+'; */\n'
p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW35 adds four explicit active ghost-read validity obligations because full RTE inventory does not expose separate ghost-call reads; binds four frame premises to existing checked havoc. All prior debts remain, no new precondition or implementation change.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard35');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
