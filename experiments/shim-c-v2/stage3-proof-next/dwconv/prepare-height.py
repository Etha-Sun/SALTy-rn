from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=R/'experiments/shim-c-v2/stage3-conv/revision2/f32-dwconv2d-chw';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'dwconv2d-height-r1';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'utils.c';s=p.read_text();needle='size_t doz(size_t n,size_t d)';assert s.count(needle)==1;s=s.replace(needle,r'''/*@ ensures next_doz_exact: \result==(n>d?n-d:0);
*/
size_t doz(size_t n,size_t d)''');p.write_text(s)
helper=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_height_step_relation:
      h<=n && (h==0 || (n-h)%3==0) ==>
      (h>3?h-3:0)<=n && ((h>3?h-3:0)==0 || (n-(h>3?h-3:0))%3==0);
 @/
 static void next_height_step(size_t n,size_t h) {}
*/
'''
p=work/'neon.c';p.write_text(helper+p.read_text())
for name in ['neon.c','rvv.c']:
 p=work/name;s=p.read_text();tail='    output_height = doz(output_height, 3);' if name=='neon.c' else '    output_height = output_height > 3 ? output_height - 3 : 0;';assert s.count(tail)==1
 s=s.replace(tail,'''    /*@ assert next_height_before: output_height<=input_height &&
          (output_height==0 || (input_height-output_height)%3==0); */
    /*@ ghost next_height_step(input_height,output_height); */
'''+tail+'''
    /*@ assert next_height_bound: output_height<=input_height; */
    /*@ assert next_height_rows: output_height==0 || (input_height-output_height)%3==0; */''');p.write_text(s)
plain=Path(g['plain']);patch=''
for n in data['files']:
 if (plain/n).read_bytes()==(work/n).read_bytes():continue
 for line in difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):
  patch+=line if line.endswith('\n') else line+'\n\\ No newline at end of file\n'
(case/'proof.patch').write_text(patch);
data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Dwconv2d height r1: exact body-proved doz contract, conditional no-requires body-proved saturated height-step ghost helper, and checked height/range cuts; original obligations retained')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
