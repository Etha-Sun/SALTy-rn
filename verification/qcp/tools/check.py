"""Native original/lowered regression and integrity controls; no proof admission."""
import ctypes as C
import json
import math
import random
import shutil
import struct
import subprocess
import tempfile
from datetime import datetime, timezone

from case import ROOT, QCP, audit, prepare, sha, validate_annotations


def ptr(buf, offset=0):
    return C.cast(C.byref(buf, offset * 4), C.POINTER(C.c_float))


def number(bits):
    return struct.unpack("=f", struct.pack("=I", bits))[0]


def same(a, b):
    return a == b or math.isnan(a) and math.isnan(b)


def library(unit, target, commands):
    cmd = ["gcc", "-std=c11", "-O0", "-shared", "-fPIC", "-fno-fast-math",
           "-ffp-contract=off", "-frounding-math", str(unit), "-o", str(target)]
    subprocess.run(cmd, check=True, capture_output=True, timeout=45)
    commands.append(cmd)
    lib = C.CDLL(str(target))
    lib.equivalent.argtypes = [C.c_size_t, *([C.POINTER(C.c_float)] * 4)]
    lib.equivalent.restype = C.c_int
    return lib


def main():
    case = QCP / "cases/f32-vadd"
    out = prepare(case)
    commands = []
    native = library(out / "native_unit.c", out / "native.so", commands)
    lowered = library(out / "lowered_unit.c", out / "lowered.so", commands)
    # Deliberately perturb only RVV, after executing its real body.
    bad = out / "mismatch.c"
    mapper = (case / "mapper.c").read_text().replace('"spec.h"', '"' + str(case / "spec.h") + '"')
    mapper = mapper.replace('"../../../../kernels/source/f32-vadd.c"', '"' + str(ROOT / "kernels/source/f32-vadd.c") + '"')
    mapper = mapper.replace('#include "../../../../kernels/target/f32-vadd.c"',
                           '#define test_rvv test_rvv_original\n#include "' + str(ROOT / "kernels/target/f32-vadd.c") +
                           '"\n#undef test_rvv\n' + '''
void test_rvv(size_t batch, const float *a, const float *b, float *r,
              const struct xnn_f32_default_params *params) {
  test_rvv_original(batch,a,b,r,params);
  r[0] = -1.0f;
}
''')
    bad.write_text('\n'.join('#include "' + str(p) + '"' for p in [
        QCP / "shared/runtime/float_ops.c", QCP / "shared/runtime/vl.c"]) + '\n' + mapper)
    mutant = library(bad, out / "mismatch.so", commands)
    special = [0,0x80000000,1,0x80000001,0x007fffff,0x00800000,0x7f7fffff,
               0xff7fffff,0x7f800000,0xff800000,0x7fc00001,0x7fa00001,0x3f800000,0x40000000]
    rng = random.Random(20261022)
    cases = 0

    def check(n, aa, bb):
        nonlocal cases
        a, b = (C.c_uint32 * len(aa))(*aa), (C.c_uint32 * len(bb))(*bb)
        before = bytes(a), bytes(b)
        baseline = None
        for lib in [native, lowered]:
            left = (C.c_uint32 * (n + 2))(*([0x4d35cafe] * (n+2)))
            right = (C.c_uint32 * (n + 2))(*([0x4d35cafe] * (n+2)))
            assert lib.equivalent(n,ptr(a),ptr(b),ptr(left,1),ptr(right,1)) == 1
            assert left[0] == left[n+1] == right[0] == right[n+1] == 0x4d35cafe
            assert before == (bytes(a),bytes(b))
            values = [number(left[i+1]) for i in range(n)]
            assert all(same(values[i],number(right[i+1])) for i in range(n))
            if baseline is not None:
                assert all(same(x,y) for x,y in zip(baseline,values))
            baseline = values
        cases += 1

    for n in list(range(1,71)) + [95,96,97,127,128,129,257,1025]:
        check(n,[0x3f800000]*(n+3),[0x40000000]*(n+3))
        check(n,[special[i%len(special)] for i in range(n+3)],
              [special[(7*i+3)%len(special)] for i in range(n+3)])
        check(n,[rng.getrandbits(32) for _ in range(n+3)], [rng.getrandbits(32) for _ in range(n+3)])
    for a in special:
        for b in special:
            check(1,[a]*4,[b]*4)
    a,b,l,r = (C.c_float*4)(1,1,1,1),(C.c_float*4)(2,2,2,2),(C.c_float*1)(),(C.c_float*1)()
    assert mutant.equivalent(1,a,b,l,r) == 0
    before = 'int f(int x) { return x + 1; }'
    validate_annotations(before, 'int f(int x) { /*@ Assert x == x */ return x + 1; }')
    rejected = []
    for name, after in [
        ("ordinary_write", before.replace('return x + 1;', 'x = 0; return x + 1;')),
        ("false_precondition", '/*@ Require 0 == 1 Ensure emp */\n'+before),
        ("hidden_import", '/*@ Import Coq Require Import Evil */\n'+before),
        ("line_splice_comment", before.replace('return', '// hidden ' + chr(92) + '\nreturn')),
        ("trigraph_splice", before.replace('return', '// hidden ??/\nreturn')),
        ("operator_token", before.replace('x + 1', 'x++ + 1'))]:
        try:
            validate_annotations(before,after)
        except ValueError:
            rejected.append(name)
        else:
            raise AssertionError(name + ' escaped proof guard')
    with tempfile.TemporaryDirectory(prefix='qcp-freeze-') as tmp:
        from pathlib import Path
        shadow=Path(tmp)
        for p in audit(case)['files']:
            target=shadow/p; target.parent.mkdir(parents=True,exist_ok=True); shutil.copyfile(ROOT/p,target)
        for p in ['kernels/source/f32-vadd.c','verification/qcp/cases/f32-vadd/spec.h',
                  'verification/qcp/cases/f32-vadd/mapper.c']:
            original=(shadow/p).read_bytes(); (shadow/p).write_bytes(original+b'\n/* drift */\n')
            try:
                audit(case,shadow)
            except ValueError:
                rejected.append(p)
            else:
                raise AssertionError('freeze drift accepted')
            (shadow/p).write_bytes(original)
    result={"time_utc":datetime.now(timezone.utc).isoformat(),"native_cases":cases,
            "equivalent_calls":cases*2,"kernel_executions":cases*4,
            "native_and_lowered_match":True,"mismatched_output_rejected":True,
            "integrity_negative_controls":rejected,"commands":commands,
            "prepared_manifest_sha256":sha(out/'manifest.json'),
            "full_kernel_proof":False,"scope":"Finite native regression and source integrity only"}
    evidence=QCP/'audit'; evidence.mkdir(exist_ok=True)
    (evidence/'framework-check.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:result[k] for k in ['native_cases','equivalent_calls','native_and_lowered_match','full_kernel_proof']}))


if __name__ == '__main__':
    main()
