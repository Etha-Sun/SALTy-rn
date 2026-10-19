from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=R/'experiments/shim-c-v2/stage3-conv/revision5/f32-dwconv-minmax';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'r1';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
for name in ['neon.c','rvv.c']:
 p=work/name;s=p.read_text();needle='    const float* w = weights;';s=s.replace(needle,needle+'\n    /*@ ghost const float *Row0=i0,*Row1=i1,*Row2=i2; */')
 s=s.replace('loop invariant w==W0+16*((CH-c+3)/4);','loop invariant next_weight_cursor: w==W0+16*((CH-c+3)/4);\n        loop invariant next_row0_cursor: i0==Row0+(CH-c);\n        loop invariant next_row1_cursor: i1==Row1+(CH-c);\n        loop invariant next_row2_cursor: i2==Row2+(CH-c);')
 s=s.replace('loop assigns c,w,i0,i1,i2,output,O0[0..P*CH-1],errno;','loop assigns c,w,i0,i1,i2,output,O0[(P-output_width)*CH..(P-output_width+1)*CH-1],errno;')
 s=s.replace('/*@ assert stage3_weight_block: (CH-c)%4==0; */','/*@ assert stage3_weight_block: (CH-c)%4==0; */\n      /*@ assert next_weight_index: (CH-c+3)/4==(CH-c)/4; */')
 p.write_text(s)
p=work/'fp_primitives.h';s=p.read_text();s=s.replace(' predicate ext_same',r''' lemma next_block_step: \forall integer ch,c;
  4<=c<=ch && (ch-c)%4==0 ==> (ch-(c-4)+3)/4 == (ch-c+3)/4+1;
 lemma next_block_tail: \forall integer ch,c;
  0<c<=4 && c<=ch && (ch-c)%4==0 ==> (ch+3)/4 == (ch-c+3)/4+1;
 predicate ext_same''',1);p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch)
data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Dwconv next r1: pixel-local inner frames, actual input row base snapshots, named packed weight cursor and proved integer block lemmas; unchanged public domain/output and original bridge obligations retained')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
