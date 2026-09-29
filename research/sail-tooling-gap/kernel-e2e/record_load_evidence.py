#!/usr/bin/env python3
"""Attach frozen Coq Load sources to an already successful compiler record."""
import argparse,hashlib,json,re
from pathlib import Path
ROOT=Path(__file__).resolve().parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
p=argparse.ArgumentParser();p.add_argument('module');a=p.parse_args()
source=ROOT/(a.module+'.v');record=ROOT/'results'/('proof-'+a.module+'.json')
r=json.loads(record.read_text())
assert r['exit_code']==0, 'Only successful compiler runs can acquire checked evidence'
assert r['input_sha256'][str(source)]==sha(source), 'Root source changed'
loaded={}
def visit(src):
 for name in re.findall(r'\bLoad\s+"([^"]+)"',src.read_text()):
  path=Path(name if name.endswith('.v') else name+'.v')
  if not path.is_absolute():path=src.parent/path
  path=path.resolve()
  assert path.is_file(), f'Unfrozen or missing Load source: {path}'
  if str(path) in loaded:continue
  loaded[str(path)]=sha(path);visit(path)
visit(source)
r['loaded_source_sha256']=loaded
r['object_sha256']=sha(source.with_suffix('.vo'))
record.write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'module':a.module,'loaded_files':len(loaded),'object_sha256':r['object_sha256']}))
