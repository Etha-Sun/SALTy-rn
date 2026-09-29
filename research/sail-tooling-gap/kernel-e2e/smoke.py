#!/usr/bin/env python3
"""Finite executable checks only; these do not establish universal equivalence."""
import hashlib, json, subprocess, sys, time
from pathlib import Path
ROOT=Path(__file__).resolve().parent
OLD=ROOT.parent.parent/'sail-binary-reduction'
VENDOR=OLD/'vendor'
OUT=ROOT/'smoke'
sys.path.insert(0,str(OLD))
from elf_image import parse

def main():
    OUT.mkdir(exist_ok=True)
    report={'status':'in-progress','universal_proof':False,'cases_per_run':135,'runs':[], 'commands':[]}
    def save(): (OUT/'result.json').write_text(json.dumps(report,indent=2)+'\n')
    def run(args,name,expect=0,timeout=180):
        args=list(map(str,args));start=time.monotonic()
        try:
            with (OUT/(name+'.log')).open('w') as log:
                r=subprocess.run(args,stdout=log,stderr=subprocess.STDOUT,timeout=timeout)
        except subprocess.TimeoutExpired:
            report['commands'].append(dict(name=name,command=args,exit_code=None,timeout_seconds=timeout))
            report['status']='timed-out';save();raise
        entry=dict(name=name,command=args,exit_code=r.returncode,seconds=round(time.monotonic()-start,3))
        report['commands'].append(entry)
        (OUT/'result.json').write_text(json.dumps(report,indent=2)+'\n')
        if r.returncode!=expect:
            report['status']='failed';save();raise RuntimeError(f'{name}: exit {r.returncode}; see log')
        return (OUT/(name+'.log')).read_text()
    clang='/usr/bin/clang-14'
    arm=['--target=aarch64-none-elf','-march=armv8-a+simd','-ffreestanding','-O2','-fno-builtin',
         '-fno-stack-protector','-fno-vectorize','-fno-slp-vectorize']
    run([clang,*arm,'-c',ROOT/'smoke.c','-o',OUT/'neon-check.o'],'compile-neon-check')
    run([clang,*arm,'-c',OLD/'start-neon.S','-o',OUT/'neon-start.o'],'compile-neon-start')
    run([VENDOR/'llvm/usr/bin/ld.lld-14','-m','aarch64elf','-static','-e','_start',
         OUT/'neon-start.o',OUT/'neon-check.o',ROOT/'neon-simple.o','-o',OUT/'neon.elf'],'link-neon')
    cc=VENDOR/'xpack-riscv-none-elf-gcc-15.2.0-1/bin/riscv-none-elf-gcc'
    rv=['-march=rv64gcv','-mabi=lp64d','-O1','-mcmodel=medany','-msmall-data-limit=0',
        '-fno-tree-vectorize','-fno-tree-loop-distribute-patterns','-fno-builtin','-fno-stack-protector',
        '-nostdlib','-static','-Wl,--no-relax',f'-Wl,-T,{OLD / "rvv.ld"}']
    run([cc,*rv,OLD/'start-rvv.S',ROOT/'smoke.c',ROOT/'rvv-simple.o','-o',OUT/'rvv.elf'],'link-rvv')
    def kernel_bytes(path,isa):
        image=parse(path.read_bytes(),isa);addr,size,_=image.symbols['sum_u8'];return image.read(addr,size)
    for isa,num in [('neon',183),('rvv',243)]:
        actual=kernel_bytes(OUT/f'{isa}.elf',num)
        assert actual==kernel_bytes(ROOT/f'{isa}-simple.elf',num)
        report[isa+'_kernel_bytes_sha256']=hashlib.sha256(actual).hexdigest()
    run([VENDOR/'qemu/usr/bin/qemu-aarch64-static',OUT/'neon.elf'],'qemu-neon',timeout=60)
    report['runs'].append(dict(isa='NEON',backend='QEMU',passed=True))
    save()
    sail=VENDOR/'sail-riscv-Linux-x86_64'
    for vlen in [128,256,512]:
        output=run([sail/'bin/sail_riscv_sim','--inst-limit','100000000','--config',
                    sail/f'share/sail-riscv/config/rv64d_v{vlen}_e64.json',OUT/'rvv.elf'],f'sail-rvv-{vlen}')
        assert 'SUCCESS' in output
        report['runs'].append(dict(isa='RVV',backend='Sail C++ simulator (separate snapshot)',vlen=vlen,passed=True))
        save()
    report['status']='finite-tests-passed'
    (OUT/'result.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({'cases_per_run':135,'runs':report['runs'],'universal_proof':False}))

if __name__=='__main__':main()
