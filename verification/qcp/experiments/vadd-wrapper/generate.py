#!/usr/bin/env python3
"""VADD-only caller preparation; kernel contracts are explicit pending dependencies."""
from pathlib import Path
import re
import sys

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
sys.path.insert(0, str(QCP / 'tools'))
from case import audit
case = QCP / 'cases/f32-vadd'
audit(case)

def replace_once(text, old, new):
    if text.count(old) != 1:
        raise ValueError('Expected one frozen VADD pattern: ' + old[:60])
    return text.replace(old, new)

mapper = (case / 'mapper.c').read_text()
public = (case / 'spec.h').read_text()
neon = (HERE.parent / 'vadd-proof/neon_kernel.c').read_text()
contract = re.search(r'/\*@ With \(A: list fp32\).*?\*/', neon, re.S).group()
prototype = '''void NAME(size_t batch, const float *input_a, const float *input_b,
               float *output, const struct xnn_f32_default_params *params)
''' + contract + ';\n'
comparison = '''  for (size_t i = 0; i < n; ++i) {
    if (!(left[i] == right[i] || (left[i] != left[i] && right[i] != right[i]))) return 0;
  }
  return 1;'''
assert mapper.count(comparison) == 1
body = replace_once(mapper[mapper.index('int equivalent('):], comparison,
    '  return compare_outputs(n, left, right);')
body = replace_once(body, 'struct xnn_f32_default_params params = {0};',
                    'struct xnn_f32_default_params params; params.unused = 0;')
body = replace_once(body, '  test_neon(', '  /*@ Assert n == (n * sizeof(float))/4 && (n * sizeof(float))%4 == 0 &&\n      0 < n * sizeof(float) && n * sizeof(float) <= 18446744073709551603 && &params != 0 &&\n      n == n@pre && input_a == input_a@pre && input_b == input_b@pre && left == left@pre && right == right@pre &&\n      0 < n && n <= 4611686018427387900 && input_a != 0 && input_b != 0 && left != 0 && right != 0 &&\n      store(&(params.unused),char,0) * FloatArray::full(input_a,n+3,A) * FloatArray::full(input_b,n+3,B) *\n      FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */\n  test_neon(')
public_contract = re.search(r'/\*@ With \(A: list fp32\).*?\*/', public, re.S).group()
body = replace_once(body, 'float *left, float *right) {',
                    'float *left, float *right)\n' + public_contract + '\n{')
comparator = (HERE.parent / 'vadd-comparator/comparator.c').read_text()
compare_decl = comparator[comparator.index('int compare_outputs('):comparator.index('\n{', comparator.index('int compare_outputs('))] + ';\n'
unit = '''#include "wrapper_def.h"
/*@ Extern Coq (FloatArray::undef_full : Z -> Z -> Assertion)
               (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
/*@ include strategies "comparator.strategies" */
/*@ include strategies "wrapper.strategies" */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
'''
unit += prototype.replace('NAME', 'test_neon') + prototype.replace('NAME', 'test_rvv')
unit += compare_decl + body
(HERE / 'wrapper.c').write_text(unit)
print('Prepared conditional caller; both kernel body proofs and adapter correspondence remain external obligations.')
