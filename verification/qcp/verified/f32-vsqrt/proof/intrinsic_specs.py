"""Fail-closed, exact seven intrinsic specification boundaries; no C body credit."""
from pathlib import Path
import hashlib,json,re,importlib.util
EXPECTED={'vld1q_f32','vsqrtq_f32','vget_low_f32','vget_high_f32','__riscv_vsetvl_e32m8','__riscv_vle32_v_f32m8','__riscv_vfsqrt_v_f32m8'}
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def approved(case):
 case=Path(case);root=next(p for p in case.parents if(p/'.git').exists());ledger=json.loads((case/'proof/intrinsic-ledger.json').read_text());header=case/'shim/intrinsics.h';text=header.read_text();assert set(ledger['spec_only_declarations'])==EXPECTED and ledger['formal_isa_refinement_established']is False
 sp=importlib.util.spec_from_file_location('sqrt_intrinsic_coverage',case/'proof/c_coverage.py');m=importlib.util.module_from_spec(sp);sp.loader.exec_module(m);parsed={n:(sig,c)for n,sig,c,edges in m._functions(re.sub(r'(?m)^\s*#.*$','',text),'intrinsic header')if n in EXPECTED};assert set(parsed)==EXPECTED
 for e in ledger['entries']:
  assert e['contract_source_sha256']==sha(header) and e['formal_isa_correspondence']=='not established'
  provider=e['actual_provider'];z=re.search(r'^[^\n]*\b'+re.escape(provider)+r'\([^\n]*\)\s*(/\*@.*?\*/);',text,re.M|re.S);assert z and hashlib.sha256(z[1].encode()).hexdigest()==e['contract_exact_text_sha256']
  for d in e['coq_definitions']:
   p=(case/d['file']).resolve();assert p.is_relative_to(root.resolve()) and sha(p)==d['sha256'];assert re.search(r'\bDefinition\s+'+re.escape(d['name'].split('.')[-1])+r'\b',p.read_text()),d
 return parsed

def records(case):
 return {n:{'signature_sha256':hashlib.sha256(repr(s).encode()).hexdigest(),'contract_sha256':hashlib.sha256(c.encode()).hexdigest(),'classification':'source-reviewed intrinsic spec, no C body/VC/ISA-refinement credit'}for n,(s,c)in sorted(approved(case).items())}
def check(case,declarations,definitions,calls):
 allowed=approved(case);missing=set(declarations)-set(definitions);unbound=set(calls)-set(definitions)
 assert missing==EXPECTED and unbound==EXPECTED,('Ordinary actual C closure hole or unexpected intrinsic inventory',missing,unbound)
 assert not EXPECTED&set(definitions),'Intrinsic-body policy inventory changed'
 for n,pair in allowed.items():assert declarations[n]==pair,'Unreviewed intrinsic signature/contract '+n
 return records(case)
