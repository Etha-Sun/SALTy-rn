from pathlib import Path
import shutil,json,hashlib,difflib
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent
old=HERE/'f32-spmm-minmax';case=HERE/'f32-spmm-frame-v2';case.mkdir();ann=case/'.build/edit/annotated';shutil.copytree(old/'.build/edit/annotated',ann);plain=old/'.build/edit/plain'
p=ann/'rvv.c';s=p.read_text();s=s.replace('  size_t m = mc / sizeof(float);','''  //@ ghost float *stage3_output_base=output;
  size_t m = mc / sizeof(float);''');s=s.replace('loop invariant stage3_strip_bounds: 0<=m<=mc/sizeof(float);','''loop invariant stage3_strip_bounds: 0<=m<=mc/sizeof(float);
      loop assigns m,input,output,stage3_output_base[0..nc*(mc/sizeof(float)+4)-1];''');s=s.replace('loop invariant stage3_column_bounds: 1<=n<=nc;','''loop invariant stage3_column_bounds: 1<=n<=nc;
        loop assigns n,w,dmap,nnzmap,in,out,stage3_output_base[0..nc*(mc/sizeof(float)+4)-1];''');s=s.replace('loop invariant stage3_nnz_bounds: 1<=nnz<=stage3_nnz0;','''loop invariant stage3_nnz_bounds: 1<=nnz<=stage3_nnz0;
            loop assigns nnz,dmap,in,w,vacc;''');p.write_text(s)
parts=[]
for f in sorted(plain.iterdir()):
 if f.suffix not in ('.c','.h'):continue
 a=f.read_text();b=(ann/f.name).read_text()
 if a!=b:
  for l in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+f.name,tofile='b/'+f.name):parts.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(parts));d=json.loads((old/'frozen.json').read_text());d['name']='f32-spmm-frame-v2';d['previous_version']=str(old.relative_to(ROOT));d['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))];d['proof_sha256']=hashlib.sha256((case/'proof.patch').read_bytes()).hexdigest();d['wp_budget']=1200;d['stage3_revision']='Independent second proof candidate: exact RVV nnz/column/strip write frames to preserve cursor induction context. All original C/spec unchanged.'
(case/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(case/'freeze-sha256.txt').write_text(hashlib.sha256((case/'frozen.json').read_bytes()).hexdigest()+'\n')
