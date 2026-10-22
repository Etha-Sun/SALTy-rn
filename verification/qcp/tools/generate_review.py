#!/usr/bin/env python3
"""Render the reviewed binary-f32 interface template; never infer a kernel's semantics."""
import argparse
import json
import re
from pathlib import Path
from string import Template

ROOT = Path(__file__).resolve().parents[3]
QCP = ROOT / 'verification/qcp'


def render(interface):
    supported = {'family': 'binary-f32', 'observation': 'number-or-both-nan',
                 'input_aliasing': 'disjoint', 'VLEN_bits': 128,
                 'VL_policy': 'min(remaining,32)', 'rounding': 'RNE'}
    if set(interface) != set(supported) | {'kernel', 'padding', 'neon', 'rvv'}:
        raise ValueError('unknown or missing interface fields')
    for key, value in supported.items():
        if interface.get(key) != value:
            raise ValueError(f'unsupported {key}: {interface.get(key)!r}')
    name, padding = interface['kernel'], interface['padding']
    if not re.fullmatch(r'f32-v[a-z0-9]+', name):
        raise ValueError('unsupported kernel name')
    if type(padding) is not int or not 0 <= padding <= 32:
        raise ValueError('padding must be an explicitly reviewed integer in [0,32]')
    # This family has byte-count + A/B/output + dummy params. Other interfaces
    # require another explicit template rather than an approximate match.
    args = (r'size_t\s+\w+\s*,\s*const\s+float\s*\*\s*\w+\s*,\s*'
            r'const\s+float\s*\*\s*\w+\s*,\s*float\s*\*\s*\w+\s*,\s*'
            r'const\s+struct\s+xnn_f32_default_params\s*\*\s*restrict\s+\w+')
    for side, directory in [('neon', 'source'), ('rvv', 'target')]:
        expected = f'kernels/{directory}/{name}.c'
        if interface[side] != expected:
            raise ValueError(f'{side} must reference {expected}')
        code = re.sub(r'/\*.*?\*/|//[^\n]*', '', (ROOT / expected).read_text(), flags=re.S)
        if not re.search(r'\bvoid\s+test_' + side + r'\s*\(\s*' + args + r'\s*\)', code):
            raise ValueError(f'unsupported test_{side} signature')
    values = dict(interface, guard='QCP_' + name.removeprefix('f32-').upper() + '_PUBLIC_SPEC_H',
                  max_n=(2**64 - 1) // 4 - padding)
    template = QCP / 'templates/binary-f32'
    return {name: Template((template / (name + '.in')).read_text()).substitute(values)
            for name in ['spec.h', 'mapper.c']}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('case', nargs='?', default='f32-vadd')
    parser.add_argument('--check', action='store_true', help='Compare with reviewed files, without writing')
    args = parser.parse_args()
    if not re.fullmatch(r'[a-z0-9-]+', args.case):
        parser.error('case must be a simple directory name')
    case = QCP / 'cases' / args.case
    generated = render(json.loads((case / 'interface.json').read_text()))
    if args.check:
        for name, content in generated.items():
            if (case / name).read_text() != content:
                raise SystemExit(f'reviewed {name} differs from generated candidate')
        print('spec.h and mapper.c exactly match the reviewed templates')
    else:
        out = QCP / '.build' / args.case / 'review-candidate'
        out.mkdir(parents=True, exist_ok=True)
        for name, content in generated.items():
            (out / name).write_text(content)
        print(out)


if __name__ == '__main__':
    main()
