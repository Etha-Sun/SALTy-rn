from pathlib import Path
import json,collections,hashlib
H=Path(__file__).resolve().parent;C=H/'r6';L=C/'logs'
def events(p):
 s=p.read_text();return [json.loads(x) for x in (s.splitlines() if s.endswith('\n') else s.splitlines()[:-1])]
def key(x):return (x['goal'],x['property'],Path(x['file']).name,x['line'],x.get('function'))
def cfg(x):return bool(x['results']) and all(v['prover']=='cfg' for v in x['results'])
inv={key(x):x for n in ['inventory-body01','inventory-lemmas01'] for x in events(L/(n+'-events.jsonl')) if x['event']=='final' and not cfg(x)}
latest={key(x):x for x in events(L/'full-root01-events.jsonl') if x['event'] in ['modified','final']}
counts=collections.Counter();rows=[]
for k,x in inv.items():
 e=latest.get(k);rr=e.get('results',[]) if e else [];vs=[v['verdict'] for v in rr if v['prover']!='cfg'];status='valid' if 'valid' in vs else ('timeout' if 'timeout' in vs else ('unknown_or_other' if vs else 'no_completed_result'));counts[status]+=1;rows.append({'goal':x['goal'],'function':x.get('function'),'property':x['property'],'file':Path(x['file']).name,'line':x['line'],'status':status,'results':rr})
unmapped=[x for k,x in latest.items() if k not in inv and not cfg(x)]
r=json.loads((L/'full-root01-result.json').read_text());summary={'inventory_complete':True,'logical_total':len(inv),'full_exit':r['exit_code'],'full_seconds':r['seconds'],'normal_exit_marker':None,'raw_total':r['raw_total'],'inputs_unchanged':r['inputs_unchanged'],'complete':False,'counts':dict(counts),'unmapped_count':len(unmapped),'unmapped_events':unmapped,'note':'Only full01 latest streaming events mapped to complete r6 inventory. No selected-run results transferred. Missing results remain uncompleted; valid results are conditional on proof contracts/other obligations and do not establish whole-kernel validity.','rows':rows};(C/'FULL-ROOT01-STREAM.json').write_text(json.dumps(summary,indent=2)+'\n');print(len(inv),dict(counts),'unmapped',len(unmapped))
