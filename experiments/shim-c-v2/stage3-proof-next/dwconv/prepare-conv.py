from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=R/'experiments/shim-c-v2/stage3-conv/revision3/f32-conv-hwc2chw';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'conv-cursor-r1';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();s=s.replace('loop invariant stage3_cursor: ow_done+ow==output_width;','loop invariant stage3_cursor: ow_done+ow==output_width;\n          loop invariant next_done_range: 0<=ow_done<=output_width;');oldtail='        ow -= vl;\n        ow_done += vl;';assert s.count(oldtail)==1;s=s.replace(oldtail,'''        /*@ assert next_width_before: ow_done+ow==output_width && 0<vl<=ow; */
        /*@ assert next_width_add_bound: ow_done+vl<=output_width; */
        ow -= vl;
        /*@ assert next_width_subtracted: ow_done+ow+vl==output_width; */
        ow_done += vl;
        /*@ assert next_width_rebased: ow_done+ow==output_width; */''');p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Conv cursor r1: explicit completed-width bound and checked cuts before/after actual unsigned ow decrement and ow_done increment; every added cut remains an obligation')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
