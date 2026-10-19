from pathlib import Path
import sys,json,hashlib,difflib,shutil
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
name='f32-dwconv-minmax';old=HERE/'revision2'/name;case=HERE/'revision4'/name;case.mkdir(parents=True);data=json.loads((old/'frozen.json').read_text());work=case/'.build/edit';shutil.copytree(old/'.build/guard02/annotated',work)
for side in ['neon.c','rvv.c']:
 p=work/side;s=p.read_text().replace(';\n          assert stage3_', '; */\n      /*@ assert stage3_');p.write_text(s)
plain=HERE/name/'.build/guard01/plain';patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch)
data.update(proof_patches=[str((case/'proof.patch').relative_to(ROOT))],previous_version=str(old.relative_to(ROOT)),proof_stage='Stage3 minmax revision4: preserve revision2 validity/frame work; split ACSL assertions into syntactically valid individual comments')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard04');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
