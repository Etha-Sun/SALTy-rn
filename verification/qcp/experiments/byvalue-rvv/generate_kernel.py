#!/usr/bin/env python3
"""Reuse old annotations while preserving every original RVV kernel C token."""
from pathlib import Path
import re,json,hashlib
HERE=Path(__file__).resolve().parent
OLD=HERE.parent/'vadd-rvv'
ROOT=HERE.parents[3]
def tokens(source):
    source=re.sub(r'/\*.*?\*/|//[^\n]*','',source,flags=re.S)
    return re.findall(r'\w+|[^\s\w]',source)
original=(ROOT/'kernels/target/f32-vadd.c').read_text()
previous=(OLD/'rvv_loop.c').read_text()
contract=re.search(r'/\*@ With \(A:list fp32\).*?\*/',previous,re.S).group()
annotations=re.findall(r'/\*@ (?:Assert|Inv).*?\*/',previous,re.S)
assert len(annotations)==3
source=original.replace('\n{','\n'+contract+'\n{',1)
source=source.replace('  while (n > 0)',annotations[0]+'\n'+annotations[1]+'\n  while (n > 0)',1)
source=source.replace('    vfloat32m8_t va =',annotations[2]+'\n    vfloat32m8_t va =',1)
source=source.replace('__riscv_vfadd_vv_f32m8(va, vb, vl)','__riscv_vfadd_vv_f32m8(va, vb, vl) /*@ where a = &va,b = &vb */')
source=source.replace('__riscv_vse32_v_f32m8(output, vacc, vl)','__riscv_vse32_v_f32m8(output, vacc, vl) /*@ where a = &vacc */')
assert tokens(source)==tokens(original)
header=previous[:previous.index('void test_rvv(')]
header=header.replace('#include "primitive_contracts.h"','#include "shim.h"').replace('#include "rvv_loop_def.h"','#include "../vadd-rvv/rvv_loop_def.h"')
(HERE/'rvv.c').write_text(header+source+'\n')
(HERE/'macro_rvv.c').write_text((header+source+'\n').replace('#include "shim.h"','#include "macro_shim.h"'))
(HERE/'source.json').write_text(json.dumps({'original_sha256':hashlib.sha256(original.encode()).hexdigest(),'executable_tokens_preserved':True,'full_kernel_proved':False},indent=2)+'\n')
