"""Deterministic full typed interfaces, one-allocation observation, parallel audits."""
import re
PARTS=16
TYPED='CaseTyped'
OBSERVATION='CaseObservation'
PREFIX='CaseAssumptions'
REPORT='AssumptionsReport.log'
SUPPORT=['HwcConv.HwcPublicObservationModel.'+n for n in ['hwp_optional_refl','hwp_state_refl','hwp_raw_related','hwp_final_same_allocation','hwp_final_unwritten','Independent.optional_exact','Independent.all_state_exact','Independent.frame_exact']]+['HwcConv.CaseObservation.whole_same_output_initial','HwcConv.CaseObservation.whole_exact_unwritten']
def typed_source(namespace,units,strategies):
 assert namespace=='HwcConv';lines=[]
 for i,u in enumerate(units):
  goal=namespace+'.'+u['stem']+'_goal';proof=u['checked_module'];lines+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.',f'Module IndependentUnit{i} : {goal}.VC_Correct := ActualUnit{i}.']
 for i,u in enumerate(strategies):
  goal=namespace+'.'+u['stem'];assert u['stem'].endswith('_strategy_goal');proof=u['checked_module'];lines+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualStrategy{i} : {goal}.{u["module_type"]} := {proof}.',f'Module IndependentStrategy{i} : {goal}.{u["module_type"]} := ActualStrategy{i}.']
 return '\n'.join(lines)+'\n'
def identifiers(namespace,units,strategies):
 names=[]
 for i,u in enumerate(units):
  assert u['namespace']==namespace
  for f in u['fields']:
   assert re.fullmatch(r'\w+',f);names.extend([f'{namespace}.{TYPED}.ActualUnit{i}.proof_of_{f}',f'{namespace}.{TYPED}.IndependentUnit{i}.proof_of_{f}'])
 for i,u in enumerate(strategies):
  for f in u['fields']:
   assert re.fullmatch(r'\w+',f);names.extend([f'{namespace}.{TYPED}.ActualStrategy{i}.{f}',f'{namespace}.{TYPED}.IndependentStrategy{i}.{f}'])
 names+=SUPPORT;assert len(names)==len(set(names));return names

def observation_source(namespace,units):
 callers=[i for i,u in enumerate(units)if u['stem']=='public_mode'];assert len(callers)==1;i=callers[0]
 return f'''From {namespace} Require Import {TYPED} HwcPublicObservationModel public_mode_goal.
Module ActualPublicCaller : {namespace}.public_mode_goal.VC_Correct := {namespace}.{TYPED}.ActualUnit{i}.
Module IndependentPublicCaller : {namespace}.public_mode_goal.VC_Correct := ActualPublicCaller.
Definition whole_same_output_initial : forall F input zero weights H N top lo hi C O output hs cs start finish ow,
 hwp_state_observe
 (hc_final(hc_visible(hc_neon_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow)
 (hc_final(hc_visible(hc_rvv_raw F input zero weights H N top lo hi)C)O output hs cs C start finish ow)
 := hwp_final_same_allocation.
Definition whole_exact_unwritten : forall R O output hs cs C start finish ow,
 hwp_unwritten_frame O(hc_final R O output hs cs C start finish ow)output hs cs C start finish ow
 := hwp_final_unwritten.
'''

def sources(namespace,units,strategies):
 names=identifiers(namespace,units,strategies);result={TYPED:typed_source(namespace,units,strategies),OBSERVATION:observation_source(namespace,units)}
 for i in range(PARTS):result[PREFIX+str(i)]=f'From {namespace} Require Import {TYPED} {OBSERVATION} HwcPublicObservationModel.\n'+''.join('Print Assumptions '+n+'.\n'for n in names[i::PARTS])
 return result

def final_source(namespace,units,strategies):
 return 'From '+namespace+' Require Import '+' '.join([TYPED,OBSERVATION]+[PREFIX+str(i)for i in range(PARTS)])+'.\n'+typed_source(namespace,units,strategies)
