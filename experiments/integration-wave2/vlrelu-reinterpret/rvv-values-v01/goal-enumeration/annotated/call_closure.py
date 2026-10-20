"""Direct C call closure. Unknown external or indirect calls are not skipped."""
import json
import subprocess
import re
import shutil
import tempfile
from pathlib import Path

# Signatures/contracts come from the pinned C library or compiler models.
EXTERNAL = {'memcpy', 'memmove', 'memset', 'fmaf', 'fma', 'nanf',
            '__builtin_nanf', '__builtin_signbit', '__assert_fail', '__builtin_expect'}


def _closure(unit, roots):
    command = ['clang-14', '-std=c11', '-Xclang', '-ast-dump=json',
               '-fsyntax-only', str(unit)]
    result = subprocess.run(command, cwd=unit.parent, capture_output=True,
                            text=True, timeout=60)
    if result.returncode:
        raise RuntimeError('Call-closure parse failed: ' + result.stderr)
    ast = json.loads(result.stdout)
    bodies = {}

    def walk(node):
        yield node
        for child in node.get('inner', []):
            yield from walk(child)

    for node in walk(ast):
        if node.get('kind') == 'FunctionDecl':
            body = next((n for n in node.get('inner', [])
                         if n.get('kind') == 'CompoundStmt'), None)
            if body is not None:
                bodies[node['name']] = body
    selected, external = set(), set()
    todo = list(roots)
    while todo:
        name = todo.pop()
        if name in selected:
            continue
        if name not in bodies:
            if name not in EXTERNAL:
                raise RuntimeError('Unmodelled external call: ' + name)
            external.add(name)
            continue
        selected.add(name)
        for node in walk(bodies[name]):
            if node.get('kind') != 'CallExpr':
                continue
            callee = node['inner'][0]
            while callee.get('kind') in {'ImplicitCastExpr', 'ParenExpr', 'UnaryOperator'}:
                if callee.get('kind') == 'UnaryOperator' and callee.get('opcode') != '&':
                    break
                callee = callee['inner'][0]
            decl = callee.get('referencedDecl', {})
            if callee.get('kind') != 'DeclRefExpr' or decl.get('kind') != 'FunctionDecl':
                raise RuntimeError('Indirect call in ' + name)
            todo.append(decl['name'])
    return {'roots': list(roots), 'functions': sorted(selected),
            'external_models': sorted(external),
            'unreachable_definitions': sorted(set(bodies) - selected),
            'command': command}


def closure(unit, ghost_functions=()):
    # Ghost code participates in proof dependencies. Parse a temporary C view
    # with ghost bodies active so calls through ghost helpers are also closed.
    with tempfile.TemporaryDirectory(prefix='shim-closure-') as folder:
        directory = Path(folder)
        for original in unit.parent.iterdir():
            if not original.is_file():
                continue
            target = directory/original.name
            if original.suffix not in {'.c', '.h'}:
                shutil.copyfile(original, target)
                continue
            text = original.read_text()
            def block(match):
                return re.sub(r'/@.*?@/', '', match.group(1), flags=re.S)
            text = re.sub(r'/\*@\s*ghost\b(.*?)\*/', block, text, flags=re.S)
            text = re.sub(r'//@\s*ghost\b([^\n]*)', r'\1', text)
            target.write_text(text)
        result = _closure(directory/unit.name, ('equivalent', *sorted(ghost_functions)))
        result['ghost_roots'] = sorted(ghost_functions)
        result['scope'] = 'Direct-call graph only; temporary ghost C is never used as implementation or WP input.'
        return result
