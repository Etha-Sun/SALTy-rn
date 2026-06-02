"""libclang frontend: parse a kernel's C signature into typed parameter facts.

No regex. Function bodies are skipped during parsing, so the NEON/RVV intrinsic
types used in the body never need to be defined for the signature to parse.

Emits *candidate facts* (types, const-ness, pointer shape); role resolution is a
separate, overridable step (see resolve_roles).
"""
from __future__ import annotations

import os
from dataclasses import dataclass, field

from clang import cindex

_configured = False


def _configure_libclang() -> None:
    """Bind to a libclang shared library. Honors $LIBCLANG_PATH; otherwise uses
    the one bundled with the `libclang` pip package (the default)."""
    global _configured
    if _configured:
        return
    _configured = True
    path = os.environ.get("LIBCLANG_PATH")
    if path:
        try:
            cindex.Config.set_library_file(path)
        except Exception:
            pass


@dataclass
class ParamFact:
    name: str
    type_spelling: str
    is_pointer: bool = False
    points_to_const: bool = False
    pointee: str = ""          # normalized element type, e.g. "float", "int8_t"
    is_ptr_to_ptr: bool = False
    is_struct_ptr: bool = False
    is_int_scalar: bool = False
    struct_name: str = ""      # for struct pointers, e.g. "xnn_f32_lrelu_params"


@dataclass
class Signature:
    func_name: str
    params: list[ParamFact]


@dataclass
class Roles:
    bounds: list[ParamFact] = field(default_factory=list)   # integer scalars (sweep / stride / flag)
    inputs: list[ParamFact] = field(default_factory=list)   # const T*
    outputs: list[ParamFact] = field(default_factory=list)  # T* (non-const)
    params: list[ParamFact] = field(default_factory=list)   # const struct *_params*
    indirect: list[ParamFact] = field(default_factory=list)  # T**
    unknown: list[ParamFact] = field(default_factory=list)


_INT_KINDS = {
    cindex.TypeKind.INT, cindex.TypeKind.UINT,
    cindex.TypeKind.LONG, cindex.TypeKind.ULONG,
    cindex.TypeKind.LONGLONG, cindex.TypeKind.ULONGLONG,
    cindex.TypeKind.SHORT, cindex.TypeKind.USHORT,
    cindex.TypeKind.SCHAR, cindex.TypeKind.UCHAR,
    cindex.TypeKind.CHAR_S, cindex.TypeKind.CHAR_U,
}


def _normalize_pointee(spelling: str) -> str:
    return spelling.replace("const", "").replace("volatile", "").replace("restrict", "").strip()


def _classify(arg) -> ParamFact:
    t = arg.type
    canon = t.get_canonical()
    f = ParamFact(name=arg.spelling, type_spelling=t.spelling)
    if canon.kind == cindex.TypeKind.POINTER:
        f.is_pointer = True
        pointee = canon.get_pointee()
        f.points_to_const = pointee.is_const_qualified()
        f.pointee = _normalize_pointee(pointee.spelling)
        pc = pointee.get_canonical()
        if pc.kind == cindex.TypeKind.POINTER:
            f.is_ptr_to_ptr = True
        elif pc.kind == cindex.TypeKind.RECORD:
            f.is_struct_ptr = True
            f.struct_name = (f.pointee.replace("struct", "").replace("union", "").strip())
    elif canon.kind in _INT_KINDS:
        f.is_int_scalar = True
    return f


def parse_signature(path: str, func_name: str | None = None) -> Signature:
    _configure_libclang()
    index = cindex.Index.create()
    # Force-include a synthetic prelude: provides std typedefs (the bundled
    # libclang has no resource-dir headers on its search path) and neutralizes
    # XNNPACK signature-level macros like XNN_OOB_READS that would otherwise
    # make the declaration unparseable.
    prelude = os.path.join(os.path.dirname(__file__), "_prelude.h")
    tu = index.parse(path, args=["-x", "c", "-std=c11", "-include", prelude],
                     options=cindex.TranslationUnit.PARSE_SKIP_FUNCTION_BODIES)
    fn = None
    for cur in tu.cursor.get_children():
        if cur.kind == cindex.CursorKind.FUNCTION_DECL:
            if func_name is None or cur.spelling == func_name:
                fn = cur
                break
    if fn is None:
        raise ValueError(f"no function decl found in {path}"
                         + (f" named {func_name!r}" if func_name else ""))
    return Signature(func_name=fn.spelling,
                     params=[_classify(a) for a in fn.get_arguments()])


