from pathlib import Path
import json,sys,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root41';case=D/'frame-root43';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
old_range=r'/*@ assert dw39_weight_range_pre: \valid_read{Pre}(\at(w,Here)+(0..\at(vl,Here)-1)); */'
assert s.count(old_range)==1;s=s.replace(old_range,'')
needle=r'/*@ assert dw41_vacc_pre_size:'
assert s.count(needle)==1
extra=r'''/*@ assert dw43_weight_pre_positive: \block_length{Pre}(\at(w,Here))>0; */
      '''
p.write_text(s.replace(needle,extra+needle))
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW43 removes the unproved range assertion and independently checks only one-element pre-validity, then positive weight allocation against already body-checked zero local allocation. All four validity/allocation/base debts must pass together. No new requires or model change.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard43');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
