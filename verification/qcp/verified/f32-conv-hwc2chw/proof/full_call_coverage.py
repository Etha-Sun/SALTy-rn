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


def audit_sources(expanded_paths,inventory,ledger,case):
    from pathlib import Path
    import hashlib
    case=Path(case);digest=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
    def require(value,message):
        if not value:raise ValueError(message)
    expected_bodies={'hc_round_down4','hc_doz','hc_assert','hc_copy_float','hc_min_f32m1','hc_max_f32m1',
      'hc_neon_fma3_lane0','hc_neon_fma3_lane1','hc_neon_fma3_lane2','hc_neon_fma3_lane3','hc_read_scalar',
      'hc_store_low_half','hc_store_high_half','hc_neon_rows_pixel27','hc_rvv_rows_fma3','hc_rvv_pixel9_raw',
      'test_neon','test_rvv','hwc_public_mode'}
    units={u['stem']:u for u in inventory['units']};require(set(expanded_paths)==set(units),'Exact13 coverage TU set required')
    declarations={};definitions={};by_unit={}
    for stem,path in expanded_paths.items():
        names=[];source=Path(path).read_text();masked=_mask_comments(source)
        for name,signature,contract,calls in _functions(source,stem):
            key=(signature,contract);require(name not in declarations or declarations[name]==key,'Actual signature/contract mismatch '+name);declarations[name]=key
            if calls is not None:
                require(name not in definitions,'Duplicate actual C body '+name);definitions[name]=dict(unit=stem,calls=sorted(calls),provider=units[stem]['typed_instance']);names.append(name)
        require(names,'No actual body '+stem);by_unit[stem]=sorted(names)
        actual_functions={re.fullmatch(r'(.+?)_(?:safety|entail|return|partial_solve|which_implies)_wit_.+',field)[1]for field in units[stem]['fields']}
        require(actual_functions==set(names),'Actual C body to VC field binding '+stem)
    require(set(definitions)==expected_bodies and len(definitions)==inventory['unique_ordinary_bodies']==19,'Exactly19 named actual bodies required')
    require({'test_neon','test_rvv'}<=set(definitions['hwc_public_mode']['calls']),'Ordinary mode caller must statically bind both actual main bodies')
    entries=ledger['entries'];require(len(entries)==ledger['entry_count']==32,'Exact32 source-reviewed original intrinsic views required')
    terminals={}
    for entry in entries:
        name=entry['name'];require(name not in terminals and name not in definitions,'Duplicate/ordinary intrinsic exemption '+name)
        require(entry['boundary']=='source-reviewed-spec'and entry['formal_ISA_correspondence_proved']is False and entry['physical_SIMD_ABI_mapping_proved']is False,'Intrinsic boundary changed')
        require(entry['human_review']=='pending final manual review','Human review boundary changed')
        header=case/entry['header'];require(digest(header)==entry['header_sha256'],'Intrinsic header identity '+name)
        contract=entry['contract'];require(hashlib.sha256(contract.encode()).hexdigest()==entry['contract_sha256'],'Intrinsic exact contract digest '+name)
        text=header.read_text();require(re.sub(r'\s','',contract)in re.sub(r'\s','',text),'Ledger not present in actual intrinsic header '+name)
        # Ledger stores name+args+full contract. Bind its return type to the same
        # hash-pinned actual header, then compare the entire live CPP declaration.
        typed=re.findall(r'(?m)^\s*([A-Za-z_]\w*(?:\s*\*\s*)?)\s+'+re.escape(name)+r'\s*\(',text)
        require(len(typed)==1,'Unique intrinsic return type declaration '+name)
        parsed=list(_functions(typed[0]+' '+contract,'ledger:'+name));require(len(parsed)==1 and parsed[0][0]==name and parsed[0][3]is None,'Exact single declaration in ledger '+name)
        require(name in declarations and declarations[name]==(parsed[0][1],parsed[0][2]),'Actual full intrinsic signature/contract drift '+name)
        models={}
        for model in entry['Coq_definitions']:
            require(model['FQ'].startswith('HwcConv.')and digest(case/model['source'])==model['source_sha256'],'Intrinsic exact model definition identity '+name);models[model['source']]=model['source_sha256']
        require(models,'No explicit intrinsic Coq definition '+name)
        official=entry['official_source'];require(official['url'].startswith(('https://arm-software.github.io/','https://documentation-service.arm.com/','https://raw.githubusercontent.com/riscvarchive/riscv-v-spec/','https://docs.riscv.org/')),'Primary official ISA source required')
        require(digest(case/official['archived_source'])==official['sha256'],'Archived official source identity '+name)
        terminals[name]=dict(original_intrinsic=entry['original_intrinsic'],header=entry['header'],header_sha256=entry['header_sha256'],actual_signature=list(declarations[name][0]),actual_contract_sha256=hashlib.sha256(declarations[name][1].encode()).hexdigest(),Coq_definitions=entry['Coq_definitions'],model_source_sha256=models,configuration=entry['configuration'],rounding_nan=entry['rounding_nan'],official_source=official,human_review=entry['human_review'],formal_ISA_correspondence_proved=False,physical_ABI_bridge_proved=False)
    for name,body in definitions.items():
        for call in body['calls']:require(call in definitions or call in terminals,'Unclosed actual call '+name+' -> '+call)
    require(set(declarations)==set(definitions)|set(terminals),'Uncovered declarations '+str(sorted(set(declarations)-set(definitions)-set(terminals))))
    return dict(passed=True,scope='actual CPP body/signature/contract/call closure, not formal proof',actual_C_units=len(by_unit),unique_ordinary_C_bodies=len(definitions),body_definitions=definitions,bodies_by_unit=by_unit,source_reviewed_intrinsic_terminals=terminals,terminal_intrinsic_count=len(terminals),no_ordinary_body_exemptions=True)
