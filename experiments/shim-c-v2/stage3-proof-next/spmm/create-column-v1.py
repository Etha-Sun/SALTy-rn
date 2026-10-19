from pathlib import Path
import shutil,json,hashlib,difflib
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'cuts-v4';c=H/'column-v1';c.mkdir();plain=R/'experiments/shim-c-v2/stage3-pool-spmm/f32-spmm-minmax/.build/edit/plain';ann=c/'.build/edit';shutil.copytree(old/'.build/edit',ann)
p=ann/'rvv.c';s=p.read_text();s='''/*@ ghost
/@ terminates \\true; assigns \\nothing;
    ensures spmm_size_exact: x>0 ==> (size_t)(x-1)==x-1; @/
static void spmm_size_decrement(size_t x) {}
*/
'''+s
s=s.replace('      vfloat32m8_t vout =', '''      /*@ assert spmm_column_consumed: nnz==0; */
      /*@ assert spmm_column_weight_done: w==stage3_w+stage3_nnz0; */
      /*@ assert spmm_column_delta_done: dmap==stage3_dmap+stage3_nnz0; */
      /*@ assert spmm_prefix_next: prefix_nnz(nidx_nnzmap,nc-n+1)==prefix_nnz(nidx_nnzmap,nc-n)+nidx_nnzmap[nc-n]; */
      /*@ assert spmm_column_map_value: stage3_nnz0==nidx_nnzmap[nc-n]; */
      vfloat32m8_t vout =''')
s=s.replace('    } while (--n != 0);', '''      /*@ assert spmm_column_predec: 1<=n<=nc; */
      //@ ghost spmm_size_decrement(n);
      /*@ assert spmm_column_decrement_exact: (size_t)(n-1)==n-1; */
    } while (--n != 0);''')
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file() or not (plain/p.name).exists():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d=json.loads((old/'frozen.json').read_text());d.update(name='spmm-column-v1',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),stage3_revision='Proof-only next-column prefix and completed nnz cursor cuts, with body-proved size_t decrement helper and no added requires.')
(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n')
