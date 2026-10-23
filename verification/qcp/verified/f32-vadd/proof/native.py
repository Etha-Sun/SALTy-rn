"""Finite regression for spec.c linked directly with both unchanged C files."""
from pathlib import Path
import ctypes as C
import json
import random
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
from prepare import REPO
RUNTIME = REPO / 'verification/qcp/shared/runtime'
build = CASE / '.build'
build.mkdir(exist_ok=True)
run = Path(tempfile.mkdtemp(prefix='native-', dir=build))
unit = run / 'entry.c'
unit.write_text('\n'.join('#include "' + str(path) + '"' for path in [
    RUNTIME / 'float_ops.c', RUNTIME / 'vl.c', CASE / 'spec.c',
    CASE / 'impl/testNEON.c', CASE / 'impl/testRVV.c']) + '\n')
library = run / 'entry.so'
subprocess.run(['gcc', '-std=c11', '-O0', '-shared', '-fPIC', '-fno-fast-math',
                '-ffp-contract=off', '-frounding-math', str(unit), '-o', str(library)], check=True, timeout=30)
dll = C.CDLL(str(library))
ptr = lambda array, offset=0: C.cast(C.byref(array, offset * 4), C.POINTER(C.c_float))
dll.equivalent.argtypes = [C.c_size_t] + [C.POINTER(C.c_float)] * 4
dll.equivalent.restype = C.c_int
dll.compare_outputs.argtypes = [C.c_size_t, C.POINTER(C.c_float), C.POINTER(C.c_float)]
dll.compare_outputs.restype = C.c_int
special = [0, 0x80000000, 1, 0x80000001, 0x007fffff, 0x00800000,
           0x7f7fffff, 0xff7fffff, 0x7f800000, 0xff800000, 0x7fc00001,
           0x7fa00001, 0x3f800000, 0x40000000]
rng = random.Random(20261022)
cases = 0


def check(n, aa, bb):
    global cases
    a, b = (C.c_uint32 * (n + 3))(*aa), (C.c_uint32 * (n + 3))(*bb)
    left, right = [(C.c_uint32 * (n + 2))(*([0x4d35cafe] * (n + 2))) for _ in range(2)]
    before = bytes(a), bytes(b)
    assert dll.equivalent(n, ptr(a), ptr(b), ptr(left, 1), ptr(right, 1)) == 1
    assert (bytes(a), bytes(b)) == before
    assert left[0] == left[n + 1] == right[0] == right[n + 1] == 0x4d35cafe
    cases += 1


for n in list(range(1, 71)) + [95, 96, 97, 127, 128, 129, 257, 1025]:
    check(n, [0x3f800000] * (n + 3), [0x40000000] * (n + 3))
    check(n, [special[i % len(special)] for i in range(n + 3)],
          [special[(7 * i + 3) % len(special)] for i in range(n + 3)])
    check(n, [rng.getrandbits(32) for _ in range(n + 3)], [rng.getrandbits(32) for _ in range(n + 3)])
for a in special:
    for b in special:
        check(1, [a] * 4, [b] * 4)
unequal = [(C.c_uint32 * 1)(x) for x in [0x3f800000, 0x40000000]]
assert dll.compare_outputs(1, ptr(unequal[0]), ptr(unequal[1])) == 0
(HERE / 'native-status.json').write_text(json.dumps({
    'passed': True, 'cases': cases, 'unequal_outputs_rejected': True,
    'entry': 'spec.c + impl/testNEON.c + impl/testRVV.c',
    'scope': 'Finite native regression using the shared C runtime; not a proof.'}, indent=2) + '\n')
print('Native:', cases, 'cases passed; unequal outputs rejected')
