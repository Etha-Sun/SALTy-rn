"""Audit-only wrapper: save the exact emitted SMT input, then exec the solver."""
import hashlib,os,sys
from pathlib import Path
out=Path(sys.argv[1]);out.mkdir(parents=True,exist_ok=True)
args=sys.argv[2:]
for a in args:
 p=Path(a)
 if p.is_file() and p.suffix in {'.smt2','.smt'}:
  b=p.read_bytes();(out/(hashlib.sha256(b).hexdigest()+'.smt2')).write_bytes(b)
os.execv(args[0],args)
