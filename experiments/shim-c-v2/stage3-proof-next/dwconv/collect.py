from pathlib import Path
import json,hashlib
D=Path(__file__).resolve().parent;R=D.parents[3];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();out={'complete':False,'selected_candidate':'r4','unexecuted_not_selected':['r2'],'candidates':[]}
for name in sorted(p.name for p in D.iterdir() if p.is_dir() and (p/'frozen.json').exists()):
 C=D/name;f=json.loads((C/'frozen.json').read_text());g=json.loads((C/'source-guard.json').read_text());a=Path(g['annotated']);proof=all(sha(R/p)==v for p,v in g['proof'].items());src=all(sha(R/v['path'])==v['sha256'] for v in f['files'].values());ann=all(sha(a/n)==v for n,v in g['generated'].items());results=[]
 for p in sorted((C/'logs').glob('*-result.json')):
  results.append({'file':str(p.relative_to(D)),**json.loads(p.read_text())})
 out['candidates'].append({'name':name,'guard':g['passed'],'frozen_sha256':sha(C/'frozen.json'),'proof_sha256':sha(C/'proof.patch'),'proof_unchanged':proof,'sources_unchanged':src,'annotated_unchanged':ann,'results':results})
out['r6_full_run']=json.loads((D/'r6/FULL-STATUS.json').read_text());(D/'STATUS.json').write_text(json.dumps(out,indent=2)+'\n');(D/'evidence-sha256.json').write_text(json.dumps({str(p.relative_to(D)):sha(p) for p in D.rglob('*') if p.is_file() and '.build' not in p.parts and p.name!='evidence-sha256.json'},indent=2)+'\n');print([(x['name'],x['guard'],x['proof_unchanged'],x['sources_unchanged'],x['annotated_unchanged']) for x in out['candidates']])
