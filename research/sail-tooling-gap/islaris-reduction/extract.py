#!/usr/bin/env python3
"""Run the unmodified Islaris frontend on two opcodes from the original ELF."""
import hashlib
import json
import os
import shutil
import struct
import subprocess
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
STUDY = HERE.parent
ISLARIS = STUDY/'vendor/islaris-main'
ELF = STUDY.parent/'sail-binary-reduction/artifacts/rvv.elf'
SNAPSHOT_HASH = 'c3f29aeb4e04659f632a151dbd6d3ae8ca7e9d74a17b32a40bf2a627a357eeed'

def elf_bytes(data, address, size):
    assert data[:6] == b'\x7fELF\x02\x01', 'Expected little-endian ELF64'
    phoff = struct.unpack_from('<Q', data, 32)[0]
    entsize, count = struct.unpack_from('<HH', data, 54)
    for i in range(count):
        kind, flags, off, va, pa, filesz, memsz, align = struct.unpack_from('<IIQQQQQQ', data, phoff+i*entsize)
        if kind == 1 and flags & 1 and va <= address and address+size <= va+filesz:
            return data[off+address-va:off+address-va+size]
    raise ValueError('Opcode address absent from executable segment')

def main():
    snapshot = STUDY/'vendor/riscv64.ir'
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == SNAPSHOT_HASH
    data = ELF.read_bytes()
    checks = [(0x800001ea, 0x0280a457), (0x800001c6, 0x093577d7)]
    for address, word in checks:
        assert elf_bytes(data, address, 4) == struct.pack('<I', word)
    configdir = ISLARIS/'_build/install/default/etc/islaris'
    configdir.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(HERE/'rvv-legacy.toml', configdir/'reduction-demo.toml')
    env = os.environ.copy()
    env['PATH'] = str(HERE/'bin')+os.pathsep+env['PATH']
    records = []
    for name, target in [('reduce','generated'), ('vset','generated-vset')]:
        command = [str(ISLARIS/'_build/default/frontend/main.exe'), '-d', '-a', 'riscv64', '-s',
                   '-o', str(HERE/target), str(HERE/(name+'.dump'))]
        start = time.monotonic()
        with (HERE/'logs'/(name+'-extract.log')).open('w') as log:
            p = subprocess.run(command, env=env, cwd=HERE, stdout=log, stderr=subprocess.STDOUT, timeout=120)
        records.append(dict(name=name, exit_code=p.returncode, seconds=round(time.monotonic()-start,3)))
        if p.returncode:
            break
    report = dict(elf_sha256=hashlib.sha256(data).hexdigest(), snapshot_sha256=SNAPSHOT_HASH,
                  opcodes=[dict(address=hex(a), word=hex(w)) for a,w in checks], extraction=records,
                  program_correctness_proved=False)
    (HERE/'results/extraction.json').write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))
    raise SystemExit(0 if all(r['exit_code']==0 for r in records) else 1)

if __name__ == '__main__':
    main()
