"""Prepare proof units from spec.c; add only proof annotations to its C bodies."""
from pathlib import Path
import json
import re

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
REPO = next(parent for parent in CASE.parents if (parent / ".git").exists())
LEXER = re.compile(r'/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|[A-Za-z_]\w*|[0-9][A-Za-z0-9_.]*|>>=|<<=|\.\.\.|->|\+\+|--|<<|>>|<=|>=|==|!=|&&|\|\||\+=|-=|\*=|/=|%=|&=|\|=|\^=|[^\s]', re.S)


def function(text, name):
    start = re.search(r'(?m)^(?:void|float|int)\s+' + name + r'\s*\(', text).start()
    annotation = re.search(r'/\*@.*?\*/', text[start:], re.S)
    end = start + annotation.end()
    if text[end:].lstrip().startswith(';'):
        return text[start:end] + ';'
    position = text.index('{', end) + 1
    depth = 1
    while depth:
        depth += (text[position] == '{') - (text[position] == '}')
        position += 1
    return text[start:position]


def declaration(text):
    return text[:text.index('*/') + 2] + ';'


def c_tokens(text):
    return [m for m in LEXER.finditer(text) if not m.group().startswith(('/*', '//'))]


def tokens(text):
    return [m.group() for m in c_tokens(text)]


def review_units():
    """Split live spec.c; metadata supplies names and proof comments only."""
    review = (CASE / 'spec.c').read_text()
    manifest = json.loads((HERE / 'manifest.json').read_text())
    units = [item for item in manifest['units'] if 'functions' in item]
    names = set(name for item in units for name in item['functions'])
    assert names == {'test_neon', 'test_rvv', 'qcp_vadd_read', 'preserve_float',
                     'check_observation', 'same_lane', 'compare_outputs', 'equivalent'}, 'Spec function coverage'
    functions = {name: function(review, name) for name in names}
    first = min(review.index(text) for text in functions.values())
    preamble = review[:first]
    remainder = review[first:]
    for text in functions.values():
        remainder = remainder.replace(text, '', 1)
    assert not tokens(remainder) and not re.search(r'/\*@', remainder), 'Unexpected text between/after spec functions'
    result = {}
    for item in units:
        annotations = json.loads((HERE / item['proof_annotations']).read_text()) if 'proof_annotations' in item else {}
        assert set(annotations) <= set(item['definitions']), 'Annotation on a declaration'
        pieces = [preamble]
        for strategy in item.get('strategies', []):
            assert re.fullmatch(r'[a-z_]+\.strategies', strategy), 'Invalid strategy name'
            pieces.append('/*@ include strategies "' + strategy + '" */')
        for name in item['functions']:
            original = functions[name]
            if name not in item['definitions']:
                pieces.append(declaration(original))
                continue
            assert not original.endswith(';'), 'Definition missing from spec: ' + name
            annotated = original
            for patch in annotations.get(name, []):
                comment = patch['text']
                assert re.fullmatch(r'/\*@ (?:Inv|Assert)\b(?:(?!\*/).)*\*/', comment, re.S), 'Only Inv/Assert may be inserted'
                assert not re.search(r'\b(?:Require|Ensure|With|Extern|Import|include)\b', comment), 'Contract/import in proof annotation'
                anchor = patch['before']
                assert annotated.count(anchor) == 1, 'Proof anchor missing or ambiguous: ' + name
                annotated = annotated.replace(anchor, comment + '\n  ' + anchor, 1)
            assert tokens(annotated) == tokens(original), 'Spec C tokens changed: ' + name
            pieces.append(annotated)
        result[item['namespace'], item['stem']] = '\n\n'.join(pieces) + '\n'
    return result


def kernel_units(manifest):
    """Read the original implementations; insert only public/proof comments."""
    review = (CASE / 'spec.c').read_text()
    result = {}
    for item in manifest['units']:
        if 'annotations' not in item:
            continue
        name = item['function']
        source = HERE / item['path']
        original = source.read_text()
        offset = original.index('void ' + name)
        raw = original[offset:]
        positions = c_tokens(raw)
        public = re.search(r'/\*@.*?\*/', function(review, name), re.S).group()
        annotated = raw
        patches = json.loads((HERE / item['annotations']).read_text())
        assert sum(p['text'] is None for p in patches) == 1, name + ': public contract slot'
        for patch in reversed(patches):
            comment = patch['text'] if patch['text'] is not None else public
            assert re.fullmatch(r'/\*@(?:(?!\*/).)*\*/', comment, re.S), 'Only proof comments may be inserted'
            at = positions[patch['after_token'] - 1].end()
            annotated = annotated[:at] + '\n' + comment + '\n' + annotated[at:]
        assert tokens(raw) == tokens(annotated), name + ': C tokens changed'
        frontend = REPO / item['frontend']
        prefix = '#include "' + str(frontend) + '"\n' + original[:offset]
        result[source] = prefix + annotated
    return result


def kernel_audit():
    return kernel_units(json.loads((HERE / 'manifest.json').read_text()))


def write_unit(source, text, target):
    # Relocated units still resolve includes against their checked-in template.
    text = re.sub(r'#include\s+"([^"]+)"',
                  lambda m: '#include "' + str((source.parent / m.group(1)).resolve()) + '"', text)
    target.write_text(text)
