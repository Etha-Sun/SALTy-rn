"""Summarize completed none inventories; CFG-only is never a raw VC."""
from pathlib import Path
import sys,json,hashlib,collections
D=Path(__file__).resolve().parent;C=D/sys.argv[1];out={'complete_kernel':False,'inventory_complete':True,'parts':{}}
for part,tag in [('body',sys.argv[2]),('lemmas',sys.argv[3])]:
 p=C/'logs'/f'{tag}-events.jsonl';r=[json.loads(x) for x in p.read_text().splitlines()];f=[x for x in r if x['event']=='final'];cfg=[x for x in f if x['results'] and all(y['prover']=='cfg' for y in x['results'])];normal=[x for x in f if x not in cfg];done=bool(r and r[-1]['event']=='normal_exit');out['inventory_complete'] &= done
 out['parts'][part]={'run':tag,'final':len(f),'cfg_only':len(cfg),'normal':len(normal),'normal_exit':done,'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'by_function':dict(collections.Counter(x.get('function') for x in normal))}
out['normal_total']=sum(x['normal'] for x in out['parts'].values()) if out['inventory_complete'] else None
(C/'INVENTORY-STATUS.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
