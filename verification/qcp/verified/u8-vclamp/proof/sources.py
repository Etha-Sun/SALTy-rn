"""Render current public impl/spec/shim; proof/c contains annotation placements only."""
from pathlib import Path
import hashlib, json, re, shutil

CASE = Path(__file__).resolve().parent.parent
TOKEN = re.compile(r'/\*.*?\*/|//[^\n]*|\w+|[^\s]', re.S)
HELPER = re.compile(r'^(?:unsigned char|size_t|vuint8m8_t|void|uint32_t) '
                    r'([A-Za-z0-9_]+)\([^\n]*\)\n/\*@(?:(?!\*/).)*\*/\n\{[^{}]*\}', re.M|re.S)
BODY_START = re.compile(r'^\s*(?:static\s+|inline\s+)*(?:void|int|size_t|uint\w+|'
                        r'unsigned char|unsigned short|unsigned int|vuint8m8_t|struct\s+\w+)'
                        r'\s+([A-Za-z_]\w*)\s*\([^;{}]*\)\s*\{', re.M)
DECLARATION = re.compile(r'^(?:unsigned char|size_t|vuint8m8_t|void|uint32_t) '
                         r'([A-Za-z0-9_]+)\([^\n]*\)\s*/\*@(?:(?!\*/).)*\*/\s*', re.M|re.S)
sha = lambda p: hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(text): return [m[0] for m in TOKEN.finditer(text) if not m[0].startswith(('/*','//'))]
def contract(function, case=CASE):
    pattern = r'void\s+'+re.escape(function)+r'\([^;{}]*\)\s*(/\*@.*?\*/)\s*;'
    matches = re.findall(pattern, (case/'spec.c').read_text(), re.S)
    assert len(matches) == 1, ('public callee contract', function)
    return matches[0]

def render_kernel(unit, case=CASE, override=None):
    data = json.loads((case/'proof/c'/(unit+'.json')).read_text())
    text = (case/data['impl']).read_text() if override is None else override
    assert hashlib.sha256(text.encode()).hexdigest() == data['source_sha256'], 'impl identity changed'
    spans = [m for m in TOKEN.finditer(text) if not m[0].startswith(('/*','//'))]
    assert not any(m[0] == '#' for m in spans), 'unexpected impl preprocessor directive'
    positions = {}
    annotations = [dict(before_token=data['contract_before_token'], text=contract(data['function'], case)),
                   *data['annotations']]
    for item in annotations:
        a = item['text']; assert a.startswith('/*@') and a.endswith('*/')
        if item in data['annotations']:
            assert not re.search(r'\b(?:Require|Ensure)\b', a), 'private contract forbidden'
            assert re.match(r'/\*@\s*(?:Inv|Assert|where)\b', a), 'unknown annotation kind'
        ordinal = item['before_token']; assert 0 <= ordinal < len(spans)
        positions.setdefault(spans[ordinal].start(), []).append(a)
    annotated = text
    for offset, values in sorted(positions.items(), reverse=True):
        annotated = annotated[:offset]+'\n'+'\n'.join(values)+'\n'+annotated[offset:]
    assert tokens(annotated) == tokens(text)
    return (case/data['frontend']).read_text(), text, annotated

def canonical_helpers(case=CASE):
    text = (case/'shim/rvv/packed_impl.c').read_text()
    result = {m[1]:m[0] for m in HELPER.finditer(text)}
    assert len(result) == 17
    return result

