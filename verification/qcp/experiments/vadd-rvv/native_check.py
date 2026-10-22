#!/usr/bin/env python3
"""Compare 32-lane implementations with the unchanged native runtime, for every VL."""
import ctypes as C
import json
import random
import struct
import subprocess
from pathlib import Path

HERE = Path(__file__).resolve().parent
SHARED = HERE.parents[1] / 'shared/runtime'

class Vector(C.Structure):
    _fields_ = [('lanes', C.c_float * 32)]


def main():
    out = HERE / '.build'
    out.mkdir(exist_ok=True)
    commands = []
    for name, sources in [('original', [SHARED / 'float_ops.c']),
                          ('adapted', [HERE / 'rvv_add.c', HERE / 'rvv_load.c'])]:
        command = ['gcc', '-std=c11', '-O0', '-fno-fast-math', '-ffp-contract=off',
                   '-shared', '-fPIC', *map(str, sources), '-o', str(out / (name + '.so'))]
        subprocess.run(command, check=True, capture_output=True, timeout=40)
        commands.append(command)
    old, new = C.CDLL(str(out / 'original.so')), C.CDLL(str(out / 'adapted.so'))
    old_load = old.__riscv_vle32_v_f32m8
    old_load.argtypes, old_load.restype = [C.POINTER(C.c_float), C.c_size_t], Vector
    old_add = old.__riscv_vfadd_vv_f32m8
    old_add.argtypes, old_add.restype = [Vector, Vector, C.c_size_t], Vector
    new_load = new.__riscv_vle32_v_f32m8
    new_load.argtypes, new_load.restype = [C.POINTER(Vector), C.POINTER(C.c_float), C.c_ulonglong], None
    new_add = new.__riscv_vfadd_vv_f32m8
    new_add.argtypes, new_add.restype = [C.POINTER(Vector), C.POINTER(Vector), C.POINTER(Vector), C.c_ulonglong], None
    rng = random.Random(20261022)
    special = [0, 0x80000000, 1, 0x007fffff, 0x7f7fffff, 0xff7fffff,
               0x7f800000, 0xff800000, 0x7fc00001, 0x7fa00001, 0xffc00001]
    count = 0
    for vl in range(33):
        for pattern in range(12):
            data = (C.c_uint32 * max(vl, 1))(*[
                special[(i + pattern) % len(special)] if pattern < 11 else rng.getrandbits(32)
                for i in range(max(vl, 1))])
            pointer = C.cast(data, C.POINTER(C.c_float)) if vl else C.POINTER(C.c_float)()
            before = bytes(data)
            actual, expected = Vector(), old_load(pointer, vl)
            new_load(C.byref(actual), pointer, vl)
            assert bytes(actual) == bytes(expected)
            assert bytes(data) == before
            for i in range(vl, 32):
                assert struct.unpack('<I', bytes(actual)[4*i:4*i+4])[0] == 0
            other = Vector()
            for i in range(32):
                bits = special[(i + pattern + 3) % len(special)] if pattern < 11 else rng.getrandbits(32)
                other.lanes[i] = struct.unpack('<f', struct.pack('<I', bits))[0]
            baseline, result = old_add(actual, other, vl), Vector()
            before_vectors = bytes(actual), bytes(other)
            new_add(C.byref(result), C.byref(actual), C.byref(other), vl)
            assert bytes(result) == bytes(baseline)
            assert (bytes(actual), bytes(other)) == before_vectors
            for i in range(vl, 32):
                assert struct.unpack('<I', bytes(result)[4*i:4*i+4])[0] == 0
            count += 1
    result = {'passed': True, 'vl_values': 33, 'cases': count,
              'load_and_add_bitwise_match': True, 'inactive_positive_zero': True,
              'input_frame_preserved': True, 'commands': commands,
              'scope': 'Finite native evidence; not a proof of general lowering or ISA correspondence.'}
    (HERE / 'native-result.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in ['passed', 'vl_values', 'cases']}))

if __name__ == '__main__':
    main()
