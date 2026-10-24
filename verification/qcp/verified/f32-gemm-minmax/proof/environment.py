#!/usr/bin/env python3
"""Inventory installed external proof inputs; not a claim of rebuilding them."""
from pathlib import Path
import argparse,hashlib,json,subprocess,datetime
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);a=p.parse_args();O=ROOT/'.build'/a.run/'environment';O.mkdir(parents=True,exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d=json.loads((ROOT/'proof/dependencies.json').read_text());paths=set()
for _,path,_ in d['external_flags']:
 paths.update(p for p in Path(path).rglob('*') if p.is_file() and p.suffix in ('.v','.vo','.cmxs'))
lib=Path('/tmp/qcp-coq820-install/lib/coq');paths.update(p for p in lib.rglob('*') if p.is_file() and p.suffix in ('.v','.vo','.cmxs'))
records=[{'path':str(p),'sha256':sha(p),'bytes':p.stat().st_size} for p in sorted(paths)]
binaries=[Path('/tmp/qcp214-src/linux-binary/symexec'),Path('/tmp/qcp-coq820-install/bin/coqc'),Path('/tmp/qcp-coq820-install/bin/coqdep')]
r={'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Installed external QCP/Coq/Flocq input inventory (superset of imports), not a fresh rebuild of external tools','coqc_version':subprocess.check_output([str(binaries[1]),'--version'],text=True).strip(),'gcc_version':subprocess.check_output(['gcc','-dumpfullversion'],text=True).strip(),'binaries':[{'path':str(p),'sha256':sha(p)} for p in binaries],'external_files':records};(O/'result.json').write_text(json.dumps(r,indent=2)+'\n');print('external files',len(records),'bytes',sum(x['bytes'] for x in records))
