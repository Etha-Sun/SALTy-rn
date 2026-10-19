"""Controls for weakened native32/FMA v6; never a consistency or kernel theorem."""
from pathlib import Path
import hashlib,json,os,subprocess,sys,time
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];MODEL=HERE/'model-native-bytes32-v6-no-pointer-range';FMA=HERE.parent/'core-float-wave2/model-native-bytes32-v6-fma';GROUP=sys.argv[1];OUT=(MODEL if GROUP=='native' else FMA)/'controls';OUT.mkdir(exist_ok=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();env=dict(os.environ,PATH='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+os.environ['PATH'])
common=['-machdep','gcc_x86_64','-wp','-wp-rte','-wp-model','Bytes','-warn-special-float','none','-wp-par','2','-wp-prover','tip,z3,cvc5','-wp-timeout','5','-wp-memlimit','1024','-wp-cache','none','-wp-auto-depth','30','-wp-print']
if GROUP=='native':
 cases=[('bookkeeping01',HERE/'probes/bookkeeping-inline-controls-v3.c',{'bookkeeping_false_ensures','mask_bad_ensures_mask_bad'},[]),('representation01',HERE/'probes/representation-helper-controls.c',{'unbounded_inverse_control_ensures','nan_inverse_control_ensures','representation_false_control_ensures'},[]),('word-store01',ROOT/'experiments/codex-kernel-wave1/audit/codec-store-controls.c',{'arbitrary_value_roundtrip_ensures','independent_nan_stores_equal_ensures','codec_false_ensures'},[]),('nan-loop01',HERE/'probes/one-site-two-iterations-frame-cut.c',{'one_site_nan_bits_equal_control_ensures'},['-ulevel','3','-ulevel-force'])];frontend=MODEL/'frama-c.py'
else:
 cases=[('fma01',HERE.parent/'core-float-wave2/model-native-bytes32-v5-fma/fma-controls-v3.c',{'impossible_fma_control_ensures','wrong_unfused_control_ensures'},[])];frontend=FMA/'frama-c.py'
reports=[]
for name,source,negative,extra in cases:
 command=[str(frontend),*common,str(source),'-wp-report-json',str(OUT/(name+'.json')),*extra];(OUT/(name+'-command.json')).write_text(json.dumps(command,indent=2)+'\n');start=time.monotonic();result={'name':name,'source_sha256':sha(source),'expected_negative_properties':sorted(negative)}
 try:
  with (OUT/(name+'.log')).open('w') as log:r=subprocess.run(command,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=180)
  result['exit']=r.returncode
 except subprocess.TimeoutExpired:result['budget_exhausted']=True
 result['seconds']=time.monotonic()-start
 if (OUT/(name+'.json')).exists():
  rows=json.loads((OUT/(name+'.json')).read_text());bad=[r['property'] for r in rows if not r['passed']];result.update(passed=sum(r['passed'] for r in rows),total=len(rows),not_proved=bad,accepted=result.get('exit')==0 and set(bad)==negative)
 reports.append(result);(OUT/'qualification-results.json').write_text(json.dumps({'group':GROUP,'model_lock_sha256':sha((MODEL if GROUP=='native' else FMA)/'float_model_lock.json'),'scope':'Controls only, not consistency or full kernel equivalence; root independent audit required.','results':reports},indent=2)+'\n')
source=HERE/'probes/unsupported-float64.c';command=[str(frontend),*common,str(source)];(OUT/'float64-rejection-command.json').write_text(json.dumps(command,indent=2)+'\n');r=subprocess.run(command,env=env,capture_output=True,text=True,timeout=90);(OUT/'float64-rejection.log').write_text(r.stdout+r.stderr);reports.append({'name':'float64-rejection','source_sha256':sha(source),'exit':r.returncode,'accepted_rejection':r.returncode!=0 and 'supports binary32 only' in (r.stdout+r.stderr)})
(OUT/'qualification-results.json').write_text(json.dumps({'group':GROUP,'model_lock_sha256':sha((MODEL if GROUP=='native' else FMA)/'float_model_lock.json'),'scope':'Controls only, not consistency or full kernel equivalence; root independent audit required.','results':reports},indent=2)+'\n');print(json.dumps(reports,indent=2))
