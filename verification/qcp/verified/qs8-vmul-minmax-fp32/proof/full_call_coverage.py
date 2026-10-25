"""Strict actual-C call closure; parser adapted from verified QS8 ADD.
Parser source SHA256: 3efd6acc59092baaa88372fab2332d5abe800f99f8f2d1b8cf04ffaa43a2765e.
No proof credit is inherited from the parser or component receipts.
"""
import re
COMMENT = re.compile(r'/\*.*?\*/|//[^\n]*', re.S)
FUNCTION = re.compile(
    r'(?m)^[ \t]*(?:[A-Za-z_]\w*[ \t]+|\*[ \t]*)+'
    r'([A-Za-z_]\w*)\s*\([^;{}]*?\)')
CALL = re.compile(r'\b([A-Za-z_]\w*)\s*\(')
C_KEYWORDS = {'if', 'while', 'for', 'switch', 'sizeof', '_Alignof', 'return'}
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


def audit_sources(expanded_paths, inventory, ledger, case, require_target_inventory=True):
    """Bind every ordinary call to an actual body, terminals to reviewed specs.

    `expanded_paths` must be the actual C inputs regenerated for the full gate.
    The gate separately proves every unit's newly generated VC_Correct type.
    """
    import hashlib
    from pathlib import Path
    case = Path(case)
    def require(condition, message):
        if not condition:
            raise ValueError(message)
    def digest(path):
        return hashlib.sha256(Path(path).read_bytes()).hexdigest()
    units = {u['stem']: u for u in inventory['units']}
    require(set(expanded_paths) == set(units), 'Actual C coverage unit set differs')
    declarations, definitions, by_unit, pending_targets = {}, {}, {}, []
    for stem, path in expanded_paths.items():
        names = []
        for name, signature, contract, calls in _functions(Path(path).read_text(), stem):
            key = (signature, contract)
            require(name not in declarations or declarations[name] == key,
                    'C signature/contract mismatch for ' + name)
            declarations[name] = key
            if calls is not None:
                require(name not in definitions, 'C function body appears twice: ' + name)
                definitions[name] = dict(unit=stem, calls=sorted(calls),
                                         provider=units[stem]['typed_instance'])
                names.append(name)
        require(names, 'No actual ordinary C bodies: ' + stem)
        by_unit[stem] = sorted(names)
        if not units[stem]['fields'] and units[stem].get('component_pending'):
            require(not require_target_inventory, 'Actual C target inventory pending: ' + stem)
            pending_targets.append(stem)
            continue
        functions_from_goals = set()
        for field in units[stem]['fields']:
            match = re.fullmatch(r'(.+?)_(?:safety|entail|return|partial_solve)_wit_.+', field)
            require(match is not None, 'Unsupported actual C field name: ' + field)
            functions_from_goals.add(match[1])
        require(functions_from_goals == set(names),
                'Actual C functions differ from checked target fields: ' + stem)
    require(len(definitions) == inventory['expected_unique_actual_C_bodies'] == 40,
            'Expected precisely 40 unique ordinary actual C bodies')
    require({'test_neon', 'test_rvv', 'compare_outputs', 'equivalent'} <= set(definitions),
            'Missing actual kernels/comparator/caller')
    require({'test_neon', 'test_rvv', 'compare_outputs'} <= set(definitions['equivalent']['calls']),
            'Public equivalent must call both actual kernels and comparison')
    terminals = {}
    for entry in ledger['entries']:
        if entry['evidence'] != 'source-reviewed-spec':
            continue  # Ordinary adapters may never use the terminal exemption.
        name = entry['name']
        require(name not in terminals and name not in definitions,
                'Duplicate or ordinary terminal exemption: ' + name)
        require(entry['intrinsic_C_body_proof_required'] is False,
                'Unrecognized intrinsic policy: ' + name)
        require(digest(case / entry['header']) == entry['header_sha256'],
                'Intrinsic header changed: ' + name)
        contract = entry['contract']
        require(hashlib.sha256(contract.encode()).hexdigest() == entry['contract_sha256'],
                'Intrinsic contract receipt changed: ' + name)
        rows = list(_functions(contract, 'intrinsic ledger ' + name))
        require(len(rows) == 1 and rows[0][0] == name and rows[0][3] is None,
                'Intrinsic ledger must contain one declaration: ' + name)
        require(name in declarations and declarations[name] == (rows[0][1], rows[0][2]),
                'Current intrinsic contract differs from reviewed ledger: ' + name)
        configuration = entry.get('configuration') or entry.get('legal_configuration')
        require(entry.get('official_source', {}).get('url') and
                entry['official_source'].get('version') and configuration,
                'Missing intrinsic specification provenance: ' + name)
        for definition in entry['Coq_definitions']:
            require(definition['fully_qualified'].startswith('Qs8Mul.') and
                    digest(case / definition['source']) == definition['source_sha256'],
                    'Intrinsic Coq model identity changed: ' + name)
        terminals[name] = dict(header=entry['header'],
                               contract_sha256=entry['contract_sha256'],
                               official_source=entry['official_source'],
                               configuration=configuration,
                               Coq_definitions=entry['Coq_definitions'],
                               formal_ISA_correspondence_proved=False,
                               human_review=entry['human_review'])
    for name, definition in definitions.items():
        for call in definition['calls']:
            require(call in definitions or call in terminals,
                    'Unclosed actual call: ' + name + ' -> ' + call)
    require(set(declarations) == set(definitions) | set(terminals),
            'Declarations without an actual body or reviewed intrinsic spec: ' +
            ', '.join(sorted(set(declarations) - set(definitions) - set(terminals))))
    return dict(passed=True, scope='actual C body/contract/call inventory only; fresh Coq gate still required',
                actual_C_units=len(by_unit), unique_ordinary_C_bodies=len(definitions),
                target_inventory_complete=not pending_targets,
                pending_target_inventories=pending_targets,
                body_definitions=definitions, bodies_by_unit=by_unit,
                source_reviewed_intrinsic_terminals=terminals,
                terminal_intrinsic_count=len(terminals),
                no_ordinary_body_exemptions=True)

