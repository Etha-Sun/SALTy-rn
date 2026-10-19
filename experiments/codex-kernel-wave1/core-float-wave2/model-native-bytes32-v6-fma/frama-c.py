#!/usr/bin/env python3
"""Isolated FMA-driver composition; native Bytes32 semantics inherited unchanged."""
from pathlib import Path
import json,hashlib,os,sys
here=Path(__file__).resolve().parent
root=here.parents[3]
lock=json.loads((here/'float_model_lock.json').read_text())
for name,digest in lock['files'].items():
 p=Path(name) if Path(name).is_absolute() else root/name
 if hashlib.sha256(p.read_bytes()).hexdigest()!=digest:raise SystemExit('Composed model changed: '+name)
base=here.parent.parent/'float-bits/model-native-bytes32-v6-no-pointer-range/frama-c.py'
driver=root/'experiments/shim-c-v2/model-fma/fma.driver'
os.execv(str(base),[str(base),*sys.argv[1:],'-wp-driver',str(driver)])
