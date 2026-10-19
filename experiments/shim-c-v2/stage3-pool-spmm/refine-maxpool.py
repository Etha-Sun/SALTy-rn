from pathlib import Path
import shutil,json,hashlib,difflib
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent
old=HERE/'f32-maxpool';case=HERE/'f32-maxpool-frame-v2';case.mkdir();ann=case/'.build/edit/annotated';shutil.copytree(old/'.build/edit/annotated',ann);plain=old/'.build/edit/plain'
p=ann/'rvv.c';s=p.read_text();s=s.replace('  do {\n    const float** i', '''  //@ ghost float *stage3_output_base=output;
  //@ ghost size_t stage3_pixels=output_pixels;
  /*@ loop invariant stage3_pixel_bounds: 1<=output_pixels<=stage3_pixels;
      loop assigns output_pixels,input,input_offset,output,stage3_output_base[0..stage3_pixels*channels-1];
      loop variant output_pixels; */
  do {\n    const float** i''');s=s.replace('loop invariant stage3_group_count: -8<=k<=(integer)kernel_elements-9;','loop invariant stage3_group_count: -8<=k<=(integer)kernel_elements-9;\n        loop assigns k,i,output[0..channels-1];');p.write_text(s)
parts=[]
for f in sorted(plain.iterdir()):
 if f.suffix not in ('.c','.h'):continue
 a=f.read_text();b=(ann/f.name).read_text()
 if a!=b:
  for l in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+f.name,tofile='b/'+f.name):parts.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(parts));d=json.loads((old/'frozen.json').read_text());d['name']='f32-maxpool-frame-v2';d['previous_version']=str(old.relative_to(ROOT));d['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))];d['proof_sha256']=hashlib.sha256((case/'proof.patch').read_bytes()).hexdigest();d['stage3_revision']='Independent second proof candidate: explicit RVV pixel/group loop write frames to preserve channel/cursor context; source and public spec unchanged.'
(case/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(case/'freeze-sha256.txt').write_text(hashlib.sha256((case/'frozen.json').read_bytes()).hexdigest()+'\n')
