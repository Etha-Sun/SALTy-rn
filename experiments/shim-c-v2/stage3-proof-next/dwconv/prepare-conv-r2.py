from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'conv-cursor-r1';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'conv-cursor-r2';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
helpers=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_conv_sub_exact: y<=x ==> (size_t)(x-y)==x-y; @/
 static void next_conv_sub(size_t x,size_t y) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_conv_add_exact: y<=SIZE_MAX-x ==> (size_t)(x+y)==x+y; @/
 static void next_conv_add(size_t x,size_t y) {}
*/
'''
p=work/'neon.c';p.write_text(helpers+p.read_text())
p=work/'rvv.c';s=p.read_text();before='        /*@ assert next_width_before: ow_done+ow==output_width && 0<vl<=ow; */';bound='        /*@ assert next_width_add_bound: ow_done+vl<=output_width; */';assert s.count(before)==s.count(bound)==1;s=s.replace(before+'\n','').replace(bound+'\n','');vl='        /*@ assert stage3_vl: 0<vl<=4 && vl<=ow; */';assert s.count(vl)==1;s=s.replace(vl,vl+'\n'+before+'\n'+bound)
sub='        ow -= vl;';s=s.replace(sub,'        /*@ ghost next_conv_sub(ow,vl); */\n'+sub)
add='        ow_done += vl;';s=s.replace(add,'        /*@ ghost next_conv_add(ow_done,vl); */\n'+add)
store='        __riscv_vse32_v_f32m1(current_o0c0, v_o0c0, vl); current_o0c0 += vl;';assert s.count(store)==1;s=s.replace(store,store+'\n        /*@ assert next_store_advanced: current_o0c0==o0c0+(ow_done+vl); */')
rebased='        /*@ assert next_width_rebased: ow_done+ow==output_width; */';s=s.replace(rebased,rebased+'\n        /*@ assert next_store_rebased: current_o0c0==o0c0+ow_done; */');p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Conv cursor r2: body-proved conditional exact size add/sub helpers; early checked width seed and bound; actual store-pointer advancement/rebase checked cuts; all prior obligations retained')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
