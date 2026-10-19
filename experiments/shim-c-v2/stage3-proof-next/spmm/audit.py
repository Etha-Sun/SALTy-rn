from pathlib import Path
import json,hashlib,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[]
for c in sorted(H.iterdir()):
 if not (c/'frozen.json').exists():continue
 d=checker.baseline(c,sha(c/'frozen.json'));assert sha(c/'frozen.json')==(c/'freeze-sha256.txt').read_text().strip();assert sha(c/'proof.patch')==d['proof_sha256']
 old=json.loads((R/'experiments/shim-c-v2/stage3-pool-spmm/f32-spmm-frame-v3/frozen.json').read_text());assert old['files']==d['files'];assert old['wp_model_variant']==d['wp_model_variant']
 lock=json.loads((R/d['files']['float_model_lock.json']['path']).read_text());assert all(sha(Path(p) if Path(p).is_absolute() else R/p)==v for p,v in lock['files'].items())
 guards=[]
 for gpath in c.glob('*/guard.json'):
  g=json.loads(gpath.read_text());assert g['passed'];a=Path(g['annotated']);unchanged=all(sha(a/n)==v for n,v in g['generated'].items());assert unchanged;guards.append(str(gpath.relative_to(H)))
 records.append(dict(candidate=c.name,proof_sha256=d['proof_sha256'],frozen_sha256=sha(c/'frozen.json'),original_frozen_files_unchanged=True,model_inputs_unchanged=True,generated_guards_unchanged=guards))
(H/'AUDIT.json').write_text(json.dumps(records,indent=2)+'\n');print('audited',len(records),'candidates')
