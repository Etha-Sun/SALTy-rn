#!/usr/bin/env python3
"""Extract real kernel opcodes; keep extraction/import/proof status distinct."""
import argparse, hashlib, json, os, re, signal, struct, subprocess, time
from pathlib import Path

HERE = Path(__file__).resolve().parent
STUDY = HERE.parent
UP = STUDY/'vendor/islaris-main'
OLD = STUDY/'islaris-reduction'
ART = STUDY.parent/'sail-binary-reduction/artifacts'
ENV = OLD/'env-exec.sh'

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

def run(name, command, timeout=180, env=None):
    start=time.monotonic()
    inputs={str(arg):sha(Path(arg)) for arg in command
            if str(arg).endswith(('.v','.isla','.toml')) and Path(arg).is_file()}
    with (HERE/'logs'/f'{name}.log').open('w') as out:
        p=subprocess.Popen(list(map(str,command)),cwd=HERE,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
        samples=HERE/'logs'/f'{name}.resources.jsonl'
        with samples.open('w') as monitor:
            while True:
                try: code=p.wait(timeout=min(30,max(0.1,timeout-(time.monotonic()-start))));break
                except subprocess.TimeoutExpired:
                    elapsed=time.monotonic()-start
                    processes=[]
                    for entry in Path('/proc').glob('[0-9]*'):
                        try:
                            pid=int(entry.name)
                            if os.getpgid(pid)!=p.pid:continue
                            stat=(entry/'stat').read_text().rsplit(')',1)[1].split()
                            processes.append(dict(pid=pid,comm=(entry/'comm').read_text().strip(),state=stat[0],
                                                  cpu_seconds=(int(stat[11])+int(stat[12]))/os.sysconf('SC_CLK_TCK'),
                                                  rss_mb=int(stat[21])*os.sysconf('SC_PAGE_SIZE')/1048576))
                        except (OSError,ValueError,IndexError):pass
                    sample=dict(seconds=round(elapsed,1),processes=processes)
                    monitor.write(json.dumps(sample)+'\n');monitor.flush()
                    print(json.dumps(dict(name=name,progress=sample)),flush=True)
                    if elapsed>=timeout:
                        os.killpg(p.pid,signal.SIGKILL);p.wait();code=None;break
    r=dict(name=name,command=list(map(str,command)),exit_code=code,seconds=round(time.monotonic()-start,3),input_sha256=inputs)
    (HERE/'results'/f'{name}.json').write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps(r),flush=True)
    return r

def inventory():
    allrows=[]
    for isa in ['neon','rvv']:
        metadata=json.loads((ART/('NeonBinary.json' if isa=='neon' else 'RvvBinary.json')).read_text())
        elf=ART/f'{isa}.elf'
        assert sha(elf)==metadata['elf_sha256']
        data=elf.read_bytes();off=struct.unpack_from('<Q',data,32)[0];esz,cnt=struct.unpack_from('<HH',data,54)
        base=metadata['kernel_address'];size=metadata['kernel_size'];raw=bytes.fromhex(metadata['kernel_bytes'])
        matched=False
        for i in range(cnt):
            kind,flags,pos,va,pa,fs,ms,align=struct.unpack_from('<IIQQQQQQ',data,off+i*esz)
            if kind==1 and flags&1 and va<=base and base+size<=va+fs:
                assert data[pos+base-va:pos+base-va+size]==raw;matched=True
        assert matched
        rows=[]
        for line in (ART/f'{isa}-disasm.log').read_text().splitlines():
            m=re.match(r'^\s*([0-9a-f]+):\s+([0-9a-f ]+)\s*\t\s*(\S+)\s*(.*)$',line)
            if not m:continue
            addr=int(m[1],16)
            if not base<=addr<base+size:continue
            hx=m[2].strip()
            b=bytes.fromhex(hx) if isa=='neon' else bytes.fromhex(hx)[::-1]
            assert raw[addr-base:addr-base+len(b)]==b,(isa,line)
            rows.append(dict(isa=isa,address=hex(addr),bytes=b.hex(),opcode=hex(int.from_bytes(b,'little')),asm=(m[3]+' '+m[4]).strip(),stage='not_attempted'))
        assert sum(len(bytes.fromhex(r['bytes'])) for r in rows)==size
        (HERE/f'{isa}-kernel.dump').write_text('\n'.join(f"{r['address'][2:]}: {int(r['opcode'],16):0{len(r['bytes'])}x}  {r['asm']}" for r in rows)+'\n')
        allrows.extend(rows)
    (HERE/'results/inventory.json').write_text(json.dumps(allrows,indent=2)+'\n')
    return allrows

