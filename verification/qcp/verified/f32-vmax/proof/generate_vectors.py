#!/usr/bin/env python3
"""Generate this case's fixed four/32-lane C wrappers and readonly borrow adapter."""
from pathlib import Path
import re

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
assert CASE.name == 'f32-vmax', 'Only the audited FMAX operation/configuration is supported'
N = 32
SHIM = CASE / 'shim'
COQ = HERE / 'coq'


def arguments(prefix, kind, count=N):
    return ' '.join(f'({prefix}{i}:{kind})' for i in range(count))


def fields(base, prefix, kind, count=N, pointer=False):
    access = '->' if pointer else '.'
    return ' * '.join(f'store(&({base}{access}s{i}),{kind},{prefix}{i})' for i in range(count))


def outputs(kind, expressions, count=N):
    return ' * '.join(f'store(&(__return.s{i}),{kind},{expressions[i]})' for i in range(count))


def prototypes(text):
    pattern = re.compile(r'(?m)^((?:unsigned int|int|float|float32x4_t|vfloat32m8_t|vbool4_t)\s+\w+\([^)]*\)\s*/\*@.*?\*/)\s*\{', re.S)
    values = pattern.findall(text)
    assert values, 'Unsupported declaration template'
    return '\n'.join(x + ';' for x in values) + '\n'


types = '''#ifndef QCP_FMAX_FORMAL_TYPES_H
#define QCP_FMAX_FORMAL_TYPES_H
#define QCP_VADD_TYPES_H
/* Fixed scalar-field representation, VLEN=128/SEW=32/LMUL=8, VLMAX=32. */
/*@ Import Coq Require Import FMax.Types */
typedef unsigned long long size_t;
typedef unsigned int uint32_t;
struct xnn_f32_default_params { char _; };
'''
for name, kind, count in [('float32x4_t', 'float', 4), ('float32x2_t', 'float', 2),
                          ('vfloat32m8_t', 'float', N), ('vbool4_t', 'int', N)]:
    types += f'typedef struct {name} {{ ' + ' '.join(f'{kind} s{i};' for i in range(count)) + f' }} {name};\n'
types += '#endif\n'
(SHIM / 'formal_types.h').write_text(types)

model_types = '''From Coq Require Import ZArith String.
From FMax Require Export Model.
Import Snaive_C_Rules64.
Local Open Scope string_scope.
Local Open Scope sac.
'''
for name, kind, count in [('float32x4_t', 'Float', 4), ('float32x2_t', 'Float', 2),
                          ('vfloat32m8_t', 'Float', N), ('vbool4_t', 'Int', N)]:
    model_types += f'Definition UndefStructPred{name} (p:Z) : Assertion :=\n '
    model_types += ' **\n '.join(f'(&(p # "{name}" ->ₛ "s{i}")) # {kind} |->_' for i in range(count)) + '.\n'
