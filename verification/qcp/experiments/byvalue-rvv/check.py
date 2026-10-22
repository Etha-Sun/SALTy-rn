#!/usr/bin/env python3
"""Fresh VC generation and Coq checking for value wrappers, not full kernel."""
from pathlib import Path
import subprocess,json,re,time
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
WORKSPACE=HERE.parents[5]
CFG=json.loads((WORKSPACE/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
build=HERE/'.build'
build.mkdir(exist_ok=True)
records=[]
def run(command,label,timeout=90):
    begin=time.monotonic()
    try:
        r=subprocess.run(list(map(str,command)),cwd=HERE,capture_output=True,text=True,timeout=timeout)
        code=r.returncode; output=r.stdout+r.stderr
    except subprocess.TimeoutExpired as e:
        code='timeout';output=(e.stdout or b'').decode()+(e.stderr or b'').decode()
    (build/(label+'.log')).write_text(output)
    records.append({'label':label,'exit_code':code,'elapsed':time.monotonic()-begin,'command':list(map(str,command))})
    print(label,code,flush=True)
    if code: raise RuntimeError(output[-3000:])
def coqc(path,label):
    run(['qcp-env','coqc',*CFG['flags'][2:],'-Q',QCP/'shared/vadd','QcpVadd','-Q',QCP/'experiments/vadd-rvv','QcpRvv32','-Q',HERE,'ByvalueRvv','-Q',build,'ByvalueRvv',path],label)
try:
    run(['python3',HERE/'generate.py'],'generate')
    run(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(HERE/'shim.c'),'--coq-output-dir='+str(build),'--coq-logic-path=ByvalueRvv','-slp',QCP/'experiments/vadd-rvv','QcpRvv32','-slp',HERE,'ByvalueRvv'],'qcp')
    goal=(build/'shim_goal.v').read_text()
    names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
    checked='From Coq Require Import Lia.\nFrom ByvalueRvv Require Import Layout shim_goal.\nFrom QcpRvv32 Require Import FastFrame.\nImport Snaive_C_Rules64.\nModule Checked : VC_Correct.\n'
    for name in names:
        if name.endswith('_pure'):
            tactic='intros; unfold derivable1, andp, coq_prop; intros; repeat split; lia.'
        else:
            extra=', '+name+'_aux' if name+'_aux' in goal else ''
            tactic=('intros; subst; unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address; first [ apply _derivable1_andp_intros; [ unfold derivable1, andp, coq_prop; intros; repeat first [assumption | split | reflexivity]; lia | opaque_leaves; sepcon_assoc_change; fast_cancel ] | opaque_leaves; sepcon_assoc_change; fast_cancel ].')
        extra=', '+name+'_aux' if name+'_aux' in goal and not name.endswith('_pure') else ''
        checked+=f'Lemma proof_of_{name} : {name}.\nProof. unfold {name}{extra}; {tactic} Qed.\n'
    checked+='End Checked.\n'
    (HERE/'shim_checked.v').write_text(checked)
    coqc(HERE/'Layout.v','layout')
    coqc(build/'shim_goal.v','goals')
    coqc(HERE/'shim_checked.v','checked')
    passed=True
except RuntimeError as error:
    passed=False; print(error)
(HERE/'status.json').write_text(json.dumps({'passed':passed,'full_kernel_proved':False,'records':records},indent=2)+'\n')
