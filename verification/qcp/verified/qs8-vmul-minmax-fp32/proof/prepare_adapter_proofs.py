#!/usr/bin/env python3
from pathlib import Path
import json,re,hashlib,shutil,tempfile
def emit(path,text):
 if path.exists():return # Preserve completed/manual proofs on future target regeneration.
 path.write_text(text)
P=Path(__file__).resolve().parent;C=P.parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();g=json.loads((P/'adapter-generation-all-status.json').read_text());assert g['generation_passed'];old=json.loads((C/'.build/adapter-proof-plan.json').read_text());rows=g['units'];store=next(x for x in old['units']if x['stem']=='store_body');rows.append(store)
seed=C/'.build/program-math-t03e1lv8';run=Path(tempfile.mkdtemp(prefix='all-adapter-core-',dir=C/'.build'));q=run/'coq';shutil.copytree(seed/'coq',q);base=json.loads((seed/'status.json').read_text());assert base['passed'];(run/'status.json').write_text(json.dumps({'passed':True,'source_sha256':base['source_sha256'],'scope':'Only13 explicitly checked initial mathematical modules, ordinary C and strategies compile fresh below','source_core':str(seed),'source_status_sha256':sha(seed/'status.json')},indent=2)+'\n')
# Independent strategy goal is generated, never copied from the private Admitted scaffold.
sg=C/'.build/byte-store-strategy-ibh8i_9r/byte_store_strategy_goal.v';assert sha(sg)=='307670e3c0ac249369e27a12e94564b4e8bb493dd055e1a9075e3116b11f6659';shutil.copyfile(sg,q/sg.name)
tactics='''From Coq Require Import ZArith Lia.
From Qs8Mul Require Export PrefixFacts VectorValuesFacts ExtFacts.
Import Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.
Local Opaque rd_mem qm_lane_match qm_fp_lane_match qm_sat8 qm_sat16 qm_sat32 qm_arm_add.
Ltac qm_adapter_start := intros;
 try change INT_MAX with 2147483647 in *;
 try change INT_MIN with (-2147483648) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *;
 change (sizeof(CHAR)) with 1 in *;
 rewrite ?Z.mul_1_r,?Z.add_0_r in *;
 try unfold UndefStructPredint8x8_t,UndefStructPredint16x4_t,UndefStructPredint16x8_t,UndefStructPredint32x4_t,UndefStructPredfloat32x4_t,UndefStructPredvint8m2_t,UndefStructPredvint16m4_t,UndefStructPredvint32m8_t,UndefStructPredvfloat32m8_t;
 rewrite ?qm_local_field_address;
 repeat progress rewrite <-logic_equiv_andp_assoc;
 repeat match goal with
 | H:(?k-2)*(?k-4)=0,Hne:?k<>4 |- _ => let E:=fresh "Ek"in assert(E:k=2)by nia;clear Hne;subst k
 end;
 subst;autorewrite with qm_ext qm_vector in *.
Ltac qm_adapter_finish := first[
 solve[apply _derivable1_andp_intros;[qm_pure|opaque_leaves;sepcon_assoc_change;fast_cancel]]
 |solve[opaque_leaves;sepcon_assoc_change;fast_cancel]
 |solve[qm_pure]
 |solve[entailer!;lia]].
''';emit(P/'coq/AdapterTactics.v',tactics)
for row in rows:
 stem=row['stem'];goal=Path(row['goal']);assert sha(goal)==row['goal_sha256'];shutil.copyfile(goal,q/goal.name);s=goal.read_text();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',s,re.M);assert len(fields)==row['actual_C_fields'];row['fields']=fields
 if stem=='qm_scale_is_nan':row.update(checked_module='ScalarNanChecked',typed_instance='Qs8Mul.ScalarNanChecked.CheckedScalarNan');continue
 row.update(checked_module='AdapterChecked_'+stem,typed_instance='Qs8Mul.AdapterChecked_'+stem+'.Checked');mods=[]
 for i,f in enumerate(fields):
  mod=f'Adapter_{stem}_{i}';mods.append(mod);unfold=f'Qs8Mul.{stem}_goal.{f}';aux=f+'_aux'
  if 'Definition '+aux+' :='in s:unfold+=f', Qs8Mul.{stem}_goal.{aux}'
  middle=''
  if stem=='qm_get32':middle+='try assert(i_pre=31)by lia;subst;autorewrite with qm_vector in *;'
  if stem=='qm_sext_sub'and'_return_'in f:middle+='Exists '+' '.join('r'+str(j)+'_3'for j in reversed(range(16,32)))+';Exists '+' '.join('r'+str(j)+'_3'for j in reversed(range(16)))+';'
  body=f'unfold {unfold};try left;qm_adapter_start;'+middle+'qm_adapter_finish'
  emit(P/'coq'/(mod+'.v'),f'From Coq Require Import ZArith Lia.\nFrom Qs8Mul Require Import AdapterTactics {stem}_goal.\nImport Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.\nLemma proof_of_{f} : Qs8Mul.{stem}_goal.{f}.\nProof. {body}. Qed.\nPrint Assumptions proof_of_{f}.\n')
 agg=f'From Qs8Mul Require Import {stem}_goal '+' '.join(mods)+f'.\nModule Checked : Qs8Mul.{stem}_goal.VC_Correct.\n'
 for mod,f in zip(mods,fields):agg+=f'Definition proof_of_{f} := Qs8Mul.{mod}.proof_of_{f}.\n'
 if 'byte_store_Strategy_Correct'in s:agg=agg.replace('Require Import '+stem+'_goal ','Require Import byte_store_strategy_proof '+stem+'_goal ').replace('VC_Correct.\n','VC_Correct.\nInclude Qs8Mul.byte_store_strategy_proof.CheckedByteStoreStrategy.\n',1)
 agg+=f'End Checked.\nModule ExactChecked : Qs8Mul.{stem}_goal.VC_Correct := Checked.\n'
 for f in fields:agg+=f'Print Assumptions Checked.proof_of_{f}.\n'
 emit(P/'coq'/('AdapterChecked_'+stem+'.v'),agg);row['leaf_modules']=mods
plan={'core':str(q),'actual_C_units':len(rows),'actual_C_fields':sum(r['actual_C_fields']for r in rows),'strategy_fields':6,'units':rows};(C/'.build/current-all-adapter-plan.json').write_text(json.dumps(plan,indent=2)+'\n');print(json.dumps({k:v for k,v in plan.items()if k!='units'},indent=2))
