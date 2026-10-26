"""Strict declaration/body/native-single-instruction closure over actual CPP.
The parser is migrated verification tooling, never transferred proof credit.
"""
from pathlib import Path
import hashlib,json,re
import coverage
from full_inputs import CASE,sha,module

def registered_views():
 boundary=module('argmax_current_intrinsic_boundary',CASE/'proof/audit_intrinsic_boundary.py').audit();assert boundary['passed']and boundary['native_spec_views']==30
 result=[]
 for e in boundary['entries']:
  rows=list(coverage._functions(e['declaration_and_contract'],'ledger:'+e['formal_symbol']));assert len(rows)==1
  name,sig,contract,body=rows[0];assert name==e['formal_symbol']and body is None
  result.append(dict(intrinsic=e['intrinsic'],formal_symbol=name,signature=list(sig),contract=contract,header=e['header'],ISA_refinement_proved=False,human_review='pending',ordinary_body_exemption=False))
 return result

def check(units,ledger=None):
 views=registered_views();registered={};ordinary={};definitions={};decls={};edges=set();rows=[];errors=[]
 for e in views:registered.setdefault(e['formal_symbol'],set()).add((tuple(e['signature']),e['contract']))
 for stem,p in sorted(units.items()):
  for name,sig,contract,calls in coverage._functions(Path(p).read_text(),stem):
   pair=sig,contract;decls.setdefault(name,set()).add(pair)
   if calls is not None:
    assert name not in registered,'An ordinary body cannot receive native-spec exemption: '+name
    assert name not in ordinary or ordinary[name]==pair,'Definition contract conflict '+name
    ordinary[name]=pair;definitions.setdefault(name,[]).append(stem);edges|={(name,c)for c in calls}
   rows.append(dict(unit=stem,name=name,definition=calls is not None,signature_sha256=hashlib.sha256(repr(sig).encode()).hexdigest(),contract_sha256=hashlib.sha256(contract.encode()).hexdigest()))
 for name,pairs in decls.items():
  if name in registered:
   if not pairs<=registered[name]:errors.append('Unregistered native declaration/contract: '+name)
  elif name not in ordinary:errors.append('Ordinary declaration without actual body: '+name)
  elif pairs!={ordinary[name]}:errors.append('Ordinary declaration/body contract differs: '+name)
 unbound=sorted({c for _,c in edges}-set(definitions)-set(registered));errors+=['Unbound callee: '+v for v in unbound]
 errors+=['Duplicate body: '+v for v,stems in definitions.items()if len(stems)!=1]
 return dict(source_closure_passed=not errors,whole_kernel_verified=False,unique_actual_C_definitions=len(definitions),actual_C_definitions=definitions,calls=sorted(edges),unbound_callees=unbound,errors=errors,views=views,rows=rows,units={n:dict(cpp_sha256=sha(p))for n,p in sorted(units.items())},parser_source_sha256=sha(CASE/'proof/coverage.py'),scope='Exact ordinary body/call/signature+contract closure, source-reviewed single-instruction native terminals only; no proof credit')
