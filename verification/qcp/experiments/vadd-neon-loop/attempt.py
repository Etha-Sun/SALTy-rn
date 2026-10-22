#!/usr/bin/env python3
"""Independent full-loop trial; retain the checked block14 checkpoint unchanged."""
import hashlib,json,subprocess,sys
from pathlib import Path
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
unit=unit.replace('  for (; batch >=',invariant+'  for (; batch >=')
bind_lane = '--bind-lane' in sys.argv
if bind_lane:
    unit=unit.replace('vst1_lane_f32(output, &vacc_lo, 0);',
                      'vst1_lane_f32(output, &vacc_lo, 0) /*@ where z = vacc_lo.s0 */;')
    if 'where z' not in unit:
        raise RuntimeError('Expected lowered lane call not found')
path=HERE/('neon_loop_bound.c' if bind_lane else 'neon_loop.c');path.write_text(unit)
out=HERE/('results-bound-lane' if bind_lane else 'results');out.mkdir(exist_ok=True)
preprocessed=out/'neon_loop_unit.c'
preprocess=['gcc','-E','-P','-CC','-nostdinc',str(path),'-o',str(preprocessed)]
subprocess.run(preprocess,cwd=ROOT,capture_output=True,text=True,check=True)
cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--input-file='+str(preprocessed),'--coq-output-dir='+str(out),'--coq-logic-path=QcpNeonLoop','-slp',str(QCP/'shared/vadd'),'QcpVadd','-slp',str(BRIDGE),'QcpNeon','-slp',str(HERE),'QcpNeonLoop','--no-exec-info']
r=subprocess.run(cmd,cwd=ROOT,capture_output=True,text=True,timeout=120)
(out/'stdout.log').write_text(r.stdout);(out/'stderr.log').write_text(r.stderr)
result={'command':cmd,'preprocess_command':preprocess,'exit_code':r.returncode,'source_sha256':hashlib.sha256((ROOT/'kernels/source/f32-vadd.c').read_bytes()).hexdigest(),'lowered_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'contract_weakened':False,'body_skipped':False,'complete_vcs_generated':r.returncode==0 and 'Successfully finished symbolic execution' in r.stdout and 'fatal error:' not in r.stderr,'full_kernel_proof':False,'stderr':r.stderr}
(out/'status.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['exit_code','complete_vcs_generated','stderr']},indent=2))
