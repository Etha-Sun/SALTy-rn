#!/usr/bin/env python3
import hashlib,json,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
ROOT=QCP.parents[1]
unit=(HERE.parent/'vadd-proof/neon_kernel.c').read_text()
unit=unit.replace('#include "../../shared/vadd/float_array_def.h"','#include "../../shared/vadd/float_array_def.h"\n#include "bridge_def.h"\n/*@ include strategies "neon_bridge.strategies" */')
cut="""/*@ Assert batch == batch@pre && input_a == input_a@pre &&
input_b == input_b@pre && output == output@pre && params == params@pre &&
0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 &&
params != 0 && input_a != 0 && input_b != 0 && output != 0 &&
4 <= batch/4+3 && (batch < 16 || 4 <= batch/4) &&
FloatArray::full(input_a,batch/4+3,A) *
FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4) */
"""
unit=unit.replace('  for (; batch >=', '  '+cut+'  for (; batch >=')
path=HERE/'neon_kernel.c';path.write_text(unit)
out=HERE/'results';preprocessed=out/'neon_kernel_unit.c'
preprocess=['gcc','-E','-P','-CC','-nostdinc',str(path),'-o',str(preprocessed)]
subprocess.run(preprocess,cwd=ROOT,capture_output=True,text=True,check=True)
cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--input-file='+str(preprocessed),'--coq-output-dir='+str(out),'--coq-logic-path=QcpNeon','-slp',str(QCP/'shared/vadd'),'QcpVadd','-slp',str(HERE),'QcpNeon','--no-exec-info']
r=subprocess.run(cmd,cwd=ROOT,capture_output=True,text=True,timeout=120)
(out/'kernel.stdout.log').write_text(r.stdout);(out/'kernel.stderr.log').write_text(r.stderr)
result={'command':cmd,'preprocess':preprocess,'exit_code':r.returncode,'body_skipped':False,'complete_vcs_generated':r.returncode==0 and 'Successfully finished symbolic execution' in r.stdout and 'fatal error:' not in r.stderr,'kernel_proved':False,'source_sha256':hashlib.sha256((ROOT/'kernels/source/f32-vadd.c').read_bytes()).hexdigest(),'lowered_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'stderr':r.stderr}
(out/'kernel-result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
