from pathlib import Path
import json,re,hashlib
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
def read(p):return json.loads(p.read_text()) if p.exists() else None
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
rows=[]
for c in sorted(HERE.iterdir()):
 f=c/'frozen.json'
 if not f.exists():continue
 d=read(f);row={'candidate':c.name,'frozen_sha256':sha(f),'proof_sha256':sha(c/'proof.patch'),'frozen_sources_match':all(sha(ROOT/x['path'])==x['sha256'] for x in d['files'].values()),'proof_sha_matches_frozen':sha(c/'proof.patch')==d['proof_sha256'],'model':d.get('wp_model_variant',d['model']),'whole_kernel_accepted':False}
 for mode in ['diagnostic','full']:
  name=mode+'-01';raw=read(c/'logs'/f'{name}.json');log=c/'logs'/f'{name}.log';summary=read(c/'logs'/f'{name}-summary.json');status=read(c/'logs'/f'{name}-exit.json')
  if not log.exists():
   row[mode]={'executed':False,'deferred':read(c/'full-deferred.json') if mode=='full' else None};continue
  text=log.read_text();counts=re.findall(r'\[wp\] (\d+) goals scheduled',text)
  # v4 appends separately checked global lemmas even when the body report is absent.
  body=[g for g in (raw or []) if g.get('function')]
  globals_=[g for g in (raw or []) if not g.get('function')]
  info={'executed':True,'scope':'selected properties only' if mode=='diagnostic' else 'complete attempt with execution-only worker adapter','raw_body_present':bool(body),'body_total':len(body) if body else None,'body_passed':sum(bool(g['passed']) for g in body) if body else None,'global_total':len(globals_),'global_passed':sum(bool(g['passed']) for g in globals_),'scheduled':int(counts[-1]) if counts else None,'raw_pending':[g['goal'] for g in body if not g['passed']] if body else None,'logged_timeouts_or_unknown':re.findall(r'\[wp\] \[(?:Timeout|Unknown)\] (\S+)',text),'why3_type_error':'Type mismatch between frama_c_wp.memaddr.MemAddr.addr and int' in text}
  if summary:
   info.update({k:summary.get(k) for k in ['exit','seconds','complete','unchanged','model_inputs_unchanged','missing_body_ensures','missing_global_lemmas']});info['source_guard']=summary.get('source_guard',{}).get('passed');info['model_control_accepted']=summary.get('model_control',{}).get('accepted')
  elif status:info.update(status)
  row[mode]=info
 rows.append(row)
report={'scope':'Proof-only independent candidates, all native IEEE; complete counts are unknown when body raw is absent. Global-only records never count as kernel acceptance. Execution adapter differs only in worker count, recorded in execution.jsonl.','candidates':rows}
(HERE/'STATUS.json').write_text(json.dumps(report,indent=2)+'\n')
print('\n'.join(f"{r['candidate']}: diag={r['diagnostic'].get('body_passed')}/{r['diagnostic'].get('body_total')}, full exit={r['full'].get('exit')}, body={r['full'].get('body_total')}" for r in rows))
