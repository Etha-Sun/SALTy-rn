from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'r5';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'r6';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
helpers=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_dw_weight_seed_relation: p==base && c==ch ==> p==base+16*((ch-c+3)/4); @/
 static void next_dw_weight_seed(float *p,float *base,size_t ch,size_t c) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_dw_weight_step_relation:
      0<vl<=c<=ch && (ch-c)%4==0 && vl==(c<4?c:4) &&
      p==base+16*((ch-c+3)/4)+16 ==> p==base+16*((ch-(c-vl)+3)/4); @/
 static void next_dw_weight_step(float *p,float *base,size_t ch,size_t c,size_t vl) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_dw_sub_exact: y<=x ==> (size_t)(x-y)==x-y; @/
 static void next_dw_sub(size_t x,size_t y) {}
*/
'''
p=work/'neon.c';p.write_text(helpers+p.read_text())
for name in ['neon.c','rvv.c']:
 p=work/name;s=p.read_text();cut='    /*@ assert next_weight_seed: W0==w; */';assert s.count(cut)==1;s=s.replace(cut,cut+'\n    /*@ ghost next_dw_weight_seed((float*)w,(float*)W0,CH,c); */')
 if name=='neon.c':
  tail='      vst1q_f32(output, vacc0123); output += 4;';assert s.count(tail)==1;s=s.replace(tail,tail+'''\n      /*@ assert next_weight_advanced: w==W0+16*((CH-c+3)/4)+16; */
      /*@ ghost next_dw_weight_step((float*)w,(float*)W0,CH,c,4); */
      /*@ ghost next_dw_sub(c,4); */
      /*@ assert next_weight_future: w==W0+16*((CH-(c-4)+3)/4); */''')
 else:
  tail='      c -= vl;';assert s.count(tail)==1;s=s.replace(tail,'''      /*@ assert next_weight_advanced: w==W0+16*((CH-c+3)/4)+16; */
      /*@ ghost next_dw_weight_step((float*)w,(float*)W0,CH,c,vl); */
      /*@ ghost next_dw_sub(c,vl); */
      c -= vl;
      /*@ assert next_weight_rebased: w==W0+16*((CH-c+3)/4); */''')
 p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Dwconv r6 extends r5: three body-proved no-requires ghost helpers for conditional weight seed, aligned block step and exact size subtraction; all advancement/rebase cuts retained as obligations')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard06');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
