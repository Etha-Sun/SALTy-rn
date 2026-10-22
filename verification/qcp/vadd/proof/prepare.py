"""Prepare proof units from spec.c; add only proof annotations to its C bodies."""
from pathlib import Path
import re

HERE = Path(__file__).resolve().parent
CASE = HERE.parent


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


def tokens(text):
    text = re.sub(r'/\*.*?\*/|//[^\n]*', '', text, flags=re.S)
    return re.findall(r'\w+|[^\s\w]', text)


def review_units():
    review = (CASE / 'spec.c').read_text()
    remainder = review
    for name in ['test_neon', 'test_rvv', 'qcp_vadd_read', 'preserve_float',
                 'check_observation', 'same_lane', 'compare_outputs', 'equivalent']:
        remainder = remainder.replace(function(review, name), '', 1)
    # A macro or extra declaration outside the extracted functions could change
    # direct compilation while escaping the split proof units.
    expected = (HERE / 'spec-preamble.txt').read_text()
    assert tokens(remainder) == tokens(expected), 'Unexpected spec.c global declarations/macros'
    annotations = lambda text: [re.sub(r'\s', '', item) for item in re.findall(r'/\*@.*?\*/', text, re.S)]
    assert annotations(remainder) == annotations(expected), 'Unexpected spec.c global proof declarations'
    groups = {
        'QcpVadd/array_read.c': ['qcp_vadd_read'],
        'NanBridge/bridge.c': ['preserve_float', 'check_observation', 'same_lane'],
        'VaddComparator/comparator.c': ['qcp_vadd_read', 'same_lane', 'compare_outputs'],
        'VaddWrapper/wrapper.c': ['test_neon', 'test_rvv', 'compare_outputs', 'equivalent'],
    }
    result = {}
    for relative, names in groups.items():
        path = HERE / 'c' / relative
        text = path.read_text()
        for name in names:
            old = function(text, name)
            new = function(review, name)
            if old.endswith(';'):
                new = declaration(new)
            else:
                # Keep loop invariants/intermediate assertions out of the review file.
                annotations = re.findall(r'/\*@ (?:Inv|Assert).*?\*/', old, re.S)
                for annotation in annotations:
                    anchor = 'while (i < n)' if name == 'compare_outputs' else 'test_neon(n * sizeof(float)'
                    new = new.replace(anchor, annotation + '\n  ' + anchor, 1)
            text = text.replace(old, new, 1)
        # The split units have the same executable functions as the review entry.
        for name in names:
            if not function(text, name).endswith(';'):
                assert tokens(function(text, name)) == tokens(function(review, name)), name
        result[path] = text
    return result


def kernel_audit():
    review = (CASE / 'spec.c').read_text()
    for name, original, annotated in [
        ('test_neon', 'testNEON.c', 'ByValue/neon.c'),
        ('test_rvv', 'testRVV.c', 'ByvalueRvv/macro_rvv.c'),
    ]:
        source = (CASE / 'impl' / original).read_text()
        proof = function((HERE / 'c' / annotated).read_text(), name)
        # Original functions have no QCP contract; compare ordinary C tokens.
        original_body = source[source.index('void ' + name):]
        assert tokens(original_body) == tokens(proof), name + ': C tokens changed'
        contract = re.search(r'/\*@.*?\*/', proof, re.S).group()
        public = re.search(r'/\*@.*?\*/', function(review, name), re.S).group()
        assert re.sub(r'\s', '', contract) == re.sub(r'\s', '', public), name + ': contract mismatch'


def write_unit(source, text, target):
    # Relocated units still resolve includes against their checked-in template.
    text = re.sub(r'#include\s+"([^"]+)"',
                  lambda m: '#include "' + str((source.parent / m.group(1)).resolve()) + '"', text)
    target.write_text(text)
