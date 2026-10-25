#!/usr/bin/env python3
# Source pattern f32-maxpool/audit_callee_cpp.py SHA256 5bff54f5ca2e107d6b8b5b255e1f29faced217423b4f62c3bf87c7758c055150. Re-executed here; no transferred proof credit.
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
 import subprocess,time
 from full_inputs import iter_current_unit_texts
 r=Path(tempfile.mkdtemp(prefix='closure-preflight-',dir=C/'.build'));units={};records=[]
 for u in iter_current_unit_texts():
  stem=u['stem'];src=r/(stem+'.in.c');src.write_text(u['text']);cpp=r/(stem+'.c');cmd=['prlimit','--as=17179869184:17179869184','--','gcc','-E','-P','-CC','-nostdinc','-I',str(C),*u['cpp_flags'],str(src),'-o',str(cpp)];start=time.monotonic();p=subprocess.run(cmd,cwd=r,capture_output=True,timeout=300);log=r/(stem+'.log');log.write_bytes(p.stdout+p.stderr);records.append({'label':stem+'-cpp','command':cmd,'exit_code':p.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)});assert p.returncode==0,log.read_text()[-2000:];units[stem]=cpp
 d=check(units,json.loads((C/'proof/intrinsic-ledger.json').read_text()));d.update(run_directory=str(r),records=records,ledger_source_sha256=sha(C/'proof/intrinsic-ledger.json'),audit_source_sha256=sha(__file__),formal_proof_replayed=False)
 (r/'status.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps({'source_closure_passed':d['source_closure_passed'],'run_directory':str(r),'actual_c_units':len(units),'unique_actual_c_bodies':d['unique_actual_C_definitions'],'intrinsic_views':d['registered_intrinsic_views'],'errors':d['errors']}));return 0 if d['source_closure_passed']else 1
if __name__=='__main__':raise SystemExit(main())