model_types += '''Lemma local_field_address : forall (v t f:string),
 eval_addr_expr (RE_addr_of (LE_arrow_field
  (RE_const (eval_addr_expr (RE_addr_of (LE_var v))) (FET_alias t)) f)) =
 eval_addr_expr (RE_addr_of (LE_arrow_field (RE_addr_of (LE_var v)) f)).
Proof. intros. apply eval_addr_expr_congr. apply RE_addr_of_congr.
 apply LE_arrow_field_congr; [apply eval_addr | reflexivity]. Qed.
'''
(COQ / 'Types.v').write_text(model_types)
(COQ / 'VectorModel.v').write_text('''From Coq Require Import ZArith.
From FMax Require Export Types.
Local Open Scope Z_scope.
Definition mm_active_max (i vl:Z) (a b:fp32) : fp32 :=
 if Z.ltb i vl then mm_rvv a b else fp32_zero.
Definition mm_active_add (i vl:Z) (a b:fp32) : fp32 :=
 if Z.ltb i vl then mm_rvv_add a b else fp32_zero.
Definition mm_active_ne (i vl:Z) (a b:fp32) : Z :=
 if Z.ltb i vl then mm_rvv_ne a b else 0.
Definition mm_active_merge (i vl:Z) (a b:fp32) (m:Z) : fp32 :=
 if Z.ltb i vl then if Z.eqb m 0 then a else b else fp32_zero.
''')
(SHIM / 'formal_vector_model.h').write_text('''#ifndef QCP_FMAX_FORMAL_VECTOR_MODEL_H
#define QCP_FMAX_FORMAL_VECTOR_MODEL_H
#include "formal_types.h"
#include "formal_model.h"
/*@ Import Coq Require Import FMax.VectorModel */
/*@ Extern Coq
 (mm_active_max : Z -> Z -> fp32 -> fp32 -> fp32)
 (mm_active_add : Z -> Z -> fp32 -> fp32 -> fp32)
 (mm_active_ne : Z -> Z -> fp32 -> fp32 -> Z)
 (mm_active_merge : Z -> Z -> fp32 -> fp32 -> Z -> fp32) */
#endif
''')
(SHIM / 'formal_scalar.h').write_text('#ifndef QCP_FMAX_FORMAL_SCALAR_H\n#define QCP_FMAX_FORMAL_SCALAR_H\n#include "formal_model.h"\n' + prototypes((SHIM / 'scalar_primitives.c').read_text()) + '#endif\n')

body = '#include "formal_vector_model.h"\n#include "formal_scalar.h"\n'
for kind, result, operation in [('max', 'float', 'qcp_fmax_rvv(a,b)'),
                                ('add', 'float', 'qcp_fmax_rvv_add(a,b)'),
                                ('ne', 'int', 'qcp_fmax_rvv_ne(a,b)')]:
    post = f'same_bits(__return,mm_active_{kind}(i,vl,a,b))' if result == 'float' else '__return == mm_active_ne(i,vl,a,b)'
    inactive = 'qcp_float_from_bits(0U)' if result == 'float' else '0'
    body += f'''{result} qcp_fmax_active_{kind}(float a,float b,unsigned long long i,unsigned long long vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
 Ensure {post} && emp */
{{ if (i < vl) return {operation}; return {inactive}; }}
'''
body += '''float qcp_fmax_active_merge(float a,float b,int mask,unsigned long long i,unsigned long long vl)
/*@ Require 0 <= i && i < 32 && 0 <= vl && vl <= 32 && emp
 Ensure same_bits(__return,mm_active_merge(i,vl,a,b,mask)) && emp */
{
 if (i < vl) { if (mask == 0) return a; return b; }
 return qcp_float_from_bits(0U);
}
'''
body += 'float32x4_t vmaxq_f32(float32x4_t a,float32x4_t b)\n'
body += '/*@ With ' + arguments('x', 'fp32', 4) + ' ' + arguments('y', 'fp32', 4) + '\n'
body += ' Require ' + fields('a', 'x', 'float', 4) + ' * ' + fields('b', 'y', 'float', 4) + '\n'
body += ' Ensure ' + outputs('float', [f'mm_arm(x{i},y{i})' for i in range(4)], 4) + ' */\n{\n float32x4_t r;\n'
body += ''.join(f' r.s{i}=qcp_fmax_arm(a.s{i},b.s{i});\n' for i in range(4)) + ' return r;\n}\n'
for operation, intrinsic in [('max', '__riscv_vfmax_vv_f32m8'), ('add', '__riscv_vfadd_vv_f32m8')]:
    body += f'vfloat32m8_t {intrinsic}(vfloat32m8_t a,vfloat32m8_t b,unsigned long long vl)\n'
    body += '/*@ With ' + arguments('x', 'fp32') + ' ' + arguments('y', 'fp32') + '\n'
    body += ' Require 0 <= vl && vl <= 32 && ' + fields('a', 'x', 'float') + ' * ' + fields('b', 'y', 'float') + '\n'
    body += ' Ensure ' + outputs('float', [f'mm_active_{operation}({i},vl,x{i},y{i})' for i in range(N)]) + ' */\n{\n vfloat32m8_t r;\n'
    body += ''.join(f' r.s{i}=qcp_fmax_active_{operation}(a.s{i},b.s{i},{i},vl);\n' for i in range(N)) + ' return r;\n}\n'
