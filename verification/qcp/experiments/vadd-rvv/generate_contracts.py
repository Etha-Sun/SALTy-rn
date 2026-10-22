#!/usr/bin/env python3
"""Extract the exact reviewed public contracts from the checked primitive bodies."""
from pathlib import Path

HERE = Path(__file__).resolve().parent

def main():
    header = '#ifndef RVV_PRIMITIVE_CONTRACTS_H\n#define RVV_PRIMITIVE_CONTRACTS_H\n'
    header += '#include "types.h"\n#include "rvv_array_def.h"\n#include "rvv_store_def.h"\n'
    for kind, function in [('load', '__riscv_vle32_v_f32m8'),
                           ('add', '__riscv_vfadd_vv_f32m8'),
                           ('store', '__riscv_vse32_v_f32m8')]:
        text = (HERE / ('rvv_' + kind + '.c')).read_text()
        start = text.index('void ' + function + '(')
        end = text.index('\n{', start)
        header += text[start:end] + ';\n'
    header += '/*@ Import Coq Require Import QcpRvv32.RvvLayout */\n#endif\n'
    (HERE / 'primitive_contracts.h').write_text(header)

if __name__ == '__main__':
    main()
