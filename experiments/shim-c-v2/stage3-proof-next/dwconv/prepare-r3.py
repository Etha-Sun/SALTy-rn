from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'r1';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'r3';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
for name in ['neon.c','rvv.c']:
 p=work/name;s=p.read_text();s=s.replace('loop invariant 0<output_width<=P;','loop invariant 0<output_width<=P;\n      loop invariant next_outer_channels: CH==channels;\n      loop invariant next_outer_weights: W0==weights;')
 s=s.replace('const float* w = weights;','const float* w = weights;\n    /*@ assert next_channel_seed: CH==c; */\n    /*@ assert next_weight_seed: W0==w; */')
 p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Dwconv r3 extends r1 not r2: explicit outer frame facts for immutable channel/weight snapshots and checked inner seeds, motivated by printed failed weight initialization goal')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard03');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
