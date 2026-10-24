#!/usr/bin/env python3
"""Fail-closed live source, contract, dependency and call-coverage checks."""
from pathlib import Path
import argparse,hashlib,json,re
from admission_prepare import ROOT,UNITS,kernel_contract,source
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def normalize(s):return re.findall(r'\w+|\S',s)
def strip(s):return re.sub(r'/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"','',s,flags=re.S)
def bodies(s):
 s=strip(s);out={}
 for m in re.finditer(r'(?m)^(?:\w+[\s*]+)+(\w+)\s*\([^;{}]*\)\s*\{',s):
  depth=1;i=m.end()
  while depth:
   depth+=(s[i]=='{')-(s[i]=='}');i+=1
  out[m[1]]=s[m.end():i-1]
 return out

def audit(run,generation_runs=None):
 generation_runs=generation_runs or {}
 dep=json.loads((ROOT/'proof/dependencies.json').read_text());ledger=json.loads((ROOT/'proof/intrinsic-ledger.json').read_text());bindings=[]
 for e in ledger['entries']:
  c=e['contract'];p=ROOT/c['path'];assert sha(p)==c['file_sha256'],p
  for d in e['definition_bindings']:
   p=(ROOT/d['path']) if 'path' in d else Path('/tmp/qcp214-src')/d['toolchain_path'];assert sha(p)==d['sha256'],p
 assert sha(ROOT/ledger['abstraction_proofs']['path'])==ledger['abstraction_proofs']['sha256']
 public=(ROOT/'spec.c').read_text();allbodies={};unitdata=[]
 for unit,u in UNITS.items():
  O=ROOT/'.build'/generation_runs.get(unit,run)/'generation'/unit;r=json.loads((O/'result.json').read_text());assert r['passed'],unit
  for p,h in r['input_hashes'].items():assert sha(ROOT/p)==h,p
  assert sha(O/(u['base']+'_goal.v'))==sha(ROOT/u['expected'])==r['goal_sha256']
  assert (O/'annotated.c').read_text()==source(unit),unit
  text=(O/(u['base']+'.c')).read_text();bs=bodies(text)
  for name,body in bs.items():
   assert name not in allbodies or allbodies[name]==body,name
   allbodies[name]=body
  unitdata.append({'unit':unit,'generation_run':generation_runs.get(unit,run),'goal_sha256':r['goal_sha256'],'C_fields':r['vc_fields'],'bodies':sorted(bs)})
  if unit in ('neon','rvv'):
   actual=re.search(r'void test_'+unit+r'\(.*?(/\*@.*?\*/)\s*\{',(O/'annotated.c').read_text(),re.S)[1]
   assert normalize(actual)==normalize(kernel_contract(unit))
   publicc='/*@'+public.split('void test_'+unit+'(',1)[1].split('/*@',1)[1].split('*/',1)[0]+'*/'
   assert normalize(actual)==normalize(publicc)
   bindings.append({'callee':'test_'+unit,'public_contract_source':'spec.c','body_contract':'token-identical public precondition and postcondition','postcondition_identical':True})
 intrinsic={e['call_symbol']:e for e in ledger['entries']};calls={name:sorted(set(re.findall(r'\b([A-Za-z_]\w*)\s*\(',body))-{'if','while','for','sizeof','switch','return'}) for name,body in allbodies.items()}
 reachable=set();unresolved=set();pending=['equivalent']
 while pending:
  name=pending.pop()
  if name in reachable:continue
  reachable.add(name)
  if name in allbodies:pending+=calls[name]
  elif name not in intrinsic:unresolved.add(name)
 assert not unresolved,unresolved
 # Every registered declaration actually used must match its public header tokens.
 for unit,u in UNITS.items():
  text=(ROOT/'.build'/generation_runs.get(unit,run)/'generation'/unit/(u['base']+'.c')).read_text()
  for name in set(c for fn in unitdata[list(UNITS).index(unit)]['bodies'] for c in calls[fn]):
   if name not in intrinsic:continue
   e=intrinsic[name];c=e['contract'];header=(ROOT/c['path']).read_text()
   pattern=r'(?m)^([^\n;]+\b'+re.escape(name)+r'\([^;{]*?\))\s*(/\*@.*?\*/)\s*;'
   original=re.search(pattern,header,re.S);generated=re.search(pattern,text,re.S)
   # Optional body units define some primitives instead of merely declaring them.
   if name in allbodies and generated is None:continue
   assert generated is not None,(unit,name)
   assert normalize(original[1]+original[2])==normalize(generated[1]+generated[2]),(unit,name)
 return {'passed':True,'units':unitdata,'unit_vc_fields':sum(x['C_fields'] for x in unitdata),'body_functions':len(allbodies),'reachable_functions':sorted(reachable),'call_graph':calls,'intrinsic_spec_calls':sorted(reachable & intrinsic.keys()),'ordinary_body_calls':sorted(reachable & allbodies.keys()),'unresolved_calls':[],'kernel_caller_contract_bindings':bindings,'intrinsic_definitions_verified':True,'intrinsic_ledger_sha256':sha(ROOT/'proof/intrinsic-ledger.json'),'limitations':'Call extraction/identity audit is a source binding check; actual body correctness is established separately by complete Coq interfaces.'}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--generation-map',type=Path);a=p.parse_args();r=audit(a.run,json.loads(a.generation_map.read_text()) if a.generation_map else None);out=ROOT/'.build'/a.run/'binding-audit.json';out.write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ('call_graph','units','reachable_functions')})
