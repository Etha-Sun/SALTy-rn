#!/usr/bin/env python3
from pathlib import Path
import re,json,hashlib
P=Path(__file__).resolve().parent;C=P.parent;g=json.loads((P/'neon-generation-status.json').read_text());assert g['generation_passed'];goal=Path(g['run_directory'])/'neon_unit_goal.v';s=goal.read_text();assert hashlib.sha256(goal.read_bytes()).hexdigest()==g['goal_sha256'];fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',s,re.M);calls=[f for f in fields if 'partial_solve'in f or'safety'in f];records=[]
for i,f in enumerate(calls):
 mod='NeonCall'+f'{i:03}';unfold='Qs8Mul.neon_unit_goal.'+f;aux=f+'_aux'
 if 'Definition '+aux+' :='in s:unfold+=', Qs8Mul.neon_unit_goal.'+aux
 text=f'From Qs8Mul Require Import KernelTactics neon_unit_goal.\nImport Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.\nLemma proof_of_{f} : Qs8Mul.neon_unit_goal.{f}.\nProof. unfold {unfold};try left;qm_k_solve. Qed.\nPrint Assumptions proof_of_{f}.\n'
 (P/'coq'/(mod+'.v')).write_text(text);records.append({'field':f,'module':mod,'source_sha256':hashlib.sha256(text.encode()).hexdigest()})
agg='From Qs8Mul Require Import neon_unit_goal '+' '.join(r['module']for r in records)+'.\nModule CheckedNeonCalls.\n'
for r in records:agg+='Definition proof_of_'+r['field']+' : Qs8Mul.neon_unit_goal.'+r['field']+' := Qs8Mul.'+r['module']+'.proof_of_'+r['field']+'.\n'
agg+='End CheckedNeonCalls.\n';(P/'coq/NeonCalls.v').write_text(agg);(P/'neon-caller-partition.json').write_text(json.dumps({'passed':False,'whole_kernel_verified':False,'actual_goal_sha256':g['goal_sha256'],'actual_C_fields':len(fields),'caller_fields':len(calls),'remaining_loop_memory_return':[f for f in fields if f not in calls],'leafs':records},indent=2)+'\n');print(len(calls),len(fields))
