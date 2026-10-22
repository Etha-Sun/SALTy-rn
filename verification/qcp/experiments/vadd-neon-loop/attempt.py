#!/usr/bin/env python3
"""Independent full-loop trial; retain the checked block14 checkpoint unchanged."""
import hashlib,json,subprocess,sys
from pathlib import Path
from provenance import inputs, sha
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
ROOT=QCP.parents[1]
BRIDGE=HERE.parent/'vadd-neon'
unit=(HERE.parent/'vadd-proof/neon_kernel.c').read_text()
unit=unit.replace('#include "../../shared/vadd/float_array_def.h"','#include "../../shared/vadd/float_array_def.h"\n#include "../vadd-neon/bridge_def.h"\n/*@ include strategies "neon_bridge.strategies" */\n#include "tail_def.h"\n/*@ include strategies "neon_tail.strategies" */')
invariant='''/*@ Inv Assert exists (k:Z),
0 <= k && k*4 + batch == batch@pre && batch % 4 == 0 &&
0 <= batch && batch <= batch@pre && k <= batch@pre/4 &&
(batch == 0 || batch == 4 || batch == 8 || batch == 12 || 16 <= batch) &&
params == params@pre && params != 0 &&
input_a == input_a@pre + k && input_b == input_b@pre + k && output == output@pre + k &&
input_a != 0 && input_b != 0 && output != 0 &&
(batch < 16 || 4 <= batch/4) && (batch == 0 || 1 <= batch/4) &&
FloatArray::full(input_a@pre,k,fp32_slice(0,k,A)) *
FloatArray::full(input_a,batch/4+3,fp32_slice(k,batch@pre/4+3,A)) *
FloatArray::full(input_b@pre,k,fp32_slice(0,k,B)) *
FloatArray::full(input_b,batch/4+3,fp32_slice(k,batch@pre/4+3,B)) *
FloatArray::full(output@pre,k,vadd_values(k,A,B)) * FloatArray::undef_full(output,batch/4) */
'''
compact_invariant = '--compact-invariant' in sys.argv
if compact_invariant:
    invariant=invariant.replace('(batch == 0 || batch == 4 || batch == 8 || batch == 12 || 16 <= batch) &&', '''(batch == 0 ||
 (batch == 4 && batch/4 == 1) ||
 (batch == 8 && batch/4 == 2) ||
 (batch == 12 && batch/4 == 3) ||
 (16 <= batch && 4 <= batch/4)) &&''').replace('(batch < 16 || 4 <= batch/4) && (batch == 0 || 1 <= batch/4) &&', '')
with_lengths = '--with-lengths' in sys.argv
if with_lengths:
    unit = '#include \"invariant_def.h\"\n' + unit
    invariant=invariant.replace('0 <= k &&', 'fp32_length(A) == batch@pre/4+3 && fp32_length(B) == batch@pre/4+3 &&\n0 <= k &&',1)
unit=unit.replace('  for (; batch >=',invariant+'  for (; batch >=')
lane0_contract = '--lane0-contract' in sys.argv
if lane0_contract:
    unit = '#include \"lane0.h\"\n' + unit
    unit = unit.replace('vst1_lane_f32(output, &vacc_lo, 0);', 'qcp_vst1_lane0_f32(output, &vacc_lo, 0);')
bind_lane = '--bind-lane' in sys.argv
if bind_lane:
    unit=unit.replace('vst1_lane_f32(output, &vacc_lo, 0);',
                      'vst1_lane_f32(output, &vacc_lo, 0) /*@ where z = vacc_lo.s0 */;')
    if 'where z' not in unit:
        raise RuntimeError('Expected lowered lane call not found')
budget_seconds=next((int(arg.split('=',1)[1]) for arg in sys.argv if arg.startswith('--timeout=')),120)
path=HERE/('neon_loop_lengths.c' if with_lengths else 'neon_loop_compact.c' if compact_invariant else 'neon_loop_lane0.c' if lane0_contract else 'neon_loop_bound.c' if bind_lane else 'neon_loop.c');path.write_text(unit)
out=HERE/(('results-lengths-'+str(budget_seconds)) if with_lengths and budget_seconds!=120 else 'results-lengths' if with_lengths else 'results-compact' if compact_invariant else 'results-lane0-contract' if lane0_contract else 'results-bound-lane' if bind_lane else 'results');out.mkdir(exist_ok=True)
if '--record-inputs' in sys.argv:
    out=HERE/'results-bound-inputs';out.mkdir(exist_ok=True)
preprocessed=out/'neon_loop_unit.c'
preprocess=['gcc','-E','-P','-CC','-nostdinc',str(path),'-o',str(preprocessed)]
subprocess.run(preprocess,cwd=ROOT,capture_output=True,text=True,check=True)
before=inputs(path,preprocessed) if '--record-inputs' in sys.argv else None
if before:(out/'inputs-before.json').write_text(json.dumps(before,indent=2)+'\n')
cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--input-file='+str(preprocessed),'--coq-output-dir='+str(out),'--coq-logic-path=QcpNeonLoop','-slp',str(QCP/'shared/vadd'),'QcpVadd','-slp',str(BRIDGE),'QcpNeon','-slp',str(HERE),'QcpNeonLoop','--no-exec-info']
try:
    r=subprocess.run(cmd,cwd=ROOT,capture_output=True,text=True,timeout=budget_seconds)
except subprocess.TimeoutExpired as exc:
    r=subprocess.CompletedProcess(cmd,124,exc.stdout or b'',exc.stderr or b'')
    r.stdout=r.stdout.decode() if isinstance(r.stdout,bytes) else r.stdout
    r.stderr=(r.stderr.decode() if isinstance(r.stderr,bytes) else r.stderr)+'\nQCP timeout after '+str(budget_seconds)+' seconds.'
(out/'stdout.log').write_text(r.stdout);(out/'stderr.log').write_text(r.stderr)
result={'command':cmd,'preprocess_command':preprocess,'exit_code':r.returncode,'source_sha256':hashlib.sha256((ROOT/'kernels/source/f32-vadd.c').read_bytes()).hexdigest(),'lowered_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'budget_seconds':budget_seconds,'with_lengths':with_lengths,'compact_invariant':compact_invariant,'lane0_contract':lane0_contract,'contract_weakened':False,'body_skipped':False,'complete_vcs_generated':r.returncode==0 and 'Successfully finished symbolic execution' in r.stdout and 'fatal error:' not in r.stderr,'full_kernel_proof':False,'stderr':r.stderr}
if before:
    result['inputs_stable']=before==inputs(path,preprocessed)
    assert result['inputs_stable'],'QCP inputs changed during generation'
    if result['complete_vcs_generated']:
        before.update({'qcp_command':cmd,'generated_goal_sha256':sha(out/'neon_loop_unit_goal.v'),'exit_code':r.returncode,'inputs_stable':True})
        (out/'generation.json').write_text(json.dumps(before,indent=2)+'\n')
(out/'status.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['exit_code','complete_vcs_generated','stderr']},indent=2))
