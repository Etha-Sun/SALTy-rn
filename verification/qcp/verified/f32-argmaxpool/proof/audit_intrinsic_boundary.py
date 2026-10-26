#!/usr/bin/env python3
"""Check the pinned original-intrinsic specification inventory, not ISA refinement."""
from pathlib import Path
import hashlib,json,re
C=Path(__file__).resolve().parents[1]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
hash_text=lambda s:hashlib.sha256(s.encode()).hexdigest()

def audit():
    neon=json.loads((C/'proof/intrinsic-ledger.json').read_text())
    rvv=json.loads((C/'proof/rvv-intrinsic-ledger.json').read_text())
    assert sha(C/'shim/neon_specs.h')==neon['header_sha256']
    assert sha(C/'shim/rvv_specs.h')==rvv['header_sha256']
    primary=C/'proof/evidence/intrinsic-sources/acle-advsimd.md'
    assert sha(primary)==neon['primary_source_sha256']
    entries=[]
    for e in neon['entries']:
        header=(C/e['contract_header']).read_text()
        matches=[m for m in re.finditer(re.escape(e['signature'])+r'\s*(/\*@.*?\*/)',header,re.S)if hash_text(m[1])==e['contract_sha256']]
        assert len(matches)==1,(e['intrinsic'],e['view'])
        m=matches[0]
        assert hash_text(e['signature'])==e['signature_sha256']
        assert hash_text(m[1])==e['contract_sha256']
        for d in e['coq_definitions']:assert sha(C/d['path'])==d['source_sha256'],d
        assert sha(C/e['type_layout']['path'])==e['type_layout']['sha256']
        assert e['source_document_sha256']==sha(primary)
        rows=[line for line in primary.read_text().splitlines()if '/'+e['intrinsic']+'"'in line]
        assert rows,('pinned API absent',e['intrinsic'])
        entries.append({'isa':'NEON','intrinsic':e['intrinsic'],'formal_symbol':e['callee'],'view':e['view'],'declaration_and_contract':m[0]+';','contract_sha256':hash_text(m[1]),'header':e['contract_header'],'model_definitions':e['coq_definitions'],'pinned_primary':str(primary.relative_to(C)),'api_row_present':True,'ordinary_body_exemption':False,'intrinsic_body_optional':True,'ISA_refinement_proved':False,'human_review':'pending'})
    for source in rvv['primary_sources']:assert sha(C/source['source'])==source['sha256']
    for e in rvv['views']:
        assert e['declaration_and_contract']in(C/e['formal_header']).read_text()
        assert hash_text(e['declaration_and_contract'])==e['declaration_and_contract_sha256']
        for path,h in e['model_source_sha256'].items():assert sha(C/path)==h
        entries.append({'isa':'RVV','intrinsic':e['original_intrinsic'],'formal_symbol':e['formal_declaration_name'],'view':e.get('view',e['formal_declaration_name']),'declaration_and_contract':e['declaration_and_contract'],'contract_sha256':e['declaration_and_contract_sha256'],'header':e['formal_header'],'model_definitions':e['model_definitions'],'pinned_primaries':rvv['primary_sources'],'ordinary_body_exemption':False,'intrinsic_body_optional':True,'ISA_refinement_proved':False,'human_review':'pending'})
    allowed={e['intrinsic']for e in entries};uses={};sources={}
    for path in [*sorted((C/'impl').glob('*.c')),*sorted((C/'shim').glob('*.c'))]:
        sources[str(path.relative_to(C))]=sha(path)
        code=re.sub(r'/\*.*?\*/|//[^\n]*',' ',path.read_text(),flags=re.S)
        names=sorted(set(re.findall(r'\b((?:__riscv_|v(?:ld|st|dup|add|cgt|bsl|get|set))\w*)\s*\(',code)))
        assert set(names)<=allowed,(path,set(names)-allowed)
        if names:uses[str(path.relative_to(C))]=names
    assert len(entries)==30 and len(allowed)==28
    return {'passed':True,'whole_kernel_verified':False,'scope':'original native intrinsic30 contract views/28names over all live impl+shimC; ordinary helpers retain actual C-body proof obligations; full C call closure is checked separately','inventory_complete':True,'native_spec_views':30,'unique_original_intrinsic_names':28,'entries':entries,'used_in_live_C':uses,'runtime_source_sha256':sources,'neon_ledger_sha256':sha(C/'proof/intrinsic-ledger.json'),'rvv_ledger_sha256':sha(C/'proof/rvv-intrinsic-ledger.json'),'RVV_configuration':rvv['configuration'],'NEON_FP_configuration':neon['FP_configuration'],'new_project_axioms':0,'formal_ISA_compiler_or_ABI_refinement_proved':False,'human_final_review':'pending'}

def main():
    result=audit();path=C/'proof/intrinsic-boundary-status.json';path.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'passed':True,'whole_kernel_verified':False,'native_spec_views':30,'unique_original_intrinsic_names':28,'human_final_review':'pending'}))
if __name__=='__main__':main()
