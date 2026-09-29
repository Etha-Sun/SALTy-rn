#!/usr/bin/env python3
"""Check current-source evidence; imports and correctness proofs stay distinct."""
import hashlib, json, re, time
from pathlib import Path
ROOT=Path(__file__).resolve().parent
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def checked(source,record):
    if not record.exists():return False
    r=json.loads(record.read_text())
    direct_loads=re.findall(r'\bLoad\s+"([^"]+)"',source.read_text())
    loaded=r.get('loaded_source_sha256',{})
    return (r.get('exit_code')==0 and source.with_suffix('.vo').exists() and
            r.get('input_sha256',{}).get(str(source))==sha(source) and
            all(str(Path(path if path.endswith('.v') else path+'.v').resolve()) in loaded
                for path in direct_loads) and
            all(Path(path).exists() and sha(Path(path))==digest
                for path,digest in loaded.items()))

def independent_result(name):
    path=ROOT/'results'/f'coqchk-{name}.json'
    r=json.loads(path.read_text()) if path.exists() else {}
    roots=r.get('checked_roots',{})
    ok=(r.get('exit_code')==0 and r.get('roots_unchanged_during_check') and roots and
        all((ROOT/f'{name}.v').exists() and (ROOT/f'{name}.vo').exists() and
            sha(ROOT/f'{name}.v')==hashes['source_sha256'] and
            sha(ROOT/f'{name}.vo')==hashes['object_sha256']
            for name,hashes in roots.items()))
    return dict(passed=bool(ok),roots=list(roots),seconds=r.get('seconds'))

