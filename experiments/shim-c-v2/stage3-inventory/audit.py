"""Post-run identity checks, distinct from whole-kernel proof acceptance."""
from pathlib import Path
import json,hashlib,datetime
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
records=[]
for case in sorted(HERE.glob('*/stream01')):
 if not (case/'quick-lemmas/result.json').exists():continue
 control=json.loads((case/'control/result.json').read_text());guard=json.loads((case/'guard.json').read_text())
 frozen=ROOT/control['candidate']/'frozen.json';data=json.loads(frozen.read_text());checks={str(frozen.relative_to(ROOT)):sha(frozen)==control['frozen_sha256']}
 for record in data['files'].values():checks[record['path']]=sha(ROOT/record['path'])==record['sha256']
 for p,d in guard['proof'].items():checks[p]=sha(ROOT/p)==d
 for p,d in guard['generated'].items():checks[str(Path(guard['annotated'])/p)]=sha(Path(guard['annotated'])/p)==d
 lockpath=ROOT/data['files']['float_model_lock.json']['path'];lock=json.loads(lockpath.read_text())
 for p,d in lock['files'].items():checks[p]=sha(Path(p) if Path(p).is_absolute() else ROOT/p)==d
 observer=HERE.parent/'stage3-inventory-research/.build/observer.cmxs'
 checks[str(observer)]=sha(observer)==control['observer_sha256'];checks[str(observer.parent.parent/'observer.ml')]=sha(observer.parent.parent/'observer.ml')==control['observer_source_sha256']
 checks['stream.py']=sha(HERE/'stream.py')==control['runner_sha256']
 records.append({'kernel':case.parent.name,'accepted':all(checks.values()),'checked_files':len(checks),'failures':[p for p,ok in checks.items() if not ok],'proof_sha256':guard['proof'],'model_lock_sha256':sha(lockpath),'frozen_sha256':sha(frozen)})
 assert all(checks.values()),records[-1]
out={'time_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Identity audit only; not proof acceptance. Includes all locked external model inputs and generated proof sources.','kernels':records,'accepted':len(records)==9 and all(r['accepted'] for r in records)}
(HERE/'POST-RUN-AUDIT.json').write_text(json.dumps(out,indent=2)+'\n')
print('audited',len(records),'kernels')
