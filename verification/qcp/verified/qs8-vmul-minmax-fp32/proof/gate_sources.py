"""Deterministic fully qualified typed gates and disjoint parallel Print leaves.

This is source construction only. Every generated module is subsequently
compiled by ordinary Coq. The issuer independently checks every print constant
against the complete actual C/strategy field inventory.
"""
import re
PARTS=16
TYPED='CaseTyped'
PREFIX='CaseAssumptions'
REPORT='AssumptionsReport.log'
def identifiers(namespace,units,strategies):
    assert re.fullmatch(r'\w+',namespace)
    result=[]
    for i,unit in enumerate(units):
        assert unit['namespace']==namespace
        for field in unit['fields']:
            assert re.fullmatch(r'\w+',field)
            result.append(f'{namespace}.{TYPED}.ActualUnit{i}.proof_of_{field}')
    for i,unit in enumerate(strategies):
        for field in unit['fields']:
            assert re.fullmatch(r'\w+',field)
            result.append(f'{namespace}.{TYPED}.ActualStrategy{i}.{field}')
    assert len(result)==len(set(result))
    return result

def typed_source(namespace,units,strategies):
    lines=[]
    for i,unit in enumerate(units):
        goal=unit['namespace']+'.'+unit['stem']+'_goal';proof=unit['checked_module']
        lines += ['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.']
    for i,unit in enumerate(strategies):
        goal=unit['namespace']+'.'+unit['stem']+'_strategy_goal';proof=unit['checked_module']
        lines += ['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualStrategy{i} : {goal}.{unit["module_type"]} := {proof}.']
    return '\n'.join(lines)+'\n'

def leaf_source(namespace,constants):
    return f'From {namespace} Require Import {TYPED}.\n'+''.join('Print Assumptions '+constant+'.\n'for constant in constants)

def sources(namespace,units,strategies):
    names=identifiers(namespace,units,strategies)
    result={TYPED:typed_source(namespace,units,strategies)}
    result.update({PREFIX+str(i):leaf_source(namespace,names[i::PARTS])for i in range(PARTS)})
    return result

def final_source(namespace,units,strategies):
    # Require all checked report leaves, then independently type every unit
    # interface once more. This final module contains no duplicate Print rows.
    return 'From '+namespace+' Require Import '+' '.join([TYPED]+[PREFIX+str(i)for i in range(PARTS)])+'.\n'+typed_source(namespace,units,strategies)
