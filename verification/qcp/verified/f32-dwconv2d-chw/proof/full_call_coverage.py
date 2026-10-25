"""Exact current declaration/body and intrinsic-view closure diagnostic.
All ordinary callees require actual body providers. No proof credit here.
"""
from pathlib import Path
import hashlib,json,re
import coverage
CASE=Path(__file__).resolve().parents[1]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
POINTER_VIEWS={
 'shim/intrinsic_store_views.h':{
  'dw_isa_store4':'vst1q_f32','dw_isa_store2':'vst1_f32',
  'dw_isa_store1':'vst1_lane_f32','dw_isa_storervv':'__riscv_vse32_v_f32m2'},
 'shim/intrinsic_mask_view.h':{'dw_isa_mask7':'vld1q_u32','dw_isa_mask7_array':'vld1q_u32'}}
def header_functions(relative):
 text=(CASE/relative).read_text()
 text=re.sub(r'(?m)^\s*#.*$', '',text)
 return list(coverage._functions(text,relative))
def registered_views(ledger):
 assert ledger['entry_count']==len(ledger['entries'])==30
 by={e['name']:e for e in ledger['entries']};assert len(by)==30
 entries=[]
 for e in ledger['entries']:
  assert sha(CASE/e['header'])==e['header_sha256'],e['header']
  assert hashlib.sha256(e['contract'].encode()).hexdigest()==e['contract_sha256']
  assert e['boundary']=='source-reviewed-spec' and not e['formal_ISA_correspondence_proved']
  for d in e['Coq_definitions']:
   assert sha(CASE/d['source'])==d['source_sha256']
   assert re.search(r'\bDefinition\s+'+re.escape(d['FQ'].split('.')[-1])+r'\b',(CASE/d['source']).read_text())
  formal=e.get('provider_name',e['name'])
  found=[row for row in header_functions(e['header'])if row[0]==formal]
  assert len(found)==1,(formal,e['header'])
  name,sig,contract,body=found[0];assert body is None
  entries.append(dict(intrinsic=e['name'],formal_symbol=name,signature=sig,contract=contract,
   contract_source=e['header'],contract_source_sha256=sha(CASE/e['header']),
   origin_ledger_entry_sha256=hashlib.sha256(json.dumps(e,sort_keys=True).encode()).hexdigest(),
   human_review='pending; specification boundary only'))
 for header,names in POINTER_VIEWS.items():
  rows=header_functions(header)
  for name,original in names.items():
   found=[row for row in rows if row[0]==name];assert len(found)==1,name
   _,sig,contract,body=found[0];assert body is None and original in by
   entries.append(dict(intrinsic=original,formal_symbol=name,signature=sig,contract=contract,
    contract_source=header,contract_source_sha256=sha(CASE/header),
    pointer_view=True,physical_ISA_ABI_correspondence_proved=False,
    human_review='pending; exact native single-instruction semantic pointer/array view'))
 return entries
def check(units,ledger):
 views=registered_views(ledger);registered={};ordinary={};defs={};decls={};calls=set();rows=[];errors=[]
 for e in views:registered.setdefault(e['formal_symbol'],set()).add((tuple(e['signature']),e['contract']))
 for stem,p in units.items():
  for name,sig,contract,edges in coverage._functions(Path(p).read_text(),stem):
   pair=sig,contract;decls.setdefault(name,set()).add(pair)
   if edges is not None:
    assert name not in registered,'Intrinsic unexpectedly has ordinary C body: '+name
    assert name not in ordinary or ordinary[name]==pair,'Body contract conflict '+name
    ordinary[name]=pair;defs.setdefault(name,[]).append(stem);calls|={(name,d)for d in edges}
   rows.append(dict(unit=stem,name=name,definition=edges is not None,
    signature_sha256=hashlib.sha256(repr(sig).encode()).hexdigest(),
    contract_sha256=hashlib.sha256(contract.encode()).hexdigest()))
 for name,pairs in decls.items():
  if name in registered:
   if not pairs<=registered[name]:errors.append('Unregistered intrinsic contract/signature '+name)
  elif name not in ordinary:errors.append('Ordinary declaration lacks body '+name)
  elif pairs!={ordinary[name]}:errors.append('Ordinary declaration/body mismatch '+name)
 unbound=sorted({d for _,d in calls}-set(defs)-set(registered))
 errors+=['Unbound callee '+n for n in unbound]
 errors+=['Duplicate C body '+n for n,v in defs.items()if len(v)!=1]
 return dict(source_closure_passed=not errors,whole_kernel_verified=False,
  scope='Exact declaration/body and source-reviewed single-instruction view audit; no formal proof credit',
  unique_actual_C_definitions=len(defs),actual_C_definitions=defs,
  registered_intrinsic_views=len(views),unique_intrinsic_symbols=len(registered),
  calls=sorted(calls),errors=errors,rows=rows,views=views,
  units={name:dict(path=str(p),cpp_sha256=sha(p))for name,p in units.items()},
  parser_source_sha256=sha(CASE/'proof/coverage.py'))
