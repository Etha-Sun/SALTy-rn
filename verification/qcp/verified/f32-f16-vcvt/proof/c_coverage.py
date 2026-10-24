"""Parse the fixed F16 preprocessed C declaration/body/call closure.

This deliberately handles the package's simple, preprocessed C functions only:
no function pointers, attributes, strings, or nested function declarations.
Extern Coq annotations name logical definitions; they are not C callees.
"""
import re


COMMENT = re.compile(r'/\*.*?\*/|//[^\n]*', re.S)
FUNCTION = re.compile(
    r'(?m)^[ \t]*(?:[A-Za-z_]\w*[ \t]+|[A-Za-z_]\w*(?=\*)|\*[ \t]*)+'
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

