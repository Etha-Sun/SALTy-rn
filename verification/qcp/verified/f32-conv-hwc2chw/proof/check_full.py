#!/usr/bin/env python3
"""Regenerate every actual C/strategy target and freshly compile its full closure.

Only the frozen handoff is accepted. Component .vo files are never copied or
loaded. Intrinsic terminals are limited to the exact source-reviewed ledger;
ordinary helpers, both kernels and the actual public caller require C bodies.
"""
from concurrent.futures import ThreadPoolExecutor
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import threading
import time

TOOL_DIR = Path(__file__).resolve().parent
HERE = CASE = ROOT = None
NS = 'HwcConv'
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
read = lambda p: json.loads(Path(p).read_text())


def require(value, message):
    if not value:
        raise ValueError(message)


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    if hasattr(result, 'configure'): result.configure(CASE)
    return result


def main():
    global HERE, CASE, ROOT
    require(__debug__, 'Optimized Python execution is not supported for verification')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--case', type=Path, required=True)
    parser.add_argument('--config', type=Path, required=True)
    parser.add_argument('--jobs', type=int, default=32)
    parser.add_argument('--live-jobs', type=int, default=1,
                        help='Coordinate this private admission budget across active agent pools')
    args = parser.parse_args()
    CASE = args.case.resolve()
    HERE = CASE / 'proof'
    ROOT = next(p for p in CASE.parents if (p / '.git').exists())
    require(args.jobs == 32 and 1 <= args.live_jobs <= args.jobs, 'Invalid admission budget')
    quota_state = ROOT / '.build/memory/quota/state.json'
    if quota_state.exists():
        require(read(quota_state).get('wind_down_requested') is not True,
                'User quota policy requests wrap-up; do not start a new full batch')
    mem_available = int(re.search(r'^MemAvailable:\s+(\d+)', Path('/proc/meminfo').read_text(), re.M)[1])
    require(mem_available >= (args.live_jobs * 32 + 32) * 1024**2,
            'Insufficient available memory for the declared live heavy-process budget and reserve')
    handoff_path = HERE / 'frozen-full-handoff.json'
    require(handoff_path.is_file(), 'Complete frozen handoff required before any full run')
    handoff, handoff_hash = read(handoff_path), sha(handoff_path)
    require(handoff['namespace'] == NS and handoff.get('complete_handoff') is True and len(handoff['units']) == 13 and
            handoff['actual_c_function_count'] == 19, 'Unexpected case inventory')
    (CASE/'.build').mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='full-', dir=CASE / '.build'))
    coq = run / 'coq'
    local = coq / NS
    local.mkdir(parents=True)
    admission = run / 'live-limit.json'
    admission.write_text(json.dumps({'live_admission_slots': args.live_jobs}) + '\n')
    env = os.environ.copy()
    env['PATH'] = str(ROOT / '.build/simple-kernels-bootstrap/bin') + ':/tmp/qcp-coq820-install/bin:' + env['PATH']
    os.environ['PATH'] = env['PATH']  # coqdep and tool identity resolution use the same environment.
    records, units, strategies, modules = [], [], [], []
    lock = threading.Lock()
    status = dict(passed=False, whole_kernel_verified=False, scope='full',
                  run_directory=str(run), case_directory=str(CASE), handoff_sha256=handoff_hash,
                  parallel_jobs=args.jobs, initial_live_admission_slots=args.live_jobs,
                  live_admission_file=str(admission), ordinary_per_process_memory_GiB=16,
                  heavy_per_process_memory_GiB=32, no_component_vo_reused=True,
                  limits=handoff['limits'],
                  external_libraries_rebuilt=False, records=records,
                  actual_c_units=units, strategies=strategies)
    def save():
        target=run/'status.json';temp=target.with_suffix('.tmp');temp.write_text(json.dumps(status, indent=2)+'\n');temp.replace(target)
    def execute(command, label, timeout=7200, memory_gib=16):
        command = list(map(str, command))
        if command[:2] == ['qcp-env', 'coqc']:
            if label in handoff['heavy_coq_labels']:
                memory_gib, timeout = 32, 14400
            else:
                timeout = max(timeout, 7200)
            if '-time' not in command:
                command.insert(2, '-time')
        require(memory_gib in {16, 32}, 'Invalid process memory limit')
        limit = memory_gib * 1024**3
        command = ['prlimit', '--as=' + str(limit) + ':' + str(limit), '--', *command]
        admission_started = time.monotonic()
        while int(re.search(r'^MemAvailable:\s+(\d+)',Path('/proc/meminfo').read_text(),re.M)[1]) < 64*1024**2:
            require(time.monotonic()-admission_started<1800, 'Finite memory admission expired: '+label)
            time.sleep(5)
        cwd = run / 'jobs' / label
        cwd.mkdir(parents=True, exist_ok=True)
        log = run / (label + '.log')
        started = time.monotonic()
        with log.open('w') as output:
            try:
                code = subprocess.run(command, cwd=cwd, env=env, stdout=output,
                                      stderr=output, timeout=timeout).returncode
            except subprocess.TimeoutExpired:
                code = 124
        with lock:
            records.append(dict(label=label, command=command, cwd=str(cwd), exit_code=code,
                                memory_limit_GiB=memory_gib, timeout_seconds=timeout,
                                seconds=time.monotonic() - started, log_sha256=sha(log)))
            save()
        print(label, code, flush=True)
        require(code == 0, label + ': ' + log.read_text()[-3000:])
    def cpp(source, target, label, flags):
        execute(['gcc', '-E', '-P', '-CC', '-nostdinc', *flags, '-I', CASE,
                 source, '-o', target], label, 600)
    try:
        for name,digest in handoff['tool_sources_sha256'].items():
            require(sha(HERE/name)==digest,'Installed replay tool drift '+name)
        frozen = handoff['frozen_source_sha256']
        for name, digest in frozen.items():
            require(not Path(name).is_absolute() and (CASE / name).resolve().is_relative_to(ROOT.resolve()),
                    'Frozen source escapes repository')
            require(sha(CASE / name) == digest, 'Frozen source changed: ' + name)
        config_hash = sha(args.config)
        config = read(args.config)
        require(config['flags'][:2] == ['qcp-env', 'coqc'] and not any(a.startswith(('-vos','-vok','-quick','-vio')) for a in config['flags']), 'Unexpected ordinary Coq command or fast compilation mode')
        require(config_hash==handoff['coq_config_sha256']and config['flags'][2:]==handoff['coq_flags'], 'Execution config differs from approved frozen profile')
        input_profile=module('approved_input_profile',HERE/'full_inputs.py')
        flags=input_profile.approved_coq_flags(handoff,run)
        for support in handoff['support_modules']:
            namespace=support['namespace'];folder=coq/namespace;folder.mkdir(parents=True,exist_ok=True)
            flags+=['-Q',str(folder),namespace]
            source=CASE/support['source']
            require(sha(source)==support['source_sha256'],'Shared mathematical source drift')
            shutil.copyfile(source,folder/support['name'])
            modules.append(dict(namespace=namespace,name=support['name'],path=str((folder/support['name']).relative_to(run))))
        tool_hashes = {n: sha(Path(shutil.which(n)).resolve()) for n in
                       ['qcp', 'qcp-env', 'coqc', 'coqtop', 'coqdep', 'gcc', 'prlimit', 'patch']}
        strategy_tool = Path(shutil.which('qcp')).resolve().parent / 'StrategyCheck'
        strategy_hash = sha(strategy_tool)
        preparation = module('frozen_preparation', HERE / 'build_full_handoff.py')
        inputs = module('current_inputs', HERE / 'full_inputs.py')
        inventory = read(HERE / 'component-unit-inventory.json')
        current_units = inputs.inventory_units(True)
        require(len(current_units) == len(handoff['units']) and
                all(all(key in frozen_unit and frozen_unit[key] == value for key, value in current.items())
                    for current, frozen_unit in zip(current_units, handoff['units'])),
                'Current component, source, field or provider inventory changed')
        require(preparation.package_audit(CASE) == handoff['package_checks'], 'Package/native/SDK/repair identity changed')
        generated_names = {u['stem'] + '_goal' for u in handoff['units']} | {s['stem'] for s in handoff['strategies']}
        declaration_parser=module('actual_signature_boundary',HERE/'declarations.py')
        declaration_rows=[]
        for name in handoff['own_modules']:
            if name in generated_names:
                continue
            source = HERE / 'coq' / (name + '.v')
            require('proof/coq/' + name + '.v' in frozen, 'Unfrozen proof source')
            text = preparation.clean_coq(source.read_text())
            declaration_rows.extend(declaration_parser.audit(text,name,handoff['allowed_abstract_signature_types'],False))
            shutil.copyfile(source, local / source.name)
            modules.append(dict(namespace=NS, name=source.name, path=str((local / source.name).relative_to(run))))
        expanded_paths = {}
        # Each generation worker owns its C files, output directory, cwd and log.
        def generate_unit(unit):
            stem = unit['stem']
            folder = run / 'units' / stem
            folder.mkdir(parents=True)
            source = folder / (stem + '.c')
            rendered = inputs.render_unit(stem, source, unit['construction'])
            expanded = folder / 'expanded.c'
            cpp(source, expanded, stem + '-cpp', inputs.expand_cpp_flags(unit['cpp_flags']))
            require(sha(expanded) == unit['cpp_sha256'], 'Frozen CPP identity differs: ' + stem)
            if rendered['private_identity_path']:
                original = folder / 'raw-expanded.c'
                cpp(rendered['private_identity_path'], original, stem + '-raw-cpp', inputs.expand_cpp_flags(unit['cpp_flags']))
                require(inputs.tokens(original.read_text()) == inputs.tokens(expanded.read_text()),
                        'Executable token mismatch: ' + stem)
            source.write_bytes(expanded.read_bytes())
            generated = folder / 'generated'
            generated.mkdir()
            command = ['qcp', '--arch=64', '--endian=little', '--no-exec-info', '--no-float-finite-vc']
            command.append('--strategy-application-limit='+('8192' if stem in {'neon_unit','rvv_unit','pixel9_unit','public_mode'} else '1024'))
            command += ['--input-file=' + str(source), '--coq-output-dir=' + str(generated),
                        '--coq-logic-path=' + NS, '-slp', str(CASE / 'shim'), NS,
                        '-slp', str(HERE / 'c'), NS]
            execute(command, stem + '-qcp', 21600, 32)
            goal = generated / (stem + '_goal.v')
            fields = re.findall(r'^Axiom proof_of_(\w+)\s*:', goal.read_text(), re.M)
            require(sha(goal) == unit['goal_sha256'] and fields == unit['fields'],
                    'Fresh actual C target differs: ' + stem)
            representation=unit['definition_representation']
            raw=inputs.check_generated_def(stem,generated,goal,representation)
            if representation['kind']=='record_emit_required':
                require(sha(local/(stem+'_def.v'))==representation['compiled_definition_sha256'] and sha(local/'VectorRecords.v')==representation['representation_model_source_sha256'],'Faithful manual identity drift '+stem)
                shutil.copyfile(raw['raw_path'],folder/(stem+'_def.emitted.v.txt'))
            (folder/'definition-representation.json').write_text(json.dumps(dict(representation,actual_raw=raw),indent=2)+'\n')
            shutil.copyfile(goal, local / goal.name)
            checked = dict(namespace=NS, stem=stem, label=NS + '/' + stem,
                           fields=fields, c_vcs=len(fields), checked_module=unit['typed_instance'],
                           goal_sha256=sha(goal), cpp_sha256=sha(expanded),definition_representation=representation)
            return checked, expanded, dict(namespace=NS, name=goal.name,
                                          path=str((local / goal.name).relative_to(run)))
        # max_workers is a live admission budget, not the configured32 per batch.
        with ThreadPoolExecutor(max_workers=args.live_jobs) as pool:
            generated = list(pool.map(generate_unit, handoff['units']))
        for checked, expanded, item in generated:
            units.append(checked)
            modules.append(item)
            expanded_paths[checked['stem']] = expanded
        coverage = module('full_call_coverage', HERE / 'full_call_coverage.py')
        closure = coverage.audit_sources(expanded_paths, inventory, read(HERE / 'intrinsic-ledger.json'), CASE)
        require(closure == handoff['call_closure'], 'Actual call closure changed')
        status['call_closure'] = closure
        for item in handoff['strategies']:
            stem = item['stem']
            folder = run / ('strategy-' + stem)
            folder.mkdir()
            execute([strategy_tool, '--arch=64', '--endian=little', '--no-exec-info',
                     '--input-file=' + str(CASE / item['source']), '--coq-output-dir=' + str(folder),
                     '--coq-logic-path=' + NS, '-slp', CASE/'shim', NS, '-slp', HERE/'c', NS], 'strategy-' + stem, 600)
            goal = folder / (stem + '.v')
            fields = re.findall(r'^\s*Axiom (\w+)\s*:', goal.read_text(), re.M)
            require(sha(goal) == item['goal_sha256'] and fields == item['field_names'], 'Strategy target drift')
            shutil.copyfile(goal, local / goal.name)
            modules.append(dict(namespace=NS, name=goal.name, path=str((local / goal.name).relative_to(run))))
            require(stem.endswith('_strategy_goal'), 'Unexpected strategy module name')
            strategies.append(dict(namespace=NS, stem=stem,
                                   module_type=item['module_type'], fields=fields,
                                   checked_module=item['typed_instance'], goal_sha256=sha(goal)))
        require(len(modules) == len(handoff['own_modules'])+len(handoff['support_modules']) and not list(coq.rglob('*.vo')),
                'Fresh source closure differs or contains copied objects')
        status['initial_project_VOs']=0
        for name in generated_names:
            declaration_rows.extend(declaration_parser.audit(preparation.clean_coq((local/(name+'.v')).read_text()),name,handoff['allowed_abstract_signature_types'],True))
        (run/'local-declaration-audit.json').write_text(json.dumps({'passed':True,'declarations':declaration_rows},indent=2)+'\n')
        gate = module('full_gate_sources', HERE / 'gate_sources.py')
        for name, text in gate.sources(NS, units, strategies).items():
            source = local / (name + '.v')
            require(not source.exists(), 'Reserved gate source collision')
            source.write_text(text)
            modules.append(dict(namespace=NS, name=source.name, path=str(source.relative_to(run))))
        fresh = {m['namespace'] + '.' + Path(m['name']).stem for m in modules}
        external = module('full_external_dependencies', HERE / 'external_dependencies.py')
        snapshot = external.external_snapshot(run, external.external_imports([run / m['path'] for m in modules], fresh),
                                              flags, execute, 'external-before')
        require(snapshot and not set(snapshot) & fresh and
                not any(n.startswith(NS + '.') for n in snapshot), 'External project object loaded')
        status.update(external_recursive_vo_closure=snapshot, input_sha256=frozen,
                      config_sha256=config_hash, tool_sha256=tool_hashes, strategy_tool_sha256=strategy_hash)
        save()
        parallel = module('full_parallel', HERE / 'parallel.py')
        parallel.compile_modules(modules, run, flags, execute, args.jobs, live_limit_file=admission)
        status['coqdep_record'] = read(run / 'coqdep-status.json')
        constants = gate.identifiers(NS, units, strategies)
        status['assumption_audit_parts'] = [dict(index=i, module=gate.PREFIX + str(i),
                                                 constants=constants[i::gate.PARTS],
                                                 report_count=len(constants[i::gate.PARTS]))
                                             for i in range(gate.PARTS)]
        report = run / gate.REPORT
        with report.open('wb') as output:
            for i in range(gate.PARTS):
                log = run / (NS + '-' + gate.PREFIX + str(i) + '.log')
                text = log.read_text()
                require(text.count('Axioms:') + text.count('Closed under the global context') == len(constants[i::gate.PARTS]),
                        'Incomplete or duplicate final assumptions report')
                output.write(log.read_bytes())
        audit=module('checked_assumption_parser',HERE/'assumptions.py')
        all_reports=[]
        for item in modules:
            path=run/item['path'];label=item['namespace']+'-'+Path(item['name']).stem
            all_reports.extend(audit.audit(path,run/(label+'.log')))
        final_reports=[]
        for i in range(gate.PARTS): final_reports.extend(audit.audit(local/(gate.PREFIX+str(i)+'.v'),run/(NS+'-'+gate.PREFIX+str(i)+'.log')))
        require([r['constant'] for i in range(gate.PARTS) for r in audit.audit(local/(gate.PREFIX+str(i)+'.v'),run/(NS+'-'+gate.PREFIX+str(i)+'.log'))] == [c for i in range(gate.PARTS) for c in constants[i::gate.PARTS]],'Final Print source/constant mapping differs')
        (run/'all-source-assumption-audit.json').write_text(json.dumps({'passed':True,'reports':all_reports,'canonical_names':sorted(set().union(*(set(r['inherited_assumptions'])for r in all_reports)))},indent=2)+'\n')
        (run/'final-assumption-audit.json').write_text(json.dumps({'passed':True,'reports':final_reports},indent=2)+'\n')
        final = local / 'FinalCaseCheck.v'
        final.write_text(gate.final_source(NS, units, strategies))
        execute(['qcp-env', 'coqc', *flags, final], 'FinalCaseCheck')
        modules.append(dict(namespace=NS,name=final.name,path=str(final.relative_to(run))))
        fresh={m['namespace']+'.'+Path(m['name']).stem for m in modules}
        loaded = external.external_snapshot(run, sorted(fresh), flags, execute, 'external-after')
        require({n: r for n, r in loaded.items() if n not in fresh} == snapshot and fresh <= set(loaded),
                'External loaded closure changed or fresh object missing')
        for item in modules:
            name = item['namespace'] + '.' + Path(item['name']).stem
            require(Path(loaded[name]['path']) == (run / item['path']).with_suffix('.vo').resolve(),
                    'Project module resolved outside fresh source tree')
        status['loaded_recursive_vo_closure'] = loaded
        (run / 'external-dependencies.json').write_text(json.dumps({'external': snapshot, 'loaded_after': loaded}, indent=2) + '\n')
        for name, row in snapshot.items():
            require(sha(row['path']) == row['sha256'], 'External object drift: ' + name)
        for name, digest in frozen.items():
            require(sha(CASE / name) == digest, 'Frozen input changed during full replay: ' + name)
        for name, digest in tool_hashes.items():
            require(sha(Path(shutil.which(name)).resolve()) == digest, 'Tool changed during replay')
        require(sha(args.config) == config_hash and sha(handoff_path) == handoff_hash and
                sha(strategy_tool) == strategy_hash, 'Execution identity drift')
        require(sum(u['c_vcs'] for u in units) == handoff['total_actual_c_vcs'] and
                sum(len(s['fields']) for s in strategies) == 4, 'Incomplete complete-case target inventory')
        require(preparation.package_audit(CASE)==handoff['package_checks'],'Package identity changed during formal replay')
        require(len(constants)==3514 and len(final_reports)==3514,'Complete two-interface/observation report count')
        status.update(passed=True, whole_kernel_verified=True,
                      verification_state='checked_repaired_C_under_source_reviewed_intrinsic_spec_boundary',
                      checked_c_units=len(units), checked_c_vcs=sum(u['c_vcs'] for u in units),
                      checked_strategy_fields=4, checked_second_c_fields=1748, checked_second_strategy_fields=4, fresh_compiled_local_modules=len(modules),
                      final_gate_sha256=sha(final), final_gate_path=str(final), final_assumptions_log_sha256=sha(report),
                      final_actual_c_report_count=3496, final_strategy_report_count=8, final_math_report_count=10,
                      final_assumptions_log_path=str(report), all_source_assumption_report_count=len(all_reports),
                      all_source_assumption_audit_sha256=sha(run/'all-source-assumption-audit.json'), final_assumption_audit_sha256=sha(run/'final-assumption-audit.json'),
                      final_assumptions_report_count=len(constants),
                      compiled_source_sha256={m['namespace'] + '.' + Path(m['name']).stem: sha(run / m['path']) for m in modules})
    except Exception as error:
        status['error'] = repr(error)
        print(status['error'], flush=True)
    save()
    destination = HERE / 'full-status.json'
    if destination.exists():
        history = HERE / 'history'
        history.mkdir(exist_ok=True)
        shutil.copyfile(destination, history / ('full-status-' + sha(destination) + '.json'))
    destination.write_bytes((run / 'status.json').read_bytes())
    print('RUN', run, flush=True)
    return 0 if status['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
