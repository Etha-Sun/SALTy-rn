"""Strict actual-C call closure; parser adapted from verified QS8 ADD.
Parser source SHA256: 3efd6acc59092baaa88372fab2332d5abe800f99f8f2d1b8cf04ffaa43a2765e.
No proof credit is inherited from the parser or component receipts.
"""
import re
COMMENT = re.compile(r'/\*.*?\*/|//[^\n]*', re.S)
FUNCTION = re.compile(
    r'(?m)^[ \t]*(?:[A-Za-z_]\w*(?:[ \t]+|(?=\*))|\*[ \t]*)+'
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
    require(len(definitions) == inventory['unique_ordinary_bodies'] == 15,
            'Expected precisely 15 unique ordinary actual C bodies')
    require({'test_neon', 'test_rvv', 'compare_outputs', 'equivalent'} <= set(definitions),
            'Missing actual kernels/comparator/caller')
    require({'test_neon', 'test_rvv', 'compare_outputs'} <= set(definitions['equivalent']['calls']),
            'Public equivalent must call both actual kernels and comparison')
    terminals={}
    entries=ledger['intrinsic_ledger']
    require(len(entries)==24,'Expected precisely24 original-intrinsic specification views')
    for entry in entries:
        name=entry['formal_declaration_name']
        require(name not in terminals and name not in definitions,'Duplicate/ordinary intrinsic exemption: '+name)
        require(entry['intrinsic_c_body_checked']is False and entry['isa_refinement_proved']is False,
                'Unexpected intrinsic evidence classification')
        require(name in declarations,'Intrinsic declaration missing: '+name)
        # The complete declaration/contract is frozen from the actual CPP input.
        # The authoritative review location is the original header and Coq model;
        # this does not assert an unproved hardware/ABI refinement theorem.
        models={}
        for source,digest_value in entry['source_files_sha256'].items():
            require(digest(case/source)==digest_value,'Intrinsic model source drift: '+name)
            models[source]=digest_value
        require(entry['model_definitions']and all(x.startswith('Dwconv.')for x in entry['model_definitions']),
                'Missing fully qualified intrinsic definitions')
        primary=ledger['primary_sources']['acle'if entry['isa'].startswith('ARM')else'rvv']
        require(primary['url']and primary['sha256'],'Missing primary ISA reference')
        header=entry['contract_source']
        require((case/header).is_file(),'Missing intrinsic header')
        terminals[name]=dict(original_intrinsic=entry['original_intrinsic'],header=header,
          header_sha256=digest(case/header),actual_signature=list(declarations[name][0]),
          actual_contract_sha256=hashlib.sha256(declarations[name][1].encode()).hexdigest(),
          official_source=primary,configuration=ledger['fp_environment'],
          Coq_definitions=entry['model_definitions'],model_source_sha256=models,
          formal_ISA_correspondence_proved=False,human_review=entry['review_status'])
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

