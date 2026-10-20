import pathlib,json,hashlib,datetime
b=pathlib.Path(__file__).parent
p=b/'handoff.json';h=json.loads(p.read_text());h['updated_at']=datetime.datetime.now().astimezone().isoformat();h['actually_closed_original_goals']=[];h['recommended_merge']=None
for v in h['profiles']:
 d=pathlib.Path(v['path']);a=d/'attempts/0001';e={'scope':'diagnostic','complete_kernel':False,'proof_sha256':v['proof_sha256'],'new_semantic_annotations':False,'public_precondition_changed':False,'actual_raw_reports':{}}
 for name in ['verify01-model-control.json','verify01-lemmas.json','verify01.json']:
  r=a/'logs'/name
  if r.exists():
   z=json.loads(r.read_text());e['actual_raw_reports'][name]={'passed':sum(x['passed'] for x in z),'total':len(z),'pending':[x['goal'] for x in z if not x['passed']]}
   if name=='verify01.json':
    good=[x for x in z if x['passed'] and 'assert_vmem_final_reads' in x['goal']]
    if good:h['actually_closed_original_goals']=[x['goal'] for x in good];h['recommended_merge']=str(d/'minimal-on-merged-values-v02.patch')
 g=a/'.build/verify01/guard.json';e['sourceguard_passed']=json.loads(g.read_text())['passed'] if g.exists() else None
 r=d/'run-0001.json';e['runner_result']=json.loads(r.read_text()) if r.exists() else {'state':'running'};e['missing_main_raw_is_not_vc_failure_count']='verify01.json' not in e['actual_raw_reports'];v['state']=e['runner_result']['state'];v['evidence']=str(d/'evidence.json');(d/'evidence.json').write_text(json.dumps(e,indent=2)+'\n')
p.write_text(json.dumps(h,indent=2)+'\n');print(json.dumps({'closed':h['actually_closed_original_goals'],'profiles':[{k:v[k] for k in ['path','state']} for v in h['profiles']]}))
