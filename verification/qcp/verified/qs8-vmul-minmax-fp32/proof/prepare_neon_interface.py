#!/usr/bin/env python3
"""Render exact fully qualified whole-kernel aliases; this never issues proof status."""
from pathlib import Path
import hashlib,json,re
P=Path(__file__).resolve().parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
g=json.loads((P/'neon-generation-status.json').read_text());assert g['generation_passed']
goal=Path(g['run_directory'])/'neon_unit_goal.v';assert sha(goal)==g['goal_sha256']
fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M)
c=json.loads((P/'neon-caller-partition.json').read_text());assert len(c['leafs'])==473
m=json.loads((P/'neon-memory-partition.json').read_text());assert m['passed']
callfields={r['field']for r in c['leafs']}
loop={'test_neon_entail_wit_3'}
mem=set(fields)-callfields-loop
assert len(fields)==528 and len(mem)==54 and not(callfields&loop)
providers={f:'Qs8Mul.NeonCalls.CheckedNeonCalls'for f in callfields}
providers.update({f:'Qs8Mul.NeonMemory.CheckedNeonMemory'for f in mem})
providers['test_neon_entail_wit_3']='Qs8Mul.NeonLoopFast'
s='From Qs8Mul Require Import neon_unit_goal NeonCalls NeonMemory NeonLoopFast byte_store_strategy_proof.\n'
s+='Module CheckedNeon : Qs8Mul.neon_unit_goal.VC_Correct.\nInclude Qs8Mul.byte_store_strategy_proof.CheckedByteStoreStrategy.\n'
for f in fields:s+='Definition proof_of_'+f+' : Qs8Mul.neon_unit_goal.'+f+' := '+providers[f]+'.proof_of_'+f+'.\n'
s+='End CheckedNeon.\nModule ExactCheckedNeon : Qs8Mul.neon_unit_goal.VC_Correct := CheckedNeon.\n'
(P/'coq/NeonChecked.v').write_text(s)
for j in range(32):
 s='From Qs8Mul Require Import NeonChecked.\n'
 for f in fields[j::32]:
  s+='Definition exact_'+f+' : Qs8Mul.neon_unit_goal.'+f+' := Qs8Mul.NeonChecked.CheckedNeon.proof_of_'+f+'.\n'
  s+='Print Assumptions exact_'+f+'.\n'
 (P/'coq'/f'NeonAssumptions{j:02}.v').write_text(s)
(P/'neon-interface-fieldmap.json').write_text(json.dumps({'prepared':True,'passed':False,'whole_kernel_verified':False,'actual_C_fields':528,'actual_goal_sha256':sha(goal),'typed_instance':'Qs8Mul.NeonChecked.CheckedNeon','fields':[{'name':f,'provider':providers[f]+'.proof_of_'+f,'fully_qualified_goal':'Qs8Mul.neon_unit_goal.'+f,'assumptions_module':f'NeonAssumptions{fields.index(f)%32:02}'}for f in fields],'assumption_part_modules':[f'NeonAssumptions{j:02}'for j in range(32)],'checked_source_sha256':sha(P/'coq/NeonChecked.v')},indent=2)+'\n')
print('Prepared exact528 interface and32 Print parts; not a verification result')
