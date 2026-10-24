"""Audit a complete fresh QC4W C/Coq run and direct intrinsic-definition bindings."""
from pathlib import Path
import argparse,hashlib,json,re
from prepare import ROOT,UNITS,tokens
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ALLOWED={'CNotation.sizeof_union_type','CNotation.sizeof_struct_type','CNotation.sizeof_enum_type','CNotation.sizeof_alias_type','ClassicalDedekindReals.sig_not_dec','ClassicalDedekindReals.sig_forall_dec','PropExtensionality.propositional_extensionality','FunctionalExtensionality.functional_extensionality_dep','CNotation.eval_addr_expr_congr','CNotation.eval_addr_expr','SeparationLogic.Snaive_C_Rules64.eval_addr','Classical_Prop.classic','CNotation.RE_addr_of_congr','CNotation.LE_arrow_field_congr'}
def audit(compile_run,generation_run):
 C=ROOT/'.build'/compile_run/'compile';G=ROOT/'.build'/generation_run
 dep=json.loads((ROOT/'proof/dependencies.json').read_text());r=json.loads((C/'result.json').read_text());assert r['passed']and r['inputs_unchanged']and r['configured_jobs']==32
 assert dep==json.loads((C/'manifest.json').read_text())
 assert r['fresh_modules']==len(dep['modules'])==len(r['records'])
 for m in dep['modules']:assert sha(ROOT/m['path'])==sha(C/m['path'])==m['sha256']
 for m in r['records']:assert m['exit']==0 and sha((C/m['path']).with_suffix('.vo'))==m['vo_sha256']
 current_records={m['path']:m for m in r['records']}
 continuations=r.get('continuations',[])
 for continuation in continuations:
  H=C/'continuations'/continuation['attempt']
  assert continuation==json.loads((H/'resume-launch.json').read_text())
  assert continuation['configured_jobs']==32 and sha(ROOT/'proof/resume_compile.py')==continuation['runner_sha256']
  assert sha(H/'result.json')==continuation['previous_result_sha256']
  assert continuation['source_manifest_sha256']==sha(C/'manifest.json')
  assert dep==json.loads((H/'manifest.json').read_text())
  assert json.loads((H/'flags.json').read_text())==json.loads((C/'flags.json').read_text())
  previous=json.loads((H/'result.json').read_text())
  assert not previous['passed']and previous['inputs_unchanged']
  preserved=[m for m in previous['records']if m['exit']==0]
  assert len(preserved)==continuation['preserved_successful_modules']
  for m in preserved:
   assert current_records[m['path']]['source_sha256']==m['source_sha256']
   assert current_records[m['path']]['vo_sha256']==m['vo_sha256']
 reports=json.loads((ROOT/'proof/final-reports.json').read_text());count=0;inherited=set();checks=[]
 for name,expected in reports['chunks'].items():
  p=C/'proof/coq/QC4Admission'/(name+'.budget/command.log');s=p.read_text();n=len(re.findall(r'(?m)^(?:Axioms:|Closed under the global context)',s));names=set(re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_.]*)\s*:',s))-{'Axioms'}
  assert n==expected and names<=ALLOWED,(name,n,expected,names-ALLOWED);inherited|=names;count+=n;checks.append({'module':name,'reports':n,'log_sha256':sha(p)})
 assert count==reports['count']==len(reports['reports'])
 generation=json.loads((G/'generation-summary.json').read_text());assert generation['passed']and generation['configured_jobs']==32
 fields={};unit_records=[]
 for unit,U in UNITS.items():
  O=G/'generation'/unit;r=json.loads((O/'result.json').read_text());assert r['generation_passed']and r['inputs_unchanged']and r['configured_jobs']==32
  assert all(sha(ROOT/f)==h for f,h in r['input_hashes'].items())
  goal=O/(U['base']+'_goal.v');expected=ROOT/'proof/coq'/U['namespace']/goal.name
  assert sha(goal)==r['goal_sha256']==sha(expected)
  n=len(re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M));assert n==r['vc_fields']and n>0;fields[unit]=n
  if unit in ['neon','rvv']:
   assert [x.group()for x in tokens((O/'plain-cpp.c').read_text())]==[x.group()for x in tokens((O/(U['base']+'.c')).read_text())]
  unit_records.append({'unit':unit,'fields':n,'goal_sha256':sha(goal),'generation_utc':r['utc'],'generation_seconds':r['seconds']})
 assert fields['rvv']==274 and fields['caller']==42 and fields['ordinary']==3 and fields['scalar_nan']==6
 assert sum(fields.values())==generation['C_fields']==reports['C_fields']
 strategies=[]
 for side in ['neon','rvv']:
  S=G/'strategy'/side;r=json.loads((S/'result.json').read_text());assert r['passed_generation']and r['strategy_fields']==12
  assert sha(ROOT/'shim'/side/'copy.strategies')==r['dsl_sha256']and sha(ROOT/'shim'/side/'copy.h')==r['header_sha256']
  assert sha(S/'copy_strategy_goal.v')==r['generated_goal_sha256']==sha(ROOT/'proof/coq/QC4Rvv/copy_strategy_goal.v')
  assert sha(Path('/tmp/qcp214-src/linux-binary/StrategyCheck'))==r['tool_sha256'];strategies.append({'side':side,'fields':12,'goal_sha256':r['generated_goal_sha256']})
 assert strategies[0]['goal_sha256']==strategies[1]['goal_sha256']and reports['strategy_fields']==12
 ledger=json.loads((ROOT/'proof/intrinsic-ledger.json').read_text());assert len(ledger['entries'])==45
 refs={}
 for side in ['neon','rvv']:
  refs[side]=set();s=(C/'proof/coq'/('QC4'+side.title())/(side+'_goal.glob')).read_text()
  for line in s.splitlines():
   a=line.split()
   if len(a)>=5 and a[0].startswith('R')and a[-1]=='def':refs[side].add(a[1]+'.'+a[-2])
 names=set()
 for e in ledger['entries']:
  names.add(e['intrinsic']);c=e['contract'];s=(ROOT/c['path']).read_text();assert sha(ROOT/c['path'])==c['file_sha256']
  m=re.search(r'(?m)^(?!#)([^\n;]+?\b'+re.escape(e['call_symbol'])+r'\([^;{]*?\))\s*(/\*@.*?\*/)\s*;',s,re.S);assert m and hashlib.sha256(m[0].encode()).hexdigest()==c['signature_and_contract_sha256']
  side='neon'if e['ISA']=='neon'else'rvv'
  for b in e['definition_bindings']:
   f=ROOT/b['path']if'path'in b else Path('/tmp/qcp214-src')/b['toolchain_path'];assert sha(f)==b['sha256'];name=b['qualified_name'].split('.')[-1]
   assert re.search(r'(?m)^(Definition|Fixpoint)\s+'+name+r'\b',f.read_text())and b['qualified_name']in refs[side],b
 impl='\n'.join(p.read_text()for p in(ROOT/'impl').glob('*.c'));impl=re.sub(r'/\*.*?\*/|//[^\n]*','',impl,flags=re.S)
 calls=set(re.findall(r'\b((?:__riscv_|__builtin_nanf|vld|vst|vdup|vfma|vmin|vmax|vget|vmov|vmul|vmlal|vshl|vshr|vand|vcvt)\w*)\s*\(',impl));assert calls==names,(calls-names,names-calls)
 identity=json.loads((ROOT/'proof/source-identity.json').read_text());repo=ROOT.parents[3]
 for side,d in identity.items():
  assert sha(repo/d['upstream_path'])==d['original_sha256'];assert sha(ROOT/'impl'/('testNEON.c'if side=='neon'else'testRVV.c'))==d['current_sha256']
 return {'passed':True,'configured_jobs':32,'fresh_local_modules':len(dep['modules']),'same_environment_continuations':len(continuations),'C_units':5,'C_fields':sum(fields.values()),'unit_fields':fields,'strategy_fields':12,'assumption_reports':count,'inherited_assumption_names':sorted(inherited),'new_project_axioms':False,'complete_interfaces':'QC4Admission.FinalCheck: RVV, NEON, Caller, Ordinary, ScalarNaN and shared actual copy strategy','assumption_checks':checks,'strategies':strategies,'C_generation':unit_records,'intrinsic_entries':45,'ledger_bindings_match_compiled_goals':True,'boundary':'source-reviewed intrinsic-spec modular partial correctness; final human semantic review pending; no formal ISA/ABI or termination theorem'}
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--compile-run',required=True);p.add_argument('--generation-run',required=True);a=p.parse_args();r=audit(a.compile_run,a.generation_run);o=ROOT/'.build'/a.compile_run/'audit.json';assert not o.exists();o.write_text(json.dumps(r,indent=2)+'\n');print({k:v for k,v in r.items()if k not in ['assumption_checks','strategies','C_generation']})
