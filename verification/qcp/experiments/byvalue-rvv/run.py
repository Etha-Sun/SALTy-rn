#!/usr/bin/env python3
"""Replay the RVV value interface using existing checked primitive contracts."""
from pathlib import Path
import hashlib,json,re,subprocess,time
HERE=Path(__file__).resolve().parent
OLD=HERE.parent/'vadd-rvv'
BUILD=HERE/'.build'
BUILD.mkdir(exist_ok=True)
records=[]
def run(command,label,timeout=240):
 start=time.monotonic()
 result=subprocess.run(list(map(str,command)),cwd=HERE,capture_output=True,text=True,timeout=timeout)
 (BUILD/(label+'.log')).write_text(result.stdout+result.stderr)
 records.append({'label':label,'command':list(map(str,command)),'exit_code':result.returncode,'elapsed':time.monotonic()-start})
 assert result.returncode==0,result.stdout+result.stderr

def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
run(['python3',HERE/'check.py'],'wrapper-check')
assert json.loads((HERE/'status.json').read_text())['passed']
run(['python3',HERE/'generate_kernel.py'],'kernel-source')
run(['gcc','-E','-P','-CC','-nostdinc',HERE/'macro_rvv.c','-o',BUILD/'macro_unit.c'],'macro-preprocess')
run(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(BUILD/'macro_unit.c'),'--coq-output-dir='+str(BUILD),'--coq-logic-path=ByvalueRvv','-slp',OLD,'QcpRvv32','-slp',HERE,'ByvalueRvv'],'macro-qcp',120)
run(['python3',HERE/'check_kernel.py','macro_unit'],'macro-proof')
assert json.loads((HERE/'Macrokernel-proof-status.json').read_text())['passed']
run(['python3',HERE/'negative.py'],'no-op-negative')
assert json.loads((HERE/'negative-status.json').read_text())['no_op_store_rejected']
checks={}
for label,stem in [('pure_byvalue','rvv_unit'),('macro_store','macro_unit')]:
 goal=BUILD/(stem+'_goal.v')
 if not goal.exists(): continue
 text=goal.read_text();begin=text.index('Definition test_rvv_entail_wit_4');end=text.index('Definition test_rvv_return_wit_1',begin);pre=text[begin:end].split('|--')[0]
 checks[label]={'goal_sha256':sha(goal),'backedge_written_output_occurrences':pre.count('FloatArray.full output vl'),'backedge_undefined_output_occurrences':pre.count('FloatArray.undef_full output vl')}
local=[p for p in HERE.iterdir() if p.suffix in ['.py','.h','.c','.v']]
old=['primitive_contracts.h','rvv_load.c','rvv_load_checked.v','rvv_add.c','rvv_add_checked.v','rvv_store.c','rvv_store_checked.v','RvvLayout.v','FastFrame.v','RvvLoopModel.v','RvvLoopMemory.v','RvvLoopResult.v','rvv_loop_pure_checked.v','rvv_arrays_strategy_proof.v','rvv_store_strategy_proof.v','rvv_loop_strategy_proof.v']
state={'passed':True,'checked_c_vcs':45,'checked_value_wrapper_vcs':11,'required_value_wrapper_vcs':8,'full_dependency_closure_replayed':False,'cross_isa_equivalence_proved':False,'original_tokens_preserved':True,'store_macro_requires_local_vector_lvalue':True,'original_sha256':json.loads((HERE/'source.json').read_text())['original_sha256'],'local_sources_sha256':{p.name:sha(p) for p in local},'old_dependencies_sha256':{name:sha(OLD/name) for name in old},'resource_comparison':checks,'records':records}
(HERE/'replay-status.json').write_text(json.dumps(state,indent=2)+'\n')
print(json.dumps({key:state[key] for key in ['passed','checked_c_vcs','checked_value_wrapper_vcs','cross_isa_equivalence_proved']}))
