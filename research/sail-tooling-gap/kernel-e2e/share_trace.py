#!/usr/bin/env python3
"""Share a generated trace's constants and suffixes; Coq checks exact equality.

This is a presentation transformation, not a trusted semantic simplifier.
The generated module must pass its final equality theorem before use.
"""
import argparse
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def parse_trace(lines, pos=0):
    events = []
    while pos < len(lines) and lines[pos].endswith(':t:'):
        events.append(lines[pos][:-3].rstrip())
        pos += 1
    if pos == len(lines):
        raise ValueError('Missing trace terminator')
    line = lines[pos]
    if line.rstrip(';') == 'tnil':
        tail = ('nil',)
        pos += 1
    elif line == 'tcases [':
        branches = []
        pos += 1
        while pos < len(lines) and lines[pos].rstrip(';') != ']':
            branch, pos = parse_trace(lines, pos)
            branches.append(branch)
        if pos == len(lines):
            raise ValueError('Missing case terminator')
        pos += 1
        tail = ('cases', tuple(branches))
    else:
        raise ValueError(f'Unexpected trace line {pos}: {line[:100]}')
    return ('seq', tuple(events), tail), pos


def generate(address, output, chunk_size):
    original = 'a' + address
    source = ROOT / 'simple/generated/rvv' / (original + '.v')
    body = source.read_text().split(' : isla_trace :=', 1)[1].strip()
    if not body.endswith('.'):
        raise ValueError('Unexpected generated module ending')
    body = body[:-1].strip()
    body = body.replace('(BV 65536%N 0x8%Z)', 'wide8')
    body = body.replace('(BV 65536%N 0x20%Z)', 'wide32')
    lines = [line.strip() for line in body.splitlines() if line.strip()]
    tree, end = parse_trace(lines)
    if end != len(lines):
        raise ValueError('Unparsed trace suffix')
    definitions, memo = [], {}

    def intern(value):
        if value not in memo:
            name = f'trace_part_{len(definitions):05d}'
            memo[value] = name
            definitions.append(f'Definition {name} : isla_trace :=\n{value}.\n')
        return memo[value]

    def render(node):
        if node[0] == 'nil':
            return 'tnil'
        if node[0] == 'cases':
            names = [render(branch) for branch in node[1]]
            return intern('tcases [' + '; '.join(names) + ']')
        _, events, tail = node
        result = render(tail)
        end = len(events)
        while end:
            start = max(0, end - chunk_size)
            result = intern('\n'.join(event + ' :t:' for event in events[start:end]) + '\n' + result)
            end = start
        return result

    root = render(tree)
    text = 'From isla Require Import opsem.\n'
    text += f'Require Import RvvLiterals Simple.rvv.{original}.\n\n'
    text += '\n'.join(definitions)
    text += f'\nDefinition {original}_chunked : isla_trace := {root}.\n'
    text += f'Lemma {original}_chunked_exact : {original}_chunked = {original}.\n'
    text += 'Proof. reflexivity. Qed.\n'
    text += f'Print Assumptions {original}_chunked_exact.\n'
    (ROOT / output).write_text(text)
    print(f'{output}: {len(definitions)} shared trace definitions; exact equality awaits Coq checking')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('address')
    parser.add_argument('output')
    parser.add_argument('--chunk-size', type=int, default=16)
    args = parser.parse_args()
    if args.chunk_size < 1:
        parser.error('chunk size must be positive')
    generate(args.address.removeprefix('0x'), args.output, args.chunk_size)
