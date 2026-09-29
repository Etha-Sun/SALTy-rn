#!/usr/bin/env python3
"""LMUL=1 kernel, symbolic VL in 0..8, arbitrary loop iteration count."""
import json, re, struct, subprocess, sys
from pathlib import Path
import translate as t
BASE=Path(__file__).resolve().parent
ROOT=BASE/'simple'
t.HERE=ROOT;t.probe.HERE=ROOT;t.NAMESPACE='Simple'
original_profile=t.profile

def profile(row):
    cfg,cons=original_profile(row)
    cons=[c.replace('0000000000000093','0000000000000090')
           .replace('00000000000000d3','00000000000000d0')
           .replace('0000000000000040','0000000000000008')
           .replace('0000000083ffffc0','0000000083fffff8') for c in cons]
    return cfg,cons

def main():
    ROOT.mkdir(exist_ok=True);t.setup();t.profile=profile
    wrapper=(t.AUDIT/'bin/isla-footprint').read_text().replace('$here/../vendor/',str(t.STUDY/'vendor')+'/')
    (ROOT/'bin/isla-footprint').write_text(wrapper)
    for p in (ROOT/'configs').glob('rvv-*.toml'):
        p.write_text(p.read_text().replace('0000000000000093','0000000000000090')
            .replace('00000000000000d3','00000000000000d0')
            .replace('vl = "0x0000000000000040"','vl = "0x0000000000000008"'))
    elf=BASE/'rvv-simple.elf';data=elf.read_bytes()
    tool=t.ART.parent/'vendor/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-objdump' if hasattr(t,'ART') else t.probe.ART.parent/'vendor/xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-objdump'
    dis=subprocess.check_output([str(tool),'-d',str(elf)],text=True)
    (ROOT/'rvv-disasm.log').write_text(dis)
    off=struct.unpack_from('<Q',data,32)[0];esz,cnt=struct.unpack_from('<HH',data,54)
    segments=[struct.unpack_from('<IIQQQQQQ',data,off+i*esz) for i in range(cnt)]
    rows=[]
    for line in dis.splitlines():
        m=re.match(r'^\s*([0-9a-f]+):\s+([0-9a-f]+)\s+(.+)$',line)
        if not m:continue
        addr=int(m[1],16);raw=bytes.fromhex(m[2])[::-1]
        assert any(k==1 and flags&1 and va<=addr and addr+len(raw)<=va+fs and
                   data[pos+addr-va:pos+addr-va+len(raw)]==raw
                   for k,flags,pos,va,pa,fs,ms,al in segments)
        rows.append(dict(isa='rvv',address=hex(addr),bytes=raw.hex(),opcode=hex(int(m[2],16)),asm=m[3]))
    assert len(rows)==19
    (ROOT/'results/inventory-rvv.json').write_text(json.dumps(dict(elf_sha256=t.probe.sha(elf),
        assembly_sha256=t.probe.sha(BASE/'rvv-simple.S'),instructions=rows),indent=2)+'\n')
    failed=[]
    for row in rows:
        if not t.extract(row,600):failed.append(row['address'])
    result=t.build_map('rvv',rows)
    print(json.dumps(dict(failed=failed,map=result)),flush=True)
    return int(bool(failed))
if __name__=='__main__':raise SystemExit(main())
