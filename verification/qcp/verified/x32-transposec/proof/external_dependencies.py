# Source pattern f32-maxpool/external_dependencies.py SHA256 bd7504ee98e578585cc6a87adaab73d47e98ebbd8559f6eb1133e8f368bd2b41. Re-executed here; no transferred proof credit.
# Readonly method copy from published f32-vsqrt; original SHA256 c3130d51abd37dc12442ad622fff391951319850572fcda40f1833e64af34200. No proof credit transferred.
"""Resolve every loaded external Coq object; fresh case/BASE modules stay local."""
from pathlib import Path
import hashlib,re
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()

def external_imports(paths,fresh_names):
 fresh_names=set(fresh_names);result=set()
 for path in paths:
  clean=re.sub(r'\(\*.*?\*\)','',Path(path).read_text(),flags=re.S)
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pre,body=m.groups()
   for word in body.split():
    name=(pre+'.'+word)if pre else word
    if name in fresh_names:continue
    assert not any(n.endswith('.'+name)for n in fresh_names),'Unqualified fresh-module import requires explicit resolution: '+name
    result.add(('From '+pre+' 'if pre else '')+'Require Import '+word+'.')
 return sorted(result)

def source(imports,tail):
 return ''.join((n if n.endswith('.')else'Require Import '+n+'.')+'\n'for n in imports)+tail

def parse_libraries(text):
 assert 'Loaded library files:'in text
 names=re.findall(r'^  ([A-Za-z_]\w*(?:\.\w+)*)\s*$',text,re.M)
 assert names and len(names)==len(set(names))
 return names

def parse_locations(text,names):
 rows=re.findall(r'([A-Za-z_]\w*(?:\.\w+)*)\s+has\s+been\s+loaded\s+from\s+file\s+(\S+\.vo)',text)
 assert len(rows)==len(set(n for n,p in rows))and set(n for n,p in rows)==set(names),'Incomplete/duplicate physical .vo resolution'
 return {n:dict(path=str(Path(p).resolve()),sha256=sha(p))for n,p in rows}

def external_snapshot(run,imports,flags,execute,label):
 run=Path(run);src=run/(label+'.v');src.write_text(source(imports,'Print Libraries.\n'))
 execute(['coqtop','-batch',*flags,'-l',src],label+'-libraries',7200)
 names=parse_libraries((run/(label+'-libraries.log')).read_text())
 loc=run/(label+'-locations.v');loc.write_text(source(imports,''.join('Locate Library '+n+'.\n'for n in names)))
 execute(['coqtop','-batch',*flags,'-l',loc],label+'-locations',7200)
 return parse_locations((run/(label+'-locations.log')).read_text(),names)

def validate_external(case,run,full,require):
 """Reconstruct library-audit sources and bindings; do not replay any proof."""
 case,run=Path(case),Path(run);historical=Path(full['run_directory']);fresh={};prefixes=set()
 for name in full['compiled_source_sha256']:
  ns,stem=name.rsplit('.',1);logical=(ns+'.'if ns else'')+stem
  require(logical not in fresh,'Duplicate logical fresh module')
  fresh[logical]=Path('coq')/(ns.replace('.','/')if ns else'relations')/(stem+'.v')
  if ns:prefixes.add(ns)
 imports=external_imports([run/p for p in fresh.values()],set(fresh));loaded={}
 for label,requirements in [('external-before',imports),('external-after',sorted(fresh))]:
  require((run/(label+'.v')).read_text()==source(requirements,'Print Libraries.\n'),'Library inventory command source differs')
  names=parse_libraries((run/(label+'-libraries.log')).read_text())
  require((run/(label+'-locations.v')).read_text()==source(requirements,''.join('Locate Library '+n+'.\n'for n in names)),'Library location command source differs')
  text=(run/(label+'-locations.log')).read_text()
  rows=re.findall(r'([A-Za-z_]\w*(?:\.\w+)*)\s+has\s+been\s+loaded\s+from\s+file\s+(\S+\.vo)',text)
  require(len(rows)==len(set(n for n,p in rows))and set(n for n,p in rows)==set(names),'Loaded library locations incomplete')
  result={}
  for n,p in rows:
   physical=Path(p).resolve()
   if n in fresh:
    require(label=='external-after','Fresh project object loaded before compilation')
    require(physical==(historical/fresh[n]).with_suffix('.vo').resolve(),'Fresh logical module resolved outside fresh source tree')
    actual=(run/fresh[n]).with_suffix('.vo')
   else:
    require(not any(n.startswith(pre+'.')for pre in prefixes),'Project helper loaded outside fresh source inventory')
    actual=physical
   require(actual.is_file(),'Missing original loaded Coq object: '+n)
   result[n]={'path':str(physical),'sha256':sha(actual)}
  loaded[label]=result
  for ending in ['libraries','locations']:
   record=[r for r in full['records']if r['label']==label+'-'+ending]
   require(len(record)==1 and record[0]['exit_code']==0,'Missing actual coqtop audit execution')
   cmd=record[0]['command'];target=label+(''if ending=='libraries'else'-locations')+'.v'
   require(cmd[:4]==['prlimit','--as=17179869184:17179869184','--','coqtop']and'-batch'in cmd and cmd[-2:]==['-l',str(historical/target)],'Coq library audit execution differs')
 external=loaded['external-before'];after=loaded['external-after']
 require(external and not set(external)&set(fresh),'Nonempty external-only inventory required')
 require(set(fresh)<=set(after)and{n:r for n,r in after.items()if n not in fresh}==external,'External recursive closure changed')
 require(external==full['external_recursive_vo_closure']and after==full['loaded_recursive_vo_closure'],'Recorded loaded object identity differs')
 import json
 require(json.loads((run/'external-dependencies.json').read_text())=={'external':external,'loaded_after':after},'External identity artifact differs')
 return {'external_library_objects':len(external),'fresh_source_objects_resolved':len(fresh),'external_libraries_rebuilt':False}
