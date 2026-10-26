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
            match = re.fullmatch(r'(.+?)_(?:safety|entail|return|partial_solve|which_implies)_wit_.+', field)
            require(match is not None, 'Unsupported actual C field name: ' + field)
            functions_from_goals.add(match[1])
        require(functions_from_goals == set(names),
                'Actual C functions differ from checked target fields: ' + stem)
    require(len(definitions) == inventory['unique_ordinary_bodies'] == 6,
            'Expected six unique ordinary actual C bodies')
    require(set(definitions)=={'test_neon','test_rvv','em_read_scalar','em_write_scalar','em_assert','expminusmax_checked_pair'},
            'Ordinary C body inventory differs')
    require({'test_neon','test_rvv'}<=set(definitions['expminusmax_checked_pair']['calls']),
            'Public caller must execute both actual kernels')
    import json
    authoritative=json.loads((case/'proof/intrinsic-ledger.json').read_text())
    expected_mapping={'em_isa_add4': 'vaddq_f32', 'em_isa_sub4': 'vsubq_f32', 'em_isa_mul4': 'vmulq_f32', 'em_isa_reint_f_i': 'vreinterpretq_s32_f32', 'em_isa_reint_i_f': 'vreinterpretq_f32_s32', 'em_isa_reint_f_u': 'vreinterpretq_u32_f32', 'em_isa_reint_u_f': 'vreinterpretq_f32_u32', 'em_isa_low': 'vget_low_f32', 'em_isa_high': 'vget_high_f32', 'em_isa_dup4': 'vmovq_n_f32', 'em_isa_fma4': 'vfmaq_f32', 'em_isa_slli4': 'vshlq_n_s32', 'em_isa_clt4': 'vcltq_f32', 'em_isa_bic4': 'vbicq_u32', 'em_isa_reduce4': 'vaddvq_f32', 'em_isa_reduce2': 'vaddv_f32', 'em_isa_lane2': 'vget_lane_f32', 'em_isa_vlmax': '__riscv_vsetvlmax_e32m4', 'em_isa_setvl': '__riscv_vsetvl_e32m4', 'em_isa_dup16': '__riscv_vfmv_v_f_f32m4', 'em_isa_load16': '__riscv_vle32_v_f32m4', 'em_isa_sub16': '__riscv_vfsub_vf_f32m4', 'em_isa_macvf16': '__riscv_vfmacc_vf_f32m4', 'em_isa_madvf16': '__riscv_vfmadd_vf_f32m4', 'em_isa_macvv16': '__riscv_vfmacc_vv_f32m4', 'em_isa_mul16': '__riscv_vfmul_vv_f32m4', 'em_isa_merge16': '__riscv_vfmerge_vfm_f32m4', 'em_isa_slide16': '__riscv_vslidedown_vx_f32m4', 'em_isa_mask16': '__riscv_vmflt_vf_f32m4_b8', 'em_isa_reint_f_i16': '__riscv_vreinterpret_v_f32m4_i32m4', 'em_isa_reint_i_f16': '__riscv_vreinterpret_v_i32m4_f32m4', 'em_isa_shift16': '__riscv_vsll_vx_i32m4', 'em_isa_first16': '__riscv_vfmv_f_s_f32m4_f32', 'em_isa_addtu16': '__riscv_vfadd_vv_f32m4_tu', 'em_isa_store16': '__riscv_vse32_v_f32m4', 'em_isa_load4': 'vld1q_f32', 'em_isa_load_dup4': 'vld1q_dup_f32', 'em_isa_store4': 'vst1q_f32', 'em_isa_store2': 'vst1_f32', 'em_isa_store_lane0': 'vst1_lane_f32'}
    entries=authoritative['entries']
    require({e['formal_declaration_name']:e['original_intrinsic']for e in entries}==expected_mapping and len(entries)==40,
            'Exact original-intrinsic view mapping differs')
    terminals={}
    for entry in entries:
        name=entry['formal_declaration_name']
        require(name not in terminals and name not in definitions,'Duplicate or ordinary-body intrinsic exemption')
        require(entry['classification']=='original_intrinsic_specification_view'and entry['body_checked']is False and entry['isa_refinement_proved']is False,
                'Intrinsic classification/unsupported ISA claim')
        require(name in declarations,'Missing intrinsic declaration '+name)
        expected=list(_functions(entry['declaration_and_contract'],'ledger:'+name))
        require(len(expected)==1 and expected[0][0]==name and expected[0][3]is None,
                'Ledger must contain one declaration only')
        require(declarations[name]==(expected[0][1],expected[0][2]),'Intrinsic signature or full contract drift '+name)
        require(hashlib.sha256(entry['declaration_and_contract'].encode()).hexdigest()==entry['declaration_and_contract_sha256'],
                'Ledger declaration SHA mismatch')
        model=entry['definition_source']
        require(digest(case/model)==entry['definition_source_sha256']and entry['coq_definition'].startswith('ExpMinusMax.'),
                'Intrinsic model source or qualified definition changed '+name)
        models={model:entry['definition_source_sha256']}
        for aux in entry.get('auxiliary_definitions',[]):
            require(aux['coq_definition'].startswith('ExpMinusMax.')and digest(case/aux['definition_source'])==aux['definition_source_sha256'],
                    'Auxiliary intrinsic predicate drift')
            models[aux['definition_source']]=aux['definition_source_sha256']
        derived=entry.get('redundant_short_AVL_consequence')
        if derived:
            require(digest(case/derived['source'])==derived['source_sha256'],'VL consequence proof source drift')
            models[derived['source']]=derived['source_sha256']
        header=entry['declaration_header'];require((case/header).is_file(),'Missing intrinsic source header')
        require(entry['official_source'].startswith(('https://arm-software.github.io/','https://documentation-service.arm.com/','https://docs.riscv.org/')),
                'Missing primary ISA reference')
        terminals[name]=dict(original_intrinsic=entry['original_intrinsic'],header=header,header_sha256=digest(case/header),
          actual_signature=list(declarations[name][0]),actual_contract_sha256=hashlib.sha256(declarations[name][1].encode()).hexdigest(),
          official_source=entry['official_source'],configuration=entry['config'],Coq_definitions=[entry['coq_definition']],
          model_source_sha256=models,formal_ISA_correspondence_proved=False,physical_ABI_bridge_proved=False,human_review=entry['human_review'])
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

