from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'frame-root31';case=D/'frame-root32';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();marker='void test_rvv(';assert s.count(marker)==1;pos=s.index(marker);contract=s.rfind('/*@',0,pos);s=s[:contract]+'/*@ ghost\n /@ assigns \\nothing;\n ensures dw32_common_right: \\forall float x,y,z; ext_same(x,z) && ext_same(y,z) ==> ext_same(x,y); @/\n static void dw32_ext_common_right(void) {}\n*/\n'+s[contract:];marker='      /*@ assert next_bias_local:';assert s.count(marker)==1;s=s.replace(marker,'      /*@ ghost dw32_ext_common_right(); */\n'+marker);s+=r'''
/*@ \wp::proof DwPrefixRange4: next_bias_local,next_bias_normalized; */
''';p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW32 adds a body-proved common-right ext relation with no requirements or reads; retains all four old debts and applies checked finite lane split. Helper body mandatory.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard29');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
