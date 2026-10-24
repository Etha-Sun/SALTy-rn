#!/usr/bin/env python3
"""Bind current public C/contract/model definitions to exact generated full interfaces."""
from pathlib import Path
import argparse,hashlib,json,re
from prepare import ROOT,UNITS,kernel_contract,source
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def normalize(s):return re.findall(r'\w+|\S',s)
def strip(s):return re.sub(r'/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"','',s,flags=re.S)
def bodies(s):
 s=strip(s);out={}
 for m in re.finditer(r'(?m)^(?:\w+[\s*]+)+(\w+)\s*\([^;{}]*\)\s*\{',s):
  depth=1;i=m.end()
  while depth:depth+=(s[i]=='{')-(s[i]=='}');i+=1
  out[m[1]]=s[m.end():i-1]
 return out

def audit(run,ordinary_run):
 ledger=json.loads((ROOT/'proof/intrinsic-ledger.json').read_text())
 for e in ledger['entries']:
  c=e['contract'];assert sha(ROOT/c['path'])==c['file_sha256']
  for d in e['definition_bindings']:assert sha(ROOT/d['path'])==d['sha256']
 assert sha(ROOT/ledger['abstraction_proofs']['path'])==ledger['abstraction_proofs']['sha256']
 mem=ledger['memory_backend'];assert sha(Path('/tmp/qcp214-src')/mem['toolchain_path'])==mem['sha256']
 units=[];allbodies={};texts=[];bindings=[]
 for unit,u in UNITS.items():
  O=ROOT/'.build'/run/'generation'/unit;r=json.loads((O/'result.json').read_text())
  assert r['generation_exit']==0 and r['vc_fields']==u['fields'] and r['inputs_unchanged'],unit
  if not r['passed']:
   correction=json.loads((O/'identity-recheck.json').read_text());assert correction['passed'] and correction['exact_goal_match'] and correction['goal_sha256']==r['goal_sha256']
   assert unit=='rvv' and correction['change']=='two import qualifications only; all391 formulas byte-identical'
  for f,h in r['input_hashes'].items():assert sha(ROOT/f)==h,f
  assert sha(O/(u['base']+'_goal.v'))==sha(ROOT/u['expected'])==r['goal_sha256']
  assert (O/'annotated.c').read_text()==source(unit)
  text=(O/(u['base']+'.c')).read_text();texts.append(text);bs=bodies(text)
  for name,body in bs.items():assert name not in allbodies or allbodies[name]==body;allbodies[name]=body
  units.append({'unit':unit,'generation_run':run,'goal_sha256':r['goal_sha256'],'C_fields':r['vc_fields'],'bodies':sorted(bs),'import_identity_recheck':not r['passed']})
  if unit in ['neon','rvv']:
   actual=re.search(r'void test_'+unit+r'\(.*?(/\*@.*?\*/)\s*\{',(O/'annotated.c').read_text(),re.S)[1]
   assert normalize(actual)==normalize(kernel_contract(unit))
   body=bs['test_'+unit]
   assert not re.search(r'\b(?:mr|kc)\s*(?:\+\+|--|(?:\+|-|\*|/|%|<<|>>|&|\||\^)?=(?!=))',body),'scalar argument mutation requires contract review'
   bindings.append({'callee':'test_'+unit,'body_contract':'spec.c QCP_KERNEL_BODY_VIEW','caller_contract':'spec.c public default view','pre_consequence':'FullDomainConsequence.FullConsequence.caller_pre_to_'+unit+'_body_pre','post_consequence':'FullDomainConsequence.FullConsequence.'+unit+'_body_post_to_caller_post','scalar_identity':'mr/kc are unmodified by actual C; caller declaration sees call-entry scalar arguments; QCP generator interpretation is trusted','raw_neon_post_theorem':'FullDomainConsequence.FullConsequence.raw_neon_post_consequence_with_scalar_identity' if unit=='neon' else None})
 O=ROOT/'.build'/ordinary_run/'generation/ordinary';r=json.loads((O/'result.json').read_text());assert r['passed'] and r['vc_fields']==1 and sha(ROOT/r['source'])==r['source_sha256']
 assert sha(O/'ordinary_goal.v')==sha(ROOT/'proof/coq/F32Admission/ordinary_goal.v')==r['goal_sha256']
 text=(ROOT/'shim/ordinary.c').read_text();texts.append(text);bs=bodies(text);allbodies.update(bs);units.append({'unit':'ordinary','generation_run':ordinary_run,'goal_sha256':r['goal_sha256'],'C_fields':1,'bodies':sorted(bs)})
 intrinsic={e['call_symbol']:e for e in ledger['entries']};calls={name:sorted(set(re.findall(r'\b([A-Za-z_]\w*)\s*\(',body))-{'if','while','for','sizeof','switch','return'}) for name,body in allbodies.items()}
 reachable=set();missing=set();pending=['equivalent']
 while pending:
  name=pending.pop()
  if name in reachable:continue
  reachable.add(name)
  if name in allbodies:pending+=calls[name]
  elif name not in intrinsic:missing.add(name)
 assert not missing,missing
 for text,unit in zip(texts,units):
  for name in set(c for fn in unit['bodies'] for c in calls[fn]):
   if name not in intrinsic:continue
   e=intrinsic[name];header=(ROOT/e['contract']['path']).read_text();pattern=r'(?m)^([^\n;]+\b'+re.escape(name)+r'\([^;{]*?\))\s*(/\*@.*?\*/)\s*;'
   old=re.search(pattern,header,re.S);new=re.search(pattern,text,re.S);assert old and new,(unit['unit'],name)
   assert normalize(old[1]+old[2])==normalize(new[1]+new[2]),(unit['unit'],name)
 # Assert remains an ordinary checked body, never an unproved intrinsic.
 c=re.search(r'/\*@\s*Require condition != 0.*?\*/',(ROOT/'shim/ordinary.c').read_text(),re.S)[0]
 for header in ['shim/neon/shim-undef.h','shim/rvv/intrinsic-spec.h']:
  h=(ROOT/header).read_text();hc=re.search(r'void qcp_assert\(int condition\)\s*(/\*@.*?\*/)',h,re.S)[1];assert normalize(c)==normalize(hc)
 return {'passed':True,'units':units,'unit_vc_fields':sum(x['C_fields'] for x in units),'body_functions':len(allbodies),'reachable_functions':sorted(reachable),'call_graph':calls,'intrinsic_spec_calls':sorted(reachable&intrinsic.keys()),'ordinary_body_calls':sorted(reachable&allbodies.keys()),'unresolved_calls':[],'kernel_caller_contract_bindings':bindings,'intrinsic_ledger_sha256':sha(ROOT/'proof/intrinsic-ledger.json'),'interpretation':'Complete generated C VC interfaces plus checked logical consequences; QCP frontend/contract instantiation trusted, no ISA or generator-soundness theorem claimed'}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--ordinary-run',required=True);a=p.parse_args();r=audit(a.run,a.ordinary_run);(ROOT/'.build'/a.ordinary_run/'binding-audit.json').write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items() if k not in ['call_graph','units','reachable_functions']})
