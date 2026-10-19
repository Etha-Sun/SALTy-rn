from pathlib import Path
import json,hashlib,subprocess,os,sys,time,signal
ROOT=Path(__file__).resolve().parents[3]; HERE=Path(__file__).resolve().parent
names=['f32-gemm-minmax-r1','f32-igemm-minmax-r1','qd8-f32-qc4w-gemm-minmax-r1'];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env=dict(os.environ);env['PYTHONPATH']=str(ROOT/'tools');env['PATH']=str(ROOT/'experiments/shim-c-v2/handoff-solvers/.build/bin')+os.pathsep+env['PATH']
mode=sys.argv[1]
for name in names:
 case=HERE/name; logs=case/'logs';logs.mkdir(exist_ok=True);annotated=case/'.build/diagnostic01/annotated';frozen=json.loads((case/'frozen.json').read_text());before={str(ROOT/v['path']):sha(ROOT/v['path']) for v in frozen['files'].values()};before[str(case/'proof.patch')]=sha(case/'proof.patch')
 if mode=='diagnostic':
  selected={'f32-gemm-minmax-r1':'stage3_acc_neon_0_0,stage3_acc_rvv_0_0','f32-igemm-minmax-r1':'stage3_inner_acc_neon_0,stage3_inner_acc_rvv_0','qd8-f32-qc4w-gemm-minmax-r1':'stage3_low_nibble,stage3_high_nibble'}[name]
  cmd=[str(ROOT/'experiments/shim-c-v2/handoff-model-plus/frama-c.py'),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-model',frozen['wp_model_variant'],'-warn-special-float','none','-wp-share',str(ROOT/frozen['wp_share']),'-wp-why3-config',str(ROOT/frozen['wp_why3_config']),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-par','1','-wp-timeout','10','-wp-memlimit','1024','-wp-cache','none','-wp-fct','equivalent','-wp-prop',selected,'-wp-driver',str(annotated/frozen['driver']),'-wp-session',str(case/'.build/diagnostic01/session'),'-wp-report-json',str(logs/'diagnostic01.json'),str(annotated/'unit.c')];budget=90;run='diagnostic01';cwd=annotated
 elif mode=='full':
  cmd=[sys.executable,str(HERE/'serial-v4.py'),str(case),'--frozen-sha256',sha(case/'frozen.json'),'--name','full01','--framac',str(ROOT/'experiments/shim-c-v2/handoff-model-plus/frama-c.py'),'--prover-bin',str(ROOT/'experiments/shim-c-v2/handoff-solvers/.build/bin')];budget=540;run='full01-launch';cwd=ROOT
 else:raise SystemExit(mode)
 record={'command':cmd,'budget_seconds':budget,'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'mode':mode,'scope':'Selected goals only, no complete acceptance' if mode=='diagnostic' else 'Full existing v4 checker with sole concurrency change to 1','input_sha256_before':before}
 (logs/(run+'-command.json')).write_text(json.dumps(record,indent=2)+'\n');start=time.monotonic()
 with (logs/(run+'.log')).open('x') as out:
  process=subprocess.Popen(cmd,cwd=cwd,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
  try:code=process.wait(timeout=budget)
  except subprocess.TimeoutExpired:
   os.killpg(process.pid,signal.SIGTERM)
   try:process.wait(timeout=5)
   except subprocess.TimeoutExpired:os.killpg(process.pid,signal.SIGKILL);process.wait()
   code=124
 record.update(exit=code,seconds=round(time.monotonic()-start,3),inputs_unchanged=all(sha(Path(p))==s for p,s in before.items()))
 raw=logs/(run+'.json')
 if raw.exists():
  goals=json.loads(raw.read_text());record['raw_total']=len(goals);record['raw_passed']=sum(bool(g['passed']) for g in goals);record['pending']=[g for g in goals if not g['passed']]
 else:record.update(raw_total=None,raw_passed=None,pending=None)
 (logs/(run+'-execution.json')).write_text(json.dumps(record,indent=2)+'\n');print(name,mode,code,record.get('raw_passed'),record.get('raw_total'),flush=True)
