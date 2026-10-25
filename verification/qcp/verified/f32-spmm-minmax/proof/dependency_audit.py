#!/usr/bin/env python3
"""Check the packaged import closure and reject unresolved dependencies or proof skipping."""
from pathlib import Path
import argparse,json,os,re,subprocess
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);a=p.parse_args();assert re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'dependency-audit';O.mkdir(parents=True,exist_ok=False)
d=json.loads((ROOT/'proof/dependencies.json').read_text());flags=[]
for kind,path,ns in d['external_flags']:flags += [kind,path.replace('/tmp/qcp214-src',os.getenv('QCP_HOME','/tmp/qcp214-src')),ns]
for ns,path in d['namespaces'].items():flags += ['-Q',str(ROOT/path),ns]
files=sorted({ROOT/m['path'] for m in d['modules']})
assert set(d['source_paths'])=={m['path']for m in d['modules']}
assert all(f.is_file() for f in files)
command=[str(Path(os.getenv('QCP_COQC','/tmp/qcp-coq820-install/bin/coqc')).with_name('coqdep')),*flags,*map(str,files)]
env=os.environ.copy();env.pop('COQPATH',None)
r=subprocess.run(command,text=True,capture_output=True,env=env)
(O/'dependencies.txt').write_text(r.stdout);(O/'stderr.txt').write_text(r.stderr)
bad=[]
for f in files:
 s=re.sub(r'\(\*.*?\*\)','',f.read_text(),flags=re.S)
 if re.search(r'\b(?:Admitted|admit|Abort)\b',s):bad.append(str(f.relative_to(ROOT)))
result={'passed':r.returncode==0 and not r.stderr and not bad,'sources':len(files),'exit':r.returncode,'warnings':r.stderr,'proof_skipping':bad,'COQPATH':env.get('COQPATH')}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(result);raise SystemExit(not result['passed'])
