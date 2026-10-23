#!/usr/bin/env python3
"""Generate unchanged NEON kernel and new primitive VCs from public inputs."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import time

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
BASE = ROOT / 'verification/qcp/verified/f32-vadd'

def tokens(text):
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    return re.findall(r'\w+|[^\s\w]', text)

def contract(text, name):
    at = text.index(' ' + name + '(')
    start = text.index('/*@', at)
    return text[start:text.index('*/', start) + 2]

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--unit', choices=['kernel', 'primitives'], required=True)
    args = parser.parse_args()
    run = Path(tempfile.mkdtemp(prefix='neon-' + args.unit + '-', dir=CASE / '.build'))
    records = []
    def execute(cmd, label, timeout=240):
        start = time.monotonic()
        with (run / (label + '.log')).open('w') as output:
            try:
                code = subprocess.run(cmd, cwd=run, stdout=output, stderr=subprocess.STDOUT, timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append({'command': cmd, 'label': label, 'exit_code': code, 'seconds': time.monotonic() - start})
        return code
    sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
    source = CASE / 'impl/testNEON.c'
    original = source.read_text()
    identity = json.loads((HERE / 'originals.json').read_text())['files'][0]
    assert sha(source) == identity['sha256'], 'Unknown kernel source; explicit template update required'
    assert source.read_bytes() == (ROOT / identity['path']).read_bytes(), 'Original source identity mismatch'
    public = (CASE / 'spec.c').read_text()
    if args.unit == 'kernel':
        inv = '''/*@ Inv Assert exists (k:Z),
fp32_length(A) == batch@pre/4+3 &&
0 <= k && k*4 + batch == batch@pre && batch % 4 == 0 &&
0 <= batch && batch <= batch@pre && k <= batch@pre/4 &&
(batch == 0 || (batch == 4 && batch/4 == 1) ||
 (batch == 8 && batch/4 == 2) || (batch == 12 && batch/4 == 3) ||
 (16 <= batch && 4 <= batch/4)) &&
params == params@pre && params != 0 &&
input == input@pre + k && output == output@pre + k &&
input != 0 && output != 0 &&
FloatArray::full(input@pre,k,fp32_slice(0,k,A)) *
FloatArray::full(input,batch/4+3,fp32_slice(k,batch@pre/4+3,A)) *
store(&(params->scalar.slope),float,c) *
store(&(vslope.s0),float,c) * store(&(vslope.s1),float,c) *
store(&(vslope.s2),float,c) * store(&(vslope.s3),float,c) *
FloatArray::full(output@pre,k,vlrelu_values(k,A,c)) * FloatArray::undef_full(output,batch/4) */'''
        patches = [{'before': '\n{', 'text': contract(public, 'test_neon')},
                   {'before': '  for (;', 'text': inv}]
        for call, binding in [
            ('vmulq_f32(vx0123, vslope)', 'a=&vx0123,b=&vslope'),
            ('vmulq_f32(vx, vslope)', 'a=&vx,b=&vslope'),
            ('vcltq_s32(vreinterpretq_s32_f32(vx0123), vmovq_n_s32(0))', 'a=0,b=0'),
            ('vcltq_s32(vreinterpretq_s32_f32(vx), vmovq_n_s32(0))', 'a=0,b=0'),
            ('vreinterpretq_s32_f32(vx0123)', 'a=&vx0123'),
            ('vreinterpretq_s32_f32(vx)', 'a=&vx'),
            ('vbslq_f32(vmask0123, vacc0123, vx0123)', 'mask=&vmask0123,a=&vacc0123,b=&vx0123'),
            ('vbslq_f32(vmask, vacc, vx)', 'mask=&vmask,a=&vacc,b=&vx'),
            ('vst1q_f32(output, vacc0123)', 'a=&vacc0123'),
            ('vget_low_f32(vacc)', 'a=&vacc'),
            ('vget_high_f32(vacc)', 'a=&vacc'),
            ('vst1_f32(output, vacc_lo)', 'a=&vacc_lo'),
            ('vst1_lane_f32(output, vacc_lo, 0)', 'a=&vacc_lo'),
        ]:
            patches.append({'after': call, 'text': '/*@ where ' + binding + ' */'})
        text = original
        for p in patches:
            anchor = p.get('before', p.get('after'))
            assert text.count(anchor) == 1, 'Unsupported or ambiguous source shape: ' + anchor
            replacement = p['text'] + '\n' + anchor if 'before' in p else anchor + ' ' + p['text']
            text = text.replace(anchor, replacement, 1)
        assert tokens(text) == tokens(original), 'Executable C changed'
        (HERE / 'c/neon.annotations.json').write_text(json.dumps(patches, indent=2) + '\n')
        text = '#include "' + str(CASE / 'shim/neon_frontend.h') + '"\n' + text
        stem = 'neon_unit'
    else:
        text = '#include "' + str(CASE / 'shim/neon_primitives.c') + '"\n'
        stem = 'neon_primitives'
    unit = run / (stem + '.c')
    unit.write_text(text)
    cpp = run / (stem + '_expanded.c')
    code = execute(['gcc', '-E', '-P', '-CC', '-nostdinc', str(unit), '-o', str(cpp)], 'cpp')
    if not code and args.unit == 'kernel':
        baseline = run / 'original.c'
        baseline.write_text('#include "' + str(CASE / 'shim/neon_frontend.h') + '"\n' + original)
        code = execute(['gcc', '-E', '-P', '-CC', '-nostdinc', str(baseline), '-o', str(run / 'original_expanded.c')], 'original-cpp')
        if not code:
            assert tokens(cpp.read_text()) == tokens((run / 'original_expanded.c').read_text()), 'Original/annotated CPP changed'
    if not code:
        unit.write_bytes(cpp.read_bytes())
        cmd = ['qcp', '--arch=64', '--endian=little', '--no-float-finite-vc', '--no-exec-info',
               '--input-file=' + str(unit), '--coq-output-dir=' + str(run), '--coq-logic-path=VLRelu']
        for d in sorted((BASE / 'proof/c').iterdir()):
            cmd += ['-slp', str(d), d.name]
        cmd += ['-slp', str(CASE / 'shim'), 'VLRelu', '-slp', str(HERE / 'c'), 'VLRelu']
        code = execute(cmd, 'qcp', 300)
    goal = run / (stem + '_goal.v')
    result = {'generation_passed': code == 0, 'whole_kernel_verified': False,
              'unit': args.unit, 'run_directory': str(run), 'records': records,
              'generated_c_vcs': len(re.findall(r'^Axiom proof_of_', goal.read_text(), re.M)) if goal.exists() else 0,
              'original_source_sha256': sha(source), 'public_spec_sha256': sha(CASE / 'spec.c')}
    (run / 'generation.json').write_text(json.dumps(result, indent=2) + '\n')
    (HERE / ('neon-' + args.unit + '-generation.json')).write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result, indent=2), flush=True)
    if code:
        print((run / ('cpp.log' if not cpp.exists() else 'qcp.log')).read_text()[-3000:])
    return code

if __name__ == '__main__':
    raise SystemExit(main())