body += 'vfloat32m8_t __riscv_vmerge_vvm_f32m8(vfloat32m8_t a,vfloat32m8_t b,vbool4_t mask,unsigned long long vl)\n'
body += '/*@ With ' + arguments('x', 'fp32') + ' ' + arguments('y', 'fp32') + ' ' + arguments('m', 'Z') + '\n'
body += ' Require 0 <= vl && vl <= 32 && ' + fields('a', 'x', 'float') + ' * ' + fields('b', 'y', 'float') + ' * ' + fields('mask', 'm', 'int') + '\n'
body += ' Ensure ' + outputs('float', [f'mm_active_merge({i},vl,x{i},y{i},m{i})' for i in range(N)]) + ' */\n{\n vfloat32m8_t r;\n'
body += ''.join(f' r.s{i}=qcp_fmax_active_merge(a.s{i},b.s{i},mask.s{i},{i},vl);\n' for i in range(N)) + ' return r;\n}\n'
(SHIM / 'vector_primitives.c').write_text(body)
(SHIM / 'vector_primitives.h').write_text('#ifndef QCP_FMAX_VECTOR_PRIMITIVES_H\n#define QCP_FMAX_VECTOR_PRIMITIVES_H\n#include "formal_vector_model.h"\n#include "formal_scalar.h"\n' + prototypes(body) + '#endif\n')

equal_values = ' && '.join(f'same_bits(x{i},y{i})' for i in range(N))
alias = '(a == b && ' + equal_values + ' && ' + fields('a', 'x', 'float', pointer=True) + ')'
separate = '(a != b && ' + fields('a', 'x', 'float', pointer=True) + ' * ' + fields('b', 'y', 'float', pointer=True) + ')'
borrow = '#include "vector_primitives.h"\n'
borrow += 'vbool4_t qcp_fmax_vmfne_borrow(const vfloat32m8_t *a,const vfloat32m8_t *b,unsigned long long vl)\n'
borrow += '/*@ With ' + arguments('x', 'fp32') + ' ' + arguments('y', 'fp32') + '\n'
borrow += ' Require 0 <= vl && vl <= 32 && (' + alias + ' || ' + separate + ')\n'
borrow += ' Ensure (' + alias + ' || ' + separate + ') *\n ' + outputs('int', [f'mm_active_ne({i},vl,x{i},y{i})' for i in range(N)]) + ' */\n{\n vbool4_t r;\n if (a == b) {\n'
borrow += ''.join(f'  r.s{i}=qcp_fmax_active_ne(a->s{i},a->s{i},{i},vl);\n' for i in range(N))
borrow += ' } else {\n' + ''.join(f'  r.s{i}=qcp_fmax_active_ne(a->s{i},b->s{i},{i},vl);\n' for i in range(N)) + ' }\n return r;\n}\n'
(SHIM / 'borrow_compare.c').write_text(borrow)
(SHIM / 'borrow_compare.h').write_text('''#ifndef QCP_FMAX_BORROW_COMPARE_H
#define QCP_FMAX_BORROW_COMPARE_H
#include "vector_primitives.h"
/* This macro supports named local vector lvalues only. Each address operand
 * is evaluated once. The readonly body explicitly supports identical inputs. */
''' + prototypes(borrow) + '''#define __riscv_vmfne_vv_f32m8_b4(a,b,vl) qcp_fmax_vmfne_borrow(&(a),&(b),(vl))
#endif
''')
print('Generated fixed NEON4/RVV32 wrappers and a one-resource alias branch')
