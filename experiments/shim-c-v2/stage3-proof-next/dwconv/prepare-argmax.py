from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=R/'experiments/shim-c-v2/stage3-unary-front/replay/f32-argmaxpool';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'argmax-index-r1';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
helpers=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_arg_seed_relation: p==base && c==n ==> p==base+(n-c); @/
 static void next_arg_seed(uint32_t *p,uint32_t *base,size_t n,size_t c) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_arg_step_relation: vl<=c<=n && p==base+(n-c)+vl ==>
      p==base+(n-(c-vl)); @/
 static void next_arg_step(uint32_t *p,uint32_t *base,size_t n,size_t c,size_t vl) {}
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_arg_sub_exact: y<=x ==> (size_t)(x-y)==x-y; @/
 static void next_arg_sub(size_t x,size_t y) {}
*/
'''
p=work/'neon.c';p.write_text(helpers+p.read_text())
p=work/'rvv.c';s=p.read_text();anchor='      //@ ghost const float *stage3_base8=i8;';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'''
      /*@ assert next_arg_seed_checked: c==channels && i==index; */
      /*@ ghost next_arg_seed(i,index,channels,c); */''')
anchor='        size_t vl = __riscv_vsetvl_e32m8(c);';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n        /*@ assert next_arg_vl: 0<vl<=32 && vl<=c; */')
anchor='        __riscv_vse32_v_u32m8(i, vidx, vl); i += vl;';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'''
        /*@ assert next_arg_advanced: i==index+(channels-c)+vl; */
        /*@ ghost next_arg_step(i,index,channels,c,vl); */
        /*@ ghost next_arg_sub(c,vl); */''')
anchor='        c -= vl;';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n        /*@ assert next_arg_rebased: i==index+(channels-c); */');p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Argmax index r1: exact original qualified unary-front, source/spec unchanged; checked index seed, vl, actual index advance/rebase, and three no-requires body-proved conditional ghost helpers')
data['proof_sha256']=sha(case/'proof.patch');(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(R/data.get('previous_proof_patch','experiments/shim-c-v2/stage3-pool-spmm/f32-argmaxpool/proof.patch'))},indent=2)+'\n');print(guard['passed'])
