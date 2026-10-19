"""One full-run stream over the complete inventory; never merge separate reruns."""
from pathlib import Path
import json,hashlib,collections
D=Path(__file__).resolve().parent;C=D/'conv-cursor-inline-r4';L=C/'logs';outpath=C/'FULL-ROOT01-STREAM.json';assert not outpath.exists()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):return [json.loads(x) for x in p.read_text().splitlines()]
parts={};cfg=[];inventory={};sources={}
for part,tag in [('body','inline-inventory-body02'),('global','inline-inventory-lemmas02')]:
 p=L/(tag+'-events.jsonl');events=read(p);assert events[-1]['event']=='normal_exit';sources[str(p.relative_to(C))]=sha(p);normal=[]
 for row in events:
  if row['event']!='final':continue
  if row['results'] and all(x['prover']=='cfg' for x in row['results']):cfg.append(row);continue
  assert row['goal'] not in inventory;inventory[row['goal']]=(part,row);normal.append(row)
 parts[part]=len(normal)
assert parts=={'body':2322,'global':6} and len(cfg)==55
p=L/'full-root01-events.jsonl';trace=read(p);sources[str(p.relative_to(C))]=sha(p);latest={r['goal']:r for r in trace if 'goal' in r};rows=[];mismatches=[]
for gid,(part,base) in inventory.items():
 event=latest.get(gid);results=event.get('results',[]) if event else [];bad=[]
 if event:
  for field in ['property','function','file','line','smoke']:
   if event.get(field)!=base.get(field):bad.append(field)
 if bad:mismatches.append({'goal':gid,'fields':bad})
 done=[x for x in results if x['verdict'] not in ['none','computing']]
 status='metadata_mismatch' if bad else 'valid' if any(x['verdict']=='valid' for x in results) else 'attempted_unproved' if done else 'without_completed_prover_result'
 rows.append({**{k:base.get(k) for k in ['goal','property','function','file','line','smoke']},'part':part,'status':status,'observed_in_full_stream':bool(event),'results':results})
resultpath=L/'full-root01-result.json';result=json.loads(resultpath.read_text());sources[str(resultpath.relative_to(C))]=sha(resultpath)
counts=lambda xs:dict(collections.Counter(x['status'] for x in xs))
summary={'complete':False,'strict_acceptance':False,'candidate':'conv-cursor-inline-r4','run':'full-root01','normal_total':len(rows),'body_total':parts['body'],'global_total':parts['global'],'cfg_only_separate':len(cfg),'full_raw_exists':(L/'full-root01.json').exists(),'full_normal_exit_marker':bool(trace and trace[-1]['event']=='normal_exit'),'full_result':result,'inventory_metadata_match':not mismatches,'metadata_mismatches':mismatches,'counts_over_complete_inventory':counts(rows),'body_counts':counts([r for r in rows if r['part']=='body']),'global_counts_in_this_stream_only':counts([r for r in rows if r['part']=='global']),'unproved_completed_verdicts_by_goal':dict(collections.Counter(v for r in rows if r['status']=='attempted_unproved' for v in set(x['verdict'] for x in r['results'] if x['verdict'] not in ['none','computing']))),'by_function':{},'trace_goals_outside_inventory_and_cfg':sorted(set(latest)-set(inventory)-{r['goal'] for r in cfg}),'evidence_sha256':sources,'scope':'Only full-root01 stream matched against completed 2328-goal inventory. The separately executed full-globals-root01 and earlier selected/helper results are NOT merged. Timeout/unknown/no-result do not establish a kernel counterexample; valid goals may depend on unproved contracts/invariants.','goals':rows}
for f in sorted({r['function'] or '<globals>' for r in rows}):summary['by_function'][f]=counts([r for r in rows if (r['function'] or '<globals>')==f])
outpath.write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v for k,v in summary.items() if k not in ['goals','by_function','evidence_sha256','full_result']},indent=2))