def configure():
    for d in ['logs','results','bin','generated','configs','dumps']: (HERE/d).mkdir(exist_ok=True)
    arm=(UP/'etc/aarch64_isla_coq.toml').read_text()
    # Numeric opcodes bypass assembly; these real installed tools satisfy
    # configuration validation (no instruction is reassembled here).
    for old,new in {'aarch64-linux-gnu-as -march=armv8.1-a':'/usr/bin/llvm-mc-14',
                    'aarch64-linux-gnu-objdump':'/usr/bin/llvm-objdump-14',
                    'aarch64-linux-gnu-nm':'/usr/bin/llvm-nm-14',
                    'aarch64-linux-gnu-ld':str(ART.parent/'vendor/llvm/usr/bin/ld.lld-14')}.items():
        arm=arm.replace(old,new)
    arm=arm.replace('[registers.reset]', '"CPACR_EL1" = "0x00300000"\n"CPTR_EL2" = "0x00000000"\n"CPTR_EL3" = "0x00000000"\n\n[registers.reset]')
    (HERE/'configs/arm.toml').write_text(arm)
    (HERE/'configs/arm-unaligned.toml').write_text(arm.replace('"SCTLR_EL2" = "0x0000000004000002"','"SCTLR_EL2" = "0x0000000004000000"'))
    rv=(OLD/'rvv-legacy.toml').read_text().replace('vl = "0x0000000000000040"','vl = "0x0000000000000010"').replace('vtype = "{ bits = 0x00000000000000d3 }"','vtype = "{ bits = 0x0000000000000093 }"')
    (HERE/'configs/rvv16.toml').write_text(rv)
    (HERE/'configs/rvv-allvl.toml').write_text(rv.replace('vl = "0x0000000000000010"\n',''))
    (HERE/'configs/rvv16-load-fixed.toml').write_text(rv.replace('[registers.defaults]', '[registers.defaults]\nx11 = "0x0000000080010000"'))
    # In this historical IR these platform getters are ordinary Sail
    # functions reading registers, not external primops. const_primops alone
    # does not initialize them when --no-model-reg-init is used.
    platform='''
x11 = "0x0000000080010000"
rv_pmp_count = "0 : %i64"
rv_ram_base = "0x0000000080000000"
rv_ram_size = "0x0000000004000000"
rv_rom_base = "0x0000000000001000"
rv_rom_size = "0x0000000000000100"
rv_clint_base = "0x0000000002000000"
rv_clint_size = "0x00000000000c0000"
rv_htif_tohost = "0x0000000040001000"
rv_enable_misaligned_access = false
rv_enable_dirty_update = false
'''
    (HERE/'configs/rvv16-load-platform.toml').write_text(rv.replace('[registers.defaults]', '[registers.defaults]\n'+platform))
    (HERE/'configs/rvv16-load-symbolic.toml').write_text(rv.replace('[registers.defaults]', '[registers.defaults]\n'+platform.replace('x11 = "0x0000000080010000"\n','')))
    wrapper='''#!/usr/bin/env bash
set -euo pipefail
here=$(cd "$(dirname "$0")/.." && pwd)
case "$1" in
 aarch64.ir) snapshot="$here/../vendor/islaris-pinned-aarch64.ir" ;;
 riscv64.ir) snapshot="$here/../vendor/riscv64.ir" ;;
 *) exit 2 ;;
esac
shift
exec "$here/../vendor/isla-master/target/release/isla-footprint" -A "$snapshot" --no-model-reg-init --executable "$@"
'''
    (HERE/'bin/isla-footprint').write_text(wrapper);(HERE/'bin/isla-footprint').chmod(0o755)

def extract(name,row,extra='',timeout=180):
    arch='aarch64' if row['isa']=='neon' else 'riscv64'
    config=(HERE/'configs'/('arm.toml' if arch=='aarch64' else 'rvv16.toml')).resolve()
    if name=='rvv_load_fixed': config=HERE/'configs/rvv16-load-fixed.toml'
    if name=='rvv_load_platform': config=HERE/'configs/rvv16-load-platform.toml'
    if name=='rvv_load_symbolic':
        config=HERE/'configs/rvv16-load-symbolic.toml'
        extra+='//@constraint: bvuge x11 0x0000000080000000\n//@constraint: bvule x11 0x0000000083fffff0\n'
    if name in {'rvv_add_allvl','rvv_widen_allvl'}:
        config=HERE/'configs/rvv-allvl.toml'
        extra+='//@constraint: bvule vl 0x0000000000000040\n'
    if name=='neon_load_ram':
        extra+='//@constraint: bvuge R1 0x0000000080000000\n//@constraint: bvule R1 0x0000000083fffff0\n//@constraint: = (bvand R1 0x000000000000000f) 0x0000000000000000\n'
    if name=='neon_load_unaligned':
        config=HERE/'configs/arm-unaligned.toml'
        extra+='//@constraint: bvuge R1 0x0000000080000000\n//@constraint: bvule R1 0x0000000083fffff0\n'
    # The frontend always prefixes its installed etc directory, including
    # when the directive begins with '/'; use an explicit relative path.
    config=os.path.relpath(config, UP/'_build/install/default/etc/islaris')
    dump=HERE/'dumps'/f'{name}.dump'
    dump.write_text(f'//@isla-config: {config}\n'+extra+f"{row['address'][2:]}: {int(row['opcode'],16):0{len(row['bytes'])}x}  {row['asm']}\n")
    env=os.environ.copy();env['PATH']=str(HERE/'bin')+os.pathsep+env['PATH']
    return run('extract-'+name,[UP/'_build/default/frontend/main.exe','-d','-a',arch,'-s','--coqdir=Bridge.'+name,'-o',HERE/'generated'/name,dump],env=env,timeout=timeout)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('names',nargs='*');p.add_argument('--timeout',type=int,default=180);args=p.parse_args()
    configure();rows=inventory()
    picks={'neon_uadalp8':0x2105bc,'neon_uadalp16':0x2105c4,'neon_addv':0x2105dc,
           'neon_load':0x210604,'neon_mul':0x210630,'rvv_load':0x800001ca,
           'rvv_widen':0x800001d2,'rvv_add':0x800001d6,'rvv_load_fixed':0x800001ca,
           'rvv_load_platform':0x800001ca,'rvv_load_symbolic':0x800001ca,
           'rvv_add_allvl':0x800001d6,'rvv_widen_allvl':0x800001d2,'neon_load_ram':0x210604,
           'neon_load_unaligned':0x210604}
    for name in args.names:
        row=next(r for r in rows if int(r['address'],16)==picks[name])
        extract(name,row,timeout=args.timeout)
