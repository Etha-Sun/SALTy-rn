from pathlib import Path
import shutil,json,hashlib,difflib
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'column-v1';c=H/'column-v2';c.mkdir();plain=R/'experiments/shim-c-v2/stage3-pool-spmm/f32-spmm-minmax/.build/edit/plain';ann=c/'.build/edit';shutil.copytree(old/'.build/edit',ann)
p=ann/'rvv.c';s=p.read_text();s='''/*@ ghost
/@ terminates \\true; assigns \\nothing;
    ensures spmm_prefix_zero: prefix_nnz(p,0)==0; @/
static void spmm_prefix_zero(const uint32_t *p) {}
*/
'''+s
s=s.replace('    size_t n = nc;', '''    size_t n = nc;
    //@ ghost spmm_prefix_zero(nidx_nnzmap);
    /*@ assert spmm_origin_count: n==nc; */
    /*@ assert spmm_origin_nnz: nnzmap==nidx_nnzmap+(nc-n); */
    /*@ assert spmm_origin_delta: dmap==widx_dmap+prefix_nnz(nidx_nnzmap,nc-n); */
    /*@ assert spmm_origin_weight: w==weights+(nc-n)+prefix_nnz(nidx_nnzmap,nc-n); */''')
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file() or not (plain/p.name).exists():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d=json.loads((old/'frozen.json').read_text());d.update(name='spmm-column-v2',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),stage3_revision='Proof-only prefix-zero body lemma and explicit initial column cursor cuts; no new requires, inherited column-v1 unresolved obligations retained.')
(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n')
