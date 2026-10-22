#!/usr/bin/env python3
"""Check all VL prefix stores against the unchanged native runtime, including frames."""
import ctypes as C
import json
import random
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
SHARED = HERE.parents[1] / 'shared/runtime'

class Vector(C.Structure):
    _fields_ = [('lanes', C.c_uint32 * 32)]


def main():
    build = HERE / '.build'
    build.mkdir(exist_ok=True)
    commands = []
    for name, source in [('original-store', SHARED / 'float_ops.c'),
                         ('adapted-store', HERE / 'rvv_store.c')]:
        command = ['gcc', '-std=c11', '-O0', '-fno-fast-math', '-ffp-contract=off',
                   '-shared', '-fPIC', str(source), '-o', str(build / (name + '.so'))]
        subprocess.run(command, check=True, capture_output=True, timeout=40)
        commands.append(command)
    old = C.CDLL(str(build / 'original-store.so')).__riscv_vse32_v_f32m8
    old.argtypes, old.restype = [C.POINTER(C.c_float), Vector, C.c_size_t], None
    new = C.CDLL(str(build / 'adapted-store.so')).__riscv_vse32_v_f32m8
    new.argtypes, new.restype = [C.POINTER(C.c_float), C.POINTER(Vector), C.c_ulonglong], None
    rng = random.Random(20261022)
    special = [0, 0x80000000, 1, 0x007fffff, 0x7f7fffff, 0xff7fffff,
               0x7f800000, 0xff800000, 0x7fc00001, 0x7fa00001, 0xffc00001]
    count = 0
    for vl in range(33):
        for pattern in range(12):
            vector = Vector((C.c_uint32 * 32)(*[
                special[(i+pattern) % len(special)] if pattern < 11 else rng.getrandbits(32)
                for i in range(32)]))
            before_vector = bytes(vector)
            initial = [rng.getrandbits(32) for _ in range(vl+2)]
            actual, expected = (C.c_uint32 * (vl+2))(*initial), (C.c_uint32 * (vl+2))(*initial)
            newp = C.cast(C.byref(actual, 4), C.POINTER(C.c_float))
            oldp = C.cast(C.byref(expected, 4), C.POINTER(C.c_float))
            old(oldp, vector, vl)
            new(newp, C.byref(vector), vl)
            assert bytes(actual) == bytes(expected)
            assert list(actual)[1:vl+1] == list(vector.lanes)[:vl]
            assert actual[0] == initial[0] and actual[vl+1] == initial[vl+1]
            assert bytes(vector) == before_vector
            if vl == 0:
                old(C.POINTER(C.c_float)(), vector, 0)
                new(C.POINTER(C.c_float)(), C.byref(vector), 0)
            count += 1
    result = {'passed': True, 'vl_values': 33, 'cases': count,
              'prefix_bitwise_match': True, 'input_vector_preserved': True,
              'output_canaries_preserved': True, 'vl_zero_null_pointer': True,
              'commands': commands,
              'scope': 'Finite differential evidence for the QCP C representation, not a general lowering or ISA proof.'}
    (HERE / 'native-store-result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({k: result[k] for k in ['passed', 'vl_values', 'cases']}))

if __name__ == '__main__':
    main()
