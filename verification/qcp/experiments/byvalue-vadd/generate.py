#!/usr/bin/env python3
"""Insert proof comments into the original NEON kernel; keep its C tokens."""
from pathlib import Path
import hashlib
import json
import re
import sys

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
ROOT = QCP.parents[1]
OLD = QCP / 'experiments/vadd-neon-loop'
sys.path.insert(0, str(QCP / 'tools'))
from case import audit, ordinary_tokens


def fields(v, values):
    return ' * '.join(f'store(&({v}.s{i}),float,{x})' for i, x in enumerate(values))


def cells(p, values, undef=False):
    return ' * '.join(f'undef_data_at(pointer_offset({p},{i},float),float)' if undef else
                      f'store(pointer_offset({p},{i},float),float,{x})' for i, x in enumerate(values))


def contract(variables, pre, post):
    return ('/*@ With ' + ' '.join(f'({x}:fp32)' for x in variables) +
            '\n Require ' + pre + '\n Ensure ' + post + ' */\n')


def generate():
    audit(QCP / 'cases/f32-vadd')
    imports = '''#include "../vadd-neon-loop/invariant_def.h"
#include "../../shared/vadd/float_array_def.h"
#include "../vadd-neon-loop/tail_def.h"
/*@ include strategies "neon_bridge.strategies" */
/*@ include strategies "neon_tail.strategies" */
/*@ include strategies "float_array.strategies" */
/*@ Extern Coq (vadd_values : Z -> list fp32 -> list fp32 -> list fp32) */
typedef struct float32x4_t float32x4_t;
typedef struct float32x2_t float32x2_t;
'''
    prototypes = []
    implementations = []

    def function(signature, spec, body):
        prototypes.append(signature + '\n' + spec + ';\n')
        implementations.append(signature + '\n' + spec + '{\n' + body + '\n}\n')

    x = [f'x{i}' for i in range(4)]
    y = [f'y{i}' for i in range(4)]
    function('float32x4_t vld1q_f32(const float *p)',
             contract(x, cells('p', x), cells('p', x) + ' * ' + fields('__return', x)),
             ' float32x4_t r;\n' + '\n'.join(f' r.s{i} = p[{i}];' for i in range(4)) + '\n return r;')
    function('float32x4_t vaddq_f32(float32x4_t a, float32x4_t b)',
             contract(x+y, fields('a', x) + ' * ' + fields('b', y),
                      fields('__return', [f'fp32_add({a},{b})' for a,b in zip(x,y)])),
             ' float32x4_t r;\n' + '\n'.join(f' r.s{i} = a.s{i} + b.s{i};' for i in range(4)) + '\n return r;')
    for name, count, typ in [('vst1q_f32',4,'float32x4_t'),('vst1_f32',2,'float32x2_t')]:
        pointer_fields = fields('a',x[:count]).replace('a.s','a->s')
        function(f'void qcp_{name}(float *p, const {typ} *a)',
                 contract(x[:count], pointer_fields+' * '+cells('p',x[:count],True),
                          pointer_fields+' * '+cells('p',x[:count])),
                 '\n'.join(f' p[{i}] = a->s{i};' for i in range(count)))
        prototypes.append(f'#define {name}(p,a) qcp_{name}((p), &(a))\n')
    for name, offset in [('vget_low_f32',0),('vget_high_f32',2)]:
        function(f'float32x2_t {name}(float32x4_t a)',
                 contract(x, fields('a',x), fields('__return',x[offset:offset+2])),
                 f' float32x2_t r;\n r.s0 = a.s{offset};\n r.s1 = a.s{offset+1};\n return r;')
    lane_fields = fields('a',x[:2]).replace('a.s','a->s')
    function('void qcp_vst1_lane_f32(float *p, const float32x2_t *a, int lane)',
             contract(x[:2], 'lane == 0 && '+lane_fields+' * undef_data_at(p,float)',
                      lane_fields+' * store(p,float,x0)'),
             ' if (lane == 0) *p = a->s0;\n if (lane == 1) *p = a->s1;')
    prototypes.append('#define vst1_lane_f32(p,a,lane) qcp_vst1_lane_f32((p), &(a), (lane))\n')
    function('void qcp_assert(int condition)', '/*@ Require condition != 0 && emp Ensure emp */\n', '')
    (HERE/'shim.h').write_text(imports + '\n'.join(prototypes))
    (HERE/'shim.c').write_text(imports + '\n'.join(implementations))

    original = (ROOT/'kernels/source/f32-vadd.c').read_text()
    baseline = (OLD/'neon_loop_lengths.c').read_text()
    spec = re.search(r'/\*@ With \(A: list fp32\).*?\*/',baseline,re.S).group()
    invariant = re.search(r'/\*@ Inv Assert.*?\*/',baseline,re.S).group()
    source = original.replace('XNN_OOB_READS\n{','XNN_OOB_READS\n'+spec+'\n{')
    source = source.replace('  for (;',invariant+'\n  for (;',1)
    substitutions = {'vaddq_f32(va, vb)':'a = &va, b = &vb',
                     'vst1q_f32(output, vacc)':'a = &vacc',
                     'vget_low_f32(vacc)':'a = &vacc',
                     'vget_high_f32(vacc)':'a = &vacc',
                     'vst1_f32(output, vacc_lo)':'a = &vacc_lo',
                     'vst1_lane_f32(output, vacc_lo, 0)':'a = &vacc_lo'}
    for call, bindings in substitutions.items():
        assert call in source, call
        source = source.replace(call,call+' /*@ where '+bindings+' */')
    assert ordinary_tokens(source) == ordinary_tokens(original), 'Executable C tokens changed'
    prelude = '''#include "shim.h"
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define assert(x) qcp_assert(x)
#define XNN_OOB_READS
#define XNN_UNLIKELY(x) (x)
'''
    (HERE/'neon.c').write_text(prelude+source)
    (HERE/'source.json').write_text(json.dumps({'original_sha256':hashlib.sha256(original.encode()).hexdigest(),
         'executable_tokens_preserved':True,'annotation_only':True,'full_kernel_proved':False},indent=2)+'\n')


if __name__ == '__main__':
    generate()
