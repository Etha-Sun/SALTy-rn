#!/usr/bin/env python3
"""Exact ordinary-callee closure and registered intrinsic-view CPP audit.

This is a source diagnostic, not a C-body proof or a whole-case certificate.
The check function also accepts the final runner's independently fresh CPPs.
"""
from pathlib import Path
import hashlib,json,re,tempfile
import coverage
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def check(units,ledger):
 registered={};defs={};ordinary={};declarations={};calls=set();errors=[];rows=[]
 for e in ledger['entries']:
  p=C/e['contract_source'];assert sha(p)==e['contract_source_sha256']
  found=[]
  for m in re.finditer(r'(?m)^([A-Za-z_][\w ]*?)\s+([A-Za-z_]\w*)\(([^;{}]*?)\)\s*/\*@(.+?)\*/;',p.read_text(),re.S):
   ret,name,args,contract=m.groups()
   if name==e['formal_symbol'] and hashlib.sha256(contract.encode()).hexdigest()==e['contract_sha256']:
    signature=tuple(t for t in re.findall(r'\w+|[^\s\w]',ret+' '+name+'('+args+')')if t!='restrict')
    found.append((signature,re.sub(r'\s','','/*@'+contract+'*/')))
  assert len(found)==1,(e['formal_symbol'],e['view']);registered.setdefault(e['formal_symbol'],set()).add(found[0])
 for label,p in units.items():
  for name,sig,contract,edges in coverage._functions(Path(p).read_text(),label):
   pair=sig,contract;declarations.setdefault(name,set()).add(pair)
   if edges is not None:
    assert name not in registered,'Original intrinsic unexpectedly represented by a C body: '+name
    assert name not in ordinary or ordinary[name]==pair,'Ordinary body conflict: '+name
    ordinary[name]=pair;defs.setdefault(name,[]).append(label);calls|={(name,x)for x in edges}
   rows.append(dict(unit=label,name=name,definition=edges is not None,signature_sha256=hashlib.sha256(repr(sig).encode()).hexdigest(),contract_sha256=hashlib.sha256(contract.encode()).hexdigest()))
 for name,pairs in declarations.items():
  if name in registered:
   if not pairs<=registered[name]:errors.append('Unregistered intrinsic contract/signature: '+name)
  elif name not in ordinary:errors.append('Ordinary declaration without body: '+name)
  elif pairs!={ordinary[name]}:errors.append('Ordinary declaration/body conflict: '+name)
 unbound=sorted({b for _,b in calls}-set(defs)-set(registered));errors+=['Unbound callee: '+n for n in unbound]
 return dict(source_closure_passed=not errors,whole_kernel_verified=False,scope='Exact C declaration/callee source diagnostic only; every ordinary body still requires fresh actualC VC_Correct closure',units={n:dict(path=str(p),cpp_sha256=sha(p))for n,p in units.items()},unique_actual_C_definitions=len(defs),actual_C_definitions=defs,registered_intrinsic_views=len(ledger['entries']),unique_intrinsic_symbols=len(registered),calls=sorted(calls),errors=errors,rows=rows,parser_source_sha256=sha(C/'proof/coverage.py'),registered_ledger_canonical_json_sha256=hashlib.sha256(json.dumps(ledger,sort_keys=True).encode()).hexdigest())
def main():
 units={};pending=[]
 def add(label,status,cpp):
  d=json.loads((C/status).read_text());assert d.get('passed',d.get('generation_passed',False)),status
  assert all(sha(C/k)==v for k,v in d.get('input_sha256',{}).items()),status
  units[label]=Path(d['run_directory'])/cpp
 for stem in ['type_width','count','assert']:add(stem,'proof/scalar-status.json',stem+'.c')
 for label,status,cpp in [('read_table','read-table','read_table.c'),('compare','compare','compare.c'),('load_views','load-views','load_views.c'),('neon','neon-generation','neon_unit.c'),('caller','caller-generation','caller.c')]:add(label,'proof/'+status+'-status.json',cpp)
 for label,run,cpp in [('rvv','rvv-kernel-86ys_ss5','rvv_unit.c'),('propagate','propagate-generation-0tcz5yj8','propagate.c')]:
  d=json.loads((C/'.build'/run/'status.json').read_text());assert all(sha(C/k)==v for k,v in d['input_sha256'].items());units[label]=C/'.build'/run/cpp
  if not d.get('passed',d.get('generation_passed',False)):pending.append(label)
 d=check(units,json.loads((C/'proof/intrinsic-ledger.json').read_text()));d['ledger_source_sha256']=sha(C/'proof/intrinsic-ledger.json');d['pending_actual_generation']=pending;d['audit_source_sha256']=sha(__file__);run=Path(tempfile.mkdtemp(prefix='closure-preflight-',dir=C/'.build'));(run/'status.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(dict(run_directory=str(run),source_closure_passed=d['source_closure_passed'],units=len(units),actual_definitions=d['unique_actual_C_definitions'],errors=d['errors'],pending_actual_generation=pending)));return 0 if d['source_closure_passed']else 1
if __name__=='__main__':raise SystemExit(main())
