"""Archive a completed replay, or audit relocation without rerunning the proof."""
from pathlib import Path
import argparse, concurrent.futures, datetime, importlib.util, json, re, shutil, subprocess, sys, tarfile

CASE = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CASE/'proof'))
from check import audit_inputs
from sources import sha, tokens, render_unit, audit_coverage

INHERITED = {
    'CNotation.LE_arrow_field_congr', 'CNotation.LE_dot_field_congr',
    'CNotation.RE_addr_of_congr', 'CNotation.eval_addr_expr', 'CNotation.eval_addr_expr_congr',
    'CNotation.sizeof_alias_type', 'CNotation.sizeof_enum_type',
    'CNotation.sizeof_struct_type', 'CNotation.sizeof_union_type',
    'FunctionalExtensionality.functional_extensionality_dep',
    'PropExtensionality.propositional_extensionality',
    'SeparationLogic.Snaive_C_Rules64.addr_of_arrow_field',
    'SeparationLogic.Snaive_C_Rules64.eval_addr',
    'ClassicalDedekindReals.sig_forall_dec', 'ClassicalDedekindReals.sig_not_dec',
    'Classical_Prop.classic',
}


def dump(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2)+'\n')


def reports(run):
    expected = {'U8CaseClosure/CaseChecked':939, 'RvvRepair/ControllerChecked':88,
                'RvvRepair/CaseChecked':6, 'RvvRepair/Policy':6,
                'U8ArrayProof/AllChecked':28, 'FullU8/u8_copy_strategy_proof':2,
                'FullU8/packed_copy_strategy_proof':1}
    result = {}; names = set()
    for module, count in expected.items():
        source = run/'coq'/(module+'.v')
        log = run/'coq/.work'/module/'coqc.log'
        text = log.read_text()
        assert len(re.findall(r'^Print Assumptions ', source.read_text(), re.M)) == count
        assert text.count('Axioms:')+text.count('Closed under the global context') == count
        raw_names = set(re.findall(r"^([\w.']+)\s*:", text, re.M))-{'Axioms'}
        # The copy modules import Snaive_C_Rules64 and print this CNotation name unqualified.
        actual = {'CNotation.eval_addr_expr' if n == 'eval_addr_expr' else n for n in raw_names}
        assert actual <= INHERITED, ('unexpected assumptions', module, actual-INHERITED)
        names.update(actual)
        result[module] = dict(count=count, log_sha256=sha(log), names=sorted(actual),
                              printed_names=sorted(raw_names))
    return dict(passed=True, reports=result, inherited_assumption_names=sorted(names),
                strategy_fields=31, C_fields_union=1027, C_variant_counts_not_additive=True,
                policy_lemmas=6)


