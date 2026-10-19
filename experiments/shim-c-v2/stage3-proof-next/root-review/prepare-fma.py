"""Add checked array tactics to original FMA helper obligations only."""
from pathlib import Path
import json,hashlib,sys,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as c
old=R/'experiments/shim-c-v2/stage3-gemm/f32-gemm-minmax-r4';out=H/'fma-r1';out.mkdir(exist_ok=False);m=json.loads((old/'frozen.json').read_text());g=json.loads((R/'experiments/shim-c-v2/stage3-inventory/f32-gemm-minmax/stream01/guard.json').read_text());ann=Path(g['annotated']);sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();diff=[]
for name,item in m['files'].items():
 original=(R/item['path']).read_text();annotated=(ann/name).read_text()
 if name=='fp_primitives.h':
  needle='\\wp::proof Stage3Array: equivalent ,stage3_gacc_seed,stage3_gacc_step;'
  assert needle in annotated
  annotated=annotated.replace(needle,needle+'\n    \\wp::proof Stage3Array: __riscv_vfmacc_vf_f32m4,vfmaq_f32;')
 diff.extend(difflib.unified_diff(original.splitlines(True),annotated.splitlines(True),fromfile='a/'+name,tofile='b/'+name))
(out/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(R));m['proof_patches']=[str((out/'proof.patch').relative_to(R))];m['stage3'].update(proof_sha256=sha(out/'proof.patch'),previous_candidate_frozen_sha256=sha(old/'frozen.json'),fix='Add existing checked Wp.array strategy to both actual FMA helper bodies; no contract/source/model changes.')
(out/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=c.prepare(out,sha(out/'frozen.json'),'diagnostic01');(out/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
print(sha(out/'frozen.json'))
