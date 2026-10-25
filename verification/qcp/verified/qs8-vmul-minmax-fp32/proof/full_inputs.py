"""Render current actual C units without running or rewriting component checks.

This module provides source identity, not proof credit.  In particular, importing
the kernel constructor does not invoke its guarded CLI or overwrite annotations.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import re

CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())
NAMESPACE = NS = 'Qs8Mul'
HELPER_SOURCES = {
    'qm_mull_high': 'shim/qm_mull_high.c',
    'qm_mull_low': 'shim/qm_mull_low.c',
    'qm_add_reinterpret': 'shim/qm_add_reinterpret.c',
    'qm_narrow_pair': 'shim/qm_narrow_pair.c',
    'qm_store4': 'shim/qm_store4.c',
    'qm_store2': 'shim/qm_store2.c',
    'qm_store1': 'shim/qm_store1.c',
    'qm_ext_self': 'shim/qm_ext_self.c',
    'qm_get32': 'shim/qm_get32.c',
    'qm_store32': 'shim/qm_store32.c',
    'qm_sext_sub': 'shim/qm_sext_sub.c',
    'control': 'shim/control.c',
    'qm_scale_is_nan': 'shim/qm_scale_is_nan.c',
    'store_body': 'shim/store.c',
    'vl_control': 'shim/vl_control.c',
    'float_borrow_unit': 'shim/float_borrow.c',
    'load_into_unit': 'shim/load_into.c',
    'record_input_consumers': 'shim/record_input_consumers.c',
    'record_fp_consumers': 'shim/record_fp_consumers.c',
    'record_compute': 'shim/record_compute.c',
}


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def read(path):
    return json.loads(Path(path).read_text())


def require(condition, message):
    if not condition:
        raise ValueError(message)


def tokens(text):
    return re.findall(r'\w+|[^\s]', re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S))


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def construction(stem):
    if stem in HELPER_SOURCES:
        source = HELPER_SOURCES[stem]
        kind, generator, annotation = 'actual_ordinary_C_helper', None, None
        inputs = [source]
    elif stem in {'neon_unit', 'rvv_unit'}:
        side = stem.split('_')[0]
        source = 'impl/' + ('testNEON.c' if side == 'neon' else 'testRVV.c')
        kind = 'current_kernel_with_annotations_only'
        generator = 'proof/prepare_kernels.py'
        annotation = 'proof/c/' + side + '.annotations.json'
        frontend = 'shim/' + side + ('_frontend.h' if side == 'neon' else '_frontend_prefix.h')
        inputs = [source, 'spec.c', frontend, generator,
                  annotation, 'proof/intrinsic-contract-inventory.json']
    elif stem == 'public_unit':
        source, kind = 'spec.c', 'current_public_compare_and_equivalent'
        generator, annotation = 'proof/prepare_public.py', None
        inputs = [source, generator]
    elif stem == 'type_width':
        source, kind = 'proof/c/type_width.c', 'actual_C_width_and_signedness_probes'
        generator, annotation = None, None
        inputs = [source, 'shim/type_width_probe.h', 'shim/types.h']
    else:
        raise ValueError('Unknown actual C unit ' + stem)
    return dict(stem=stem, source=source, kind=kind, generator_source=generator,
                annotation_file=annotation,
                direct_source_sha256={n: sha(CASE / n) for n in inputs})


def public_text():
    raw = (CASE / 'spec.c').read_text()
    annotated = raw
    invariant = ('/*@ Inv Assert 0<n && n<=18446744073709551615 && n==n@pre '
                 '&& left==left@pre && right==right@pre && 0<=i && i<=n '
                 '&& CharArray::full(left,n,L) * CharArray::full(right,n,L) */')
    require(annotated.count(' while(i<n){') == 1, 'Public loop anchor changed')
    annotated = annotated.replace(' while(i<n){', invariant + '\n while(i<n){', 1)
    binding = '/*@ where M=M,AZ=AZ,BZ=BZ,Scale=Scale,OZ=OZ,Lo=Lo,Hi=Hi */'
    for side, output in [('neon', 'left'), ('rvv', 'right')]:
        call = f'test_{side}(n,input_a,input_b,{output},params);'
        require(annotated.count(call) == 1, 'Public kernel call anchor changed')
        annotated = annotated.replace(call, call[:-1] + ' ' + binding + ';', 1)
    call = 'compare_outputs(n,left,right);'
    require(annotated.count(call) == 1, 'Public comparator call anchor changed')
    annotated = annotated.replace(call, call[:-1] +
        ' /*@ where L=qm_values(n,M,input_a,input_b,AZ,BZ,Scale,OZ,Lo,Hi) */;', 1)
    require(tokens(raw) == tokens(annotated), 'Public C tokens changed')
    return raw, annotated


def absolute_includes(text, source_directory=None):
    def fix(match):
        path = ((source_directory or CASE) / match[1]).resolve()
        require(path.is_relative_to(ROOT.resolve()), 'Include escapes repository')
        return '#include "' + str(path) + '"'
    return re.sub(r'^\s*#\s*include\s*"([^\"]+)"', fix, text, flags=re.M)


def render_unit(stem, destination, expected_recipe=None):
    destination = Path(destination)
    require(destination.resolve().is_relative_to((CASE / '.build').resolve()),
            'Materialize generated C only in this case private .build')
    destination.parent.mkdir(parents=True, exist_ok=True)
    recipe = construction(stem)
    require(expected_recipe is None or recipe == expected_recipe,
            'Construction recipe/source drift: ' + stem)
    identity = None
    raw_source = None
    flags = []
    if stem in HELPER_SOURCES or stem == 'type_width':
        text = '#include "' + str(CASE / recipe['source']) + '"\n'
        if stem in {'float_borrow_unit', 'load_into_unit', 'record_input_consumers',
                    'record_fp_consumers', 'record_compute'}:
            flags = ['-DQS8MUL_FORMAL=1']
    elif stem in {'neon_unit', 'rvv_unit'}:
        side = stem.split('_')[0]
        constructor = module('qs8mul_frozen_kernel_constructor', CASE / recipe['generator_source'])
        raw, annotated, metadata = constructor.construct(side)
        require(metadata == read(CASE / recipe['annotation_file']),
                'Installed kernel annotations differ from current constructor')
        require(tokens(raw) == tokens(annotated), 'Kernel C tokens changed')
        frontend = side + ('_frontend.h' if side == 'neon' else '_frontend_prefix.h')
        prefix = '#include "' + str(CASE / 'shim' / frontend) + '"\n'
        text = prefix + annotated
        identity = prefix + raw
        raw_source = recipe['source']
        if side == 'rvv':
            # The actual repaired source includes its ordinary record helper
            # header relative to impl/, also when materialized under .build.
            flags = ['-I', str(CASE / 'impl')]
    else:
        raw, text = public_text()
        identity, raw_source = raw, 'spec.c'
        flags = ['-DQCP_FORMAL']
    include_base = CASE / 'impl' if stem in {'neon_unit', 'rvv_unit'} else CASE
    text = absolute_includes(text, include_base)
    identity = absolute_includes(identity, include_base) if identity is not None else None
    destination.write_text(text)
    raw_path = destination.with_name(stem + '.raw.c') if identity is not None else None
    if raw_path is not None:
        raw_path.write_text(identity)
    return dict(stem=stem, label=stem, text=text, cpp_flags=flags,
                construction=recipe, identity_source=raw_source,
                identity_text=identity, private_source_path=str(destination),
                private_identity_path=str(raw_path) if raw_path is not None else None)


def goal_source(row, strategy=False):
    """Retained target identity, with a completed immutable archive fallback.

    A subsequent full run always regenerates the target; this is no object or
    historical proof reuse. Fresh clones need not possess old private outputs.
    """
    path = Path(row['goal_path'])
    if path.is_file():
        require(sha(path) == row['goal_sha256'], 'Retained target changed')
        return path
    archive = CASE / 'proof/evidence/full-run'
    status = read(archive / 'status.json')
    require(status.get('passed') is True and status.get('whole_kernel_verified') is True,
            'No completed immutable target archive available')
    path = (archive / 'strategies' / (row['stem'] + '.v') if strategy else
            archive / 'units' / row['stem'] / 'goal.v')
    require(sha(path) == row['goal_sha256'], 'Archived target identity changed')
    return path


def inventory_units(require_complete=True):
    """Read the canonical provider map; reject partial components at freeze time.

    This checks source/target identity. It cannot replace the final fresh Coq
    instance checks, even when every component receipt is already successful.
    """
    inventory = read(CASE / 'proof/component-unit-inventory.json')
    expected = set(HELPER_SOURCES) | {'neon_unit', 'rvv_unit', 'public_unit', 'type_width'}
    rows = inventory['units']
    require(len(rows) == 24 and {u['stem'] for u in rows} == expected,
            'Expected precisely the 24 current actual C translation units')
    require(inventory['expected_unique_actual_C_bodies'] == 40,
            'Ordinary C body inventory changed')
    result = []
    for row in rows:
        stem = row['stem']
        require(row['namespace'] == NS, 'Wrong namespace: ' + stem)
        require(sha(CASE / row['actual_source']) == row['source_sha256'],
                'Current source differs from inventory: ' + stem)
        require(row['actual_source'] == construction(stem)['source'],
                'Actual source recipe mismatch: ' + stem)
        if require_complete:
            require(not row.get('component_pending', False), 'Component pending: ' + stem)
            receipt_path = CASE / row['component_status']
            require(sha(receipt_path) == row['component_status_sha256'],
                    'Component receipt identity mismatch: ' + stem)
            require(read(receipt_path)['passed'] is True, 'Component failed: ' + stem)
            target = goal_source(row)
            public_target = CASE / 'proof/coq' / (stem + '_goal.v')
            if public_target.exists():
                require(sha(public_target) == row['goal_sha256'],
                        'Installed goal differs from component: ' + stem)
            fields = re.findall(r'^Axiom proof_of_(\w+)\s*:', target.read_text(), re.M)
            require(fields == row['fields'] and len(fields) == row['actual_C_fields'],
                    'Actual VC field inventory mismatch: ' + stem)
            require(row['typed_instance'].startswith(NS + '.' + row['provider_root'] + '.'),
                    'Provider root differs from typed instance: ' + stem)
        result.append(dict(row, construction=construction(stem)))
    return result


def strategy_units():
    inventory = read(CASE / 'proof/component-unit-inventory.json')
    rows = inventory['strategy_units']
    require({s['stem'] for s in rows} ==
            {'byte_store_strategy_goal', 'rvv_prefix_store_strategy_goal'},
            'Unknown strategy group')
    require(sum(s['fields'] for s in rows) == 7, 'Expected six byte and one prefix fields')
    for row in rows:
        target = goal_source(row, strategy=True)
        require(sha(target) == row['goal_sha256'], 'Installed strategy goal changed')
        require(read(CASE / row['component_status'])['passed'] is True,
                'Strategy component has not passed')
    return rows
