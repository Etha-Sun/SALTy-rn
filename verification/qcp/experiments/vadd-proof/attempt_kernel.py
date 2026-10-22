#!/usr/bin/env python3
"""Run the actual lowered upstream NEON body with its unchanged pilot contract."""
import hashlib,importlib.util,json,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
ROOT=QCP.parents[1]
spec=importlib.util.spec_from_file_location('lower_vadd',QCP/'tools/lower_vadd.py')
module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
source=ROOT/'kernels/source/f32-vadd.c'
body,rewrites=module.lower_kernel(source.read_text())
contract='''/*@ With (A: list fp32) (B: list fp32)
    Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 && params != 0 &&
            input_a != 0 && input_b != 0 && output != 0 &&
            FloatArray::full(input_a,batch/4+3,A) *
            FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
    Ensure FloatArray::full(input_a,batch/4+3,A) *
           FloatArray::full(input_b,batch/4+3,B) *
           FloatArray::full(output,batch/4,vadd_values(batch/4,A,B)) */
'''
start=body.index('{',body.index('void test_neon'))
body=body[:start]+contract+body[start:]
unit='''#include "../../shared/vadd/intrinsics.h"
#include "../../shared/vadd/float_array_def.h"
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ include strategies "float_array.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
'''+body
path=HERE/'neon_kernel.c';path.write_text(unit)
out=HERE/'kernel-attempt';out.mkdir(exist_ok=True)
preprocessed=out/'neon_kernel_unit.c'
preprocess=['gcc','-E','-P','-CC','-nostdinc',str(path),'-o',str(preprocessed)]
subprocess.run(preprocess,cwd=ROOT,check=True,text=True,capture_output=True,timeout=30)
cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--input-file='+str(preprocessed),'--coq-output-dir='+str(out),'--coq-logic-path=QcpVadd','-slp',str(QCP/'shared/vadd'),'QcpVadd','--no-exec-info']
r=subprocess.run(cmd,cwd=ROOT,text=True,capture_output=True,timeout=120)
(out/'stdout.log').write_text(r.stdout);(out/'stderr.log').write_text(r.stderr)
result={'preprocess_command':preprocess,'command':cmd,'source':str(source),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'lowered_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'rewrites':rewrites,'qcp_exit_code':r.returncode,'complete_vcs_generated':r.returncode==0 and 'Successfully finished symbolic execution' in r.stdout and 'fatal error:' not in r.stderr,'stderr':r.stderr,'kernel_proved':False,'contract':'Unchanged old-demo NEON kernel contract; disjoint inputs, full binary32 domain, 3 padding cells, byte batch bounded by uint64.'}
(out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['qcp_exit_code','complete_vcs_generated','stderr']},indent=2))
