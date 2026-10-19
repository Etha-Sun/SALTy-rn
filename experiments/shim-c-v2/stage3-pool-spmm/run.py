"""Sequential bounded diagnostics and complete attempts; execution-only wp-par=1 adapter."""
from pathlib import Path
import sys,subprocess,hashlib,json,time,runpy,os,signal
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'tools'))
import shim_c_campaign_closure as campaign
def bounded(command,*args,**kwargs):
 timeout=kwargs.pop('timeout',None)
 process=subprocess.Popen(command,*args,start_new_session=True,**kwargs)
 try:
  stdout,stderr=process.communicate(timeout=timeout)
 except subprocess.TimeoutExpired:
  os.killpg(process.pid,signal.SIGKILL)
  process.communicate()
  raise
 return subprocess.CompletedProcess(command,process.returncode,stdout,stderr)

kernel,mode=sys.argv[1:3];case=HERE/kernel;digest=(case/'freeze-sha256.txt').read_text().strip();name=mode+'-01'
if mode=='diagnostic':
 data,guard=campaign.prepare(case,digest,name);ann=case/'.build'/name/'annotated';logs=case/'logs';logs.mkdir(exist_ok=True)
 (logs/(name+'-guard.json')).write_text(json.dumps(guard,indent=2)+'\n')
 names={'f32-maxpool':'stage3_channel_bounds,stage3_output_cursor','f32-spmm-frame-v3':'stage3_weight_step,stage3_delta_step,stage3_nnz_bounds','f32-spmm-frame-v2':'stage3_weight_step,stage3_delta_step,stage3_nnz_bounds','f32-argmaxpool-typed-v2':'stage3_group_count,stage3_group_index,stage3_index_cursor','f32-maxpool-step-v3':'stage3_vl_bound,stage3_next_bound,stage3_store_cursor','f32-maxpool-frame-v2':'stage3_channel_bounds,stage3_output_cursor','f32-argmaxpool':'stage3_group_count,stage3_group_index,stage3_index_cursor','f32-spmm-minmax':'stage3_weight_step,stage3_delta_step,stage3_nnz_bounds'}[kernel]
 cmd=[str(ROOT/'experiments/shim-c-v2/handoff-model-plus/frama-c.py'),'-machdep','gcc_x86_64','-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv','-wp','-wp-rte','-wp-par','1','-wp-timeout','5','-wp-memlimit','1024','-wp-cache','none','-wp-model',data['wp_model_variant'],'-warn-special-float','none','-wp-share',str(ROOT/data['wp_share']),'-wp-why3-config',str(ROOT/data['wp_why3_config']),'-wp-no-why3-detect','-wp-prover','z3,cvc5','-wp-driver',str(ann/data['driver']),'-wp-prop',names,'-wp-report-json',str(logs/(name+'.json')),'-wp-session',str(case/'.build'/name/'session'),str(ann/'unit.c')]
 (logs/(name+'-command.json')).write_text(json.dumps(cmd,indent=2)+'\n');t=time.monotonic()
 with (logs/(name+'.log')).open('x') as f:
  try:result=bounded(cmd,cwd=ann,stdout=f,stderr=subprocess.STDOUT,timeout=120);code=result.returncode
  except subprocess.TimeoutExpired:code=124
 (logs/(name+'-exit.json')).write_text(json.dumps({'exit':code,'seconds':time.monotonic()-t,'scope':'Selected properties only, not whole kernel acceptance.'})+'\n')
 print(kernel,mode,code,flush=True)
elif mode=='full':
 if (case/'full-deferred.json').exists():
  print('DEFERRED: no complete attempt executed; see full-deferred.json',flush=True)
  raise SystemExit(0)
 actual_run=subprocess.run
 def run(command,*args,**kwargs):
  if isinstance(command,list) and '-wp' in command:
   requested=list(command);command=list(command)
   command[command.index('-wp-par')+1]='1'
   with (case/'logs'/(name+'-execution.jsonl')).open('a') as f:f.write(json.dumps({'requested':requested,'actual':command,'only_change':'wp-par 2 -> 1'})+'\n')
   return bounded(command,*args,**kwargs)
  return actual_run(command,*args,**kwargs)
 subprocess.run=run
 sys.argv=[str(ROOT/'tools/shim_c_campaign_v4.py'),str(case),'--frozen-sha256',digest,'--name',name,'--framac',str(ROOT/'experiments/shim-c-v2/handoff-model-plus/frama-c.py'),'--prover-bin',str(ROOT/'experiments/shim-c-v2/handoff-solvers/.build/bin')]
 runpy.run_path(sys.argv[0],run_name='__main__')
else:raise ValueError(mode)
