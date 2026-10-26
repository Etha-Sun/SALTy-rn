"""Independent source/native/repair identity audit. No proof execution or credit.
The raw emitter and documented source-reviewed native spec boundary remain visible.
"""
from pathlib import Path
import json,subprocess,time
from full_inputs import CASE,ROOT,read,sha,require
from build_full_handoff import audit_native,audit_implementations
import full_call_coverage

def identity(case,work,handoff=None):
 require(case.resolve()==CASE.resolve(),'Case identity differs');records=[]
 def execute(cmd,label):
  wrapped=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=work/(label+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(wrapped,stdout=f,stderr=f,timeout=300)
  records.append(dict(label=label,command=wrapped,exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));require(r.returncode==0,'Exact repair replay failed '+label)
 native=audit_native();repair=audit_implementations(work,execute);views=full_call_coverage.registered_views();ledger=read(case/'proof/intrinsic-ledger.json')
 require(ledger['inventory_complete']is True,'Native ledger incomplete');require(len(views)==30,'Expected30native views')
 if handoff:
  require(handoff['native_statuses']==native and handoff['implementations']==repair,'Frozen identity differs')
  for n,h in handoff['frozen_source_sha256'].items():require(sha(case/n)==h,'Frozen input drift '+n)
 require(read(case/'proof/repair.json')['ordinary_block32_preparation_ready']is True,'Preparation ready flag absent')
 return dict(formal_proof_replayed=False,repair_patch_records=records,implementations=repair,native_statuses=native,source_reviewed_intrinsic_views=30,ordinary_helpers_require_actual_fresh_body_proofs=True,human_intrinsic_review='pending',ISA_refinement_proved=False)
