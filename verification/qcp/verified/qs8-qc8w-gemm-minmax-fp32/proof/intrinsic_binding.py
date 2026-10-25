#!/usr/bin/env python3
"""Bind source-reviewed contracts to actual calls and compiled generated-goal references."""
from pathlib import Path
import argparse,hashlib,json,re
T=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def audit(compile_run,generation_run,neon_compile_run=None):
 B=T/'.build'/compile_run/'compile';manifest=json.loads((B/'manifest.json').read_text())
 generation=json.loads((T/'.build'/generation_run/'generation-summary.json').read_text());assert generation['passed']
 ledger=json.loads((T/'proof/intrinsic-review.json').read_text())
 for path,h in ledger['contracts'].items():assert sha(T/path)==h,path
 refs={};body={};glob_hashes={}
 for side,ns in [('NEON','Qs8NeonGoals'),('RVV','Qs8Rvv')]:
  GBASE=T/'.build'/neon_compile_run/'compile'if side=='NEON'and neon_compile_run else B
  GM=json.loads((GBASE/'manifest.json').read_text())
  files=[GBASE/m['path']for m in GM['modules']if m['namespace']==ns and (side=='NEON'or m['path'].endswith('/rvv_goal.v'))]
  refs[side]=set()
  for f in files:
   g=f.with_suffix('.glob');assert g.exists(),g;glob_hashes[str(g.relative_to(T/'.build'))]=sha(g)
   for line in g.read_text().splitlines():
    a=line.split()
    if len(a)>=5 and a[0].startswith('R')and a[-1]=='def':refs[side].add(a[1]+'.'+(''if a[2]=='<>'else a[2]+'.')+a[-2])
  row=next(r for r in generation['units']if r['unit']==side.lower());u=side.lower();G=T/'.build'/row['source_run']/'generation'/u
  cpp=(G/(u+'.c')).read_text();body[side]=cpp[cpp.index('void test_'+u+'('):]
 paths=[(ns,T/path)for ns,path in manifest['namespaces'].items()]+[(ns,Path(path))for _,path,ns in manifest['external_flags']]
 def binding(q):
  ns,root=next((ns,root)for ns,root in sorted(paths,key=lambda t:-len(t[0]))if q.startswith(ns+'.'))
  bits=q[len(ns)+1:].split('.');p=root.joinpath(*bits[:-1]).with_suffix('.v');name=bits[-1]
  assert p.is_file()and re.search(r'(?m)^(?:Definition|Fixpoint)\s+'+re.escape(name)+r'\b',p.read_text()),q
  return {'qualified_name':q,'path':str(p.relative_to(T))if p.is_relative_to(T)else str(p),'sha256':sha(p),'local':p.is_relative_to(T)}
 records=[]
 for e in ledger['entries']:
  if not e['active']:continue
  s=T/e['source_file'];h=T/e['contract_file'];assert sha(s)==e['source_sha256']and sha(h)==e['contract_file_sha256']
  provider=e['actual_provider'];m=re.search(r'^\w+\s+'+re.escape(provider)+r'\(.*?\*/;',h.read_text(),re.S|re.M);assert m and hashlib.sha256(m[0].encode()).hexdigest()==e['contract_sha256']
  calls=len(re.findall(r'\b'+re.escape(provider)+r'\s*\(',body[e['isa']]));assert calls>0,(e['original_intrinsic'],provider)
  bindings=[]
  for name in e['value_definitions']:
   candidates=[q for q in refs[e['isa']]if q.endswith('.'+name)];assert len(candidates)==1,(name,candidates)
   bindings.append(binding(candidates[0]))
  records.append({'intrinsic':e['original_intrinsic'],'provider':provider,'isa':e['isa'],'actual_call_occurrences':calls,'contract_sha256':e['contract_sha256'],'definitions':bindings})
 for side in ['NEON','RVV']:
  impl=re.sub(r'/\*.*?\*/|//[^\n]*','',(T/('impl/test'+side+'.c')).read_text(),flags=re.S)
  names=set(re.findall(r'\b((?:v\w+|__riscv_\w+))\s*\(',impl));assert names=={e['original_intrinsic']for e in ledger['entries']if e['isa']==side}
 assert len(records)==52
 return {'passed':True,'entries':records,'raw_entries':len(ledger['entries']),'active_entries':len(records),'ledger_sha256':sha(T/'proof/intrinsic-review.json'),'compiled_goal_glob_sha256':glob_hashes,'boundary':ledger['trust_boundary'],'preliminary_multiple_compilation_runs':bool(neon_compile_run),'meaning':'Every active intrinsic provider occurs in actual generated whole C. Its exact contract and each named value definition are hash-bound to compiled goal references. This does not independently prove the source-to-contract or ISA interpretation.'}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--generation-run',required=True);p.add_argument('--neon-compile-run');a=p.parse_args();r=audit(a.compile_run,a.generation_run,a.neon_compile_run);o=T/'.build'/a.compile_run/'intrinsic-binding.json';assert not o.exists();o.write_text(json.dumps(r,indent=2)+'\n');print('intrinsic bindings passed',r['active_entries'])
