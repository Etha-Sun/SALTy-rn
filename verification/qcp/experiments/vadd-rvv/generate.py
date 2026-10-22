#!/usr/bin/env python3
"""Generate the fixed RVV32 flat-field implementation; no arbitrary C translation."""
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
SHARED = HERE.parents[1] / 'shared/vadd'


def shared_definition(name):
    text = (SHARED / 'intrinsics.c').read_text()
    match = re.search(r'^(?:float|void|unsigned long long) ' + name + r'\([^\n]*\).*?^}', text, re.M | re.S)
    if match is None:
        raise ValueError('Checked shared function missing: ' + name)
    return match[0]


def main():
    (HERE / 'types.h').write_text('''/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
               (vadd_active_add : Z -> Z -> fp32 -> fp32 -> fp32) */
struct vfloat32m8_t { ''' + ' '.join(f'float s{i};' for i in range(32)) + ' };\n')
    inputs = [f'store(&({a}->s{i}),float,{v}{i})'
              for a, v in [('a', 'x'), ('b', 'y')] for i in range(32)]
    undefined = [f'undef_data_at(&(r->s{i}),float)' for i in range(32)]
    outputs = [f'store(&(r->s{i}),float,vadd_active_add({i},vl,x{i},y{i}))' for i in range(32)]
    contract = '/*@ With ' + ' '.join(f'(x{i}:fp32) (y{i}:fp32)' for i in range(32)) + '\n'
    contract += ' Require 0 <= vl && vl <= 32 && ' + ' * '.join(inputs + undefined) + '\n'
    contract += ' Ensure ' + ' * '.join(inputs + outputs) + ' */\n'
    body = 'void __riscv_vfadd_vv_f32m8(struct vfloat32m8_t *r,const struct vfloat32m8_t *a,const struct vfloat32m8_t *b,unsigned long long vl)\n'
    body += contract + '{\n' + '\n'.join(f'  r->s{i}=qcp_rvv_add_lane32(a->s{i},b->s{i},{i},vl);' for i in range(32)) + '\n}\n'
    (HERE / 'rvv_add.c').write_text('#include "types.h"\n' + shared_definition('f32_add') + '\n' + shared_definition('qcp_rvv_add_lane32') + '\n' + body)
    helper = '''void qcp_rvv_read_lane(const float *p,float *out,unsigned long long vl,unsigned long long i)
/*@ With (L:list fp32)
 Require 0 <= vl && vl <= 32 && 0 <= i && i < 32 &&
         FloatArray::full(p,vl,L) * undef_data_at(out,float)
 Ensure FloatArray::full(p,vl,L) * store(out,float,rvv_read_value(i,vl,L)) */
{
 if(i<vl) *out=p[i];
 else *out=0.0f;
}
'''
    contract = '/*@ With (L:list fp32)\n Require 0 <= vl && vl <= 32 && FloatArray::full(p,vl,L) * '
    contract += ' * '.join(f'undef_data_at(&(r->s{i}),float)' for i in range(32)) + '\n'
    contract += ' Ensure FloatArray::full(p,vl,L) * ' + ' * '.join(f'store(&(r->s{i}),float,rvv_read_value({i},vl,L))' for i in range(32)) + ' */\n'
    body = 'void __riscv_vle32_v_f32m8(struct vfloat32m8_t *r,const float *p,unsigned long long vl)\n'
    body += contract + '{\n' + '\n'.join(f' qcp_rvv_read_lane(p,&(r->s{i}),vl,{i});' for i in range(32)) + '\n}\n'
    (HERE / 'rvv_load.c').write_text('#include "types.h"\n#include "rvv_array_def.h"\n/*@ include strategies "rvv_arrays.strategies" */\n' + helper + body)


if __name__ == '__main__':
    main()
