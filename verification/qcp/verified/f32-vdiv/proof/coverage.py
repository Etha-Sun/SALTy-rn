"""Close the C calls and Coq checkers of this fixed VADD proof package.

This deliberately handles the package's simple, preprocessed C functions only:
no function pointers, attributes, strings, or nested function declarations.
Extern Coq annotations name logical definitions; they are not C callees.
"""
import re


# namespace, input stem, checked Coq file, implementing module, actual C bodies
UNITS = [
    ('QcpVadd', 'array_read', 'array_read_checked', 'CheckedArrayRead',
     {'qcp_vadd_read'}),
    ('NanBridge', 'bridge', 'bridge_checked', 'Checked',
     {'preserve_float', 'check_observation', 'same_lane'}),
    ('VaddComparator', 'comparator', 'comparator_checked', 'CheckedComparator',
     {'compare_outputs'}),
    ('VaddWrapper', 'wrapper', 'wrapper_checked', 'CheckedWrapper',
     {'equivalent'}),
    ('ByValue', 'neon_unit', 'neon_full_checked', 'CheckedOriginalNeon',
     {'test_neon'}),
    ('ByValue', 'shim_unit', 'shim_checked', 'CheckedShim',
     {'vld1q_f32', 'vdivq_f32', 'qcp_vst1q_f32', 'qcp_vst1_f32',
      'vget_low_f32', 'vget_high_f32', 'qcp_vst1_lane_f32', 'qcp_assert'}),
    ('ByvalueRvv', 'macro_unit', 'MacroKernelChecked', 'KernelChecked',
     {'test_rvv', 'qcp_assert', '__riscv_vsetvl_e32m8'}),
    ('ByvalueRvv', 'shim', 'shim_checked', 'Checked',
     {'qcp_byvalue_load', 'qcp_byvalue_div', 'qcp_byvalue_store'}),
    ('QcpRvv32', 'rvv_load', 'rvv_load_checked', 'CheckedRvvLoad',
     {'qcp_rvv_read_lane', '__riscv_vle32_v_f32m8'}),
    ('QcpRvv32', 'rvv_add', 'rvv_add_checked', 'CheckedRvvAdd',
     {'f32_div', 'qcp_rvv_div_lane32', '__riscv_vfdiv_vv_f32m8'}),
    ('QcpRvv32', 'rvv_store', 'rvv_store_checked', 'CheckedRvvStore',
     {'qcp_rvv_get32', 'qcp_rvv_store_next', '__riscv_vse32_v_f32m8'}),
]
REVIEW_NAMESPACES = {'QcpVadd', 'NanBridge', 'VaddComparator', 'VaddWrapper'}
COMMENT = re.compile(r'/\*.*?\*/|//[^\n]*', re.S)
FUNCTION = re.compile(
    r'(?m)^[ \t]*(?:[A-Za-z_]\w*[ \t]+|\*[ \t]*)+'
    r'([A-Za-z_]\w*)\s*\([^;{}]*?\)')
CALL = re.compile(r'\b([A-Za-z_]\w*)\s*\(')
C_KEYWORDS = {'if', 'while', 'for', 'switch', 'sizeof', '_Alignof'}


def _mask_comments(text):
    return COMMENT.sub(lambda m: re.sub(r'[^\n]', ' ', m.group()), text)


