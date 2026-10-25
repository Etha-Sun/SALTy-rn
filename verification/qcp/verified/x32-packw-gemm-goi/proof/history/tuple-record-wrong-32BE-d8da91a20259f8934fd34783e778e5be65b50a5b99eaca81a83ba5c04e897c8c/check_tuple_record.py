#!/usr/bin/env python3
"""Actual nested-record C copy, with audited case-local generated-proof repairs.

Record definitions and lemma propositions are preserved. No toolchain edits,
new axioms, scalar projection, or complete-kernel credit.
"""
from pathlib import Path
import difflib, hashlib, json, os, re, shutil, subprocess, tempfile, time
C=Path(__file__).resolve().parents[1]
R=next(p for p in C.parents if (p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()

def main():
    quota=json.loads((R/'.build/memory/quota/state.json').read_text())
    assert not quota['wind_down_requested']
    run=Path(tempfile.mkdtemp(prefix='tuple-record-fresh-',dir=C/'.build'))
    snapshot=run/'input';Q=run/'coq';gen=run/'generated'
    Q.mkdir();gen.mkdir()
    inputs=['shim/tuple_record.c','shim/tuple_types.h','proof/coq/TupleRecordChecked.v','proof/check_tuple_record.py']
    pins={p:sha(C/p)for p in inputs}
    for p in inputs:
        target=snapshot/p;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(C/p,target)
    records=[]
    status={'passed':False,'whole_kernel_verified':False,'scope':'Actual ordinary tuple-record C copy only; no complete original SIMD kernel/ISA credit',
            'run_directory':str(run),'input_sha256':pins,'records':records,
            'configured_jobs':32,'actual_max_parallel_processes':1,'memory_GiB':16,'timeout_seconds':7200}
    env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
    def execute(label,command):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,command)]
        log=run/(label+'.log');start=time.monotonic()
        try:
            with log.open('w')as out:rc=subprocess.run(cmd,cwd=run,env=env,stdout=out,stderr=out,timeout=7200).returncode
        except subprocess.TimeoutExpired:rc=124
        records.append({'label':label,'command':cmd,'exit_code':rc,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
        print(label,rc,flush=True)
        assert rc==0,(label,log.read_text()[-2500:])
    try:
        expanded=run/'tuple_record.c'
        execute('cpp',['gcc','-E','-P','-CC','-nostdinc',snapshot/'shim/tuple_record.c','-o',expanded])
        execute('qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(expanded),'--coq-output-dir='+str(gen),'--coq-logic-path=X32Packw','-slp',snapshot/'shim','X32Packw'])
        raw_path=gen/'tuple_record_def.v';raw=raw_path.read_text()
        # Dependency order only: the emitter emits the outer record first.
        outer=raw.index('Record Recorduint32x2x2_t');inner=raw.index('Record Recorduint32x2_t')
        assert outer<inner
        header,outer_block,inner_block=raw[:outer],raw[outer:inner],raw[inner:]
        assert raw==header+outer_block+inner_block
        ordered=header+inner_block+outer_block
        # Array.undef_full_to_align already yields store_align_n. Its generated
        # proof incorrectly applies the scalar store_align4 conversion again.
        needle='  sep_apply Structuint32x2_tArray.undef_full_to_align.\n  sep_apply store_align4_to_store_align.\n'
        assert ordered.count(needle)==1
        checked=ordered.replace(needle,'  sep_apply Structuint32x2_tArray.undef_full_to_align.\n')
        erase_proofs=lambda text:re.sub(r'Proof\..*?Qed\.','Proof. CHECKED_BODY. Qed.',text,flags=re.S)
        assert erase_proofs(ordered)==erase_proofs(checked)
        assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',re.sub(r'\(\*.*?\*\)','',checked,flags=re.S))
        (Q/raw_path.name).write_text(checked)
        patch=run/'generated-proof-only.patch'
        patch.write_text(''.join(difflib.unified_diff(ordered.splitlines(keepends=True),checked.splitlines(keepends=True),fromfile='ordered_def.v',tofile='checked_def.v')))
        goal=gen/'tuple_record_goal.v';shutil.copy2(goal,Q/goal.name)
        fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert len(fields)==3
        shutil.copy2(snapshot/'proof/coq/TupleRecordChecked.v',Q/'TupleRecordChecked.v')
        cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())
        dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq'
        flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(dep.iterdir())if p.is_dir()),[])+['-Q',str(Q),'X32Packw']
        for name in ['tuple_record_def','tuple_record_goal','TupleRecordChecked']:
            execute(name,[*flags,Q/(name+'.v')])
        assert pins=={p:sha(C/p)for p in inputs}
        proof_log=(run/'TupleRecordChecked.log').read_text()
        reports=len(re.findall(r'^(?:Axioms:|Closed under the global context)',proof_log,re.M));assert reports==4
        status.update(passed=True,actual_C_fields=3,fresh_local_modules=3,Print_reports=reports,
                      actual_goal_sha256=sha(goal),raw_definition_sha256=sha(raw_path),checked_definition_sha256=sha(Q/raw_path.name),
                      generated_record_block_permutation=[1,0],nonproof_definitions_and_propositions_unchanged=True,
                      generated_proof_patch_sha256=sha(patch),goal_bytes_unchanged=(Q/goal.name).read_bytes()==goal.read_bytes(),
                      checked_module='X32Packw.TupleRecordChecked.CheckedRecordCopy',second_exact_ascription=True,
                      no_component_proof_vo_reused=True,checked_source_sha256={p.name:sha(p)for p in Q.glob('*.v')},
                      address_lemma_origin='verified/f32-f16-vcvt/proof/coq/VectorSupport.v f16_local_field_address, statement/body unchanged except name')
    except Exception as error:status['error']=str(error)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    dest=C/'proof/tuple-record-status.json'
    if dest.exists():
        history=C/'proof/history';history.mkdir(exist_ok=True);shutil.copy2(dest,history/(dest.stem+'-'+sha(dest)+'.json'))
    dest.write_bytes((run/'status.json').read_bytes())
    print(json.dumps({k:v for k,v in status.items()if k not in ['input_sha256','records','checked_source_sha256']},indent=2))
    raise SystemExit(not status['passed'])

if __name__=='__main__':main()
