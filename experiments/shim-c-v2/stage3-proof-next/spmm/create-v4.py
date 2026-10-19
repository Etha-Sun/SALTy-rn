from pathlib import Path
import shutil,json,hashlib,difflib
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c'); H=Path(__file__).resolve().parent
old=R/'experiments/shim-c-v2/stage3-pool-spmm/f32-spmm-frame-v3'; c=H/'cuts-v4';c.mkdir()
plain=R/'experiments/shim-c-v2/stage3-pool-spmm/f32-spmm-minmax/.build/edit/plain'
ann=c/'.build/edit';shutil.copytree(old/'.build/edit/annotated',ann)
p=ann/'rvv.c';s=p.read_text();s=s.replace('        } while (--nnz != 0);','''          /*@ assert spmm_before_decrement: 1<=nnz<=stage3_nnz0; */
              /*@ assert spmm_next_count: 0<=nnz-1<stage3_nnz0; */
              /*@ assert spmm_weight_advanced: w==stage3_w+(stage3_nnz0-nnz)+1; */
              /*@ assert spmm_delta_advanced: dmap==stage3_dmap+(stage3_nnz0-nnz)+1;
          */
          /*@ assert spmm_decrement_exact: (uint32_t)(nnz-1)==nnz-1; */
          /*@ assert spmm_weight_rebased: w==stage3_w+(stage3_nnz0-(uint32_t)(nnz-1)); */
          /*@ assert spmm_delta_rebased: dmap==stage3_dmap+(stage3_nnz0-(uint32_t)(nnz-1)); */
        } while (--nnz != 0);''' );s='/*@ ghost\n/@ terminates \\true; assigns \\nothing;\n    ensures spmm_u32_exact: x>0 ==> (uint32_t)(x-1)==x-1; @/\nstatic void spmm_u32_decrement(uint32_t x) {}\n*/\n'+s
s=s.replace('          /*@ assert spmm_decrement_exact:', '          //@ ghost spmm_u32_decrement(nnz);\n          /*@ assert spmm_decrement_exact:')
p.write_text(s)
patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file() or not (plain/p.name).exists():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):
  patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
d=json.loads((old/'frozen.json').read_text());d.update(name='spmm-cuts-v4',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),wp_timeout=30,wp_budget=1200,stage3_revision='Proof-only explicit pre-decrement range and pointer-step cuts; every new assertion retained as a proof obligation.')
(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n')
