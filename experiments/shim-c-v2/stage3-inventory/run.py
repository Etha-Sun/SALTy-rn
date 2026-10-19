"""Diagnostic inventory only: unchanged frozen inputs, independent execution options."""
from pathlib import Path
import sys,json,hashlib,subprocess,os,signal,time,re
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];BASE=HERE.parent
sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as checker
CASES={
 'f32-gemm-minmax':'stage3-gemm/f32-gemm-minmax-r4',
 'f32-igemm-minmax':'stage3-gemm/f32-igemm-minmax-r4',
 'qd8-f32-qc4w-gemm-minmax':'stage3-gemm/qd8-f32-qc4w-gemm-minmax-r2',
 'f32-conv-hwc2chw':'stage3-conv/revision3/f32-conv-hwc2chw',
 'f32-dwconv-minmax':'stage3-conv/revision5/f32-dwconv-minmax',
 'f32-dwconv2d-chw':'stage3-conv/revision2/f32-dwconv2d-chw',
 'f32-maxpool':'stage3-pool-spmm/f32-maxpool-step-v3',
 'f32-argmaxpool':'stage3-unary-front/replay/f32-argmaxpool',
 'f32-spmm-minmax':'stage3-pool-spmm/f32-spmm-frame-v3'}
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
kernel,run,mode=sys.argv[1:4];assert re.fullmatch(r'[a-zA-Z0-9_-]+',run)
assert mode in ['inventory','quick']
out=HERE/kernel/run;out.mkdir(parents=True,exist_ok=False)
case=BASE/CASES[kernel];digest=sha(case/'frozen.json');data,guard=checker.prepare(case,digest,'inventory-'+run)
assert guard['passed'];ann=Path(guard['annotated'])
(out/'guard.json').write_text(json.dumps(guard,indent=2)+'\n')
closure=checker.shim_c_call_closure.closure(ann/'unit.c',set())
(out/'closure.json').write_text(json.dumps(closure,indent=2)+'\n')
lockpath=ROOT/data['files']['float_model_lock.json']['path'];lock=json.loads(lockpath.read_text())
for p,d in lock['files'].items():assert sha(Path(p) if Path(p).is_absolute() else ROOT/p)==d,p
frontend=BASE/('stage3-unary-front' if 'stage3-unary-front' in str(lockpath) else 'handoff-model-plus')/'frama-c.py'
base=[str(frontend),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','2','-wp-prover','qed' if mode=='inventory' else 'z3','-wp-timeout','1','-wp-memlimit','1024','-wp-cache','none','-wp-no-qed','-wp-no-clean','-wp-model',data.get('wp_model_variant',data['model']),'-warn-special-float','none','-wp-share',str(ROOT/data['wp_share']),'-wp-why3-config',str(ROOT/data['wp_why3_config']),'-wp-no-why3-detect','-wp-driver',str(ann/data['driver']),str(ann/'unit.c')]
if mode=='quick':base+=['-wp-steps','1000']
for phase in ['body','lemmas']:
 target=out/phase;target.mkdir();cmd=base+['-wp-report-json',str(target/'raw.json'),'-wp-session',str(target/'.build/session')]
 if phase=='body':cmd+=['-wp-skip-fct',','.join(closure['unreachable_definitions'])]
 else:cmd+=['-wp-prop','@lemma']
 budget=300 if mode=='inventory' else 600
 record={'kernel':kernel,'candidate':str(case.relative_to(ROOT)),'frozen_sha256':digest,'model_lock_sha256':sha(lockpath),'mode':mode,'phase':phase,'command':cmd,'cwd':str(ann),'budget':budget,'scope':'Diagnostic only; not canonical acceptance. Qed normalization disabled; goal identities/counts may differ from historical runs.'}
 (target/'command.json').write_text(json.dumps(record,indent=2)+'\n');t=time.monotonic()
 with (target/'run.log').open('x') as log:
  p=subprocess.Popen(cmd,cwd=ann,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'PATH':str(BASE/'handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=p.wait(timeout=budget)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 rows=json.loads((target/'raw.json').read_text()) if (target/'raw.json').exists() else None
 record.update(exit=code,seconds=round(time.monotonic()-t,3),raw_total=len(rows) if rows is not None else None,raw_passed=sum(bool(r['passed']) for r in rows) if rows is not None else None,input_unchanged=checker.baseline(case,digest)==data and all(sha(ann/n)==d for n,d in guard['generated'].items()))
 (target/'result.json').write_text(json.dumps(record,indent=2)+'\n');print(kernel,mode,phase,code,record['raw_passed'],record['raw_total'],flush=True)
