"""Read-only recursive external Coq library identities, from the checked RSUM workflow."""
from pathlib import Path
import hashlib,re
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()

def external_imports(paths,ns):
 result=set()
 for path in paths:
  clean=re.sub(r'\(\*.*?\*\)','',Path(path).read_text(),flags=re.S)
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pre,body=m.groups()
   for word in body.split():
    name=(pre+'.'+word)if pre else word
    if not name.startswith(ns+'.'):result.add(('From '+pre+' 'if pre else '')+'Require Import '+word+'.')
 return sorted(result)


def external_snapshot(run,imports,flags,execute,label):
 # Print Libraries enumerates transitively loaded .vo files, including implicit
 # Prelude imports. Locate Library resolves their real files in these load paths.
 src=run/(label+'.v');src.write_text(''.join((n if n.endswith('.')else 'Require Import '+n+'.')+'\n'for n in imports)+'Print Libraries.\n')
 execute(['coqtop','-batch',*flags,'-l',src],label+'-libraries',7200)
 text=(run/(label+'-libraries.log')).read_text();assert 'Loaded library files:'in text
 names=re.findall(r'^  ([A-Za-z_]\w*(?:\.\w+)*)\s*$',text,re.M);assert names and len(names)==len(set(names))
 loc=run/(label+'-locations.v');loc.write_text(''.join((n if n.endswith('.')else 'Require Import '+n+'.')+'\n'for n in imports)+''.join('Locate Library '+n+'.\n'for n in names))
 execute(['coqtop','-batch',*flags,'-l',loc],label+'-locations',7200)
 text=(run/(label+'-locations.log')).read_text();rows=re.findall(r'([A-Za-z_]\w*(?:\.\w+)*)\s+has\s+been\s+loaded\s+from\s+file\s+(\S+\.vo)',text)
 assert set(n for n,p in rows)==set(names),'Incomplete physical .vo resolution'
 return {n:dict(path=str(Path(p).resolve()),sha256=sha(Path(p)))for n,p in rows}