def resolve_roles(sig: Signature) -> Roles:
    """Candidate facts → roles. Type-driven; deliberately simple for now.
    (Bound-vs-stride and f16-data-vs-params refinements come with fixtures.)"""
    r = Roles()
    for p in sig.params:
        if p.is_int_scalar:
            r.bounds.append(p)
        elif "_params" in p.type_spelling or (p.is_struct_ptr and "param" in p.name.lower()):
            r.params.append(p)
        elif p.is_ptr_to_ptr:
            r.indirect.append(p)
        elif p.is_pointer:
            (r.inputs if p.points_to_const else r.outputs).append(p)
        else:
            r.unknown.append(p)
    return r


_FLOAT_KINDS = {cindex.TypeKind.FLOAT, cindex.TypeKind.DOUBLE, cindex.TypeKind.LONGDOUBLE}
if hasattr(cindex.TypeKind, "FLOAT16"):
    _FLOAT_KINDS.add(cindex.TypeKind.FLOAT16)


def _find_struct(node, name):
    for c in node.get_children():
        if (c.kind in (cindex.CursorKind.STRUCT_DECL, cindex.CursorKind.UNION_DECL)
                and c.spelling == name and c.is_definition()):
            return c
        found = _find_struct(c, name)
        if found:
            return found
    return None


def _leaves(struct_cursor, prefix, out):
    for f in struct_cursor.get_children():
        if f.kind != cindex.CursorKind.FIELD_DECL:
            continue
        canon = f.type.get_canonical()
        if canon.kind == cindex.TypeKind.RECORD:
            _leaves(canon.get_declaration(), prefix + f.spelling + ".", out)
        else:
            out.append((prefix + f.spelling, f.type.spelling, canon.kind))


def parse_struct_leaves(header_path: str, struct_name: str):
    """Return [(dotted_path, ctype_spelling, TypeKind)] for a struct's scalar
    leaves, recursing nested (anonymous) structs. Read from the real header, not
    a hand table."""
    _configure_libclang()
    prelude = os.path.join(os.path.dirname(__file__), "_prelude.h")
    tu = cindex.Index.create().parse(
        header_path, args=["-x", "c", "-std=c11", "-include", prelude],
        options=cindex.TranslationUnit.PARSE_SKIP_FUNCTION_BODIES)
    s = _find_struct(tu.cursor, struct_name)
    if s is None:
        raise ValueError(f"struct {struct_name!r} not found in {header_path}")
    out: list = []
    _leaves(s, "", out)
    return out


def classify_param_struct(leaves) -> str:
    """'none' (empty/dummy), 'float' (all leaves FP → sentinel-bindable),
    or 'int' (has integer fields → needs AST rewrite)."""
    real = [l for l in leaves if l[0] != "_"]
    if not real:
        return "none"
    if all(kind in _FLOAT_KINDS for _, _, kind in real):
        return "float"
    return "int"


if __name__ == "__main__":
    import sys
    for path in sys.argv[1:]:
        sig = parse_signature(path)
        roles = resolve_roles(sig)
        print(f"\n=== {path} : {sig.func_name} ===")
        for p in sig.params:
            tags = []
            if p.is_int_scalar: tags.append("int")
            if p.is_pointer: tags.append("ptr")
            if p.points_to_const: tags.append("const")
            if p.is_ptr_to_ptr: tags.append("ptr2ptr")
            if p.is_struct_ptr: tags.append("struct")
            print(f"  {p.name:12} : {p.type_spelling:42} pointee={p.pointee:24} [{','.join(tags)}]")
        print(f"  ROLES bounds={[p.name for p in roles.bounds]} "
              f"inputs={[p.name for p in roles.inputs]} "
              f"outputs={[p.name for p in roles.outputs]} "
              f"params={[p.name for p in roles.params]} "
              f"indirect={[p.name for p in roles.indirect]}")
