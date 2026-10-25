#!/usr/bin/env python3
from pathlib import Path
import re,json,hashlib
P=Path(__file__).resolve().parent;C=P.parent;src=P/'native/isa_arrays.h';s=src.read_text();types=[]
def field(m):
 t,n,name=m.groups();n=int(n);types.append((t,n,name));return 'typedef struct{union{'+t+' v['+str(n)+'];struct{'+''.join(t+' s'+str(j)+';'for j in range(n))+'};};}'+name+';'
s,count=re.subn(r'typedef struct\{([\w]+) v\[(\d+)\];\}(\w+);',field,s);assert count==11
asserts='\n/* Diagnostic semantic struct view, not a physical SIMD ABI theorem. */\n'
for t,n,name in types:
 asserts+=f'_Static_assert(sizeof({name})==sizeof({t})*{n},"{name} size");\n'
 for j in range(n):asserts+=f'_Static_assert(offsetof({name},s{j})==sizeof({t})*{j},"{name} lane{j}");\n'
i=s.index('static inline int8x8_t vdup_n_s8');s=s[:i]+asserts+s[i:];dst=P/'native/isa_fields.h';dst.write_text(s)
guards=[]
for p in(C/'shim').glob('*.h'):
 m=re.search(r'^#ifndef (\w+)\n#define \1',p.read_text(),re.M)
 if m:guards.append(m[1])
body='''/* Actual ordinary adapter C bodies, compiled before frontend call macros.
   Intrinsic numeric implementations are the finite, distinct ISA emulator.
   Coq annotations remain byte-identical source comments. */
'''+''.join('#define '+g+'\n'for g in sorted(set(guards)))
files=[u['source']for u in json.loads((P/'adapter-unit-inventory.json').read_text())['units']if u['stem']!='qm_scale_is_nan']+['shim/store.c','shim/control.c','shim/float_borrow.c']
for f in files:body+='#include "../../'+f+'"\n'
body+='''#undef assert
#define assert(c) qm_assert((c))
#include "../../shim/neon_frontend.h"
#define test_neon field_neon
#include "../../impl/testNEON.c"
#undef test_neon
#include "../../shim/rvv_frontend_prefix.h"
#define test_rvv field_rvv
#include "../../impl/testRVV.c"
#undef test_rvv
#undef assert
#include <assert.h>
'''
(P/'native/field_kernels.h').write_text(body)
(P/'native-field-source-ledger.json').write_text(json.dumps({'scope':'Finite current actual C kernel frontends and all ordinary adapter bodies. Anonymous union exposes both scalar fields and emulator array lanes with compile-time size/offset guards; not a physical ISA ABI/refinement claim.','intrinsic_semantics_source':'proof/native/isa_arrays.h','source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'generated_fields_header':'proof/native/isa_fields.h','generated_fields_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'unchanged_intrinsic_C_function_bodies':True,'actual_ordinary_body_sources':files+['shim/qm_scale_is_nan.c'],'actual_kernel_sources':['impl/testNEON.c','impl/testRVV.c'],'actual_frontends':['shim/neon_frontend.h','shim/rvv_frontend_prefix.h','shim/rvv_frontend.h'],'field_layout_static_guards':sum(n+1 for _,n,_ in types),'scope_limit':'Native min(AVL,32) and zero inactive values are representative choices; formal specs preserve all legal VL and arbitrary inactive values.'},indent=2)+'\n')
