#!/usr/bin/env python3
"""Translate the simplified, assembled NEON kernel using the real Sail snapshot."""
import json, re, struct, subprocess, sys
from pathlib import Path
import translate as t

BASE=Path(__file__).resolve().parent
ROOT=BASE/'simple'
t.HERE=ROOT
t.probe.HERE=ROOT

def inventory():
    elf=BASE/'neon-simple.elf'
    data=elf.read_bytes()
    dis=subprocess.check_output(['/usr/bin/llvm-objdump-14','-d',str(elf)],text=True)
    (ROOT/'neon-disasm.log').write_text(dis)
    off=struct.unpack_from('<Q',data,32)[0]
    esz,cnt=struct.unpack_from('<HH',data,54)
    segments=[struct.unpack_from('<IIQQQQQQ',data,off+i*esz) for i in range(cnt)]
    rows=[]
    for line in dis.splitlines():
        m=re.match(r'^\s*([0-9a-f]+):\s+((?:[0-9a-f]{2} ){4})\s*(.*)$',line)
        if not m:continue
        addr=int(m[1],16);raw=bytes.fromhex(m[2])
        assert any(k==1 and flags&1 and va<=addr and addr+4<=va+fs and
                   data[pos+addr-va:pos+addr-va+4]==raw
                   for k,flags,pos,va,pa,fs,ms,al in segments)
        rows.append(dict(isa='neon',address=hex(addr),bytes=raw.hex(),
                         opcode=hex(int.from_bytes(raw,'little')),asm=m[3]))
    assert len(rows)==20
    (ROOT/'results/inventory.json').write_text(json.dumps(dict(
        elf_sha256=t.probe.sha(elf),assembly_sha256=t.probe.sha(BASE/'neon-simple.S'),
        instructions=rows),indent=2)+'\n')
    return rows

def profile(row):
    a=int(row['address'],16);cons=[]
    if a==0x8000100c:
        cons=['bvuge R1 0x0000000080000000','bvule R1 0x0000000083fffff0',
              '= (bvand R1 0x000000000000000f) 0x0000000000000000']
    if a==0x80001030:
        cons=['bvuge R1 0x0000000080000000','bvule R1 0x0000000083ffffff']
    if a in [0x80001040,0x80001048]:
        cons=['bvuge R2 0x0000000080000000','bvule R2 0x0000000083fffffc',
              '= (bvand R2 0x0000000000000003) 0x0000000000000000']
    return 'neon-aligned',cons

def main():
    ROOT.mkdir(exist_ok=True)
    t.setup()
    # Wrapper paths are absolute because this run has its own isolated output.
    wrapper=(t.AUDIT/'bin/isla-footprint').read_text()
    wrapper=wrapper.replace('$here/../vendor/',str(t.STUDY/'vendor')+'/')
    (ROOT/'bin/isla-footprint').write_text(wrapper)
    (ROOT/'configs/neon-aligned.toml').write_text((t.AUDIT/'configs/arm.toml').read_text())
    t.profile=profile
    rows=inventory();failed=[]
    for row in rows:
        address=row['address'][2:]
        done=ROOT/'results'/f'import-neon-{address}.json'
        if '--resume' in sys.argv and done.exists() and json.loads(done.read_text()).get('exit_code')==0:
            continue
        if not t.extract(row,300):failed.append(row['address'])
    result=t.build_map('neon',rows)
    print(json.dumps(dict(failed=failed,map=result)),flush=True)
    return int(bool(failed))

if __name__=='__main__':raise SystemExit(main())