def archive(run, budget):
    audit_inputs()
    full = json.loads((run/'result.json').read_text())
    assert full['passed'] and full['whole_kernel_verified'] and full['parallel_jobs'] >= 16
    assert full['fresh_compiled_local_modules'] == 458 and not full['old_project_vo_reused']
    for module in full['modules']:
        source = run/'coq'/module['source']
        assert module['exit'] == 0 and sha(source) == module['source_sha256']
        assert sha(source.with_suffix('.vo')) == module['object_sha256']
    for unit in full['actual_C_units']:
        assert sha(unit['CPP']) == unit['CPP_sha256']
        assert sha(unit['goal']) == unit['goal_sha256']
    assert full['native']['passed'] and full['false_goal_rejected'] and full['source_tamper_rejected']
    evidence = CASE/'proof/evidence'
    dest = evidence/run.name
    dest.mkdir(exist_ok=False)
    shutil.copyfile(run/'result.json', CASE/'proof/full-status.json')
    dump(dest/'print-audit.json', reports(run))
    # Check that the installed environment retained the identity recorded before the run.
    toolfile = CASE.parent.parent/'tools/environment.py'
    spec = importlib.util.spec_from_file_location('publication_environment', toolfile)
    environment = importlib.util.module_from_spec(spec); spec.loader.exec_module(environment)
    after = environment.load_environment()
    before = json.loads((run/'environment.json').read_text())
    for key in ['source_identity','compiled_library_provenance','tool_sha256','coqproject_sha256']:
        assert before[key] == after[key], ('environment changed during replay', key)
    dump(dest/'environment-after.json', after)
    shared = {}
    for name in ['environment.py','qcp-2.1.4-source.json']:
        source = toolfile.parent/name
        shutil.copyfile(source, dest/name)
        shared['verification/qcp/tools/'+name] = sha(source)
    dump(dest/'shared-inputs.json', shared)
    local_tools = {}
    for name, binary in [('python',sys.executable),('gcc',after['dependencies']['gcc']),
                         ('coq_makefile',str(Path(after['coqc']).parent/'coq_makefile'))]:
        item = dict(path=str(Path(binary).resolve()), sha256=sha(binary))
        if name != 'coq_makefile':
            item['version'] = subprocess.check_output([binary,'--version'],text=True,timeout=15).strip()
        local_tools[name] = item
    dump(dest/'local-tools.json',local_tools)
    if budget:
        assert budget.is_file()
        assert json.loads(budget.read_text())['exit_code'] == 0
        shutil.copyfile(budget, dest/'budget.json')
        for name in ['launch.json','time.log','service.log','command.log']:
            if (budget.parent/name).is_file(): shutil.copyfile(budget.parent/name, dest/('budget-'+name))
    # Keep raw C, goals, commands, full compiler/Print logs and result records. No binary cache.
    selected = []
    for path in sorted(run.rglob('*')):
        if not path.is_file(): continue
        rel = path.relative_to(run)
        if path.suffix not in {'.c','.h','.strategies','.v','.json','.log'} and path.name not in {
            'Makefile','Makefile.conf','_CoqProject','.Makefile.d'}: continue
        if rel.parts[0] == 'coq' and path.suffix == '.v': continue  # exact public source lock
        selected.append(path)
    archive_path = dest/'replay.tar.xz'
    with tarfile.open(archive_path, 'w:xz') as tar:
        for path in selected: tar.add(path, arcname=str(path.relative_to(run)), recursive=False)
    index = {str(p.relative_to(run)):sha(p) for p in selected}
    dump(dest/'archive.json', dict(archive='replay.tar.xz', sha256=sha(archive_path), members=index,
         historical_run_directory=str(run), public_coq_source_lock='../../coq-source-lock.json'))
    summary = dict(passed=True, run=run.name, original_C_VCs=939, avl128_C_VCs=973,
        checked_C_units_union=13, checked_C_units_per_variant=12, strategy_fields=31,
        ordinary_local_modules=458, final_case_gate_modules=2, unused_source_modules=2,
        jobs=full['parallel_jobs'], total_seconds=full['seconds'],
        stages=[dict(stage=r['stage'],seconds=r['seconds']) for r in full['records']],
        max_single_compiler_RSS_GiB=full['max_compiler_peak_RSS_KiB']/1024**2,
        max_RSS_is_not_aggregate_peak=True, external_libraries_rebuilt=False,
        recursive_coqchk_performed=False, old_project_vo_reused=False)
    dump(dest/'summary.json', summary)
    print(json.dumps(summary, ensure_ascii=False))


def relocate(name):
    inputs = audit_inputs()
    full = json.loads((CASE/'proof/full-status.json').read_text())
    assert full['passed']
    run = CASE/'.build'/name; run.mkdir(parents=True, exist_ok=False)
    manifest = json.loads((CASE/'proof/units.json').read_text())
    old = {u['name']:u for u in full['actual_C_units']}
    def compare(unit):
        folder = run/unit['name']; entry, raw = render_unit(unit, folder)
        cpp = folder/'expanded.c'
        subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(entry),'-o',str(cpp)], check=True, timeout=60)
        assert sha(cpp) == old[unit['name']]['CPP_sha256'], ('relocated CPP differs', unit['name'])
        if raw:
            raw_cpp = folder/'raw-expanded.c'
            subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(raw),'-o',str(raw_cpp)], check=True, timeout=60)
            assert tokens(cpp.read_text()) == tokens(raw_cpp.read_text())
        goal = CASE/'proof/coq'/unit['expected']
        assert sha(goal) == old[unit['name']]['goal_sha256']
        return dict(name=unit['name'], CPP=str(cpp), goal=str(goal), CPP_sha256=sha(cpp),
                    goal_sha256=sha(goal), source_CPP_identity_checked=raw is not None)
    with concurrent.futures.ThreadPoolExecutor(max_workers=16) as pool:
        units = list(pool.map(compare, manifest))
    coverage = audit_coverage(units)
    sources = json.loads((CASE/'proof/coq-source-lock.json').read_text())
    assert all(sha(CASE/'proof/coq'/n)==h for n,h in sources.items())
    assert inputs == audit_inputs()
    result = dict(passed=True, kind='relocation_identity_audit_not_new_Coq_replay',
                  public_inputs=len(inputs), Coq_source_files=len(sources),
                  CPP_units=[{k:v for k,v in u.items() if k not in ['CPP','goal']} for u in units],
                  call_coverage=coverage, new_case_directory=str(CASE), parallel_jobs=16)
    dump(CASE/'proof/evidence/relocation.json', result)
    print('Relocation identity audit passed:', len(units), 'C units')


