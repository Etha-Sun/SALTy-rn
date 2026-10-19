"""Aggregate observational inventories; never converts a diagnostic to acceptance."""
from pathlib import Path
import json,hashlib,collections,csv
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
phases=['inventory-body','inventory-lemmas','quick-helpers','quick-main','quick-lemmas']
metadata=lambda r:tuple(r.get(k) for k in ['goal','property','file','line','function','behavior','smoke'])
summary=[]
for case in sorted(HERE.glob('*/stream01')):
 if not (case/'quick-lemmas/result.json').exists():continue
 inventory={};evidence={};phase_results={};complete=True
 for phase in phases:
  folder=case/phase
  if phase=='inventory-body' and (case.parent/'inventory-body-retry01/result.json').exists():
   retry=json.loads((case.parent/'inventory-body-retry01/result.json').read_text())
   if retry['exit']==0:folder=case.parent/'inventory-body-retry01'
  p=folder/'events.jsonl';result=json.loads((folder/'result.json').read_text());phase_results[phase]=result
  assert result.get('input_unchanged',result.get('inputs_unchanged'))
  evidence[str(p.relative_to(ROOT))]=sha(p)
  events=[json.loads(l) for l in p.read_text().splitlines()]
  if phase.startswith('inventory'):
   final=[x for x in events if x['event']=='final'];markers=[x for x in events if x['event']=='normal_exit']
   ok=result['exit']==0 and len(markers)==1 and markers[0]['goal_count']==len(final)==len({r['goal'] for r in final})
   complete &=ok
   for r in final:
    if r['goal'] in inventory:assert metadata(r)==metadata(inventory[r['goal']])
    inventory[r['goal']]=r
 control=json.loads((case/'control/result.json').read_text());assert control['accepted']
 guard=json.loads((case/'guard.json').read_text());assert guard['passed']
 evidence[str((case/'guard.json').relative_to(ROOT))]=sha(case/'guard.json')
 seen={};unmapped=[];raw_checks=[]
 for phase in phases[2:]:
  p=case/phase/'events.jsonl';events=[json.loads(l) for l in p.read_text().splitlines()];latest={r['goal']:r for r in events if 'goal' in r}
  rawpath=case/phase/'raw.json'
  if rawpath.exists():
   raw=json.loads(rawpath.read_text());missing=[r['goal'] for r in raw if r['goal'] not in latest]
   mismatched=[r['goal'] for r in raw if r['goal'] in latest and metadata(r)!=metadata(latest[r['goal']])]
   assert not missing and not mismatched,(phase,missing,mismatched)
   # The observer reports direct prover verdicts; canonical consolidated raw stays separate.
   for r in raw:
    if r['passed']:assert any(x['verdict']=='valid' for x in latest[r['goal']]['results']),r
   raw_checks.append({'phase':phase,'raw_count':len(raw),'raw_passed':sum(r['passed'] for r in raw),'observer_metadata_matches':True,'raw_sha256':sha(rawpath)})
  for gid,r in latest.items():
   if gid not in inventory or metadata(inventory[gid])!=metadata(r):unmapped.append({'phase':phase,'goal':gid,'reason':'not in inventory or metadata mismatch','observed_metadata':list(metadata(r)),'inventory_metadata':list(metadata(inventory[gid])) if gid in inventory else None,'excluded_results':r['results']});continue
   seen.setdefault(gid,[]).append({'phase':phase,'results':r['results']})
 rows=[];cfg=[]
 for gid,r in sorted(inventory.items()):
  row={k:r.get(k) for k in ['goal','property','file','line','function','behavior','smoke']}
  if r['results'] and all(x['prover']=='cfg' and x['verdict']=='valid' for x in r['results']):cfg.append(row);continue
  trials=seen.get(gid,[]);results=[v for t in trials for v in t['results'] if v['prover']!='cfg'];verdicts={v['verdict'] for v in results}
  if 'valid' in verdicts:status='passed'
  elif 'failed' in verdicts:status='tool_error'
  elif 'invalid' in verdicts:status='invalid_reported_needs_review'
  elif 'timeout' in verdicts:status='timeout'
  elif 'stepout' in verdicts:status='stepout'
  elif 'unknown' in verdicts:status='unknown'
  else:status='no_completed_check'
  row.update(status=status,attempts=trials);rows.append(row)
 counts=dict(collections.Counter(r['status'] for r in rows));assert sum(counts.values())==len(rows)
 closure=json.loads((case/'closure.json').read_text());expected=set(closure['functions'])-{'test_neon','test_rvv'}
 present={r.get('function') for r in inventory.values()};missing_functions=sorted(expected-present)
 record={'kernel':case.parent.name,'inventory_complete':bool(complete and not missing_functions),'screen_mapping_complete':not unmapped,'complete':False,'whole_kernel_accepted':False,'candidate':control['candidate'],'frozen_sha256':control['frozen_sha256'],'model_lock_sha256':control['model_lock_sha256'],'observer_sha256':control['observer_sha256'],'source_guard':True,'model_control_accepted':True,'total_obligations':len(rows),'counts':counts,'cfg_only_separate_count':len(cfg),'missing_functions':missing_functions,'unmapped_quick_goals':unmapped,'raw_report_checks':raw_checks,'runs':{k:{x:v.get(x) for x in ['exit','seconds','normal_exit_marker','raw_total','raw_passed']} for k,v in phase_results.items()},'evidence_sha256':evidence,'obligations':rows,'cfg_only_obligations':cfg,'scope':'Complete inventory is not a complete proof. Passed goals may depend on unproved contracts/global lemmas. Unknown/stepout/timeout do not show a false theorem. No completed check includes unstarted or interrupted work. Counts reflect this pinned candidate and diagnostic options, not historical canonical totals.'}
 record['by_function']={name:dict(collections.Counter(r['status'] for r in rows if (r.get('function') or '<global>')==name)) for name in sorted({r.get('function') or '<global>' for r in rows})}
 (case/'REPORT.json').write_text(json.dumps(record,indent=2)+'\n')
 with (case/'OBLIGATIONS.tsv').open('w') as f:
  writer=csv.writer(f,delimiter='\t',lineterminator='\n');writer.writerow(['goal','function','property','file','line','status'])
  for r in rows:writer.writerow([r.get(k) for k in ['goal','function','property','file','line','status']])
 summary.append({k:record[k] for k in ['kernel','inventory_complete','complete','total_obligations','counts','cfg_only_separate_count','candidate']})
(HERE/'RESULTS.json').write_text(json.dumps({'kernel_count':len(summary),'all_nine_inventoried':len(summary)==9 and all(r['inventory_complete'] for r in summary),'new_complete_kernels':0,'kernels':summary},indent=2)+'\n')
for r in summary:print(r['kernel'],r['inventory_complete'],r['total_obligations'],r['counts'])