def main():
    translations={}
    for isa,inventory in [('neon','inventory.json'),('rvv','inventory-rvv.json')]:
        inv=json.loads((ROOT/'simple/results'/inventory).read_text())
        assert sha(ROOT/f'{isa}-simple.elf')==inv['elf_sha256']
        assert sha(ROOT/f'{isa}-simple.S')==inv['assembly_sha256']
        rows=inv['instructions'];missing=[]
        for row in rows:
            addr=row['address'][2:]
            src=ROOT/'simple/generated'/isa/f'a{addr}.v'
            if not checked(src,ROOT/'simple/results'/f'import-{isa}-{addr}.json'):
                missing.append(row['address'])
        src=ROOT/'simple/generated'/isa/'Kernel.v'
        translations[isa]=dict(instructions=len(rows),imported=len(rows)-len(missing),
            missing=missing,map_checked=checked(src,ROOT/'simple/results'/f'map-{isa}.json'),
            elf_sha256=inv['elf_sha256'])
    proofs={}
    for name in ['Programs','StructAssume','RvvArithmetic','RvvVset','RvvSimpleVset','RvvProgress',
                 'NeonZero','NeonSequence','Pointer','NeonSequenceSpec','NeonLoop',
                 'NeonLoopSpec','NeonTail','NeonTailEntry','NeonEdges','NeonFinalize',
                 'NeonKernel','NeonProgram','NeonByteSpec','NeonRegisters','KernelSpec','RvvPacking',
                 'RvvWiden','RvvAdd','RvvWidenFast','RvvAddFast','RvvLoad','RvvReduce',
                 'RvvCompactWiden','RvvCompactAdd','RvvCompactLoad','RvvChunkedLoad',
                 'RvvSharedDefs','RvvWidenShared','RvvAddShared','RvvWidenAdd',
                 'RvvControl','RvvPrepare','RvvInitialize','RvvWritebackFast',
                 'RvvFinishShared','RvvPackingShared','RvvReduceShared',
                 'RvvBytePackingShared','RvvBytePackingAll','RvvLaneMath','RvvStepMath',
                 'RvvSharedSpec','RvvMemory','RvvWindow','RvvLoopControl','RvvEntry',
                 'RvvComposition','RvvUpdateExpressions','RvvUpdateMath',
                 'RvvAllUpdatesFast','RvvCacheRule','RvvTaggedCache',
                 'RvvActiveCache','RvvLoadCaseMath','RvvReadByteFast','RvvLoadSideconds',
                 'RvvIterationConditional','RvvRoundConditional','RvvLoopConditional',
                 'RvvKernelConditional','RvvProgramConditional','RvvByteSpecConditional','KernelMemoryBridge',
                 'RvvLoadUniversal','RvvLoadTerminalPlain','RvvLoadTerminal',
                 'RvvLoadBoundCase0','RvvLoadBoundCase8',
                 'RvvLoadLightCase0','RvvLoadLightCase8',
                 'RvvLoadSuffixCase0','RvvLoadSuffixCase8',
                 'RvvLoadComputedCase0','RvvLoadComputedCase1','RvvLoadComputedCase2',
                 'RvvLoadComputedCase3','RvvLoadComputedCase4','RvvLoadComputedCase5',
                 'RvvLoadComputedCase6','RvvLoadComputedCase7','RvvLoadComputedCase8',
                 'RvvLoadInlineCase0',
                 *[f'RvvLoadGroundCase{k}' for k in range(1,9)],
                 *[f'RvvLoadReadyCase{k}' for k in range(1,9)],
                 *[f'RvvLoadFlexibleCase{k}' for k in range(1,9)],
                 *[f'RvvLoadFastSideCase{k}' for k in range(1,9)],
                 'RvvLoadDeferredCase1','RvvLoadDeferredCase8',
                 'RvvLoadChecked','RvvProgram',
                 'RvvLoadShared','RvvLoadChunked']:
        src=ROOT/f'{name}.v';record=ROOT/'results'/f'proof-{name}.json'
        ok=checked(src,record)
        if ok:
            assert 'Admitted.' not in src.read_text()
            assert 'Closed under the global context' in (ROOT/'logs'/f'proof-{name}.log').read_text()
        r=json.loads(record.read_text()) if record.exists() else {}
        current=r.get('input_sha256',{}).get(str(src))==sha(src)
        resources=ROOT/'logs'/f'proof-{name}.resources.jsonl'
        running=(resources.exists() and time.time()-resources.stat().st_mtime < 90 and
                 (not record.exists() or resources.stat().st_mtime > record.stat().st_mtime))
        outcome=('checked' if ok else 'running' if running else
                 'no-current-result' if not current else
                 'cancelled' if r.get('status')=='cancelled' else
                 'timed-out' if r.get('exit_code') is None else 'failed')
        proofs[name]=dict(checked=ok,source_sha256=sha(src),outcome=outcome,
                         seconds=r.get('seconds') if current else None)
    chk=ROOT/'results/coqchk-neon-kernel.json'
    chk_result=json.loads(chk.read_text()) if chk.exists() else {}
    chk_ok=(chk_result.get('exit_code')==0 and
            chk_result.get('checked_root_source_sha256')==sha(ROOT/'NeonKernel.v') and
            chk_result.get('checked_root_vo_sha256')==sha(ROOT/'NeonKernel.vo'))
    rvv_chk_path=ROOT/'results/coqchk-rvv-composition.json'
    rvv_chk=json.loads(rvv_chk_path.read_text()) if rvv_chk_path.exists() else {}
    rvv_chk_ok=(rvv_chk.get('exit_code')==0 and rvv_chk.get('roots_unchanged_during_check') and
        all(sha(ROOT/f'{name}.v')==hashes['source_sha256'] and
            sha(ROOT/f'{name}.vo')==hashes['object_sha256']
            for name,hashes in rvv_chk.get('checked_roots',{}).items()))
    smoke_path=ROOT/'smoke/result.json'
    smoke=json.loads(smoke_path.read_text()) if smoke_path.exists() else {}
    result=dict(translations=translations,proofs=proofs,
        neon_kernel_independent_coqchk_passed=chk_ok,
        rvv_composition_independent_coqchk_passed=bool(rvv_chk_ok),
        rvv_composition_independent_coqchk_roots=list(rvv_chk.get('checked_roots',{})),
        rvv_all_dynamic_vl_widening_proved=proofs['RvvWidenShared']['checked'],
        rvv_all_dynamic_vl_addition_proved=proofs['RvvAddShared']['checked'],
        rvv_loop_exit_to_return_proved=proofs['RvvFinishShared']['checked'],
        rvv_arbitrary_length_loop_conditional_on_load_contract=
            proofs['RvvLoopConditional']['checked'],
        rvv_entry_to_return_conditional_on_load_contract=
            proofs['RvvKernelConditional']['checked'],
        rvv_actual_instruction_table_conditional_on_load_contract=
            proofs['RvvProgramConditional']['checked'],
        rvv_shared_byte_spec_conditional_on_load_contract=
            proofs['RvvByteSpecConditional']['checked'],
        neon_block_memory_to_flat_bytes_proved=proofs['KernelMemoryBridge']['checked'],
        independent_checks={name:independent_result(name) for name in
            ['rvv-composition','rvv-finish','rvv-conditional-loop',
             'rvv-conditional-kernel','rvv-load-math','rvv-load-helpers',
             'rvv-load-zero','kernel-memory-bridge']},
        conditional_proof_warning='The load contract is a universally quantified premise; '
            'closed global assumptions do not discharge that premise.',
        finite_smoke_tests=dict(status=smoke.get('status','not-run'),
            cases_per_run=smoke.get('cases_per_run'),runs=smoke.get('runs',[]),
            establishes_universal_equivalence=False),
        whole_neon_kernel_correctness_proved=proofs['NeonKernel']['checked'],
        whole_neon_kernel_correctness_kind='Islaris Iris partial correctness, entry to return',
        whole_neon_kernel_termination_proved=False,
        whole_rvv_kernel_correctness_proved=(proofs['RvvLoadChecked']['checked'] and
                                            proofs['RvvProgram']['checked']),
        cross_isa_arbitrary_length_equivalence_proved=False,
        hardware_vlen_bits=256,rvv_lmul=1,rvv_vl_range=[0,8],
        input_length_bound_is_unrolling_bound=False)
    (ROOT/'STATUS.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
