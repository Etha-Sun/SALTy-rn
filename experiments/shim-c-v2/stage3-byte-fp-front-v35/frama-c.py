#!/usr/bin/env python3
"""Isolated WP frontend with pinned IEEE/FMA share and libc contracts."""
from pathlib import Path
import os,sys,json,hashlib
here=Path(__file__).resolve().parent
root=here.parents[2]
lockfile=here/'float_model_lock.json'
if lockfile.exists():
    for name,digest in json.loads(lockfile.read_text())['files'].items():
        path=Path(name) if Path(name).is_absolute() else root/name
        if hashlib.sha256(path.read_bytes()).hexdigest()!=digest:
            raise SystemExit('Model input changed: '+name)
install=here.parent/'stage3-byte-fp-front-v35/.build/install'
args,drivers=['-warn-special-float','none'],[str(here/'bytefloat.driver'),str(here.parent/'model-fma/fma.driver')]
i=1
while i<len(sys.argv):
    if sys.argv[i]=='-wp-driver':drivers.extend(sys.argv[i+1].split(','));i+=2
    else:args.append(sys.argv[i]);i+=1
command=[str(install/'bin/frama-c'),*args,'-cpp-command',
         'gcc -E -C -I'+str(here.parent/'model-plus/libc')+' -I.',
         '-cpp-frama-c-compliant','-wp-driver',','.join(drivers)]
env=dict(os.environ);env['OCAMLPATH']=str(install/'lib')
print('# Patched WP underlying invocation: '+json.dumps(command),flush=True)
os.execve(command[0],command,env)
