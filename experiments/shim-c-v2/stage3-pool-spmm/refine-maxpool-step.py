from pathlib import Path
import shutil,json,hashlib,difflib
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent
old=HERE/'f32-maxpool-frame-v2';case=HERE/'f32-maxpool-step-v3';case.mkdir();ann=case/'.build/edit/annotated';shutil.copytree(old/'.build/edit/annotated',ann);plain=HERE/'f32-maxpool/.build/edit/plain'
p=ann/'rvv.c';s=p.read_text();s=s.replace('size_t vl = __riscv_vsetvl_e32m8(c);','''size_t vl = __riscv_vsetvl_e32m8(c);
      /*@ assert stage3_vl_bound: 0<vl<=c; */''');s=s.replace('      c -= vl;','''      /*@ assert stage3_next_bound: 0<=c-vl<=channels; */
      /*@ assert stage3_store_cursor: o==output+(channels-c+vl); */
      c -= vl;''');p.write_text(s)
parts=[]
for f in sorted(plain.iterdir()):
 if f.suffix not in ('.c','.h'):continue
 a=f.read_text();b=(ann/f.name).read_text()
 if a!=b:
  for l in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+f.name,tofile='b/'+f.name):parts.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(parts));d=json.loads((old/'frozen.json').read_text());d['name']='f32-maxpool-step-v3';d['previous_version']=str(old.relative_to(ROOT));d['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))];d['proof_sha256']=hashlib.sha256((case/'proof.patch').read_bytes()).hexdigest();d['wp_budget']=1200;d['stage3_revision']='Independent third proof candidate: pixel/group frames plus explicit VL/subtraction/store cursor proof cuts; all are actual body obligations. Original C/spec unchanged; extended complete attempt budget1200s.'
(case/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(case/'freeze-sha256.txt').write_text(hashlib.sha256((case/'frozen.json').read_bytes()).hexdigest()+'\n')