def record():
    inputs = audit_inputs()
    fullpath = CASE/'proof/full-status.json'; full = json.loads(fullpath.read_text())
    assert full['passed'] and full['input_sha256'] == inputs
    relocation = CASE/'proof/evidence/relocation.json'
    assert json.loads(relocation.read_text())['passed']
    archives = list((CASE/'proof/evidence').glob('*/archive.json'))
    assert archives
    for path in archives:
        index = json.loads(path.read_text()); packed = path.parent/index['archive']
        assert sha(packed) == index['sha256']
        with tarfile.open(packed,'r:xz') as tar:
            actual = {}
            import hashlib
            for item in tar.getmembers():
                assert item.isfile() and not Path(item.name).is_absolute() and '..' not in Path(item.name).parts
                actual[item.name] = hashlib.sha256(tar.extractfile(item).read()).hexdigest()
            assert actual == index['members']
    files = {}
    for path in sorted(CASE.rglob('*')):
        if not path.is_file(): continue
        rel = path.relative_to(CASE)
        if '.build' in rel.parts or '__pycache__' in rel.parts: continue
        if str(rel) in {'proof/manifest.json','proof/status.json'}: continue
        files[str(rel)] = sha(path)
    manifest = dict(schema=1,kernel='u8-vclamp',primary_variant='original',
        optional_variant='RVV AVL<=128',files=files,operational_input_lock='input-lock.json',
        local_Coq_source_lock='coq-source-lock.json',actual_C_units='units.json',
        ordinary_compiled_module_sources=[x['source'] for x in full['modules']],
        installed_environment_record='evidence/'+Path(full['run_directory']).name+'/environment-after.json',
        final_case_gates=['U8CaseClosure.CaseChecked.CaseChecked','RvvRepair.CaseChecked.RepairedCase'])
    dump(CASE/'proof/manifest.json',manifest)
    print_audit = json.loads((CASE/'proof/evidence'/Path(full['run_directory']).name/'print-audit.json').read_text())
    status = dict(schema=1,kernel='u8-vclamp',passed=True,whole_kernel_verified=True,status='proved',
        verification_scope=full['verification_scope'],implementation_variant='original',
        optional_variant='RVV AVL<=128, same catalog entry',full_status='full-status.json',
        full_status_sha256=sha(fullpath),manifest='manifest.json',manifest_sha256=sha(CASE/'proof/manifest.json'),
        relocation='evidence/relocation.json',relocation_sha256=sha(relocation),
        verified_at_UTC=datetime.datetime.now(datetime.timezone.utc).isoformat(),
        ordinary_compiled_local_modules=458,final_case_gate_modules=2,parallel_jobs=full['parallel_jobs'],
        checked_C_units=12,checked_C_units_across_variants=13,unit_vc_fields=939,
        optional_variant_unit_vc_fields=973,strategy_fields=31,
        counts_not_additive=True,old_project_vo_reused=False,external_libraries_rebuilt=False,
        inherited_assumption_names=print_audit['inherited_assumption_names'],
        C_VC_assumption_names=full['inherited_assumption_names'],
        ISA_correspondence_proved=False,termination_theorem_proved=False)
    dump(CASE/'proof/status.json',status)
    print('Publication identities recorded:',len(files),'files')


def verify():
    status = json.loads((CASE/'proof/status.json').read_text())
    manifest_path = CASE/'proof'/status['manifest']
    assert status['passed'] and sha(manifest_path) == status['manifest_sha256']
    manifest = json.loads(manifest_path.read_text())
    for name, digest in manifest['files'].items():
        assert sha(CASE/name) == digest, ('published file changed',name)
    assert sha(CASE/'proof'/status['full_status']) == status['full_status_sha256']
    assert sha(CASE/'proof'/status['relocation']) == status['relocation_sha256']
    audit_inputs()
    full = json.loads((CASE/'proof'/status['full_status']).read_text())
    shared = json.loads((CASE/'proof/evidence'/Path(full['run_directory']).name/'shared-inputs.json').read_text())
    root = CASE.parents[3]
    assert all(sha(root/name) == digest for name,digest in shared.items())
    print('Published file and runtime input identities verified:',len(manifest['files']))


if __name__ == '__main__':
    assert __debug__
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action',choices=['archive','relocate','record','verify'])
    parser.add_argument('--run',type=Path); parser.add_argument('--budget',type=Path)
    parser.add_argument('--name',default='relocation01')
    args = parser.parse_args()
    if args.action == 'archive': archive(args.run.resolve(), args.budget)
    elif args.action == 'relocate': relocate(args.name)
    elif args.action == 'record': record()
    else: verify()
