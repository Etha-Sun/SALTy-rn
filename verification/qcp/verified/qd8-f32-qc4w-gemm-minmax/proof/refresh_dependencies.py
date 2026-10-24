#!/usr/bin/env python3
"""Record imports of current unsealed Coq sources without copying any objects."""
from pathlib import Path
import subprocess,json,hashlib
T=Path(__file__).resolve().parents[1];p=T/'proof/dependencies.json';D=json.loads(p.read_text());flags=[]
for k,path,ns in D['external_flags']:flags += [k,path,ns]
for ns,path in D['namespaces'].items():flags += ['-Q',str(T/path),ns]
files=sorted(T/f for f in D['source_paths']) if 'source_paths' in D else sorted((T/'proof/coq').rglob('*.v'));r=subprocess.run(['/tmp/qcp-coq820-install/bin/coqdep',*flags,*map(str,files)],capture_output=True,text=True);assert r.returncode==0,r.stderr
new=[]
for line in r.stdout.replace('\\\n',' ').splitlines():
 if ': ' not in line:continue
 target,deps=line.split(': ',1);f=Path(target.split()[0]).with_suffix('.v');ns=next(ns for ns,root in D['namespaces'].items() if f.is_relative_to(T/root));ds=[]
 for dep in deps.split():
  if not dep.endswith('.vo'):continue
  dep=Path(dep).with_suffix('.v');ds.append(str(dep.relative_to(T)) if dep.is_relative_to(T) else str(dep))
 new.append({'path':str(f.relative_to(T)),'namespace':ns,'sha256':hashlib.sha256(f.read_bytes()).hexdigest(),'dependencies':ds})
D['modules']=new;p.write_text(json.dumps(D,indent=2)+'\n');print('Updated actual dependency graph',len(new))
