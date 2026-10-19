from pathlib import Path
import json,collections,hashlib
H=Path(__file__).resolve().parent;c=H/'cuts-v4';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
inv={};cfg={};inventory_ok=True
for phase in ['body','lemmas']:
 p=c/('inventory-'+phase);events=[json.loads(l) for l in (p/'events.jsonl').read_text().splitlines()];final=[e for e in events if e['event']=='final'];r=json.loads((p/'result.json').read_text());inventory_ok &= r['exit']==0 and r['normal_exit_marker'] and len(final)==r['goal_count']==len({e['goal'] for e in final})
 for e in final:
  target=cfg if e['results'] and all(v['prover']=='cfg' and v['verdict']=='valid' for v in e['results']) else inv
  target[e['goal']]=e
seen={};unmapped=[];evidence={}
for p in [c/'selected01/events.jsonl',c/'helper01/events.jsonl',*sorted((c/'logs').glob('full01-events-*.jsonl'))]:
 evidence[str(p.relative_to(H))]=sha(p)
 for line in p.read_text().splitlines():
  e=json.loads(line)
  if 'goal' not in e or e['goal'] not in inv:continue
  ref=inv[e['goal']]
  if any(e.get(k)!=ref.get(k) for k in ['property','line','function','smoke']) or Path(e['file']).name!=Path(ref['file']).name:unmapped.append(e);continue
  seen.setdefault(e['goal'],[]).append(dict(run=str(p.relative_to(c)),results=e['results']))
rows=[]
for gid,e in inv.items():
 trials=seen.get(gid,[]);verdicts={v['verdict'] for t in trials for v in t['results'] if v['prover']!='cfg'}
 status=next((label for verdict,label in [('valid','passed'),('failed','tool_error'),('invalid','invalid_reported_needs_review'),('timeout','timeout'),('stepout','stepout'),('unknown','unknown')] if verdict in verdicts),'no_completed_check')
 rows.append(dict(goal=gid,property=e['property'],function=e.get('function'),file=e['file'],line=e['line'],status=status,trials=trials))
summary_path=c/'logs/full01-summary.json';full=json.loads(summary_path.read_text()) if summary_path.exists() else None
record=dict(candidate='cuts-v4',inventory_complete=inventory_ok,complete=False,whole_kernel_accepted=False,total_obligations=len(rows),cfg_only_separate_count=len(cfg),counts=dict(collections.Counter(r['status'] for r in rows)),by_scope={n:dict(collections.Counter(r['status'] for r in rows if ('main' if r['function']=='equivalent' else 'helper' if r['function'] else 'global')==n)) for n in ['main','helper','global']},full_run_finished=full is not None,full_summary=full,unmapped=unmapped,obligations=rows,evidence_sha256=evidence,scope='Results from same frozen proof only; path normalization strips distinct generated-directory prefixes after source guards; a selected proof is not whole-kernel acceptance.')
full_status=[]
for row in rows:
 verdicts={v['verdict'] for t in row['trials'] if t['run'].startswith('logs/full01-events-') for v in t['results'] if v['prover']!='cfg'}
 full_status.append(next((label for verdict,label in [('valid','passed'),('failed','tool_error'),('invalid','invalid_reported_needs_review'),('timeout','timeout'),('stepout','stepout'),('unknown','unknown')] if verdict in verdicts),'no_completed_check'))
record['full_only_counts']=dict(collections.Counter(full_status))
(c/'REPORT.json').write_text(json.dumps(record,indent=2)+'\n');print({k:v for k,v in record.items() if k not in ['full_summary','obligations','evidence_sha256']})
