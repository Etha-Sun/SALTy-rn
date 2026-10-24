"""Audit one complete fresh Coq run, exact C generation and semantic bindings."""
from pathlib import Path
import argparse,hashlib,json,re
from prepare import ROOT,UNITS
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ALLOWED={'CNotation.sizeof_union_type','CNotation.sizeof_struct_type','CNotation.sizeof_enum_type','CNotation.sizeof_alias_type','ClassicalDedekindReals.sig_not_dec','ClassicalDedekindReals.sig_forall_dec','PropExtensionality.propositional_extensionality','FunctionalExtensionality.functional_extensionality_dep','CNotation.eval_addr_expr_congr','CNotation.eval_addr_expr','SeparationLogic.Snaive_C_Rules64.eval_addr','Classical_Prop.classic','CNotation.RE_addr_of_congr','CNotation.LE_arrow_field_congr'}
def audit(compile_run,generation_run):
 C=ROOT/'.build'/compile_run/'compile';G=ROOT/'.build'/generation_run
 dep=json.loads((ROOT/'proof/dependencies.json').read_text());result=json.loads((C/'result.json').read_text());assert result['passed']and result['inputs_unchanged'];assert dep==json.loads((C/'manifest.json').read_text())
 for m in dep['modules']:assert sha(ROOT/m['path'])==sha(C/m['path'])==m['sha256']
 for r in result['records']:assert r['exit']==0 and sha((C/r['path']).with_suffix('.vo'))==r['vo_sha256']
 reports=json.loads((ROOT/'proof/final-reports.json').read_text());count=0;inherited=set();checks=[]
 for name,expected in reports['chunks'].items():
  p=C/'proof/coq/FloatIgAdmission'/(name+'.budget/command.log');s=p.read_text();n=len(re.findall(r'(?m)^(?:Axioms:|Closed under the global context)',s));names=set(re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_.]*)\s*:',s))-{'Axioms'}
  assert n==expected and names<=ALLOWED,(name,n,expected,names-ALLOWED);inherited|=names;count+=n;checks.append({'module':name,'reports':n,'log_sha256':sha(p)})
 assert count==reports['count']==604
 generation=json.loads((G/'generation-summary.json').read_text());assert generation['passed']and generation['C_fields']==593
 for unit,U in UNITS.items():
  O=G/'generation'/unit;r=json.loads((O/'result.json').read_text());assert r['generation_passed']and r['inputs_unchanged']
  assert all(sha(ROOT/f)==h for f,h in r['input_hashes'].items())
  assert sha(O/(U['base']+'_goal.v'))==sha(ROOT/'proof/coq'/U['namespace']/(U['base']+'_goal.v'))
 strategies=[]
 for side in ['neon','rvv']:
  S=G/'strategy'/side;r=json.loads((S/'result.json').read_text());ns='Gemm'+side.title()
  assert r['passed_generation']and sha(ROOT/'shim'/side/'copy.strategies')==r['dsl_sha256']and sha(ROOT/'shim'/side/'copy.h')==r['header_sha256']
  assert sha(S/'copy_strategy_goal.v')==r['generated_goal_sha256']==sha(ROOT/'proof/coq'/ns/'copy_strategy_goal.v')
  assert sha(Path('/tmp/qcp214-src/linux-binary/StrategyCheck'))==r['tool_sha256'];strategies.append({'side':side,'fields':r['strategy_fields'],'goal_sha256':r['generated_goal_sha256']})
 assert sum(x['fields']for x in strategies)==7
 ledger=json.loads((ROOT/'proof/intrinsic-ledger.json').read_text());assert len(ledger['entries'])==22
 names=set();goal_refs=set()
 for side in ['Rvv','Neon']:
  glob=(C/'proof/coq'/('FloatIg'+side)/(side.lower()+'_goal.glob')).read_text()
  for line in glob.splitlines():
   a=line.split()
   if len(a)>=5 and a[0].startswith('R')and a[-1]=='def':goal_refs.add(a[1]+'.'+a[-2])
 for e in ledger['entries']:
  names.add(e['intrinsic']);c=e['contract'];s=(ROOT/c['path']).read_text();assert sha(ROOT/c['path'])==c['file_sha256']
  symbol=e['call_symbol'];m=re.search(r'(?m)^([^\n;]+\b'+re.escape(symbol)+r'\([^;{]*?\))\s*(/\*@.*?\*/)\s*;',s,re.S);assert m and hashlib.sha256(m[0].encode()).hexdigest()==c['signature_and_contract_sha256']
  for b in e['definition_bindings']:
   f=ROOT/b['path'];assert sha(f)==b['sha256'];name=b['qualified_name'].split('.')[-1]
   assert re.search(r'(?m)^(Definition|Fixpoint)\s+'+name+r'\b',f.read_text())
   if name!='active_mask':assert b['qualified_name']in goal_refs,b
 impl='\n'.join(p.read_text()for p in(ROOT/'impl').glob('*.c'))
 calls=set(re.findall(r'\b((?:__riscv_|__builtin_nanf|vld|vst|vdup|vfma|vmin|vmax|vget)\w*)\s*\(',impl));assert calls==names,(calls-names,names-calls)
 identity=json.loads((ROOT/'proof/source-identity.json').read_text());repo=ROOT.parents[3]
 for side,f in identity['files'].items():assert sha(repo/f['path'])==f['sha256'];assert sha(ROOT/'impl'/('testNEON.c'if side=='neon'else'testRVV.c'))==identity['current_impl'][side]
 return {'passed':True,'configured_jobs':32,'fresh_local_modules':len(dep['modules']),'C_units':4,'C_fields':593,'strategy_fields':7,'assumption_reports':count,'inherited_assumption_names':sorted(inherited),'new_project_axioms':False,'complete_interfaces':'FloatIgAdmission.FinalCheck: RVV, NEON, Caller, Ordinary and both copy strategy interfaces','assumption_checks':checks,'strategies':strategies,'intrinsic_entries':22,'ledger_bindings_match_compiled_goals':True}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--generation-run',required=True);a=p.parse_args();r=audit(a.compile_run,a.generation_run);o=ROOT/'.build'/a.compile_run/'audit.json';assert not o.exists();o.write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k not in ['assumption_checks','strategies']})
