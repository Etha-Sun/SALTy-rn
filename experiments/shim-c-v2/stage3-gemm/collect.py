from pathlib import Path
import json,hashlib,re
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
items=[]
for case in sorted(HERE.iterdir()):
 if not (case/'frozen.json').exists():continue
 m=json.loads((case/'frozen.json').read_text());item={'candidate':case.name,'kernel':m['name'],'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'proof_matches_freeze':sha(case/'proof.patch')==m['stage3']['proof_sha256'],'source_files_match':all(sha(ROOT/v['path'])==v['sha256'] for v in m['files'].values()),'complete':False,'target_modified':False,'attempts':[]}
 for execution in sorted((case/'logs').glob('*-execution.json')):
  d=json.loads(execution.read_text());item['attempts'].append({'file':str(execution.relative_to(ROOT)),'mode':d.get('mode','selected-helper-bodies'),'exit':d['exit'],'seconds':d['seconds'],'raw_passed':d['raw_passed'],'raw_total':d['raw_total'],'pending':[x['goal'] for x in d['pending']] if d['pending'] is not None else None,'pending_verdicts':[{'goal':x['goal'],'verdict':x.get('verdict')} for x in d['pending']] if d['pending'] is not None else None,'inputs_unchanged':d.get('inputs_unchanged')})
 for summary in sorted((case/'logs').glob('full*-summary.json')):
  d=json.loads(summary.read_text());rawfile=summary.with_name(summary.name.replace('-summary',''));raw=json.loads(rawfile.read_text()) if rawfile.exists() else [];body=[g for g in raw if g.get('function')];lemmas=[g for g in raw if not g.get('function')];hasbody=bool(body) and d.get('exit')!=124;log=summary.with_name(summary.name.replace('-summary.json','.log')).read_text();scheduled=re.findall(r'\[wp\] (\d+) goals scheduled',log)
  record={'summary':str(summary.relative_to(ROOT)),'exit':d.get('exit'),'complete':d.get('complete',False),'seconds':d.get('seconds'),'body_report_complete':hasbody,'body_passed':sum(g['passed'] for g in body) if hasbody else None,'body_total':len(body) if hasbody else None,'scheduled_body_goals':int(scheduled[-1]) if scheduled else None,'global_only_report_count':len(lemmas),'pending_body':[g['goal'] for g in body if not g['passed']] if hasbody else None,'logged_unproved_goals':re.findall(r'\[wp\] \[(?:Timeout|Failure|Unknown)\] (\S+)',log),'source_guard_passed':d.get('source_guard',{}).get('passed'),'unchanged':d.get('unchanged'),'model_inputs_unchanged':d.get('model_inputs_unchanged'),'model_control_accepted':d.get('model_control',{}).get('accepted'),'missing_body_ensures':d.get('missing_body_ensures'),'missing_global_lemmas':d.get('missing_global_lemmas')};item.setdefault('full_attempts',[]).append(record);item['complete']=item['complete'] or record['complete']
 items.append(item)
result={'scope':'Stage3 GEMM proof continuation. Diagnostics/global lemmas are not full kernel results. No target change/counterexample identified.','new_full_kernel_successes':len({i['kernel'] for i in items if i['complete']}),'candidates':items}
(HERE/'RESULTS.json').write_text(json.dumps(result,indent=2)+'\n');print('candidates',len(items),'complete',result['new_full_kernel_successes'])
