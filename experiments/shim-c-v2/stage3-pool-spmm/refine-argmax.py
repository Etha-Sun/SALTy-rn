from pathlib import Path
import shutil,json,hashlib,difflib
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent
old=HERE/'f32-argmaxpool';case=HERE/'f32-argmaxpool-typed-v2';case.mkdir();ann=case/'.build/edit/annotated';shutil.copytree(old/'.build/edit/annotated',ann);plain=old/'.build/edit/plain'
shutil.copyfile(ROOT/'experiments/shim-c-v2/complex-v3-next/integer-helper-candidate/quantized.c',ann/'quantized.c')
p=ann/'rvv.c';s=p.read_text();s=s.replace('  do {\n    // Accumulators', '''  //@ ghost float *stage3_output_base=output;
  //@ ghost uint32_t *stage3_index_base=index;
  //@ ghost size_t stage3_pixels=output_pixels;
  /*@ loop invariant stage3_pixel_bounds: 1<=output_pixels<=stage3_pixels;
      loop assigns output_pixels,input,input_offset,output,index,stage3_output_base[0..stage3_pixels*channels-1],stage3_index_base[0..stage3_pixels*channels-1];
      loop variant output_pixels; */
  do {\n    // Accumulators''');s=s.replace('loop invariant stage3_group_count: -8<=k<=(integer)pooling_elements;','loop invariant stage3_group_count: -8<=k<=(integer)pooling_elements;\n        loop assigns k,id,idx0,ab,ib,output[0..channels-1],index[0..channels-1];');p.write_text(s)
p=ann/'fp_masks.c';s=p.read_text();needle='vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl) { for(size_t i=0;i<vl;i++)if(m.lane[i])a.lane[i]=x;return a; }';rep=r'''/*@ requires vl<=32; assigns \nothing;
    ensures \forall integer j; 0<=j<vl ==> \result.lane[j]==(m.lane[j]?x:a.lane[j]); */
vuint32m8_t __riscv_vmerge_vxm_u32m8(vuint32m8_t a,uint32_t x,vbool4_t m,size_t vl) {
 /*@ loop invariant 0<=i<=vl;
     loop invariant \forall integer j;0<=j<i ==> a.lane[j]==(m.lane[j]?x:\at(a.lane[j],Pre));
     loop invariant \forall integer j;i<=j<32 ==> a.lane[j]==\at(a.lane[j],Pre);
     loop assigns i,a; loop variant vl-i; */
 for(size_t i=0;i<vl;i++)if(m.lane[i])a.lane[i]=x;return a; }''';assert needle in s;s=s.replace(needle,rep);p.write_text(s)
parts=[]
for f in sorted(plain.iterdir()):
 if f.suffix not in ('.c','.h'):continue
 a=f.read_text();b=(ann/f.name).read_text()
 if a!=b:
  for l in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+f.name,tofile='b/'+f.name):parts.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(parts));d=json.loads((old/'frozen.json').read_text());d['name']='f32-argmaxpool-typed-v2';d['previous_version']=str(old.relative_to(ROOT));d['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))];d['proof_sha256']=hashlib.sha256((case/'proof.patch').read_bytes()).hexdigest();d['wp_model_variant']='Typed+float';d['stage3_revision']='Independent candidate: remove raw configuration after diagnostic isolated Why3 addr/int translation failure; still same qualified native IEEE model. Add RVV loop frames, actual u32 helpers and merge body proofs. Source/spec unchanged; same-context positive/negative controls required.'
(case/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(case/'freeze-sha256.txt').write_text(hashlib.sha256((case/'frozen.json').read_bytes()).hexdigest()+'\n')
