from pathlib import Path
import shutil,json,hashlib,difflib
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'column-v2';c=H/'column-v3';c.mkdir();plain=R/'experiments/shim-c-v2/stage3-pool-spmm/f32-spmm-minmax/.build/edit/plain';ann=c/'.build/edit';shutil.copytree(old/'.build/edit',ann)
p=ann/'rvv.c';s=p.read_text()
s=s.replace('      if (nnz != 0) {', '''      /*@ assert spmm_map_local_disjoint: \\separated(nidx_nnzmap+(nc-n), &nnz); */
      /*@ assert spmm_map_initial_value: stage3_nnz0==nidx_nnzmap[nc-n]; */
      if (nnz != 0) {''')
s=s.replace('/*@ loop invariant stage3_nnz_bounds:', '/*@ loop invariant spmm_inner_map_value: stage3_nnz0==nidx_nnzmap[nc-n];\n            loop invariant stage3_nnz_bounds:')
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file() or not (plain/p.name).exists():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d=json.loads((old/'frozen.json').read_text());d.update(name='spmm-column-v3',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),stage3_revision='Explicit metadata/local separation proof cut and metadata preservation invariant; every new obligation retained, no new requires.')
(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n')
