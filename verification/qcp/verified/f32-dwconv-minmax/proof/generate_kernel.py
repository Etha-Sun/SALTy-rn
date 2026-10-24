#!/usr/bin/env python3
"""Compatibility dispatcher. Each ISA constructor reads live implementation/specs."""
from pathlib import Path
import argparse,subprocess,sys,importlib.util
HERE=Path(__file__).resolve().parent
def render(isa):
 assert isa in ['neon','rvv']
 p=HERE/('generate_'+isa+'.py');s=importlib.util.spec_from_file_location('dwconv_'+isa,p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m.render(isa)
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--timeout',type=int,default=21600);a=p.parse_args();raise SystemExit(subprocess.run([sys.executable,HERE/('generate_'+a.isa+'.py'),'--isa',a.isa,'--timeout',str(a.timeout)]).returncode)
