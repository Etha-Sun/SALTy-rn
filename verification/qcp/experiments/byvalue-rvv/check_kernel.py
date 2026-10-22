#!/usr/bin/env python3
"""Compile old array-loop arguments against fresh by-value kernel obligations."""
from pathlib import Path
import json,re,subprocess,time,sys
HERE=Path(__file__).resolve().parent
OLD=HERE.parent/'vadd-rvv'
QCP=HERE.parents[1]
CFG=json.loads((HERE.parents[5]/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
BUILD=HERE/'.build'
STEM=sys.argv[1] if len(sys.argv)>1 else 'rvv_unit'
PREFIX='Macro' if STEM=='macro_unit' else ''
records=[]
def coqc(path,label,timeout=90):
    cmd=['qcp-env','coqc',*CFG['flags'][2:],'-Q',QCP/'shared/vadd','QcpVadd','-Q',OLD,'QcpRvv32','-Q',QCP/'experiments/vadd-relations','','-Q',HERE,'ByvalueRvv','-Q',BUILD,'ByvalueRvv',path]
    begin=time.monotonic()
    try:
        r=subprocess.run(list(map(str,cmd)),cwd=HERE,capture_output=True,text=True,timeout=timeout);code=r.returncode;log=r.stdout+r.stderr
    except subprocess.TimeoutExpired as e: code='timeout';log=(e.stdout or b'').decode()+(e.stderr or b'').decode()
    (BUILD/(label+'.log')).write_text(log)
    records.append({'label':label,'exit_code':code,'elapsed':time.monotonic()-begin,'command':list(map(str,cmd))}); print(label,code,flush=True)
    if code: raise RuntimeError(log[-3000:])
try:
    memory=(OLD/'rvv_loop_memory_checked.v').read_text().replace('Require Import rvv_loop_unit_goal RvvLoopMemory','Require Import RvvLoopMemory')
    memory='From ByvalueRvv Require Import '+STEM+'_goal.\n'+memory
    (HERE/(PREFIX+'KernelMemory.v')).write_text(memory)
    goal=(BUILD/(STEM+'_goal.v')).read_text()
    names=re.findall(r'^Axiom proof_of_(\w+)',goal,re.M)
    memory_names=re.findall(r'Lemma proof_of_(\w+)',memory)
    checked='From Coq Require Import Lia.\nFrom QcpRvv32 Require Import RvvLoopModel FastFrame rvv_loop_pure_checked.\nFrom ByvalueRvv Require Import Layout '+STEM+'_goal.\nImport Snaive_C_Rules64.\nModule KernelCalls.\n'
    for name in names:
        if name in memory_names: continue
        extra=', '+name+'_aux' if name+'_aux' in goal and not name.endswith('_pure') else ''
        if '_safety_' in name or name.endswith('_pure'):
            tactic='intros; unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia.'
        elif not name.startswith('test_rvv_'):
            tactic='first [ exact CheckedRvvLoopPure.proof_of_'+name+' | intros; unfold vadd_vl; entailer!; lia ].'
        else:
            tactic='intros; rewrite ?rvv_local_undef_fields; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ].'
        if name in re.findall(r'Lemma proof_of_(\w+)',(OLD/'rvv_loop_pure_checked.v').read_text()):
            tactic='first [ exact CheckedRvvLoopPure.proof_of_'+name+' | '+tactic.rstrip('.')+' ].'
        checked+=f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{extra}; {tactic} Qed.\n'
    checked+='End KernelCalls.\n'
    (HERE/(PREFIX+'KernelCalls.v')).write_text(checked)
    coqc(BUILD/(STEM+'_goal.v'),'kernel-goal')
    coqc(HERE/(PREFIX+'KernelMemory.v'),'kernel-memory')
    coqc(HERE/(PREFIX+'KernelCalls.v'),'kernel-calls')
    combined='From QcpRvv32 Require Import rvv_arrays_strategy_proof rvv_store_strategy_proof rvv_loop_strategy_proof.\nFrom ByvalueRvv Require Import '+STEM+'_goal '+PREFIX+'KernelMemory '+PREFIX+'KernelCalls.\nModule KernelChecked : VC_Correct.\nInclude CheckedRvvArray.\nInclude CheckedRvvStoreStrategy.\nInclude CheckedRvvLoopStrategy.\nInclude CheckedRvvLoopMemory.\nInclude KernelCalls.\nEnd KernelChecked.\n'
    (HERE/(PREFIX+'KernelChecked.v')).write_text(combined)
    coqc(HERE/(PREFIX+'KernelChecked.v'),'kernel-checked')
    passed=True
except RuntimeError as e: passed=False; print(e)
(HERE/(PREFIX+'kernel-proof-status.json')).write_text(json.dumps({'passed':passed,'full_kernel_proved':False,'kernel_body_vcs_proved':passed,'checked_c_vcs':len(names) if passed else 0,'old_dependency_closure_replayed':False,'records':records},indent=2)+'\n')
