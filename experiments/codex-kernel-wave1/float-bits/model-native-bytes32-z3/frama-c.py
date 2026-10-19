#!/usr/bin/env python3
"""Pinned experimental byte-memory/native-IEEE32 codec; not yet qualified."""
from pathlib import Path
import hashlib,json,os,sys
here=Path(__file__).resolve().parent
root=here.parents[3]
lock=json.loads((here/'float_model_lock.json').read_text())
for name,digest in lock['files'].items():
 path=Path(name) if Path(name).is_absolute() else root/name
 if hashlib.sha256(path.read_bytes()).hexdigest()!=digest:
  raise SystemExit('Experimental model input changed: '+name)
args=sys.argv[1:]
if args.count('-wp-model')>1:raise SystemExit('Exactly one memory model must be selected')
if '-wp-model' in args:
 if args[args.index('-wp-model')+1]!='Bytes':raise SystemExit('Experimental codec qualified only for Bytes')
else:args+=['-wp-model','Bytes']
if '-wp-share' in args:
 if Path(args[args.index('-wp-share')+1]).resolve()!=here.parent/'model-native-bytes32/wp-share':raise SystemExit('Wrong share')
else:args+=['-wp-share',str(here.parent/'model-native-bytes32/wp-share')]
if '-wp-why3-config' not in args:args+=['-wp-why3-config',str(here/'why3.conf'),'-wp-no-why3-detect']
args += ['-wp-driver',str(here/'acsl-bits.driver')]
install=here.parent/'model-native-bytes32/.build/install'
cmd=[str(install/'bin/frama-c'),*args,'-cpp-command','gcc -E -C -I'+str(here.parent/'model-native-bytes32/libc')+' -I.','-cpp-frama-c-compliant']
env=dict(os.environ,OCAMLPATH=str(install/'lib'))
print('# Experimental native32 byte invocation: '+json.dumps(cmd),flush=True)
os.execve(cmd[0],cmd,env)
