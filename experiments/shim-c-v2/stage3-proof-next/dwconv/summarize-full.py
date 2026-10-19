from pathlib import Path
import json,collections,hashlib
D=Path(__file__).resolve().parent;C=D/'r4';L=C/'logs'
def events(p):return [json.loads(x) for x in p.read_text().splitlines()]
body=events(L/'inventory-body01-events.jsonl');final=[v for v in body if v['event']=='final'];cfg=[v for v in final if v['results'] and all(r['prover']=='cfg' for r in v['results'])];inventory={v['goal']:v for v in final if v not in cfg};trace=events(L/'full01-events.jsonl');latest={v['goal']:v for v in trace if 'goal' in v};rows=[]
def category(v):
 f=v.get('function','');g=v['goal']
 if f=='canonical_nan':return 'canonical_nan_bit_representation_or_memcpy_contract'
 if f!='equivalent':return 'actual_callee_body_obligation'
 if 'ensures_equal' in g:return 'public_output_relation'
 if 'weight' in g:return 'packed_weight_cursor_or_validity'
 if 'row' in g or '_i0_' in g or '_i1_' in g or '_i2_' in g:return 'row_cursor_or_validity'
 if 'assigns' in g:return 'frame'
 if 'requires' in g or 'mem_access' in g:return 'call_or_memory_obligation'
 if 'loop_variant' in g or 'terminat' in g:return 'termination'
 return 'kernel_loop_or_assertion'
for gid,v in inventory.items():
 x=latest.get(gid,{});results=x.get('results',[]);status='valid' if any(r['verdict']=='valid' for r in results) else 'attempted_unproved' if any(r['verdict'] not in ['none','computing'] for r in results) else 'without_completed_prover_result'
 rows.append({'goal':gid,'property':v['property'],'function':v.get('function'),'file':v['file'],'line':v['line'],'category':category(v),'status':status,'results':results})
summary={'complete':False,'selected_candidate':'r4','normal_total':827,'body_total':len(inventory),'global_total':8,'cfg_only_count':len(cfg),'full_normal_exit_marker':bool(trace and trace[-1]['event']=='normal_exit'),'full_raw_exists':(L/'full01.json').exists(),'full_result':json.loads((L/'full01-result.json').read_text()) if (L/'full01-result.json').exists() else None,'body_counts':dict(collections.Counter(x['status'] for x in rows)),'globals_passed':json.loads((L/'lemmas01-result.json').read_text())['raw_passed'],'by_function':{},'unproved_categories':{},'scope':'Streaming outcomes for complete inventoried body set, plus separately checked global lemmas. Not strict checker acceptance. A timeout is not a counterexample or impossibility result; valid downstream obligations may depend on other unproved loop/callee/global obligations.','goals':rows}
for f in sorted({v['function'] for v in rows}):summary['by_function'][f]=dict(collections.Counter(v['status'] for v in rows if v['function']==f))
for status in ['attempted_unproved','without_completed_prover_result']:summary['unproved_categories'][status]=dict(collections.Counter(v['category'] for v in rows if v['status']==status))
summary['total_with_global_valid']=summary['body_counts'].get('valid',0)+summary['globals_passed'];(D/'FULL-STATUS.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps({k:v for k,v in summary.items() if k not in ['goals','full_result','by_function']},indent=2))
