#!/usr/bin/env python3
"""A no-op store must not satisfy the value wrapper's existing contract."""
from pathlib import Path
import json,subprocess
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
CFG=json.loads((HERE.parents[5]/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
BUILD=HERE/'.build/negative';BUILD.mkdir(exist_ok=True)
records=[]
def run(command,label):
 r=subprocess.run(list(map(str,command)),cwd=HERE,capture_output=True,text=True,timeout=90)
 (BUILD/(label+'.log')).write_text(r.stdout+r.stderr)
 records.append({'label':label,'exit_code':r.returncode,'command':list(map(str,command))})
 return r
r=run(['gcc','-E','-P','-CC','-nostdinc',HERE/'shim.c','-o',BUILD/'shim.c'],'preprocess');assert r.returncode==0
source=(BUILD/'shim.c').read_text();mutant=source.replace('__riscv_vse32_v_f32m8(p,&a,vl);',';');assert mutant!=source
(BUILD/'shim.c').write_text(mutant)
r=run(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(BUILD/'shim.c'),'--coq-output-dir='+str(BUILD),'--coq-logic-path=ByvalueRvv','-slp',QCP/'experiments/vadd-rvv','QcpRvv32','-slp',HERE,'ByvalueRvv'],'qcp');assert r.returncode==0
flags=['qcp-env','coqc',*CFG['flags'][2:],'-Q',QCP/'shared/vadd','QcpVadd','-Q',QCP/'experiments/vadd-rvv','QcpRvv32','-Q',HERE,'ByvalueRvv','-Q',BUILD,'ByvalueRvv']
r=run(flags+[BUILD/'shim_goal.v'],'goal');assert r.returncode==0
# Copy only the previously proved store return argument so rejection cannot be
# caused by other lemmas disappearing after removal of the internal call.
(BUILD/'negative_checked.v').write_text('''From Coq Require Import Lia.
From QcpRvv32 Require Import FastFrame.
From ByvalueRvv Require Import Layout shim_goal.
Import Snaive_C_Rules64.
Lemma negative_store : qcp_byvalue_store_return_wit_1.
Proof. unfold qcp_byvalue_store_return_wit_1; intros; subst;
 unfold UndefStructPredvfloat32m8_t; rewrite ?rvv_local_field_address;
 opaque_leaves; sepcon_assoc_change; fast_cancel. Qed.
''')
positive=HERE/'.build/negative_checked.v'
positive.write_text((BUILD/'negative_checked.v').read_text())
positive_flags=flags[:-3]+['-Q',HERE/'.build','ByvalueRvv']
r=run(positive_flags+[positive],'positive-proof');assert r.returncode==0,r.stderr
r=run(flags+[BUILD/'negative_checked.v'],'proof')
rejected=r.returncode!=0
(HERE/'negative-status.json').write_text(json.dumps({'no_op_store_rejected':rejected,'records':records},indent=2)+'\n')
assert rejected
print('no_op_store_rejected',rejected)
