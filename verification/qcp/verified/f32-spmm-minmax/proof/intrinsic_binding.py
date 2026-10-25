#!/usr/bin/env python3
"""Bind actual calls, exact contracts and compiled model definitions; no ISA refinement claim."""
from pathlib import Path
import argparse,hashlib,json,re
T=Path(__file__).resolve().parents[1];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
clean=lambda s:re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S)
def bodies(s,names):
 s=clean(s);out=[]
 for name in names:
  m=re.search(r'\b'+re.escape(name)+r'\s*\([^;{}]*\)\s*\{',s);assert m,name
  start=m.end();depth=1;i=start
  while depth:
   assert i<len(s);depth+=(s[i]=='{')-(s[i]=='}');i+=1
  out.append(s[start:i-1])
 return '\n'.join(out)
def refs(f):
 out=set()
 for line in f.read_text().splitlines():
  a=line.split()
  if len(a)>=5 and a[0].startswith('R'):out.add(a[1]+'.'+(''if a[2]=='<>'else a[2]+'.')+a[-2])
 return out
def audit(compile_run,generation_run):
 B=T/'.build'/compile_run/'compile';d=json.loads((B/'manifest.json').read_text());mods={m['path']:m for m in d['modules']};g=json.loads((T/'.build'/generation_run/'generation-summary.json').read_text());assert g['passed'];L=json.loads((T/'proof/intrinsic-ledger.json').read_text())
 assert len(L['entries'])==26
 body={};cpp={};calls={};direct={};closures={};glob_hashes={}
 names={'neon':['test_neon'],'rvv':['test_rvv'],'ordinary':['qcp_identity','qcp_assert','xnn_prefetch_to_l1'],'caller':['equivalent']}
 for u in names:
  row=next(x for x in g['units']if x['unit']==u);G=T/'.build'/row['source_run']/'generation'/u
  assert all(sha(T/f)==h and sha(G/'snapshot'/f)==h for f,h in row['input_hashes'].items())
  cpp[u]=(G/(u+'.c')).read_text();body[u]=bodies(cpp[u],names[u]);calls[u]=set(re.findall(r'\b([A-Za-z_]\w*)\s*\(',body[u]))-{'if','while','for','switch','sizeof','_Alignof'}
  goal=row['public_goal'];closure=set()
  def visit(k):
   if k in closure:return
   closure.add(k)
   for x in mods[k]['dependencies']:
    if x in mods:visit(x)
  visit(goal);closures[u]=closure;f=(B/goal).with_suffix('.glob');assert f.exists(),f;direct[u]=refs(f);glob_hashes[goal[:-2]+'.glob']=sha(f)
 ordinary={'qcp_identity','qcp_assert','xnn_prefetch_to_l1'};providers={e['call_symbol']for e in L['entries']}
 assert (calls['neon']|calls['rvv'])<=providers|ordinary,(calls['neon']|calls['rvv'])-providers-ordinary
 assert calls['ordinary']=={'__builtin_prefetch'}and calls['caller']=={'test_neon','test_rvv'}
 source_unit={'impl/testNEON.c':'neon','impl/testRVV.c':'rvv','shim/ordinary.c':'ordinary'};records=[]
 for e in L['entries']:
  c=e['contract'];h=T/c['path'];assert sha(h)==c['file_sha256']
  m=next((m for m in re.finditer(r'^([^\n]+?\b(\w+)\([^\n]*\))\n(/\*@.*?\*/);',h.read_text(),re.M|re.S)if m[2]==e['call_symbol']),None)
  assert m and sha_bytes(m[0])==c['signature_and_contract_sha256']and m[3]==c['text']
  units=set()
  for site in e['source_call_sites']:
   f=T/site['path'];assert sha(f)==site['sha256'];line=f.read_text().splitlines()[site['line']-1];assert re.search(r'\b'+re.escape(e['intrinsic'])+r'\s*\(',line)
   units.add(source_unit[site['path']])
  assert units,e['call_symbol'];counts={}
  for u in units:
   assert c['text']in cpp[u]
   n=len(re.findall(r'\b'+re.escape(e['call_symbol'])+r'\s*\(',body[u]));assert n>0,(e['call_symbol'],u);counts[u]=n
  definitions=[]
  for b in e['definition_bindings']:
   f=T/b['path'];assert b['path']in mods and sha(f)==sha(B/b['path'])==b['sha256']==mods[b['path']]['sha256']
   assert (B/b['path']).with_suffix('.vo').is_file()
   assert re.search(r'(?m)^(?:Definition|Fixpoint|Record)\s+'+re.escape(b['qualified_name'].rsplit('.',1)[1])+r'\b',f.read_text())
   assert all(b['path']in closures[u]for u in units),(e['call_symbol'],b['path'])
   seen={u:b['qualified_name']in direct[u]for u in units}
   definitions.append({**b,'direct_generated_goal_reference':seen,'compiled_transitive_model_definition':True})
  records.append({'intrinsic':e['intrinsic'],'provider':e['call_symbol'],'calls':counts,'contract_sha256':c['signature_and_contract_sha256'],'definitions':definitions})
 used=set().union(*(calls[u]for u in ['neon','rvv','ordinary']))-ordinary
 assert used==providers,(used-providers,providers-used)
 for b in L['abstraction_proofs']:assert sha(T/b['path'])==sha(B/b['path'])==b['sha256']and(B/b['path']).with_suffix('.vo').exists()
 mb=L['memory_backend'];assert sha(Path('/tmp/qcp214-src')/mb['toolchain_path'])==mb['sha256'];assert sha(Path('/tmp/qcp214-src')/mb['definition_core'])==mb['core_sha256']
 return {'passed':True,'active_entries':26,'entries':records,'call_closure':{k:sorted(v)for k,v in calls.items()},'ledger_sha256':sha(T/'proof/intrinsic-ledger.json'),'compiled_goal_glob_sha256':glob_hashes,'boundary':'Exact actual-call/contract/source binding, with Coq-checked model definitions and explicit direct/transitive references. Semantic correspondence to official intrinsic/ABI behavior remains source-reviewed; final human review pending.'}
def sha_bytes(s):return hashlib.sha256(s.encode()).hexdigest()
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--generation-run',required=True);p.add_argument('--run',required=True);a=p.parse_args();r=audit(a.compile_run,a.generation_run);O=T/'.build'/a.run/'intrinsic-binding.json';assert not O.exists();O.parent.mkdir(parents=True,exist_ok=True);O.write_text(json.dumps(r,indent=2)+'\n');print('Intrinsic binding passed',r['active_entries'])