def render_unit(unit, folder, case=CASE):
    folder.mkdir(parents=True, exist_ok=False); name = unit['name']
    side = 'neon' if name in ['neon','public'] else 'rvv'
    for source in (case/'shim'/side).iterdir():
        if source.suffix in ['.c','.h','.strategies']: shutil.copyfile(source, folder/source.name)
    entry = folder/('public_unit.c' if name == 'public' else 'unit.c')
    raw = None
    if name in ['neon','rvv_original','rvv_repaired']:
        prefix, original, annotated = render_kernel(name, case)
        entry.write_text(prefix+annotated)
        raw = folder/'raw.c'; raw.write_text(prefix+original)
    elif name == 'public': entry.write_bytes((case/'spec.c').read_bytes())
    else:
        helpers = canonical_helpers(case)
        if name in ['vle','vmin','vmax']:
            fn = dict(vle='__riscv_vle8_v_u8m8', vmin='__riscv_vminu_vx_u8m8',
                      vmax='__riscv_vmaxu_vx_u8m8')[name]
            text = '#define QCP_IMPLEMENT_'+fn+'\n#include "packed.h"\n'+helpers[fn]+'\n'
        else:
            layout = (case/'shim/units'/(name+'.h')).read_text()
            assert not list(HELPER.finditer(layout)), 'helper body must come from public packed_impl.c'
            text = re.sub(r'/\* QCP_BODY:(\w+) \*/', lambda m: helpers[m[1]], layout)
            assert 'QCP_BODY:' not in text
        entry.write_text(text)
    return entry, raw

def definitions(text):
    code = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    result = {}
    for m in BODY_START.finditer(code):
        start = pos = m.end(); depth = 1
        while depth:
            assert pos < len(code)
            depth += (code[pos]=='{')-(code[pos]=='}'); pos += 1
        calls = set(re.findall(r'\b([A-Za-z_]\w*)\s*\(', code[start:pos]))
        calls -= {'if','for','while','sizeof','return','uint32_t','unsigned','char','int','size_t'}
        assert m[1] not in result
        result[m[1]] = sorted(calls)
    return result

def audit_coverage(results, case=CASE):
    canonical = canonical_helpers(case)
    canon_contracts = {m[1]:re.sub(r'\s+','',m[0]) for m in DECLARATION.finditer(
        (case/'shim/rvv/packed_impl.c').read_text())}
    units = {}; helper_units = {}; counts = {}; external = 0
    for result in results:
        name = result['name']; text = Path(result['CPP']).read_text(); functions = definitions(text)
        fields = re.findall(r'^Axiom proof_of_(\w+)',Path(result['goal']).read_text(),re.M)
        assert sum(sum(v.startswith(fn+'_') for v in fields) for fn in functions) == len(fields)
        assert all(any(v.startswith(fn+'_') for v in fields) for fn in functions)
        units[name] = functions; counts[name] = len(fields)
        declarations = []
        if name not in ['neon','public']:
            for m in re.finditer(DECLARATION.pattern+';',text,re.M|re.S):
                assert re.sub(r'\s+','',m[0][:-1]) == canon_contracts[m[1]], (name,m[1])
                declarations.append(m[1]); external += 1
            for calls in functions.values(): assert set(calls) <= set(functions)|set(declarations)
        if name not in ['neon','public','rvv_original','rvv_repaired']:
            ds = {m[1]:m[0] for m in HELPER.finditer(text)}
            assert set(ds) == set(functions)
            for fn, definition in ds.items():
                assert definition == canonical[fn] and fn not in helper_units
                helper_units[fn] = name
    assert set(helper_units) == set(canonical) and external == 87
    cases = []
    for rvv, expected in [('rvv_original',939),('rvv_repaired',973)]:
        selected = set(units)-({'rvv_original','rvv_repaired'}-{rvv}); graph = {}
        for unit in selected:
            for fn,calls in units[unit].items():
                edges = []
                for callee in calls:
                    if callee in units[unit]: target = unit
                    elif unit == 'public': target = {'test_neon':'neon','test_rvv':rvv}[callee]
                    else:
                        assert unit != 'neon', ('unproved NEON callee',callee)
                        target = helper_units[callee]
                    edges.append(target+':'+callee)
                graph[unit+':'+fn] = edges
        active = set(); done = set()
        def visit(node):
            assert node not in active, ('circular contract assumption',node)
            if node in done:return
            active.add(node)
            for child in graph[node]:visit(child)
            active.remove(node);done.add(node)
        for node in graph:visit(node)
        assert sum(counts[u] for u in selected) == expected
        cases.append(dict(variant=rvv, C_units=len(selected), C_bodies_by_unit=len(graph),
                          C_VCs=expected, call_graph=graph, unproved_callees=[]))
    return dict(passed=True, exact_helper_bodies=17, exact_external_declarations=external,
                contracts_from_public_spec=True, cases=cases)
