#!/usr/bin/env python3
"""Replay the actual C identity bridge, its generated VCs, and native controls."""
import ctypes
import hashlib
import json
import random
import re
import shutil
import struct
import subprocess
import tempfile
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parents[1] / 'tools'))
from environment import load_environment
ENV = load_environment()



def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def execute(command, *, cwd=None, log):
    result = subprocess.run(command, cwd=cwd, capture_output=True, text=True, timeout=90)
    log.write_text(result.stdout + result.stderr)
    record = {'command': command, 'exit_code': result.returncode, 'log': str(log.relative_to(HERE)),
              'log_sha256': sha(log)}
    if result.returncode:
        raise RuntimeError(json.dumps(record) + '\n' + result.stderr[-2000:])
    return record


def main():
    build = HERE / '.build'
    build.mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='replay-', dir=build))
    config = ENV
    records = []
    records.append(execute([ENV['qcp'], '--arch=64', '--endian=little', '--no-float-finite-vc',
        '--input-file=' + str(HERE / 'bridge.c'), '--coq-output-dir=' + str(run),
        '--coq-logic-path=NanBridge', '--no-exec-info'], log=run / 'qcp.log'))
    fresh = run / 'bridge_goal.v'
    if fresh.read_bytes() != (HERE / 'bridge_goal.v').read_bytes():
        raise RuntimeError('Generated VC changed; review the checked proof before accepting it.')
    if '“ False ”' in fresh.read_text():
        raise RuntimeError('The identity bridge unexpectedly generated the NaN pruning VC.')
    for name in ['BridgeLogic.v', 'ListBridge.v', 'bridge_goal.v', 'bridge_checked.v']:
        source = HERE / name
        if name != 'bridge_goal.v' and re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b', source.read_text()):
            raise RuntimeError('Unchecked declaration in ' + name)
        cmd = [ENV['coqc'], *config['flags'], '-Q', str(HERE), 'NanBridge', str(source)]
        records.append(execute(cmd, cwd=config['cwd'], log=run / (source.stem + '-coqc.log')))
    native = run / 'native.c'
    native.write_text((HERE / 'bridge.c').read_text() + '''
int original_native(float x, float y) {
  return x == y || (x != x && y != y);
}
''')
    library = run / 'bridge.so'
    records.append(execute(['gcc', '-std=c11', '-O0', '-fno-fast-math', '-shared', '-fPIC',
                            str(native), '-o', str(library)], log=run / 'native-build.log'))
    dll = ctypes.CDLL(str(library))
    original, bridged = dll.original_native, dll.same_lane
    for function in [original, bridged]:
        function.argtypes = [ctypes.c_float, ctypes.c_float]
        function.restype = ctypes.c_int
    special = [0x00000000, 0x80000000, 0x3F800000, 0xBF800000, 0x7F800000, 0xFF800000,
               0x7FC00000, 0x7FA00001, 0xFFC00000, 0x00000001, 0x007FFFFF, 0x7F7FFFFF]
    bits = lambda n: struct.unpack('<f', struct.pack('<I', n))[0]
    pairs = [(bits(a), bits(b)) for a in special for b in special]
    rng = random.Random(20261022)
    pairs.extend((bits(rng.getrandbits(32)), bits(rng.getrandbits(32))) for _ in range(4096))
    pairs.extend((bits(a), bits(a)) for a in [rng.getrandbits(32) for _ in range(1024)])
    for x, y in pairs:
        if original(x, y) != bridged(x, y):
            raise RuntimeError('Native observation mismatch')
    mutant = run / 'mutant.c'
    mutant.write_text(native.read_text().replace('{ return x; }', '{ return 0.0f; }', 1))
    mutant_so = run / 'mutant.so'
    records.append(execute(['gcc', '-std=c11', '-O0', '-fno-fast-math', '-shared', '-fPIC',
                            str(mutant), '-o', str(mutant_so)], log=run / 'mutant-build.log'))
    mutant_function = ctypes.CDLL(str(mutant_so)).same_lane
    mutant_function.argtypes = [ctypes.c_float, ctypes.c_float]
    mutant_function.restype = ctypes.c_int
    mutation_detected = mutant_function(1.0, 2.0) != original(1.0, 2.0)
    if not mutation_detected:
        raise RuntimeError('Broken identity mutation escaped the unequal-value control')
    logs = HERE / 'logs'
    logs.mkdir(exist_ok=True)
    for record in records:
        source_log = HERE / record['log']
        target_log = logs / source_log.name
        shutil.copyfile(source_log, target_log)
        record['log'] = str(target_log.relative_to(HERE))
    binary = Path(ENV['qcp']).resolve()
    status = {'passed': True, 'actual_c_bodies_checked': ['preserve_float', 'check_observation', 'same_lane'],
        'canonical_vcs': 14, 'fresh_generated_goal_matches': True,
        'source_sha256': {name: sha(HERE / name) for name in ['bridge.c', 'BridgeLogic.v', 'ListBridge.v',
                                                           'bridge_goal.v', 'bridge_checked.v']},
        'native': {'pairs': len(pairs), 'comparisons_matched': True, 'broken_identity_detected': mutation_detected},
        'commands': records,
        'qcp_binary': {'path': str(binary), 'sha256': sha(binary),
                       'launcher': 'explicit QCP_HOME binary; no wrapper flags'},
        'upstream_reference': 'https://github.com/QinxiangCao/QualifiedCProgramming',
        'scope': 'The C checker proof assumes same_value(x,y); the copy-rewrite observation theorem holds for arbitrary x,y.',
        'assumptions': 'Pure bridge lemmas and return VCs are closed. Safety/stack VCs retain QCP eval_addr_expr and standard function extensionality.',
        'limits': ['This does not prove vadd kernel bodies or the complete public equivalent loop.',
                   'Source rewrite preserves the value observation; floating-point exception flags are outside the original observation.']}
    (HERE / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    print(json.dumps({'passed': True, 'canonical_vcs': 14, 'native_pairs': len(pairs),
                      'status': str(HERE / 'status.json')}, ensure_ascii=False))


if __name__ == '__main__':
    main()
