#!/usr/bin/env python3
"""Add value interfaces around existing checked RVV32 primitive contracts."""
from pathlib import Path
import re
HERE=Path(__file__).resolve().parent
OLD=HERE.parent/'vadd-rvv'

def fields(name, values):
    return ' * '.join(f'store(&({name}.s{i}),float,{value})' for i,value in enumerate(values))

def generate():
    imports='''#include "../vadd-rvv/primitive_contracts.h"
/*@ Import Coq Require Import ByvalueRvv.Layout */
typedef struct vfloat32m8_t vfloat32m8_t;
'''
    definitions=[]
    declarations=[]
    def function(signature,spec,body):
        declarations.append(signature+'\n'+spec+';\n')
        definitions.append(signature+'\n'+spec+'{\n'+body+'\n}\n')
    xs=[f'x{i}' for i in range(32)]
    ys=[f'y{i}' for i in range(32)]
    function('vfloat32m8_t qcp_byvalue_load(const float *p,unsigned long long vl)',
        '/*@ With (L:list fp32)\n Require 0 <= vl && vl <= 32 && FloatArray::full(p,vl,L)\n Ensure FloatArray::full(p,vl,L) * '+fields('__return',[f'rvv_read_value({i},vl,L)' for i in range(32)])+' */\n',
        ' vfloat32m8_t r;\n __riscv_vle32_v_f32m8(&r,p,vl);\n return r;')
    variables=' '.join(f'({x}:fp32)' for x in xs+ys)
    function('vfloat32m8_t qcp_byvalue_add(vfloat32m8_t a,vfloat32m8_t b,unsigned long long vl)',
        '/*@ With '+variables+'\n Require 0 <= vl && vl <= 32 && '+fields('a',xs)+' * '+fields('b',ys)+'\n Ensure '+fields('__return',[f'vadd_active_add({i},vl,x{i},y{i})' for i in range(32)])+' */\n',
        ' vfloat32m8_t r;\n __riscv_vfadd_vv_f32m8(&r,&a,&b,vl);\n return r;')
    packed='rvv_pack32('+','.join(xs)+')'
    function('void qcp_byvalue_store(float *p,vfloat32m8_t a,unsigned long long vl)',
        '/*@ With (L:list fp32) '+' '.join(f'({x}:fp32)' for x in xs)+'\n Require 0 <= vl && vl <= 32 && L == '+packed+' && '+fields('a',xs)+' * FloatArray::undef_full(p,vl)\n Ensure FloatArray::full(p,vl,rvv_take(vl,L)) */\n',
        ' __riscv_vse32_v_f32m8(p,&a,vl);')
    (HERE/'shim.c').write_text(imports+'\n'.join(definitions))
    (HERE/'shim.h').write_text(imports+'\n'.join(declarations)+'''#define __riscv_vle32_v_f32m8 qcp_byvalue_load
#define __riscv_vfadd_vv_f32m8 qcp_byvalue_add
#define __riscv_vse32_v_f32m8 qcp_byvalue_store
''')
    layout='From QcpRvv32 Require Export RvvLayout.\n'
    (HERE/'Layout.v').write_text(layout)

if __name__=='__main__': generate()
