#!/usr/bin/env python3
"""Add annotations to the frozen RVV kernel after the reviewed vadd lowering."""
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
ROOT = QCP.parents[1]
spec = importlib.util.spec_from_file_location('qcp_case', QCP/'tools/case.py')
import sys
sys.path.insert(0, str(QCP/'tools'))
case = importlib.util.module_from_spec(spec)
spec.loader.exec_module(case)
case.audit(QCP/'cases/f32-vadd')
source = ROOT/'kernels/target/f32-vadd.c'
lowered, changes = case.lower_kernel(source.read_text())
N = '(batch@pre/4)'
k = f'({N}-n)'
end = f'({k}+vl)'
def off(p, i):
    return f'pointer_offset({p},{i},float)'
def seg(p, lo, hi, xs):
    return f'FloatArray::seg({p},{lo},{hi},{xs})'
def sl(lo, hi, xs):
    return f'rvv_slice({lo},{hi},{xs})'
def full(p, n, xs):
    return f'FloatArray::full({p},{n},{xs})'
basea, baseb, baseo = 'input_a@pre', 'input_b@pre', 'output@pre'
pure = f'''batch == batch@pre && params == params@pre && 0 < {N} && {N} <= 4611686018427387900 && 0 <= n && n <= {N} && rvv_length(A) == {N}+3 && rvv_length(B) == {N}+3 &&
 input_a == {off(basea,k)} && input_b == {off(baseb,k)} && output == {off(baseo,k)}'''
resources = f'''{full(basea,N+'+3','A')} * {full(baseb,N+'+3','B')} *
 {seg(baseo,'0',k,f'vadd_values({k},A,B)')} * FloatArray::undef_seg({baseo},{k},{N})'''
contract = '''/*@ With (A:list fp32) (B:list fp32)
 Require 0 < batch && batch <= 18446744073709551603 && batch % 4 == 0 &&
 params != 0 && input_a != 0 && input_b != 0 && output != 0 &&
 FloatArray::full(input_a,batch/4+3,A) * FloatArray::full(input_b,batch/4+3,B) * FloatArray::undef_full(output,batch/4)
 Ensure FloatArray::full(input_a,batch/4+3,A) * FloatArray::full(input_b,batch/4+3,B) * FloatArray::full(output,batch/4,vadd_values(batch/4,A,B)) */
'''
annotated = lowered.replace('\n{', '\n'+contract+'{', 1)
annotated = annotated.replace('  while (n > 0)', '/*@ Assert batch == batch@pre && params == params@pre && 0 < batch@pre/4 && batch@pre/4 <= 4611686018427387900 && input_a == input_a@pre && input_b == input_b@pre && output == output@pre && n == batch@pre/4 && rvv_length(A) == batch@pre/4+3 && rvv_length(B) == batch@pre/4+3 && '+full(basea,N+'+3','A')+' * '+full(baseb,N+'+3','B')+' * FloatArray::undef_full(output,batch@pre/4) */\n/*@ Inv '+pure+' &&\n '+resources+' */\n  while (n > 0)')
chunks = []
for p, current, xs in [(basea,'input_a','A'),(baseb,'input_b','B')]:
    chunks += [seg(p,'0',k,sl('0',k,xs)), full(current,'vl',sl(k,end,xs)), seg(p,end,N+'+3',sl(end,N+'+3',xs))]
chunks += [seg(baseo,'0',k,f'vadd_values({k},A,B)'), 'FloatArray::undef_full(output,vl)', f'FloatArray::undef_seg({baseo},{end},{N})']
cut = '/*@ Assert '+pure+' && 0 < n && 0 < vl && vl <= 32 && vl <= n && vl == vadd_vl(n) &&\n '+' *\n '.join(chunks)+' */\n    '
annotated = annotated.replace('    struct vfloat32m8_t va;', '    '+cut+'struct vfloat32m8_t va;')
# Let the loop backedge VC prove the array reassembly; retain all local vector resources through scope exit.
if case.ordinary_tokens(lowered) != case.ordinary_tokens(annotated):
    raise ValueError('Annotation channel changed ordinary C')
header = '''#include "primitive_contracts.h"
#include "rvv_loop_def.h"
/*@ include strategies "rvv_arrays.strategies" */
/*@ include strategies "rvv_store.strategies" */
/*@ include strategies "rvv_loop.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */
{ return; }
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
'''
(HERE/'rvv_loop.c').write_text(header+annotated+'\n')
(HERE/'rvv_loop_def.h').write_text('''/*@ Import Coq Require Import QcpRvv32.RvvLoopModel */
/*@ Extern Coq (rvv_slice : Z -> Z -> list fp32 -> list fp32)
 (vadd_vl : Z -> Z)
 (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
''')
(HERE/'rvv_loop.strategies').write_text('''#include "rvv_loop_def.h"
#include "rvv_store_def.h"
id : 1
priority : core(0)
right : FloatArray::seg(?p,?lo,?hi,vadd_values(?count,?a,?b)) at 0
check : infer(lo == 0);
        infer(hi == 0);
        infer(count == 0);
action : right_erase(0);

id : 2
priority : core(0)
left : FloatArray::undef_full(?p,?n) at 0
right : FloatArray::undef_seg(?q,?lo,?hi) at 1
check : infer(p == q);
        infer(lo == 0);
        infer(hi == n);
action : left_erase(0);
         right_erase(1);
''')
(HERE/'loop-source.json').write_text(json.dumps({'original':str(source.relative_to(ROOT)), 'original_sha256':hashlib.sha256(source.read_bytes()).hexdigest(), 'reviewed_lowering_sha256':case.sha(QCP/'tools/lower_vadd.py'), 'changes':changes, 'ordinary_tokens_equal_after_annotations':True, 'full_kernel_proved':False},indent=2)+'\n')
