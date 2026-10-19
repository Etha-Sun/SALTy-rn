"""Re-freeze an identical old proof solely for a fresh same-budget comparison."""
from pathlib import Path
import json,sys,hashlib
H=Path(__file__).resolve().parent
R=H.parents[3]
sys.path.insert(0,str(R/'tools'))
import shim_c_campaign_closure as checker
old=R/'experiments/shim-c-v2/stage3-pool-spmm/f32-maxpool-step-v3'
c=H/'baseline-v3'
c.mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
(c/'proof.patch').write_bytes((old/'proof.patch').read_bytes())
m=json.loads((old/'frozen.json').read_text())
m['proof_patches']=[str((c/'proof.patch').relative_to(R))]
m['proof_sha256']=sha(c/'proof.patch')
m['baseline_source']=str(old.relative_to(R))
(c/'frozen.json').write_text(json.dumps(m,indent=2)+'\n')
_,g=checker.prepare(c,sha(c/'frozen.json'),'diagnostic01')
(c/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
print(g['passed'])
