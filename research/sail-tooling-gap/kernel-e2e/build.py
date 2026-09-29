#!/usr/bin/env python3
"""Reassemble both simplified kernels; optionally rerun all Isla extraction."""
import argparse, subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parent
VENDOR=ROOT.parent.parent/'sail-binary-reduction/vendor'
def run(*args):subprocess.run(list(map(str,args)),check=True)
def main():
    p=argparse.ArgumentParser();p.add_argument('--extract',action='store_true');a=p.parse_args()
    run('/usr/bin/llvm-mc-14','-triple=aarch64','-filetype=obj',ROOT/'neon-simple.S','-o',ROOT/'neon-simple.o')
    run(VENDOR/'llvm/usr/bin/ld.lld-14','-Ttext=0x80001000','--entry=sum_u8',ROOT/'neon-simple.o','-o',ROOT/'neon-simple.elf')
    rv=VENDOR/'xpack-riscv-none-elf-gcc-15.2.0-1/bin'
    run(rv/'riscv-none-elf-as','-march=rv64gcv',ROOT/'rvv-simple.S','-o',ROOT/'rvv-simple.o')
    run(rv/'riscv-none-elf-ld','-m','elf64lriscv','-Ttext=0x800001bc','--entry=sum_u8',ROOT/'rvv-simple.o','-o',ROOT/'rvv-simple.elf')
    if a.extract:
        run('python3',ROOT/'simple.py')
        run('python3',ROOT/'rvv_simple.py')
if __name__=='__main__':main()