def _functions(text, label):
    """Yield name, normalized signature/contract, and optional body calls."""
    masked = _mask_comments(text)
    if '"' in masked or "'" in masked:
        raise ValueError(label + ': string/character literals need parser support')
    end_of_body = 0
    for match in FUNCTION.finditer(masked):
        if match.start() < end_of_body:
            continue
        name = match.group(1)
        position = match.end()
        while position < len(masked) and masked[position].isspace():
            position += 1
        if position == len(masked) or masked[position] not in ';{':
            raise ValueError(label + ': unsupported function declaration: ' + name)
        annotations = re.findall(r'/\*@.*?\*/', text[match.end():position], re.S)
        if len(annotations) != 1 or not re.search(r'\bRequire\b', annotations[0]) or not re.search(r'\bEnsure\b', annotations[0]):
            raise ValueError(label + ': expected one Require/Ensure contract: ' + name)
        contract = re.sub(r'\s', '', annotations[0])
        signature = re.findall(r'\w+|[^\s\w]', match.group())
        signature = tuple(token for token in signature if token != 'restrict')
        calls = None
        if masked[position] == '{':
            begin = position + 1
            depth = 1
            position = begin
            while position < len(masked) and depth:
                depth += (masked[position] == '{') - (masked[position] == '}')
                position += 1
            if depth:
                raise ValueError(label + ': unmatched braces: ' + name)
            end_of_body = position
            calls = set(CALL.findall(masked[begin:position - 1])) - C_KEYWORDS
        yield name, signature, contract, calls


def check_coverage(manifest, units, review_only=False):
    """Validate fixed unit/body/callee/root coverage; return FinalCheck.v text.

    units contains dictionaries with namespace, stem, and text after CPP.
    Contracts are intentionally compared exactly apart from whitespace, rather
    than accepting a stronger precondition or a weaker postcondition silently.
    Review-only mode is explicitly conditional on test_neon/test_rvv contracts;
    full mode permits no external C callees without a checked body.
    """
    required = [item for item in UNITS
                if not review_only or item[0] in REVIEW_NAMESPACES]
    expected = {(namespace, stem) for namespace, stem, *_ in required}
    actual = [(item['namespace'], item['stem']) for item in units]
    if len(actual) != len(set(actual)) or set(actual) != expected:
        raise ValueError('C unit coverage mismatch: missing=' + repr(expected - set(actual))
                         + ', unexpected=' + repr(set(actual) - expected))

    modules = {(item['namespace'], item['name']) for item in manifest['modules']}
    roots = set(manifest['roots'])
    imports, checks = [], []
    for namespace, stem, checked, instance, _ in required:
        goal = stem + '_goal'
        root = namespace + '.' + checked
        for name in (goal, checked):
            if (namespace, name + '.v') not in modules:
                raise ValueError('Required Coq module missing: ' + namespace + '.' + name)
        if root not in roots:
            raise ValueError('Required proof root missing: ' + root)
        imports.append('Require Import ' + namespace + '.' + goal + ' ' + root + '.')
        checks.append('Module Check_' + namespace + '_' + stem + ' : '
                      + namespace + '.' + goal + '.VC_Correct := '
                      + root + '.' + instance + '.')

    expected_bodies = {(ns, stem): bodies for ns, stem, _, _, bodies in required}
    declarations, definitions, callers = {}, set(), []
    for item in units:
        key = item['namespace'], item['stem']
        label = '/'.join(key)
        bodies = set()
        for name, signature, contract, calls in _functions(item['text'], label):
            old = declarations.get(name)
            current = signature, contract
            if old is not None and old[0] != current:
                raise ValueError('C declaration/body contract or signature mismatch for '
                                 + name + ': ' + old[1] + ' versus ' + label)
            declarations[name] = current, label
            if calls is not None:
                if name in bodies:
                    raise ValueError(label + ': duplicate C body: ' + name)
                bodies.add(name)
                definitions.add(name)
                callers.append((label + ':' + name, calls))
        if bodies != expected_bodies[key]:
            raise ValueError(label + ': C body coverage mismatch: missing='
                             + repr(expected_bodies[key] - bodies)
                             + ', unexpected=' + repr(bodies - expected_bodies[key]))
    conditional = {'test_neon', 'test_rvv'} if review_only else set()
    for caller, calls in callers:
        missing = calls - definitions - conditional
        if missing:
            raise ValueError(caller + ': unproved external C callees: ' + repr(missing))
    missing = set(declarations) - definitions - conditional
    if missing:
        raise ValueError('C declarations without proved bodies: ' + repr(missing))
    return '\n'.join(imports + [''] + checks) + '\n'
