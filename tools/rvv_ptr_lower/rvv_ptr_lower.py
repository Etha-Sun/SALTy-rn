#!/usr/bin/env python3
"""rvv_ptr_lower: deterministic, rule-based pointer/A-normal-form lowering of RVV
intrinsic code, so that QCP never sees an RVV vector passed or returned by value.

The tool is type-directed: it asks clang (the pinned zig clang 20) for the typed
AST of the original file and decides every rewrite from AST node kinds and from
whether a type is an RVV builtin type (`__rvv_*_t`).  It never guesses from text.
Every construct outside the rule set aborts with an explicit rejection; nothing is
silently skipped.  Only statements that involve RVV values are edited; all other
bytes of the file (comments, formatting, macros) are copied unchanged.

Rules (see README.zh-CN.md for the full table and the semantic argument):
  R1  T v = f(args);           ->  T v; qcp_p_f(&v, args');
  R2  T v = u;                 ->  T v; qcp_p_copy_T(&v, &u);
  R3  v = f(args);   (v not a direct vector argument of f)
                               ->  qcp_p_f(&v, args');
  R4  v = f(args);   (v is a direct vector argument of f)
                               ->  T t; qcp_p_f(&t, args'); qcp_p_copy_T(&v, &t);
  R5  v = u;                   ->  qcp_p_copy_T(&v, &u);
  R6  nested vector-valued call g(...) used as an argument
                               ->  lifted, in left-to-right order, into a fresh
                                   temporary declared just before the statement
  R7  vector argument that is a variable u  ->  &u
  R8  intrinsic call with a non-vector result (store, scalar move, ...) whose
      arguments involve vectors  ->  qcp_p_f(args')   (still an expression)
  R9  statement that becomes several statements and is the direct body of
      if/else/for/while/do      ->  wrapped in { ... }
  R10 `if`/`switch` condition that needs lifting  ->  lifted statements are
      inserted immediately before the `if`/`switch` (condition evaluated once)
  R11 `const` on a vector local declared by R1/R2 is dropped (the variable is
      now initialised through a pointer); recorded per occurrence.
  R23 (v1.6, all ISAs) `T v = *p++;` / `x = *p++;` (p a plain local, single site)
                               ->  `T v = *p; p += 1;` (`--p`, `++p`, `p--` likewise;
                                   C11 6.5.2.4); anything else is rejected (R23)
  R25 (v1.7, only with --entry F) delete the main file's functions outside F's call graph;
      address-taken and attribute-pinned functions (and their callees) are kept
  R26 (v1.7, --isa hvx) `*(T*)&v` (v a local vector variable, T a char class or the
      element type, offset 0, read only)  ->  qcp_p_lane0_<class>_<T>(&v); every other
      `&v` of a vector is rejected
  --isa hvx: the same pointer lowering for HVX_Vector/HVX_VectorPair; Q6_* forwarding
  macros and xnn_* header wrappers are operations (wrapper bodies are not lowered).
  Rejections: vector calls in loop conditions/increments/for-init, in operands of
  &&, ||, ?:, or comma (other than the first), side effects inside a lifted call's
  arguments, vector-typed function parameters/returns, non-intrinsic calls taking
  vectors, vector expressions of any other kind, and anything inside a macro
  expansion that would need rewriting.
"""
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

TOOL_VERSION = "rvv_ptr_lower 1.7.0"
HERE = Path(__file__).resolve().parent


def find_repo():
    """Repository root = the directory holding the pinned toolchain (config paths are
    relative to it). $RVV_PTR_LOWER_REPO overrides; otherwise search upwards from the
    tool directory (tools/rvv_ptr_lower inside the repo, or a copy below it)."""
    env = os.environ.get("RVV_PTR_LOWER_REPO")
    if env:
        return Path(env).resolve()
    for d in HERE.parents:
        if (d / "research/sol-pipeline-comparison-20261030/tools/ziglang/zig").exists():
            return d
    return HERE.parents[1]


REPO = find_repo()
PTR_PREFIX = "qcp_p_"
TEMP_PREFIX = "qcpv_t"
RVV_TYPE = re.compile(r"^(?:const\s+|volatile\s+)*(__rvv_\w+_t)$")


class Reject(Exception):
    def __init__(self, rule, message, node=None):
        super().__init__(message)
        self.rule = rule
        self.message = message
        self.node = node


# ----------------------------------------------------------------------------
# clang AST acquisition


def cfg_for(cfg, isa):
    """Merge the ISA-specific parse settings (config 'isa' section) over the top level."""
    out = dict(cfg)
    out.update(cfg.get("isa", {}).get(isa, {}))
    out["_isa"] = isa
    return out


def resolve_include(inc):
    """Config include paths are relative to the repository root; '@tool/x' is relative
    to the tool directory."""
    return HERE / inc[len("@tool/"):] if inc.startswith("@tool/") else REPO / inc


def clang_command(cfg, profile, src, preprocessed=False):
    cmd = [str(REPO / cfg["clang"][0])] + cfg["clang"][1:]
    if preprocessed:
        # self-contained, already preprocessed unit: no system/user include path, no prelude
        return cmd + cfg["target_flags"] + ["-fsyntax-only", "-nostdinc", "-x", "c", str(src)]
    cmd += cfg["target_flags"] + ["-fsyntax-only", "-nostdinc",
                                  "-isystem", str(REPO / cfg["clang_resource_include"])]
    for inc in cfg["libc_includes"]:
        cmd += ["-isystem", str(REPO / inc)]
    for inc in cfg["user_includes"]:
        cmd += ["-I" + str(resolve_include(inc))]
    for h in cfg["profiles"][profile]:
        cmd += ["-include", h]
    return cmd + [str(src)]


def clang_env():
    env = dict(os.environ)
    env.setdefault("ZIG_GLOBAL_CACHE_DIR", "/tmp/rvv-ptr-lower-zig")
    env.setdefault("ZIG_LOCAL_CACHE_DIR", "/tmp/rvv-ptr-lower-zig")
    return env


def parse(cfg, src, extra_includes=(), preprocessed=False):
    """Return (profile, ast). Tries the fixed profile order; first clean parse wins.
    A preprocessed unit is parsed alone (profile name 'preprocessed')."""
    errors = {}
    for profile in (["preprocessed"] if preprocessed else cfg["profile_order"]):
        cmd = clang_command(cfg, profile, src, preprocessed)
        for h in extra_includes:
            cmd[-1:-1] = ["-include", str(h)]
        p = subprocess.run(cmd + ["-Xclang", "-ast-dump=json"], capture_output=True,
                           text=True, env=clang_env())
        if p.returncode == 0:
            return profile, json.loads(p.stdout), cmd
        errors[profile] = [l for l in p.stderr.splitlines() if "error" in l][:5]
    raise Reject("PARSE", "clang could not parse the file under any profile: " + json.dumps(errors))


def annotate_files(node, state):
    """clang JSON elides `file` when unchanged from the previously printed location.
    Walk in print order (dict order) and record the effective file on each plain loc."""
    if isinstance(node, dict):
        if "offset" in node and "spellingLoc" not in node:
            if "file" in node:
                state["file"] = node["file"]
            node["_file"] = state["file"]
        for v in node.values():
            annotate_files(v, state)
    elif isinstance(node, list):
        for v in node:
            annotate_files(v, state)


# ----------------------------------------------------------------------------
# helpers over AST nodes


def kids(n):
    return n.get("inner", []) or []


def is_rvv_type(t):
    if not t:
        return False
    q = t.get("desugaredQualType", t.get("qualType", ""))
    return bool(RVV_TYPE.match(q.strip())) or bool(RVV_TYPE.match(t.get("qualType", "").strip()))


def canonical(t):
    """Canonical type spelling; RVV builtin types use their riscv_vector.h names."""
    q = (t or {}).get("desugaredQualType", (t or {}).get("qualType", "")).strip()
    return re.sub(r"\b__rvv_(\w+)_t\b", r"v\1_t", q)


def node_is_rvv(n):
    return is_rvv_type(n.get("type"))


def strip(n):
    while n.get("kind") in ("ImplicitCastExpr", "ParenExpr"):
        n = kids(n)[0]
    return n


def callee_name(call):
    c = strip(kids(call)[0])
    if c.get("kind") == "DeclRefExpr":
        return c.get("referencedDecl", {}).get("name")
    return None


def callee_type(call):
    c = strip(kids(call)[0])
    return c.get("type", {}).get("qualType")


def is_intrinsic_call(n):
    return n.get("kind") == "CallExpr" and (callee_name(n) or "").startswith("__riscv_")


def is_vsetvl_builtin(n):
    # clang's riscv_vector.h defines __riscv_vsetvl*/__riscv_vsetvlmax* as macros over
    # these builtins; they only compute a length from their arguments.
    return n.get("kind") == "CallExpr" and re.match(r"__builtin_rvv_vsetvli(max)?$", callee_name(n) or "")


def involves_rvv(n):
    """True if the subtree contains any RVV-typed value. Taking the address of a
    vector variable (`&v`, the pointer form this tool produces) yields a pointer, not a
    vector value, so it does not count."""
    if n.get("kind") == "UnaryOperator" and n.get("opcode") == "&":
        return False
    if node_is_rvv(n) and n.get("kind") not in ("DeclStmt",):
        return True
    return any(involves_rvv(k) for k in kids(n))


SIDE_EFFECT_KINDS = {"CompoundAssignOperator"}


def decl_refs(n):
    out = set()
    if n.get("kind") == "DeclRefExpr":
        out.add(n.get("referencedDecl", {}).get("id"))
    for c in kids(n):
        out |= decl_refs(c)
    return out


def has_side_effect(n):
    k = n.get("kind")
    if k in SIDE_EFFECT_KINDS:
        return True
    if k == "UnaryOperator" and n.get("opcode") in ("++", "--"):
        return True
    if k == "BinaryOperator" and n.get("opcode") == "=":
        return True
    if k == "CallExpr" and not is_intrinsic_call(n) and not is_vsetvl_builtin(n):
        return True
    if k == "CallExpr" and is_intrinsic_call(n) and re.match(r"__riscv_vs(e|se|oxei|uxei|seg|sseg)\d", callee_name(n) or ""):
        return True
    return any(has_side_effect(c) for c in kids(n))


CHAR_CLASS = {"char", "signed char", "unsigned char"}
LOAD_POINTEES = CHAR_CLASS | {"void"}


def parse_macro_defs(dm_text):
    """Function-like macros of a `clang -E -dM` dump: name -> (params, body)."""
    out = {}
    for line in dm_text.splitlines():
        m = re.match(r"#define\s+(\w+)\(([^)]*)\)\s+(.*)$", line)
        if m:
            out[m.group(1)] = ([p.strip() for p in m.group(2).split(",") if p.strip()], m.group(3).strip())
    return out


def dump_macros(cfg, profile, src, preprocessed=False):
    cmd = clang_command(cfg, profile, src, preprocessed)
    cmd = [c for c in cmd if c != "-fsyntax-only"]
    cmd[-1:-1] = ["-E", "-dM"]
    p = subprocess.run(cmd, capture_output=True, text=True, env=clang_env())
    if p.returncode != 0:
        raise Reject("PARSE", "clang -E -dM failed: " + p.stderr[:300])
    return parse_macro_defs(p.stdout)


class Lowerer:
    def __init__(self, text, main_file, cfg=None, ast=None, macros=None):
        self.text = text
        self.main_file = main_file
        self.cfg = cfg
        self.hvx = bool(cfg and cfg.get("_isa") == "hvx")
        self.macros = macros or {}
        self.edits = []          # (start, end, replacement, seq)
        self.log = []
        self.ops = {}            # ptr-op name -> signature record
        self.copy_types = set()
        self.temp_counter = 0
        self.lifted = []
        self.fn = None
        self.idents = set(re.findall(r"\b[A-Za-z_]\w*\b", text))
        self.puns = {}           # id(`*` node) -> pun description (R26)
        self.pun_amps = set()
        self.vars = {}
        if self.hvx:
            self.fdecls = {d["id"]: d for d in kids(ast) if d.get("kind") == "FunctionDecl"}
            self.main_defs = {d["name"] for d in kids(ast) if d.get("kind") == "FunctionDecl"
                              and has_body(d) and node_file(d) == main_file}
            self.defs = {}
            for d in kids(ast):
                if d.get("kind") == "FunctionDecl" and has_body(d):
                    self.defs.setdefault(d["name"], d)
            self.vec_typedefs = {d["name"] for d in kids(ast)
                                 if d.get("kind") == "TypedefDecl" and is_vec(cfg, d.get("type"))}
            self.typedefs = {d["name"]: (d.get("type", {}).get("desugaredQualType") or d.get("type", {}).get("qualType", ""))
                             for d in kids(ast) if d.get("kind") == "TypedefDecl"}
            self.pure_memo = {}
            self.heap_rx = re.compile(cfg["heap_write_regex"])

    # ---- ISA hooks (RVV: the module-level functions; HVX: configured vector types) --------
    def vt(self, t):
        return is_vec(self.cfg, t) if self.hvx else is_rvv_type(t)

    def nv(self, n):
        return self.vt(n.get("type"))

    def inv(self, n):
        if not self.hvx:
            return involves_rvv(n)
        k = n.get("kind")
        if k == "UnaryOperator" and n.get("opcode") == "&":
            return False
        if id(n) in self.puns:
            return True
        if self.nv(n) and k != "DeclStmt":
            return True
        return any(self.inv(c) for c in kids(n))

    def is_op(self, n):
        if not self.hvx:
            return is_intrinsic_call(n)
        if n.get("kind") == "CallExpr":
            c = strip(kids(n)[0])
            return (c.get("kind") == "DeclRefExpr" and c.get("referencedDecl", {}).get("kind") == "FunctionDecl"
                    and c["referencedDecl"]["name"] not in self.main_defs)
        return self.load_info(n) is not None

    def fx(self, n):
        if not self.hvx:
            return has_side_effect(n)
        k = n.get("kind")
        if k in SIDE_EFFECT_KINDS:
            return True
        if k == "UnaryOperator" and n.get("opcode") in ("++", "--"):
            return True
        if k == "BinaryOperator" and n.get("opcode") == "=":
            return True
        if k == "CallExpr":
            if not self.is_op(n) or self.op_effect(n):
                return True
        return any(self.fx(c) for c in kids(n))

    def op_effect(self, call):
        name = callee_name(call)
        if name.startswith("__builtin_"):
            return bool(self.heap_rx.match(name))
        return not self.pure_fn(name)

    def pure_fn(self, name, stack=()):
        """A header function is pure when its body writes nothing but its own locals and
        parameters, has no inline asm, and calls only pure functions or non-heap-writing
        builtins. Unknown bodies, recursion and function-pointer calls are effectful."""
        if name in self.pure_memo:
            return self.pure_memo[name]
        d = self.defs.get(name)
        if d is None or name in stack:
            return False
        res = [True]

        def local(x):
            x = strip(x)
            if x.get("kind") != "DeclRefExpr":
                return False
            r = x.get("referencedDecl", {})
            if r.get("kind") == "ParmVarDecl":
                return True
            return r.get("kind") == "VarDecl" and r["id"] in loc_ids

        loc_ids = set()

        def collect(x):
            if x.get("kind") == "VarDecl" and x.get("storageClass") not in ("static", "extern"):
                loc_ids.add(x["id"])
            for c in kids(x):
                collect(c)
        collect(d)

        def walk(x):
            k = x.get("kind")
            if k in ("GCCAsmStmt", "MSAsmStmt"):
                res[0] = False
            elif k == "CompoundAssignOperator" or (k == "BinaryOperator" and x.get("opcode") == "=") or \
                    (k == "UnaryOperator" and x.get("opcode") in ("++", "--")):
                if not local(kids(x)[0]):
                    res[0] = False
            elif k == "CallExpr":
                c = strip(kids(x)[0])
                cn = c.get("referencedDecl", {}).get("name") if c.get("kind") == "DeclRefExpr" else None
                if cn is None or c["referencedDecl"].get("kind") != "FunctionDecl":
                    res[0] = False
                elif cn == "__assert_fail":
                    pass
                elif cn.startswith("__builtin_"):
                    if self.heap_rx.match(cn):
                        res[0] = False
                elif not self.pure_fn(cn, stack + (name,)):
                    res[0] = False
            for c in kids(x):
                walk(c)
        walk(d)
        self.pure_memo[name] = res[0]
        return res[0]

    # ---- HVX types ----------------------------------------------------------
    def cls(self, t):
        """Canonical vector class name (the type the pointer-form ops are declared over)."""
        q = (t or {}).get("desugaredQualType", (t or {}).get("qualType", "")).strip()
        q = re.sub(r"\s+", " ", re.sub(r"\b(?:const|volatile)\b", "", q)).strip()
        c = self.cfg.get("vector_canonical", {}).get(q)
        if c is None:
            raise Reject("TYPE", f"unknown HVX vector class {q!r}")
        return c

    def decl_type(self, t):
        """Spelling used to declare a variable of vector type t."""
        if not self.hvx:
            return self.type_text(t)
        q = re.sub(r"^(?:(?:const|volatile)\s+)+", "", t.get("qualType", "")).strip()
        q = self.cfg.get("vector_spelling", {}).get(q, q)
        if not re.fullmatch(r"\w+", q):
            raise Reject("TYPE", f"unexpected vector type spelling {q!r}")
        return q

    # ---- source positions -------------------------------------------------
    def plain(self, loc):
        return loc is not None and "spellingLoc" not in loc and loc.get("_file") == self.main_file

    def argtoken(self, loc):
        """A token of the main file that was written as a macro argument."""
        return (loc is not None and "spellingLoc" in loc and loc["spellingLoc"].get("_file") == self.main_file
                and loc.get("expansionLoc", {}).get("isMacroArgExpansion"))

    def macro_body(self, loc):
        """Expansion offset of a token spelled in a macro body (not a macro argument)."""
        if loc is not None and "spellingLoc" in loc and not self.argtoken(loc) \
                and loc.get("expansionLoc", {}).get("_file") == self.main_file \
                and not loc["expansionLoc"].get("isMacroArgExpansion") and not loc.get("isMacroArgExpansion"):
            return loc["expansionLoc"]["offset"]
        return None

    def q6_builtin(self, name):
        """(builtin callee, parameter count) if `name` is a macro whose whole body is
        `__BUILTIN_VECTOR_WRAP(__builtin_HEXAGON_V6_x)(params, in order)`, else None."""
        d = self.macros.get(name)
        w = self.macros.get("__BUILTIN_VECTOR_WRAP")
        if not d or not w or w[0] != ["a"] or re.sub(r"\s+", "", w[1]) != "a##_128B":
            return None
        params, body = d
        m = re.fullmatch(r"__BUILTIN_VECTOR_WRAP\((__builtin_HEXAGON_V6_\w+)\)\(([^()]*)\)", body)
        if not m:
            return None
        args = [x.strip() for x in m.group(2).split(",")] if m.group(2).strip() else []
        if args != params or len(set(params)) != len(params):
            return None
        return m.group(1) + "_128B", len(params)

    def paren_args(self, i):
        """Argument spans of the call whose '(' is at text[i]; returns (spans, close index)."""
        t = self.text
        assert t[i] == "("
        spans, depth, cur, j = [], 0, i + 1, i + 1
        while j < len(t):
            c = t[j]
            if c in "\"'":
                q = c
                j += 1
                while t[j] != q:
                    j += 2 if t[j] == "\\" else 1
            elif t.startswith("/*", j):
                j = t.index("*/", j) + 1
            elif t.startswith("//", j):
                j = t.index("\n", j)
            elif c in "([{":
                depth += 1
            elif c in ")]}":
                if depth == 0:
                    last = (cur, j)
                    if t[cur:j].strip() or spans:
                        spans.append(last)
                    fixed = []
                    for s, e in spans:
                        while s < e and t[s].isspace():
                            s += 1
                        while e > s and t[e - 1].isspace():
                            e -= 1
                        fixed.append((s, e))
                    return fixed, j
                depth -= 1
            elif c == "," and depth == 0:
                spans.append((cur, j))
                cur = j + 1
            j += 1
        raise Reject("ARGTEXT", "unbalanced parentheses in a call")

    def macro_end(self, off, node):
        """End offset (just after ')') of the verified trivial Q6 macro invocation at `off`."""
        m = re.match(r"[A-Za-z_]\w*", self.text[off:])
        if not m or not self.q6_builtin(m.group(0)):
            raise Reject("MACRO", f"macro {m.group(0) if m else '?'} at a node needing rewrite is not a "
                                  "trivial HVX forwarding macro", node)
        i = off + m.end()
        while self.text[i].isspace():
            i += 1
        if self.text[i] != "(":
            raise Reject("MACRO", "macro invocation without '('", node)
        _, close = self.paren_args(i)
        return close + 1

    def edge(self, loc, is_end, n):
        if self.plain(loc):
            return loc["offset"] + loc["tokLen"] if is_end else loc["offset"]
        if self.hvx:
            if self.argtoken(loc):
                s = loc["spellingLoc"]
                return s["offset"] + s["tokLen"] if is_end else s["offset"]
            off = self.macro_body(loc)
            if off is not None:
                return self.macro_end(off, n) if is_end else off
        raise Reject("MACRO", "node needing rewrite is inside a macro expansion or another file", n)

    def span(self, n, what="node"):
        r = n.get("range", {})
        b, e = r.get("begin"), r.get("end")
        if self.hvx:
            return self.edge(b, False, n), self.edge(e, True, n)
        if not (self.plain(b) and self.plain(e)):
            raise Reject("MACRO", f"{what} needing rewrite is inside a macro expansion or another file", n)
        return b["offset"], e["offset"] + e["tokLen"]

    def src(self, n):
        s, e = self.span(n)
        return self.text[s:e]

    def line_of(self, n):
        b = n.get("range", {}).get("begin", {})
        for loc in (b, b.get("expansionLoc")):
            if loc and "offset" in loc and loc.get("_file") == self.main_file:
                return self.text.count("\n", 0, loc["offset"]) + 1
        return None

    def stmt_end(self, n):
        """End offset including the terminating ';' of an expression/return statement."""
        _, e = self.span(n)
        i = e
        t = self.text
        while i < len(t):
            if t[i].isspace():
                i += 1
            elif t.startswith("//", i):
                i = t.index("\n", i)
            elif t.startswith("/*", i):
                i = t.index("*/", i) + 2
            elif t[i] == ";":
                return i + 1
            else:
                break
        raise Reject("SHAPE", "could not find ';' terminating the statement", n)

    def indent_at(self, offset):
        ls = self.text.rfind("\n", 0, offset) + 1
        m = re.match(r"[ \t]*", self.text[ls:offset])
        return m.group(0) if m and m.group(0) == self.text[ls:offset][:len(m.group(0))] else ""

    def edit(self, start, end, repl, rule, n, original=None):
        self.edits.append((start, end, repl, len(self.edits)))
        self.log.append({"function": self.fn, "rule": rule, "line": self.text.count("\n", 0, start) + 1,
                         "original": self.text[start:end] if original is None else original,
                         "rewritten": repl})

    # ---- names -------------------------------------------------------------
    def fresh(self):
        while True:
            self.temp_counter += 1
            name = f"{TEMP_PREFIX}{self.temp_counter}"
            if name not in self.idents:
                self.idents.add(name)
                return name

    def type_text(self, t):
        """Canonical vector class name used for temporaries and copy ops."""
        if self.hvx:
            return self.cls(t)
        q = t.get("qualType", "")
        q = re.sub(r"^(?:const\s+|volatile\s+)+", "", q).strip()
        # builtin result types print as __rvv_X_t; riscv_vector.h names them vX_t
        q = re.sub(r"^__rvv_(\w+)_t$", r"v\1_t", q)
        if not re.fullmatch(r"\w+", q):
            raise Reject("TYPE", f"unexpected vector type spelling {q!r}")
        return q

    def copy_op(self, tname):
        self.copy_types.add(tname)
        return f"{PTR_PREFIX}copy_{tname}"

    # ---- HVX: loads, lane-0 puns (R26), call sites ----------------------------
    def load_info(self, n):
        """`*((VT *)p)` read as a vector value, p a pointer to a char class or void."""
        n = strip(n)
        if not self.hvx or n.get("kind") != "UnaryOperator" or n.get("opcode") != "*" or not self.nv(n):
            return None
        cast = strip(kids(n)[0])
        if cast.get("kind") != "CStyleCastExpr" or not kids(cast):
            return None
        ptr = kids(cast)[0]
        pt = ptr.get("type", {})
        q = (pt.get("desugaredQualType") or pt.get("qualType", "")).strip()
        if "volatile" in q:
            return None
        bare = re.sub(r"\b(?:const|restrict|__restrict)\b", "", q)
        m = re.fullmatch(r"\s*([\w ]+?)\s*\*\s*", bare)
        if not m:
            return None
        elem = m.group(1).strip()
        seen = set()
        while re.fullmatch(r"\w+", elem) and elem in self.typedefs and elem not in seen:
            seen.add(elem)
            elem = re.sub(r"\b(?:const|volatile)\b", "", self.typedefs[elem]).strip()
        if elem not in LOAD_POINTEES:
            return None
        spelled = re.sub(r"\b(?:const|volatile|restrict|__restrict)\b", "", pt.get("qualType", ""))
        spelled = re.sub(r"\*", "", spelled).strip()
        if not re.fullmatch(r"\w+", spelled):
            return None
        return {"vt": self.decl_type(n["type"]), "cls": self.cls(n["type"]), "elem": spelled,
                "elem_desugared": elem, "ptr": ptr}

    def pun_info(self, n):
        """R26: `*(T *)&v` with v a local automatic vector variable, T a char class or the
        vector's element type (offset 0 by construction)."""
        if n.get("kind") != "UnaryOperator" or n.get("opcode") != "*" or self.nv(n):
            return None
        cast = strip(kids(n)[0])
        if cast.get("kind") != "CStyleCastExpr" or not kids(cast):
            return None
        amp = strip(kids(cast)[0])
        if amp.get("kind") != "UnaryOperator" or amp.get("opcode") != "&":
            return None
        ref = strip(kids(amp)[0])
        if ref.get("kind") != "DeclRefExpr" or not self.nv(ref):
            return None
        var = self.vars.get(ref.get("referencedDecl", {}).get("id"))
        if var is None or var.get("storageClass") in ("static", "extern") or "volatile" in var["type"].get("qualType", ""):
            return None
        vq = var["type"].get("desugaredQualType") or var["type"].get("qualType", "")
        elem = re.sub(r"^(?:const\s+|volatile\s+)+", "", _strip_attrs(vq).strip()).strip()
        base = re.sub(r"^unsigned\s+", "", elem)
        tq = n["type"].get("desugaredQualType") or n["type"].get("qualType", "")
        target = re.sub(r"^(?:const\s+|volatile\s+)+", "", tq.strip()).strip()
        if target not in CHAR_CLASS | {base, "unsigned " + base}:
            return None
        spelled = re.sub(r"^(?:const\s+|volatile\s+)+", "", n["type"].get("qualType", "")).strip()
        if not re.fullmatch(r"\w+", spelled):
            return None
        return {"var": ref["referencedDecl"]["name"], "cls": self.cls(var["type"]), "target": target,
                "spelled": spelled, "amp": amp}

    def prescan(self, body):
        """HVX: find the R26 pun sites of a function and reject every other address-of a
        vector (the pointer form is the tool's own output; a user `&v` would alias it)."""
        self.puns, self.pun_amps, self.vars = {}, set(), {}

        def collect(x):
            if x.get("kind") == "VarDecl":
                self.vars[x["id"]] = x
            for c in kids(x):
                collect(c)
        collect(body)

        def scan(x, chain):
            k = x.get("kind")
            if k == "UnaryOperator" and x.get("opcode") == "*":
                info = self.pun_info(x)
                if info:
                    j = len(chain) - 1
                    while j >= 0 and chain[j].get("kind") == "ParenExpr":
                        j -= 1
                    if j < 0 or chain[j].get("kind") != "ImplicitCastExpr" or chain[j].get("castKind") != "LValueToRValue":
                        raise Reject("R26", "lane-0 pun `*(T*)&v` is not a plain value read", x)
                    self.puns[id(x)] = info
                    self.pun_amps.add(id(info["amp"]))
            if k == "UnaryOperator" and x.get("opcode") == "&" and id(x) not in self.pun_amps:
                if self.nv(strip(kids(x)[0])):
                    raise Reject("ADDROF", "address of a vector variable (only the R26 lane-0 read "
                                           "`*(T*)&v` is supported)", x)
            for c in kids(x):
                scan(c, chain + [x])
        scan(body, [])

    def pun_text(self, n):
        info = self.puns[id(n)]
        name = f"{PTR_PREFIX}lane0_{info['cls']}_{info['spelled']}"
        rec = {"kind": "lane0", "intrinsic": None, "callee": None, "macro": None, "ptr_op": name,
               "return_type": info["target"], "params": [info["cls"]], "vector_params": [True],
               "out_param": None}
        old = self.ops.get(name)
        if old and old != rec:
            raise Reject("TYPE", f"inconsistent lane-0 operations for {name}", n)
        self.ops[name] = rec
        text = f"{name}(&{info['var']})"
        s, e = self.span(n)
        self.log.append({"function": self.fn, "rule": "R26", "line": self.text.count("\n", 0, s) + 1,
                         "original": self.text[s:e], "rewritten": text})
        return text

    def call_site(self, call, bound=None):
        """(start, end, macro name or None, argument spans) of an HVX call. A call written
        through a trivial forwarding macro must be that macro's whole invocation."""
        callee = strip(kids(call)[0])
        b = call["range"]["begin"]
        t = self.text
        if self.plain(b) or self.argtoken(b):
            s, e = self.span(call, "call")
            if bound is not None and bound != (s, e):
                raise Reject("MACRO", "nested call does not coincide with the macro argument", call)
            _, ce = self.span(callee, "callee")
            i = ce
            while t[i].isspace():
                i += 1
            if t[i] != "(":
                raise Reject("ARGTEXT", "call text is not NAME(...)", call)
            spans, close = self.paren_args(i)
            if close + 1 != e:
                raise Reject("ARGTEXT", "call text does not end at its closing parenthesis", call)
            macro = None
        else:
            if bound is not None:
                s, e = bound
            else:
                s, e = self.macro_body(b), None
                if s is None:
                    raise Reject("MACRO", "call inside a macro expansion that is not a trivial forwarding macro", call)
            m = re.match(r"[A-Za-z_]\w*", t[s:s + 128])
            macro = m.group(0) if m else None
            q = self.q6_builtin(macro) if macro else None
            if not q:
                raise Reject("MACRO", f"call through macro {macro} which is not a trivial HVX forwarding macro", call)
            if callee_name(call) != q[0]:
                raise Reject("MACRO", f"macro {macro} does not forward to {callee_name(call)}", call)
            i = s + m.end()
            while t[i].isspace():
                i += 1
            if t[i] != "(":
                raise Reject("ARGTEXT", "macro invocation without '('", call)
            spans, close = self.paren_args(i)
            if e is not None and close + 1 != e:
                raise Reject("MACRO", "nested macro call does not coincide with the macro argument", call)
            e = close + 1
            if len(spans) != q[1]:
                raise Reject("ARGTEXT", f"macro {macro} invocation has {len(spans)} arguments, expected {q[1]}", call)
        if len(spans) != len(kids(call)) - 1:
            raise Reject("ARGTEXT", f"argument text split gives {len(spans)} pieces, AST has {len(kids(call)) - 1}", call)
        return s, e, macro, spans

    def op_args(self, call, bound=None):
        """(argument nodes, argument texts, argument spans or None, macro name or None)."""
        if not self.hvx:
            return kids(call)[1:], self.arg_texts(call), None, None
        info = self.load_info(call) if call.get("kind") != "CallExpr" else None
        if info:
            p = info["ptr"]
            if self.inv(p):
                raise Reject("VECEXPR", "vector code in the address of a vector load", p)
            s, e = self.span(p, "load address")
            return [p], [self.text[s:e]], [(s, e)], None
        _, _, macro, spans = self.call_site(call, bound)
        return kids(call)[1:], [self.text[s:e] for s, e in spans], spans, macro

    def record_op_h(self, call, out_type, parts):
        info = self.load_info(call) if call.get("kind") != "CallExpr" else None
        if info:
            name = f"{PTR_PREFIX}load_{info['vt']}_{info['elem']}"
            rec = {"kind": "load", "intrinsic": None, "callee": None, "macro": None, "ptr_op": name,
                   "return_type": info["cls"], "params": [f"const {info['elem_desugared']} *"],
                   "vector_params": [False], "out_param": out_type, "load_type": info["vt"]}
        else:
            callee = callee_name(call)
            macro = parts[3]
            kind = "builtin" if callee.startswith("__builtin_") else "wrapper"
            base = macro or (callee if kind == "wrapper" else callee[len("__builtin_"):])
            args = parts[0]
            vec = [self.vt(a.get("type")) for a in args]
            params = [self.cls(a["type"]) if v else canonical(a.get("type")) for a, v in zip(args, vec)]
            if any(not p for p in params):
                raise Reject("TYPE", f"cannot read the argument types of {callee}", call)
            ret = self.cls(call["type"]) if self.nv(call) else canonical(call.get("type"))
            rec = {"kind": kind, "intrinsic": callee, "callee": callee, "macro": macro,
                   "ptr_op": PTR_PREFIX + base, "return_type": ret, "params": params,
                   "vector_params": vec, "out_param": out_type}
        old = self.ops.get(rec["ptr_op"])
        if old and old != rec:
            raise Reject("TYPE", f"inconsistent signatures for {rec['ptr_op']}", call)
        self.ops[rec["ptr_op"]] = rec
        return rec["ptr_op"]

    def record_op(self, call, out_type, parts=None):
        if self.hvx:
            return self.record_op_h(call, out_type, parts)
        name = callee_name(call)
        # RVV intrinsics are clang builtins ('<builtin fn type>'), so the signature is
        # read from the call: clang converts every argument to its parameter type with
        # an implicit cast, so the outermost argument type is the parameter type.
        # Clang omits the cast when argument and parameter types are canonically equal
        # (e.g. int vs int32_t), so signatures are recorded with canonical types.
        args = kids(call)[1:]
        params = [canonical(a.get("type")) for a in args]
        if any(not p for p in params):
            raise Reject("TYPE", f"cannot read the argument types of {name}", call)
        vec = [self.vt(a.get("type")) for a in args]
        rec = {"intrinsic": name, "ptr_op": PTR_PREFIX + name[len("__riscv_"):],
               "return_type": canonical(call.get("type")),
               "params": params, "vector_params": vec,
               "out_param": out_type}
        old = self.ops.get(rec["ptr_op"])
        if old and old != rec:
            raise Reject("TYPE", f"inconsistent signatures for {name}", call)
        self.ops[rec["ptr_op"]] = rec
        return rec["ptr_op"]

    # ---- expression lowering ----------------------------------------------
    def vec_operand(self, n, pre, bound=None):
        """Lower an RVV-typed argument to the name of a variable holding it (R6/R7)."""
        s = strip(n)
        k = s.get("kind")
        if k == "DeclRefExpr":
            d = s.get("referencedDecl", {})
            if d.get("kind") == "ParmVarDecl":
                raise Reject("VECPARAM", "vector-typed function parameter", s)
            if d.get("kind") != "VarDecl":
                raise Reject("VECEXPR", f"vector reference to {d.get('kind')}", s)
            return d["name"]
        if self.is_op(s) and self.nv(s):
            self.lifted.append(s)
            t = self.fresh()
            tname = self.type_text(s["type"])
            pre.append(f"{tname} {t};")
            pre.append(self.call_into(s, t, pre, bound=bound) + ";")
            return t
        if k == "CallExpr":
            raise Reject("VECCALL", f"non-intrinsic call {callee_name(s)} producing a vector", s)
        raise Reject("VECEXPR", f"unsupported vector expression kind {k}", s)

    def arg_texts(self, call):
        """Source text of each argument, split at top-level commas of the call's own
        parentheses. Arguments that are macro invocations (e.g. UINT32_C(1)) are copied
        verbatim; the split must yield exactly the AST's argument count."""
        s, e = self.span(call, "call")
        _, ce = self.span(kids(call)[0], "callee")
        t = self.text
        i = ce
        while t[i].isspace():
            i += 1
        if t[i] != "(" or t[e - 1] != ")":
            raise Reject("ARGTEXT", "call text is not NAME(...)", call)
        parts, depth, cur, j = [], 0, i + 1, i + 1
        while j < e - 1:
            c = t[j]
            if c in "\"'":
                q = c
                j += 1
                while t[j] != q:
                    j += 2 if t[j] == "\\" else 1
            elif t.startswith("/*", j):
                j = t.index("*/", j) + 1
            elif t.startswith("//", j):
                j = t.index("\n", j)
            elif c in "([{":
                depth += 1
            elif c in ")]}":
                depth -= 1
            elif c == "," and depth == 0:
                parts.append(t[cur:j].strip())
                cur = j + 1
            j += 1
        tail = t[cur:e - 1].strip()
        if tail or parts:
            parts.append(tail)
        if len(parts) != len(kids(call)) - 1:
            raise Reject("ARGTEXT", f"argument text split gives {len(parts)} pieces, AST has {len(kids(call)) - 1}", call)
        return parts

    def lifted_args(self, parts, pre):
        """Arguments of a call in pointer form (R7); nested vector calls are lifted (R6).
        Reordering safety of the lifts is checked per statement by check_lifts.
        `parts` is op_args(call): (argument nodes, texts, spans or None, macro)."""
        nodes, texts, spans, _ = parts
        out = []
        for i, (a, txt) in enumerate(zip(nodes, texts)):
            sp = spans[i] if spans else None
            if self.vt(a.get("type")):
                out.append("&" + self.vec_operand(a, pre, sp))
            elif self.inv(a):
                out.append(self.scalar_expr(a, pre, bound=sp))
            else:
                out.append(txt)
        return out

    def call_into(self, call, target, pre, top=False, bound=None):
        """Text of `qcp_p_f(&target, args')`; nested lifts are appended to pre."""
        parts = self.op_args(call, bound)
        op = self.record_op(call, self.type_text(call["type"]), parts)
        args = self.lifted_args(parts, pre)
        return f"{op}(&{target}" + "".join(", " + a for a in args) + ")"

    def scalar_expr(self, n, pre, top=False, bound=None):
        """Lower a non-vector expression that may contain vector subexpressions."""
        if self.nv(n):
            raise Reject("VECEXPR", "vector value in scalar context", n)
        if not self.inv(n):
            return self.src(n)
        if id(n) in self.puns:
            return self.pun_text(n)
        k = n.get("kind")
        if k == "CallExpr":
            if not self.is_op(n):
                raise Reject("VECCALL", f"non-intrinsic call {callee_name(n)} with vector arguments", n)
            parts = self.op_args(n, bound)
            op = self.record_op(n, None, parts)
            return f"{op}(" + ", ".join(self.lifted_args(parts, pre)) + ")"
        if k == "BinaryOperator" and n.get("opcode") in ("&&", "||", ","):
            if any(self.inv(c) for c in kids(n)[1:]):
                raise Reject("CONDEVAL", f"vector call in conditionally evaluated operand of {n['opcode']}", n)
        if k == "ConditionalOperator" and any(self.inv(c) for c in kids(n)[1:]):
            raise Reject("CONDEVAL", "vector call in a branch of ?:", n)
        # generic splice: keep the node's text, replacing each child that changes
        s, e = self.span(n)
        pieces, cur = [], s
        for c in kids(n):
            if not self.inv(c):
                continue
            cs, ce = self.span(c)
            pieces.append(self.text[cur:cs])
            pieces.append(self.scalar_expr(c, pre))
            cur = ce
        pieces.append(self.text[cur:e])
        return "".join(pieces)

    # ---- statements --------------------------------------------------------
    def check_lifts(self, n):
        """R6 safety: lifted calls are evaluated before the rest of the statement.
        This is unobservable when (a) lifted calls have no side effects (they are pure
        or loads; stores are void and never lifted), (b) the rest of the statement
        writes only named variables (++, --, =, op=) apart from a top-level assignment
        or initialisation, which C sequences after its operands anyway, and (c) no
        variable written by the rest is read by a lifted call."""
        lifted, self.lifted = self.lifted, []
        if not lifted:
            return
        for c in lifted:
            if self.fx(c):
                raise Reject("SIDEEFFECT", f"lifted call {callee_name(c)} has side effects", c)
        lifted_ids = {id(c) for c in lifted}
        root_call = None
        if self.hvx:
            if n.get("kind") == "DeclStmt":
                ds = kids(n)
                root_call = strip(kids(ds[0])[0]) if len(ds) == 1 and kids(ds[0]) else None
            elif n.get("kind") == "ReturnStmt":
                root_call = strip(kids(n)[0])
            else:
                root_call = strip(n)
        reads = set()
        for c in lifted:
            reads |= decl_refs(c)
        writes = set()

        def walk(x, top):
            if id(x) in lifted_ids:
                return
            k = x.get("kind")
            if k == "CallExpr" and not self.is_op(x) and not is_vsetvl_builtin(x):
                raise Reject("SIDEEFFECT", f"call to {callee_name(x)} in a statement with lifted vector calls", x)
            if self.hvx and k == "CallExpr" and self.op_effect(x) and x is not root_call:
                raise Reject("SIDEEFFECT", f"effectful call {callee_name(x)} is not the whole statement "
                                           "in a statement with lifted vector calls", x)
            if k in ("BinaryOperator", "CompoundAssignOperator") and (x.get("opcode") == "=" or k == "CompoundAssignOperator") \
                    or (k == "UnaryOperator" and x.get("opcode") in ("++", "--")):
                lhs = strip(kids(x)[0])
                if top and k == "BinaryOperator":
                    pass  # the statement's own assignment happens after all operands
                elif lhs.get("kind") == "DeclRefExpr":
                    writes.add(lhs.get("referencedDecl", {}).get("id"))
                else:
                    raise Reject("SIDEEFFECT", "memory write inside a statement with lifted vector calls", x)
            for c in kids(x):
                walk(c, False)
        root = n
        if root.get("kind") == "DeclStmt":
            for d in kids(root):
                for c in kids(d):
                    walk(c, False)
        else:
            walk(root, True)
        if reads & writes:
            raise Reject("SIDEEFFECT", "a lifted call reads a variable written elsewhere in the statement", n)

    def emit_stmt(self, n, parent_kind, start, end, stmts, rule, note=None):
        self.check_lifts(n)
        ind = self.indent_at(start)
        if len(stmts) > 1 and parent_kind != "CompoundStmt":
            repl = "{ " + " ".join(stmts) + " }"
            rule = rule + "+R9"
        else:
            repl = ("\n" + ind).join(stmts)
        self.edit(start, end, repl, rule, n)
        if note:
            self.log[-1]["note"] = note

    def decl_stmt(self, n, parent_kind):
        decls = kids(n)
        if not any(self.inv(d) or self.vt(d.get("type")) for d in decls):
            return
        rvv_decls = [d for d in decls if self.vt(d.get("type"))]
        if len(decls) != 1:
            if all(not kids(d) for d in decls):
                return  # several vector declarations without initialisers: nothing to do
            if len(rvv_decls) != len(decls):
                raise Reject("SHAPE", "declaration mixing vector and non-vector declarators", n)
            # R13: split `T a = x, b = y;` into one declaration per declarator, in order
            # (C initialises declarators in order and each is in scope after its own).
            s, e = self.span(n, "declaration")
            stmts, rules = [], []
            for d in decls:
                st, rule = self.vec_declarator(d, [])
                stmts += st
                rules.append(rule)
            self.emit_stmt(n, parent_kind, s, e, stmts, "R13(" + ",".join(rules) + ")")
            return
        d = decls[0]
        s, e = self.span(n, "declaration")
        if d.get("kind") != "VarDecl":
            raise Reject("SHAPE", f"vector declaration of kind {d.get('kind')}", n)
        init = kids(d)[0] if kids(d) else None
        if not rvv_decls:
            # scalar declaration whose initialiser contains vector code
            pre = []
            if d.get("init") != "c":
                raise Reject("SHAPE", "unsupported initialiser style", n)
            new_init = self.scalar_expr(init, pre)
            is_, ie = self.span(init)
            stmt = self.text[s:is_] + new_init + self.text[ie:e]
            self.emit_stmt(n, parent_kind, s, e, pre + [stmt], "R6/R8")
            return
        if init is None:
            return
        stmts, rule = self.vec_declarator(d, [])
        note = "R11: dropped const" if d["type"]["qualType"].strip().startswith("const") else None
        self.emit_stmt(n, parent_kind, s, e, stmts, rule, note)

    def vec_declarator(self, d, pre):
        """Statements for one vector declarator (R1/R2; uninitialised kept as is)."""
        if d.get("kind") != "VarDecl":
            raise Reject("SHAPE", f"vector declaration of kind {d.get('kind')}", d)
        tname = self.decl_type(d["type"])
        cname = self.type_text(d["type"])
        v = d["name"]
        init = kids(d)[0] if kids(d) else None
        if init is None:
            return [f"{tname} {v};"], "keep"
        if d.get("init") != "c":
            raise Reject("SHAPE", "unsupported initialiser style", d)
        si = strip(init)
        if self.is_op(si) and self.nv(si):
            call = self.call_into(si, v, pre, top=True)
            return [f"{tname} {v};"] + pre + [call + ";"], "R1"
        if si.get("kind") == "DeclRefExpr":
            u = self.vec_operand(si, pre)
            return [f"{tname} {v};", f"{self.copy_op(cname)}(&{v}, &{u});"], "R2"
        raise Reject("VECEXPR", f"vector initialiser of kind {si.get('kind')}", d)

    def expr_stmt(self, n, parent_kind):
        if not self.inv(n):
            return
        s, _ = self.span(n, "statement")
        e = self.stmt_end(n)
        x = strip(n)
        pre = []
        if self.nv(x):
            if not (x.get("kind") == "BinaryOperator" and x.get("opcode") == "="):
                raise Reject("VECEXPR", f"vector expression statement of kind {x.get('kind')}", n)
            lhs, rhs = kids(x)
            lhs = strip(lhs)
            if lhs.get("kind") != "DeclRefExpr" or lhs.get("referencedDecl", {}).get("kind") != "VarDecl":
                raise Reject("VECEXPR", "assignment to a vector lvalue that is not a local variable", n)
            v = lhs["referencedDecl"]["name"]
            tname = self.type_text(lhs["type"])
            r = strip(rhs)
            if r.get("kind") == "DeclRefExpr":
                u = self.vec_operand(r, pre)
                self.emit_stmt(n, parent_kind, s, e, [f"{self.copy_op(tname)}(&{v}, &{u});"], "R5")
                return
            if self.is_op(r):
                direct = set()
                for a in (kids(r)[1:] if r.get("kind") == "CallExpr" else []):
                    sa = strip(a)
                    if self.vt(a.get("type")) and sa.get("kind") == "DeclRefExpr":
                        direct.add(sa["referencedDecl"]["name"])
                if v in direct:
                    t = self.fresh()
                    call = self.call_into(r, t, pre, top=True)
                    self.emit_stmt(n, parent_kind, s, e,
                                   [f"{tname} {t};"] + pre + [call + ";", f"{self.copy_op(tname)}(&{v}, &{t});"], "R4")
                else:
                    call = self.call_into(r, v, pre, top=True)
                    self.emit_stmt(n, parent_kind, s, e, pre + [call + ";"], "R3")
                return
            raise Reject("VECEXPR", f"vector assignment from {r.get('kind')}", n)
        new = self.scalar_expr(n, pre, top=True)
        self.emit_stmt(n, parent_kind, s, e, pre + [new + ";"], "R6/R8")

    def return_stmt(self, n, parent_kind):
        if not self.inv(n):
            return
        val = kids(n)[0]
        if self.nv(val):
            raise Reject("VECRET", "function returns a vector by value", n)
        s, _ = self.span(n, "return")
        e = self.stmt_end(val)
        pre = []
        new = self.scalar_expr(val, pre)
        self.emit_stmt(n, parent_kind, s, e, pre + [f"return {new};"], "R6/R8")

    def cond_lift(self, stmt, cond, rule):
        """R10: lift vector code out of an if/switch condition."""
        pre = []
        new = self.scalar_expr(cond, pre)
        self.check_lifts(cond)
        cs, ce = self.span(cond, "condition")
        s, _ = self.span(stmt, "statement")
        ind = self.indent_at(s)
        self.edit(cs, ce, new, rule, cond)
        if pre:
            self.edit(s, s, ("\n" + ind).join(pre) + "\n" + ind, rule, stmt, original="")

    def stmt(self, n, parent_kind):
        k = n.get("kind")
        if k == "CompoundStmt":
            for c in kids(n):
                self.stmt(c, "CompoundStmt")
        elif k == "DeclStmt":
            self.decl_stmt(n, parent_kind)
        elif k == "ReturnStmt":
            if kids(n):
                self.return_stmt(n, parent_kind)
        elif k == "IfStmt":
            ch = kids(n)
            if n.get("hasInit") or n.get("hasVar"):
                raise Reject("SHAPE", "if with init/variable", n)
            cond, rest = ch[0], ch[1:]
            if self.inv(cond):
                if parent_kind != "CompoundStmt":
                    raise Reject("SHAPE", "if with vector condition outside a block", n)
                self.cond_lift(n, cond, "R10")
            for c in rest:
                self.stmt(c, "IfStmt")
        elif k == "SwitchStmt":
            ch = kids(n)
            if self.inv(ch[0]):
                if parent_kind != "CompoundStmt":
                    raise Reject("SHAPE", "switch with vector condition outside a block", n)
                self.cond_lift(n, ch[0], "R10")
            for c in ch[1:]:
                self.stmt(c, "SwitchStmt")
        elif k in ("ForStmt", "WhileStmt", "DoStmt"):
            ch = kids(n)
            body = ch[-1] if k != "DoStmt" else ch[0]
            heads = [c for c in ch if c is not body]
            for h in heads:
                if h and self.inv(h):
                    raise Reject("LOOPHEAD", f"vector code in the header/condition of a {k}", h)
            self.stmt(body, k)
        elif k in ("CaseStmt", "DefaultStmt", "LabelStmt"):
            ch = kids(n)
            for c in ch:
                if c.get("kind", "").endswith("Stmt") or c.get("kind") in ("CompoundStmt",):
                    self.stmt(c, k)
                elif c is ch[-1]:
                    self.stmt(c, k)
        elif k in ("NullStmt", "BreakStmt", "ContinueStmt", "GotoStmt"):
            return
        elif k and (k.endswith("Expr") or k.endswith("Operator") or k.endswith("Literal")):
            self.expr_stmt(n, parent_kind)
        else:
            if self.inv(n):
                raise Reject("SHAPE", f"vector code inside unsupported statement {k}", n)

    def function(self, fn):
        self.fn = fn["name"]
        ptype = fn.get("type", {}).get("qualType", "")
        for p in kids(fn):
            if p.get("kind") == "ParmVarDecl" and self.vt(p.get("type")):
                raise Reject("VECPARAM", f"function {fn['name']} has a vector parameter", p)
        m = re.match(r"^(.*?)\s*\(", ptype)
        if m and RVV_TYPE.match(m.group(1).strip()):
            raise Reject("VECRET", f"function {fn['name']} returns a vector", fn)
        if self.hvx and m:
            rt = re.sub(r"^(?:(?:const|volatile)\s+)+", "", m.group(1).strip())
            if rt in self.vec_typedefs or self.vt({"qualType": rt}):
                raise Reject("VECRET", f"function {fn['name']} returns a vector", fn)
        body = [c for c in kids(fn) if c.get("kind") == "CompoundStmt"]
        if body:
            if self.hvx:
                self.prescan(body[0])
            self.stmt(body[0], "FunctionDecl")

    def apply(self):
        ed = sorted(self.edits, key=lambda x: (x[0], x[1], x[3]))
        for a, b in zip(ed, ed[1:]):
            if b[0] < a[1]:
                raise Reject("INTERNAL", "overlapping edits")
        out, cur = [], 0
        for s, e, r, _ in ed:
            out.append(self.text[cur:s])
            out.append(r)
            cur = e
        out.append(self.text[cur:])
        return "".join(out)


# ----------------------------------------------------------------------------
# generated pointer-form header (real RVV semantics; for compiling/diff-testing)


ISA_INCLUDES = {"rvv": ["#include <riscv_vector.h>"],
                "hvx": ["#include <stddef.h>", "#include <stdint.h>", "#include <string.h>",
                        "#include <hexagon_types.h>"]}


def gen_header(ops, copy_types, isa="rvv"):
    """Pointer-form ops as macros over the real intrinsics. Macros (not functions) keep
    arguments that must be integer constant expressions (vget/vset index, vxrm
    rounding mode, ...) constant."""
    name_isa = {"rvv": "RVV", "hvx": "HVX"}[isa]
    lines = ["/* Generated by " + TOOL_VERSION + f". Pointer-form wrappers over the real {name_isa}",
             " * intrinsics: vector arguments are read through pointers and a vector result",
             " * is written through the first pointer. Used to compile and differentially",
             " * test the lowered program; the QCP proof uses a separate shim with the same",
             " * names and contracts. */",
             "#pragma once"] + ISA_INCLUDES[isa] + [""]
    for t in sorted(copy_types):
        lines.append(f"static inline void {PTR_PREFIX}copy_{t}({t} *qcp_r, const {t} *qcp_a) {{ *qcp_r = *qcp_a; }}")
    for name in sorted(ops):
        r = ops[name]
        kind = r.get("kind")
        if kind == "lane0":
            lines.append(f"/* {name}: lane 0 of {r['params'][0]} read as {r['return_type']} (R26) */")
            lines.append(f"static inline {r['return_type']} {name}(const {r['params'][0]} *qcp_a0) "
                         f"{{ {r['return_type']} qcp_r; memcpy(&qcp_r, qcp_a0, sizeof qcp_r); return qcp_r; }}")
            continue
        params, call = [], []
        if r["out_param"]:
            params.append("qcp_r")
        for i, isv in enumerate(r["vector_params"]):
            params.append(f"qcp_a{i}")
            call.append(f"*(qcp_a{i})" if isv else f"(qcp_a{i})")
        if kind == "load":
            inv = f"*(({r['load_type']} *)(qcp_a0))"
        else:
            inv = f"{r.get('macro') or r['intrinsic']}({', '.join(call)})"
        body = f"(*(qcp_r) = {inv})" if r["out_param"] else f"({inv})"
        sig = "; ".join(f"{p}{' (vector)' if v else ''}" for p, v in zip(r["params"], r["vector_params"]))
        lines.append(f"/* {name}: {('out ' + r['out_param'] + '; ') if r['out_param'] else ''}{sig} -> {r['return_type']} */")
        lines.append(f"#define {name}({', '.join(params)}) {body}")
    return "\n".join(lines) + "\n"

def gen_prototypes(ops, copy_types, isa="rvv"):
    """The pointer-form interface as C prototypes (canonical types). This is the list
    of functions the QCP shim must implement and specify."""
    lines = ["/* Generated by " + TOOL_VERSION + ". Pointer-form interface (prototypes). */",
             "#pragma once"] + ISA_INCLUDES[isa] + [""]
    for t in sorted(copy_types):
        lines.append(f"void {PTR_PREFIX}copy_{t}({t} *qcp_r, const {t} *qcp_a);")
    for name in sorted(ops):
        r = ops[name]
        ps = [f"{r['out_param']} *qcp_r"] if r["out_param"] else []
        for i, (pt, isv) in enumerate(zip(r["params"], r["vector_params"])):
            base = re.sub(r"^(?:const\s+)+", "", pt)
            ps.append(f"const {base} *qcp_a{i}" if isv else f"{pt} qcp_a{i}")
        ret = "void" if r["out_param"] else r["return_type"]
        lines.append(f"{ret} {name}({', '.join(ps) or 'void'});")
    return "\n".join(lines) + "\n"


# ----------------------------------------------------------------------------
# R12: expansion of kernel-local macros that contain vector code


def directives(text):
    """(start, end, directive, name) for every preprocessor directive, including
    backslash-continued lines."""
    out, pos = [], 0
    lines = text.splitlines(keepends=True)
    i = 0
    while i < len(lines):
        start = pos
        if re.match(r"[ \t]*#", lines[i]):
            j = i
            while lines[j].rstrip("\r\n").endswith("\\") and j + 1 < len(lines):
                j += 1
            end = start + sum(len(lines[k]) for k in range(i, j + 1))
            m = re.match(r"[ \t]*#[ \t]*(\w+)[ \t]*(\w*)", text[start:end])
            out.append((start, end, m.group(1) if m else "", m.group(2) if m else ""))
            pos = end
            i = j + 1
        else:
            pos += len(lines[i])
            i += 1
    return out


def target_macros(text, dirs):
    """Macros defined in this file whose body mentions RVV intrinsics or vector types,
    closed under 'body mentions another target macro'."""
    bodies = {}
    for s, e, d, name in dirs:
        if d == "define":
            body = re.sub(r"^[ \t]*#[ \t]*define[ \t]+\w+", "", text[s:e], count=1)
            bodies.setdefault(name, []).append((body, text[s:e]))
    targets = {n for n, bs in bodies.items()
               if any(re.search(r"__riscv_|\bv(?:float|int|uint|bool)\w*_t\b", b) for b, _ in bs)}
    changed = True
    while changed:
        changed = False
        for n, bs in bodies.items():
            if n not in targets and any(re.search(r"\b(" + "|".join(map(re.escape, targets)) + r")\b", b)
                                         for b, _ in bs) and targets:
                targets.add(n)
                changed = True
    function_like = {n: any(re.match(r"[ \t]*#[ \t]*define[ \t]+\w+\(", full) for _, full in bs)
                     for n, bs in bodies.items()}
    return targets, function_like


def invocation_sites(ast, text, main_file, targets, function_like):
    sites = set()

    def visit(n):
        if isinstance(n, dict):
            r = n.get("range", {})
            for loc in (r.get("begin"), r.get("end")):
                if loc and "expansionLoc" in loc and loc["expansionLoc"].get("_file") == main_file:
                    sites.add(loc["expansionLoc"]["offset"])
            for c in n.get("inner", []) or []:
                visit(c)
    visit(ast)
    out = []
    for o in sorted(sites):
        m = re.match(r"\w+", text[o:])
        if not m or m.group(0) not in targets:
            continue
        name = m.group(0)
        end = o + len(name)
        if function_like[name]:
            j = end
            while text[j].isspace():
                j += 1
            if text[j] != "(":
                raise Reject("MACRO", f"function-like macro {name} used without arguments")
            depth = 0
            while True:
                if text[j] == "(":
                    depth += 1
                elif text[j] == ")":
                    depth -= 1
                    if depth == 0:
                        break
                j += 1
            end = j + 1
        out.append((o, end, name))
    for a, b in zip(out, out[1:]):
        if b[0] < a[1]:
            raise Reject("MACRO", "nested target-macro invocation sites")
    return out


def expand_local_macros(cfg, text, ast, main_file, work_dir):
    dirs = directives(text)
    targets, function_like = target_macros(text, dirs)
    if not targets:
        return text, []
    sites = invocation_sites(ast, text, main_file, targets, function_like)
    if not sites:
        return text, []
    # Derived file for clang's preprocessor: only the target macros' #define/#undef
    # survive; every other directive (includes, other macros, conditionals) is blanked,
    # so header macros (UINT32_C, XNN_*, assert) stay unexpanded and are expanded later
    # by the real compile exactly as before.
    keep = [(s, e) for s, e, d, name in dirs if d in ("define", "undef") and name in targets]
    blank = [(s, e) for s, e, d, name in dirs if (s, e) not in keep]
    edits = [(s, e, re.sub(r"[^\n]", " ", text[s:e])) for s, e in blank]
    edits += [(s, s, f" QCPX_B{i} ") for i, (s, _, _) in enumerate(sites)]
    edits += [(e, e, f" QCPX_E{i} ") for i, (_, e, _) in enumerate(sites)]
    edits.sort(key=lambda x: (x[0], x[1]))
    derived, cur = [], 0
    for s, e, r in edits:
        derived.append(text[cur:s])
        derived.append(r)
        cur = e
    derived.append(text[cur:])
    dpath = work_dir / "r12-derived.c"
    dpath.write_bytes("".join(derived).encode("latin-1"))
    cmd = [str(REPO / cfg["clang"][0])] + cfg["clang"][1:] + cfg["target_flags"] + \
        ["-E", "-P", "-nostdinc", "-x", "c", str(dpath)]
    p = subprocess.run(cmd, capture_output=True, env=clang_env())
    if p.returncode != 0:
        raise Reject("MACRO", "preprocessing for R12 failed: " + p.stderr.decode("utf-8", "replace")[:300])
    pp = p.stdout.decode("latin-1")
    log, out, cur = [], [], 0
    for i, (s, e, name) in enumerate(sites):
        m = re.search(rf"\bQCPX_B{i}\b(.*?)\bQCPX_E{i}\b", pp, re.S)
        if not m:
            raise Reject("MACRO", f"could not locate the expansion of {name}")
        exp = " ".join(m.group(1).split())
        out.append(text[cur:s])
        out.append(exp)
        cur = e
        log.append({"rule": "R12", "line": text.count("\n", 0, s) + 1, "macro": name,
                    "original": text[s:e], "rewritten": exp})
    out.append(text[cur:])
    new = "".join(out)
    # The target macros are now unused; their #define/#undef lines are replaced by a
    # comment (same line count) so the proof input contains no vector code in macros.
    ndirs = directives(new)
    rest = new
    for s, e, d, name in sorted(ndirs, reverse=True):
        if d in ("define", "undef") and name in targets:
            nl = rest[s:e].count("\n")
            rest = rest[:s] + f"/* R12: #{d} {name} removed; expanded at its uses */" + "\n" * nl + rest[e:]
    for name in targets:
        body_free = re.sub(r"/\*.*?\*/", "", rest, flags=re.S)
        if re.search(rf"\b{re.escape(name)}\b", body_free):
            raise Reject("MACRO", f"target macro {name} still used after expansion")
    return rest, log


# ----------------------------------------------------------------------------
# QCP frontend normalisation, applied to both ISAs (NEON A and RVV Bopt):
#   R14 an inline asm statement whose only content is an alignment directive
#       (.balign/.p2align/.align N, no operands or clobbers) is replaced by an empty
#       statement: it only pads instruction layout and has no C-level effect.
#   R15 `do S while (OP v REL e);` / `do S while (OP v);` with OP in {++,--} applied
#       to a plain variable v, e free of side effects and of v, and no `continue`
#       binding to this loop  ->  `do { S OP v; } while (v REL e);` / `(v)`.
#       The condition is evaluated exactly once after each iteration of S, so moving
#       its side effect to the end of the body preserves the evaluation sequence.
#   Any other loop condition with ++/--/assignment is rejected (NORMCOND).

ASM_ALIGN = re.compile(r'^(?:asm|__asm__)\s*(?:volatile|__volatile__)?\s*\(\s*"\s*\.(?:p2align|balign|align)\s+\d+\s*"\s*\)\s*;$', re.S)
RELOPS = {"==", "!=", "<", "<=", ">", ">="}


def _cond_side_effect(n):
    k = n.get("kind")
    if k == "UnaryOperator" and n.get("opcode") in ("++", "--"):
        return True
    if k == "CompoundAssignOperator" or (k == "BinaryOperator" and n.get("opcode") == "="):
        return True
    return any(_cond_side_effect(c) for c in kids(n))


def _continue_binds(body):
    def rec(n):
        k = n.get("kind")
        if k == "ContinueStmt":
            return True
        if k in ("ForStmt", "WhileStmt", "DoStmt"):
            return False
        return any(rec(c) for c in kids(n))
    return any(rec(c) for c in kids(body))


def _prefix_var(n):
    n = strip(n)
    if n.get("kind") == "UnaryOperator" and n.get("opcode") in ("++", "--") and not n.get("isPostfix"):
        v = strip(kids(n)[0])
        if v.get("kind") == "DeclRefExpr" and v.get("referencedDecl", {}).get("kind") in ("VarDecl", "ParmVarDecl"):
            return n, v
    return None


def normalize(text, ast, main_file, sysdirs=()):
    low = Lowerer(text, main_file)
    fn_decls = {d.get("id"): d for d in kids(ast) if d.get("kind") == "FunctionDecl"}
    real_sysdirs = [os.path.realpath(d) + os.sep for d in sysdirs]

    def system_intrinsic(call):
        """True if the callee is a compiler builtin or is declared in a system header
        (clang resource or libc include directory). A function that the kernel file itself
        defines or declares does not qualify, whatever its name."""
        c = strip(kids(call)[0])
        ref = c.get("referencedDecl", {}) if c.get("kind") == "DeclRefExpr" else {}
        d = fn_decls.get(ref.get("id"))
        if d is None:
            return False
        if d.get("isImplicit") or d.get("name", "").startswith("__builtin_"):
            return True
        f = node_file(d)
        return bool(f) and (os.path.realpath(f) + os.sep).startswith(tuple(real_sysdirs))

    def do_stmt(n):
        body, cond = kids(n)[0], kids(n)[1]
        c = strip(cond)
        pv = _prefix_var(c)
        rhs = None
        if pv is None and c.get("kind") == "BinaryOperator" and c.get("opcode") in RELOPS:
            pv = _prefix_var(kids(c)[0])
            rhs = kids(c)[1]
        if pv is None:
            if _cond_side_effect(cond):
                raise Reject("NORMCOND", "do-while condition with a side effect outside the R15 pattern", n)
            return
        un, var = pv
        vid = var.get("referencedDecl", {}).get("id")
        if rhs is not None and (has_side_effect(rhs) or _cond_side_effect(rhs) or vid in decl_refs(rhs)):
            raise Reject("NORMCOND", "do-while condition: right operand has side effects or mentions the variable", n)
        if body.get("kind") != "CompoundStmt":
            raise Reject("NORMCOND", "do-while body is not a block", n)
        if _continue_binds(body):
            raise Reject("NORMCOND", "do-while body contains continue; moving the condition side effect would skip it", n)
        name = var["referencedDecl"]["name"]
        op = un["opcode"]
        cop = "-=" if op == "--" else "+="
        us, ue = low.span(un, "condition operand")
        low.edit(us, ue, name, "R15", un)
        _, be = low.span(body, "do-while body")
        close = be - 1
        assert low.text[close] == "}"
        ls = low.text.rfind("\n", 0, close) + 1
        if low.text[ls:close].strip() == "":
            ind = low.text[ls:close]
            low.edit(ls, ls, f"{ind}  {name} {cop} 1;  /* R15: moved from the do-while condition */\n", "R15", body, original="")
        else:
            low.edit(close, close, f" {name} {cop} 1; /* R15 */ ", "R15", body, original="")

    def r16(stmt):
        """R16: `++v;`, `--v;`, `v++;`, `v--;` as a whole statement inside a do-while
        body -> `v += 1;` / `v -= 1;` (value unused, so all four forms are equal)."""
        x = stmt
        if x.get("kind") == "UnaryOperator" and x.get("opcode") in ("++", "--"):
            v = strip(kids(x)[0])
            if v.get("kind") == "DeclRefExpr" and v.get("referencedDecl", {}).get("kind") in ("VarDecl", "ParmVarDecl"):
                s0, _ = low.span(x, "increment statement")
                e0 = low.stmt_end(x)
                name = v["referencedDecl"]["name"]
                cop = "-=" if x["opcode"] == "--" else "+="
                low.edit(s0, e0, f"{name} {cop} 1;", "R16", x)

    def walk_do_body(n, inside):
        k = n.get("kind")
        if k in ("ForStmt", "WhileStmt"):
            inside = False
        if k == "DoStmt":
            inside = True
            body = kids(n)[0]
            walk_do_body(body, True)
            return
        if k == "CompoundStmt" and inside:
            for c in kids(n):
                if c.get("kind") == "UnaryOperator":
                    r16(c)
                else:
                    walk_do_body(c, inside)
            return
        for c in kids(n):
            walk_do_body(c, inside)

    def refs_of(node, vid, stack, out):
        if node.get("kind") == "DeclRefExpr" and node.get("referencedDecl", {}).get("id") == vid:
            out.append(list(stack))
        stack.append(node)
        for c in kids(node):
            refs_of(c, vid, stack, out)
        stack.pop()

    def r17(decl_stmt, fn_body):
        """R17: function-local `static const` array with an initialiser -> automatic
        `const` array (alignment attribute dropped). Read-only, same values on every
        call; rejected if its address can escape the call."""
        for d in kids(decl_stmt):
            if d.get("kind") != "VarDecl" or d.get("storageClass") != "static":
                continue
            q = d.get("type", {}).get("qualType", "")
            if not (q.startswith("const ") and "[" in q and kids(d)):
                raise Reject("STATIC", f"function-local static {d.get('name')} is not a const array with initialiser", d)
            paths = []
            refs_of(fn_body, d.get("id"), [], paths)
            for path in paths:
                for anc in path:
                    k = anc.get("kind")
                    if k == "ReturnStmt":
                        raise Reject("STATIC", f"address of static {d['name']} may be returned", d)
                    if k == "CallExpr" and not is_intrinsic_call(anc):
                        nm = callee_name(anc) or ""
                        if nm.startswith("_mm"):
                            if not system_intrinsic(anc):
                                raise Reject("STATIC", f"static {d['name']} passed to {nm}, which is not a compiler builtin or a function declared in a system intrinsic header (it is defined or declared in the kernel file)", d)
                        elif not nm.startswith(("v", "__builtin")):
                            raise Reject("STATIC", f"static {d['name']} passed to a non-intrinsic call", d)
                    if k in ("BinaryOperator", "CompoundAssignOperator") and anc.get("opcode") in ("=", "+=", "-="):
                        lhs = strip(kids(anc)[0])
                        if not (lhs.get("kind") == "DeclRefExpr" and lhs.get("referencedDecl", {}).get("kind") == "VarDecl"):
                            raise Reject("STATIC", f"address of static {d['name']} stored to a non-local lvalue", d)
            b0 = decl_stmt.get("range", {}).get("begin", {})
            start = b0.get("offset") if "offset" in b0 else b0.get("expansionLoc", {}).get("offset")
            line_end = low.text.index("\n", start)
            seg = low.text[start:line_end]
            m = re.match(r"(?:XNN_ALIGN\s*\(\s*\d+\s*\)\s*)?static\s+", seg)
            if not m:
                raise Reject("STATIC", "could not locate the static keyword", d)
            low.edit(start, start + m.end(), "", "R17", d, original=seg[:m.end()])

    def r18(init):
        """R18: drop the trailing comma of an initialiser list (syntax only)."""
        try:
            s0, e0 = low.span(init, "initialiser list")
        except Reject:
            return
        t = low.text
        if t[e0 - 1] != "}":
            return
        i = e0 - 2
        while i > s0 and t[i].isspace():
            i -= 1
        if t[i] == ",":
            low.edit(i, i + 1, "", "R18", init, original=",")

    def visit(n, fn_body=None):
        k = n.get("kind")
        if k == "DeclStmt" and fn_body is not None and any(d.get("storageClass") == "static" for d in kids(n)):
            r17(n, fn_body)
        if k == "InitListExpr":
            r18(n)
            return
        if k == "GCCAsmStmt":
            s, _ = low.span(n, "asm statement")
            e = low.stmt_end(n) if low.text[low.span(n)[1] - 1] != ";" else low.span(n)[1]
            if not ASM_ALIGN.match(low.text[s:e].strip()):
                raise Reject("ASM", "inline asm other than an alignment-only directive", n)
            low.edit(s, e, "/* R14: alignment-only asm removed */;", "R14", n)
            return
        if k == "DoStmt":
            do_stmt(n)
        elif k in ("WhileStmt", "ForStmt"):
            ch = kids(n)
            conds = ch[:1] if k == "WhileStmt" else [c for c in ch[:-1] if c is not ch[0]][:1]
            for c in conds:
                if c and _cond_side_effect(c) and k == "WhileStmt":
                    raise Reject("NORMCOND", "while condition with a side effect", n)
        for c in kids(n):
            visit(c, fn_body)

    fns = [f for f in kids(ast) if f.get("kind") == "FunctionDecl" and
           any(c.get("kind") == "CompoundStmt" for c in kids(f)) and
           f.get("loc", {}).get("_file", f.get("loc", {}).get("expansionLoc", {}).get("_file")) == main_file]
    for f in fns:
        low.fn = f["name"]
        for c in kids(f):
            if c.get("kind") == "CompoundStmt":
                visit(c, c)
                walk_do_body(c, False)
    out, log = low.apply(), low.log
    return r19(out, log)


CODE_SPLIT = re.compile(r'(/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\')', re.S)


def r19(text, log):
    """R19: GNU `__restrict` / `__restrict__` -> C99 `restrict` (same meaning) outside
    comments and literals. QCP 2.1.4 only accepts the C99 keyword."""
    parts = CODE_SPLIT.split(text)
    n = 0
    for i in range(0, len(parts), 2):
        parts[i], k = re.subn(r"\b__restrict(?:__)?\b", "restrict", parts[i])
        n += k
    if n:
        log = log + [{"function": None, "rule": "R19", "line": None,
                      "original": "__restrict / __restrict__", "rewritten": f"restrict ({n} occurrences)"}]
    return "".join(parts), log


# ----------------------------------------------------------------------------
# v1.5/v1.6 rules: R20 (preprocessed units), R23 (`*p++` split, all ISAs), R21 (ISAs with enable_r21: x86), R22 (comment only)

LEX = re.compile(r'/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|[A-Za-z_]\w*|[0-9][A-Za-z0-9_.]*'
                 r'|>>=|<<=|\.\.\.|->|\+\+|--|<<|>>|<=|>=|==|!=|&&|\|\||\+=|-=|\*=|/=|%=|&=|\|=|\^=|[^\s]', re.S)


def c_tokens(text):
    """C token sequence with comments removed (used by the R22 comment-only self-check)."""
    return [m.group() for m in LEX.finditer(text) if not m.group().startswith(("/*", "//"))]


def node_file(n):
    loc = n.get("loc", {})
    return loc.get("_file", loc.get("expansionLoc", {}).get("_file"))


def _strip_attrs(q):
    """Remove balanced `__attribute__((...))` groups from a type spelling."""
    out, i = [], 0
    while i < len(q):
        j = q.find("__attribute__", i)
        if j < 0:
            out.append(q[i:])
            break
        out.append(q[i:j])
        k = q.find("(", j)
        depth = 0
        while k < len(q):
            depth += (q[k] == "(") - (q[k] == ")")
            k += 1
            if depth == 0:
                break
        i = k
    return "".join(out)


VEC_ATTR = re.compile(r"__vector_size__|neon_vector_type|neon_polyvector_type|ext_vector_type")


def is_vec(cfg, t):
    """True for a by-value vector type (pointers and arrays of vectors do not count).
    Vector = the ISA's `vector_type_regex` matches the spelling or the desugared spelling,
    or the desugared spelling carries a vector attribute."""
    if not t:
        return False
    rx = re.compile(cfg["vector_type_regex"])
    for q in (t.get("qualType", ""), t.get("desugaredQualType", "")):
        bare = re.sub(r"^(?:(?:const|volatile)\s+)+", "", _strip_attrs(q).strip()).strip()
        bare = re.sub(r"^(?:struct|union)\s+", "", bare)
        if not bare or any(c in bare for c in "*[("):
            continue
        if rx.match(bare) or (VEC_ATTR.search(q) and re.fullmatch(r"(?:\w+\s*)+", bare)):
            return True
    return False


def system_dirs(cfg):
    return [str(REPO / cfg["clang_resource_include"])] + [str(REPO / d) for d in cfg["libc_includes"]]


def top_decls(ast, main_file):
    return [d for d in kids(ast) if node_file(d) == main_file]


def has_body(d):
    return any(c.get("kind") == "CompoundStmt" for c in kids(d))


PINNING_ATTR = re.compile(r"^(?:Constructor|Destructor|Used|Retain|Weak|WeakRef|Alias|IFunc|AsmLabel)Attr$")


def fn_refs(n, out):
    """Names of all functions that the subtree refers to: DeclRefExpr (calls, address-of,
    function-pointer stores, initialisers) plus the two attribute forms that name a function
    without a DeclRefExpr: `alias("f")` and `cleanup(f)`."""
    k = n.get("kind")
    if k == "DeclRefExpr" and n.get("referencedDecl", {}).get("kind") == "FunctionDecl":
        out.add(n["referencedDecl"]["name"])
    elif k == "AliasAttr" and n.get("aliasee"):
        out.add(n["aliasee"])
    elif k == "CleanupAttr" and n.get("cleanup_function", {}).get("name"):
        out.add(n["cleanup_function"]["name"])
    for c in kids(n):
        fn_refs(c, out)
    return out


def _decl_label(d):
    return f"{d.get('kind', 'decl')} {d.get('name', '?')}" if d.get("name") else d.get("kind", "decl")


def r20(text, ast, main_file):
    """R20: delete unreferenced top-level `static inline` functions of the (preprocessed)
    unit. A candidate is deleted only if (a) no remaining top-level declaration other than
    itself refers to it -- by call, address-of, function-pointer store, initialiser,
    `alias`/`cleanup` attribute -- and (b) none of its declarations carries an attribute
    that lets a function run or survive without a reference (constructor, destructor, used,
    retain, weak, weakref, alias, ifunc, asm label). Repeat until nothing more is deleted.
    Everything else is kept, with the reason recorded. Prototypes of a deleted function go
    with it. Returns (text, log, retained)."""
    low = Lowerer(text, main_file)
    tops = [d for d in top_decls(ast, main_file) if d.get("kind") == "FunctionDecl" and not d.get("isImplicit")]
    by_name = {}
    for d in tops:
        by_name.setdefault(d["name"], []).append(d)
    cand = set()
    for name, ds in by_name.items():
        defs = [d for d in ds if has_body(d)]
        if defs and all(d.get("storageClass") == "static" for d in ds) and any(d.get("inline") for d in defs):
            cand.add(name)
    pinned = {}
    for n in cand:
        attrs = sorted({c["kind"][:-4].lower() for d in by_name[n] for c in kids(d) if PINNING_ATTR.match(c.get("kind", ""))})
        if attrs:
            pinned[n] = attrs
    # every other declaration of the unit counts as a referrer, wherever clang places it
    others = [d for d in kids(ast) if not d.get("isImplicit") and
              not (d.get("kind") == "FunctionDecl" and d.get("name") in cand and node_file(d) == main_file)]
    refs_of_fn = {n: fn_refs({"inner": [d for d in by_name[n] if has_body(d)]}, set()) for n in cand}
    base_refs = {}
    for d in others:
        for r in fn_refs(d, set()):
            base_refs.setdefault(r, set()).add(_decl_label(d))
    live, deleted = set(cand), []
    while True:
        referenced = set(base_refs)
        for n in live:
            referenced |= refs_of_fn[n] - {n}
        dead = sorted(n for n in live if n not in referenced and n not in pinned)
        if not dead:
            break
        live -= set(dead)
        deleted.extend(dead)
    reach = {n for n in live if n in base_refs or n in pinned}
    todo = list(reach)
    while todo:
        for m in refs_of_fn[todo.pop()] & live:
            if m not in reach:
                reach.add(m)
                todo.append(m)
    retained = []
    for n in sorted(live):
        why = []
        if n in pinned:
            why.append("attribute: " + ", ".join(pinned[n]))
        if n in base_refs:
            why.append("referenced by " + ", ".join(sorted(base_refs[n])))
        users = sorted(m for m in live if m != n and n in refs_of_fn[m])
        if users:
            why.append("referenced by static inline " + ", ".join(users))
        if n not in reach:
            why.append("not reachable from any reference outside the static inline set: reference cycle kept conservatively")
        retained.append({"function": n, "rule": "R20", "reason": "; ".join(why)})
    for name in deleted:
        for d in by_name[name]:
            s, e = low.span(d, "static inline function")
            if not has_body(d):
                m = re.match(r"\s*;", low.text[e:])
                if m:
                    e += m.end()
            low.fn = name
            low.edit(s, e, "", "R20", d)
    return low.apply(), low.log, retained


def _walk_calls(n, found):
    if n.get("kind") == "CallExpr":
        found.append(n)
    for c in kids(n):
        if c.get("kind") != "CompoundStmt":
            _walk_calls(c, found)
    return found


def _var_ref(n):
    n = strip(n)
    if n.get("kind") == "DeclRefExpr" and n.get("referencedDecl", {}).get("kind") in ("VarDecl", "ParmVarDecl"):
        return n
    return None


def _has_call_or_assign(n):
    return n.get("kind") == "CallExpr" or _cond_side_effect(n) or any(_has_call_or_assign(c) for c in kids(n))


R23_SAFE_BINOPS = frozenset(["+", "-", "*", "/", "%", "<<", ">>", "<", ">", "<=", ">=", "==", "!=", "&", "|", "^"])
R23_SAFE_UNOPS = frozenset(["-", "+", "~", "!", "*"])
R23_SAFE_KINDS = frozenset(["ImplicitCastExpr", "ParenExpr", "CStyleCastExpr", "ArraySubscriptExpr", "MemberExpr"])


def _incdec_deref(n):
    """`*p++`, `*p--`, `*++p`, `*--p` (through parentheses and casts): returns (deref, incdec, DeclRefExpr)."""
    if n.get("kind") == "UnaryOperator" and n.get("opcode") == "*":
        u = strip(kids(n)[0])
        if u.get("kind") == "UnaryOperator" and u.get("opcode") in ("++", "--"):
            v = strip(kids(u)[0])
            if v.get("kind") == "DeclRefExpr":
                return n, u, v
            return n, u, None
    return None


def r23(text, ast, main_file):
    """R23: `T v = *p++;` / `x = *p++;` -> `T v = *p; p += 1;` (and the --p, ++p, p-- forms:
    postfix: the update follows the statement; prefix: it precedes it). C11 6.5.2.4: the
    value of `p++` is p before the update and the side effect completes before the end of
    the full expression, so, when p occurs nowhere else in the statement, evaluating the
    dereference first and updating p afterwards is the same. Every `*p++`-like dereference
    that does not satisfy all conditions is rejected (rule R23)."""
    low = Lowerer(text, main_file)

    def locals_of(fn):
        out, addr = {}, set()

        def rec(n):
            if n.get("kind") in ("VarDecl", "ParmVarDecl"):
                out[n["id"]] = n
            if n.get("kind") == "UnaryOperator" and n.get("opcode") == "&":
                v = strip(kids(n)[0])
                if v.get("kind") == "DeclRefExpr":
                    addr.add(v["referencedDecl"]["id"])
            for c in kids(n):
                rec(c)
        rec(fn)
        return out, addr

    def count_refs(n, vid):
        c = 1 if n.get("kind") == "DeclRefExpr" and n.get("referencedDecl", {}).get("id") == vid else 0
        return c + sum(count_refs(k, vid) for k in kids(n))

    def sites(n, out):
        s = _incdec_deref(n)
        if s:
            out.append(s)
        for c in kids(n):
            sites(c, out)
        return out

    def path_to(root, target):
        if root is target:
            return [root]
        for c in kids(root):
            p = path_to(c, target)
            if p:
                return [root] + p
        return None

    def handle(stmt, decls, addr):
        ss = sites(stmt, [])
        if not ss:
            return
        if len(ss) > 1:
            raise Reject("R23", "several `*p++`-like dereferences in one statement", stmt)
        deref, upd, var = ss[0]
        if var is None:
            raise Reject("R23", "operand of ++/-- under the dereference is not a plain variable", stmt)
        d = var["referencedDecl"]
        vd = decls.get(d["id"])
        if vd is None or vd.get("storageClass") in ("static", "extern"):
            raise Reject("R23", f"{d['name']} is not an ordinary local variable or parameter", stmt)
        if "volatile" in (vd.get("type", {}).get("qualType", "")):
            raise Reject("R23", f"{d['name']} is volatile", stmt)
        if d["id"] in addr:
            raise Reject("R23", f"the address of {d['name']} is taken in the function", stmt)
        if count_refs(stmt, d["id"]) != 1:
            raise Reject("R23", f"{d['name']} occurs again in the statement", stmt)
        if stmt.get("kind") == "DeclStmt":
            vds = [k for k in kids(stmt) if k.get("kind") == "VarDecl"]
            if len(vds) != 1 or len(kids(stmt)) != 1 or not kids(vds[0]) or vds[0].get("storageClass") == "static":
                raise Reject("R23", "declaration statement is not a single non-static declarator with an initialiser", stmt)
            root = kids(vds[0])[-1]
        elif strip(stmt).get("kind") == "BinaryOperator" and strip(stmt).get("opcode") == "=":
            root = kids(strip(stmt))[1]
        else:
            raise Reject("R23", "statement is neither a declaration with initialiser nor `x = expr;`", stmt)
        path = path_to(root, deref)
        if path is None:
            raise Reject("R23", "the dereference is not inside the initialiser / right-hand side", stmt)
        for a in path[:-1]:
            k = a.get("kind")
            ok = k in R23_SAFE_KINDS or \
                (k == "UnaryOperator" and a.get("opcode") in R23_SAFE_UNOPS) or \
                (k == "BinaryOperator" and a.get("opcode") in R23_SAFE_BINOPS)
            if not ok:
                raise Reject("R23", f"the dereference is nested in a {k} {a.get('opcode', '')}".rstrip()
                                    + " (conditionally or not-simply evaluated)", stmt)
        try:
            u_s, u_e = low.span(upd, "increment")
            v_s, v_e = low.span(var, "pointer variable")
            s_s, s_e = low.span(stmt, "statement")
        except Reject as r:
            raise Reject("R23", r.message, stmt)
        if low.text[s_e - 1] != ";":
            s_e = low.stmt_end(stmt)
        name = d["name"]
        step = f"{name} += 1;" if upd["opcode"] == "++" else f"{name} -= 1;"
        low.edit(u_s, u_e, low.text[v_s:v_e], "R23", upd)
        if upd.get("isPostfix"):
            low.edit(s_e, s_e, " " + step, "R23", stmt, original="")
        else:
            low.edit(s_s, s_s, step + " ", "R23", stmt, original="")

    def visit(n, decls, addr):
        if n.get("kind") == "CompoundStmt":
            for c in kids(n):
                if c.get("kind") == "CompoundStmt":
                    continue
                own = [k for k in kids(c) if k.get("kind") == "CompoundStmt"]
                if own or c.get("kind") in ("IfStmt", "WhileStmt", "DoStmt", "ForStmt", "SwitchStmt",
                                            "CaseStmt", "DefaultStmt", "LabelStmt", "AttributedStmt"):
                    check_compound_parts(c, decls, addr)
                else:
                    handle(c, decls, addr)
        for c in kids(n):
            visit(c, decls, addr)

    def check_compound_parts(c, decls, addr):
        """A control statement: every `*p++`-like dereference outside nested compound
        statements (condition, init, unbraced body) is rejected; braced bodies are
        visited as compound statements of their own."""
        def rec(n):
            if n.get("kind") == "CompoundStmt":
                return
            s = _incdec_deref(n)
            if s:
                raise Reject("R23", f"`*p++`-like dereference in a {c.get('kind')} (condition, initialiser or "
                                    "unbraced body), not a direct statement of a compound statement", c)
            for k in kids(n):
                rec(k)
        rec(c)

    for f in top_decls(ast, main_file):
        if f.get("kind") == "FunctionDecl" and has_body(f):
            low.fn = f["name"]
            decls, addr = locals_of(f)
            for c in kids(f):
                if c.get("kind") == "CompoundStmt":
                    visit(c, decls, addr)
    return low.apply(), low.log


def r21(cfg, text, ast, main_file):
    """R21: when one call receives the same by-value vector variable as several arguments,
    copy it into a fresh temporary (declared just before the enclosing statement) for the
    2nd and later occurrences. QCP cannot split the single resource of a variable between
    two parameters. The call must be the whole expression statement, the whole initialiser
    of a single declaration, or the whole right-hand side of a plain `x = call;`, and its
    arguments must contain no calls or assignments, so the copy sees the value the call sees."""
    low = Lowerer(text, main_file)

    def dups(call):
        seen = {}
        for a in kids(call)[1:]:
            r = _var_ref(a)
            if r is None or not is_vec(cfg, r.get("type")):
                continue
            seen.setdefault(r["referencedDecl"]["id"], []).append(r)
        return [v for v in seen.values() if len(v) > 1]

    def check_stmt(c):
        if c.get("kind") == "CompoundStmt":
            return
        calls = [k for k in _walk_calls(c, []) if dups(k)]
        if not calls:
            return
        if len(calls) > 1:
            raise Reject("R21", "several calls with repeated vector arguments in one statement", c)
        call = calls[0]
        e = strip(c)
        if c.get("kind") == "DeclStmt":
            vds = [d for d in kids(c) if d.get("kind") == "VarDecl"]
            ok = len(vds) == 1 and bool(kids(vds[0])) and strip(kids(vds[0])[-1]) is call
        elif e.get("kind") == "BinaryOperator" and e.get("opcode") == "=":
            ok = strip(kids(e)[1]) is call
        else:
            ok = e is call
        if not ok:
            raise Reject("R21", "call with repeated vector arguments is not the whole expression, initialiser or "
                                "right-hand side of its statement", c)
        if any(_has_call_or_assign(a) for a in kids(call)[1:]):
            raise Reject("R21", "arguments of a call with repeated vector arguments contain calls or assignments", call)
        stmt_start, _ = low.span(c, "statement")
        ind = low.indent_at(stmt_start)
        pre = []
        for group in dups(call):
            for r in group[1:]:
                while True:
                    low.temp_counter += 1
                    tmp = f"qcpv_dup{low.temp_counter}"
                    if tmp not in low.idents:
                        low.idents.add(tmp)
                        break
                ty = low.type_text(r["type"])
                pre.append(f"{ty} {tmp} = {r['referencedDecl']['name']};\n{ind}")
                s, e2 = low.span(r, "repeated vector argument")
                low.edit(s, e2, tmp, "R21", r)
        low.edit(stmt_start, stmt_start, "".join(pre), "R21", c, original="")

    def visit(n):
        if n.get("kind") == "CompoundStmt":
            for c in kids(n):
                check_stmt(c)
        for c in kids(n):
            visit(c)

    for f in top_decls(ast, main_file):
        if f.get("kind") == "FunctionDecl" and has_body(f):
            low.fn = f["name"]
            for c in kids(f):
                if c.get("kind") == "CompoundStmt":
                    visit(c)
    return low.apply(), low.log


def r22(cfg, text, ast, main_file):
    """R22: at a call of a user-defined function (not from a system header) that takes a
    vector by value and writes the heap (itself or through the functions it calls, judged
    by the ISA's `heap_write_regex` on callee names), insert the comment
    `/*@ where <param>=&<variable>, ... */` right after the call, one binding per by-value
    vector parameter. Comment-only: the C token sequence must be unchanged (checked)."""
    low = Lowerer(text, main_file)
    sysd = system_dirs(cfg)
    heap_rx = re.compile(cfg["heap_write_regex"])
    defs = {d["name"]: d for d in kids(ast) if d.get("kind") == "FunctionDecl" and has_body(d)}
    memo = {}

    def writes(name, stack=()):
        if heap_rx.match(name):
            return True
        if name in memo:
            return memo[name]
        if name in stack or name not in defs:
            return False
        res = any(writes(c, stack + (name,)) for c in sorted(fn_refs(defs[name], set()) - {name}))
        memo[name] = res
        return res

    def wrapper(name):
        d = defs.get(name)
        if d is None:
            return None
        f = node_file(d)
        if f is None or any(f.startswith(s) for s in sysd):
            return None
        params = [p for p in kids(d) if p.get("kind") == "ParmVarDecl"]
        if not any(is_vec(cfg, p.get("type")) for p in params) or not writes(name):
            return None
        return params

    def visit(n):
        if n.get("kind") == "CallExpr":
            name = callee_name(n)
            params = wrapper(name) if name else None
            if params:
                binds = []
                for p, a in zip(params, kids(n)[1:]):
                    if not is_vec(cfg, p.get("type")):
                        continue
                    r = _var_ref(a)
                    if r is None or not p.get("name"):
                        raise Reject("R22", f"vector argument of heap-writing wrapper {name} is not a plain variable "
                                            "or its parameter is unnamed", n)
                    binds.append(f"{p['name']}=&{r['referencedDecl']['name']}")
                _, e = low.span(n, "wrapper call")
                if not re.match(r"\s*/\*@\s*where\b", low.text[e:]):
                    low.edit(e, e, "\n/*@ where " + ", ".join(binds) + " */\n", "R22", n, original="")
        for c in kids(n):
            visit(c)

    for f in top_decls(ast, main_file):
        if f.get("kind") == "FunctionDecl" and has_body(f):
            low.fn = f["name"]
            for c in kids(f):
                if c.get("kind") == "CompoundStmt":
                    visit(c)
    out = low.apply()
    if c_tokens(out) != c_tokens(text):
        raise Reject("INTERNAL", "R22 changed the C token sequence")
    return out, low.log


def _non_call_refs(n, out):
    """Functions referred to other than as the direct callee of a call (address taken,
    stored, passed, or named by an alias/cleanup attribute)."""
    k = n.get("kind")
    if k == "CallExpr":
        ch = kids(n)
        if strip(ch[0]).get("kind") != "DeclRefExpr":
            _non_call_refs(ch[0], out)
        for c in ch[1:]:
            _non_call_refs(c, out)
        return out
    if k == "DeclRefExpr" and n.get("referencedDecl", {}).get("kind") == "FunctionDecl":
        out.add(n["referencedDecl"]["name"])
    elif k == "AliasAttr" and n.get("aliasee"):
        out.add(n["aliasee"])
    elif k == "CleanupAttr" and n.get("cleanup_function", {}).get("name"):
        out.add(n["cleanup_function"]["name"])
    for c in kids(n):
        _non_call_refs(c, out)
    return out


def r25(text, ast, main_file, entry):
    """R25: keep only the call graph of `entry`. A function defined in the unit is deleted
    (with its prototypes) unless it is the entry, is reachable from the entry through calls,
    or is a root that may run or be reached without a call from the entry: it carries a
    pinning attribute (constructor, destructor, used, retain, weak, weakref, alias, ifunc,
    asm label), its address is taken or named by an alias/cleanup attribute anywhere in the
    unit, or a non-function top-level declaration refers to it. Retained functions are
    recorded with their reason. Returns (text, log, retained)."""
    low = Lowerer(text, main_file)
    tops = [d for d in top_decls(ast, main_file) if d.get("kind") == "FunctionDecl" and not d.get("isImplicit")]
    by_name = {}
    for d in tops:
        by_name.setdefault(d["name"], []).append(d)
    defs = {n: [d for d in ds if has_body(d)] for n, ds in by_name.items()}
    defs = {n: ds for n, ds in defs.items() if ds}
    if entry not in defs:
        raise Reject("R25", f"entry function {entry} is not defined in the input file")
    why = {entry: ["entry"]}
    for n, ds in by_name.items():
        if n not in defs or n == entry:
            continue
        attrs = sorted({c["kind"][:-4].lower() for d in ds for c in kids(d) if PINNING_ATTR.match(c.get("kind", ""))})
        if attrs:
            why.setdefault(n, []).append("attribute: " + ", ".join(attrs))
    taken = set()
    for d in kids(ast):
        if d.get("isImplicit") or node_file(d) != main_file:
            continue
        if d.get("kind") == "FunctionDecl":
            _non_call_refs(d, taken)
        else:
            for r in fn_refs(d, set()):
                taken.add(r)
    for n in sorted(taken):
        if n in defs and n != entry:
            why.setdefault(n, []).append("address taken or referenced outside a call")
    kept, todo = set(why), list(why)
    while todo:
        n = todo.pop()
        for m in sorted(fn_refs({"inner": defs[n]}, set()) - {n}):
            if m in defs and m not in kept:
                kept.add(m)
                why.setdefault(m, []).append("called from " + n)
                todo.append(m)
            elif m in defs:
                why.setdefault(m, []).append("called from " + n)
    retained = [{"function": n, "rule": "R25", "reason": "; ".join(why[n])} for n in sorted(kept)]
    dead = sorted(n for n in defs if n not in kept)
    for name in dead:
        for d in by_name[name]:
            s, e = low.span(d, "unreachable function")
            if not has_body(d):
                m = re.match(r"\s*;", low.text[e:])
                if m:
                    e += m.end()
            low.fn = name
            low.edit(s, e, "", "R25", d)
    return low.apply(), low.log, retained


def lower_file(cfg, src, work_dir, header_name="qcp_rvv_ptr_ops.h", isa="rvv", preprocessed=False, entry=None):
    src = Path(src).resolve()
    # clang reports byte offsets; latin-1 maps each byte to one character, so string
    # indices equal byte offsets and the file round-trips byte-exactly.
    orig_text = src.read_bytes().decode("latin-1")
    cfg = cfg_for(cfg, isa)
    if isa == "hvx":
        header_name = cfg["ops_header"]
    if preprocessed and isa == "rvv":
        raise Reject("PREPROCESSED", "--preprocessed is supported for --isa neon/x86 only (R12 needs the macro text)")
    profile, ast, cmd = parse(cfg, src, preprocessed=preprocessed)
    annotate_files(ast, {"file": None})
    macros = dump_macros(cfg, profile, src, preprocessed) if isa == "hvx" else None
    main_file = str(src)
    text, r12 = orig_text, []
    with tempfile.TemporaryDirectory(prefix="rvv_ptr_lower_") as tmp:
        def reparse(txt, tag):
            path = (Path(tmp) / f"{src.stem}.{tag}{src.suffix}").resolve()
            path.write_bytes(txt.encode("latin-1"))
            prof, a, _ = parse(cfg, path, preprocessed=preprocessed)
            annotate_files(a, {"file": None})
            return prof, a, str(path)

        if isa == "rvv":
            text, r12 = expand_local_macros(cfg, orig_text, ast, str(src), work_dir)
            if r12:
                epath = (work_dir / (src.stem + ".r12-expanded.c")).resolve()
                epath.write_bytes(text.encode("latin-1"))
                profile, ast, cmd = parse(cfg, epath)
                annotate_files(ast, {"file": None})
                main_file = str(epath)
        r20log, r20_retained = [], []
        if preprocessed:
            text, r20log, r20_retained = r20(text, ast, main_file)
            if r20log:
                profile, ast, main_file = reparse(text, "r20")
        r25log, r25_retained = [], []
        if entry:
            text, r25log, r25_retained = r25(text, ast, main_file, entry)
            if r25log:
                profile, ast, main_file = reparse(text, "r25")
        text, r23log = r23(text, ast, main_file)
        if r23log:
            profile, ast, main_file = reparse(text, "r23")
        ntext, nlog = normalize(text, ast, main_file, system_dirs(cfg))
        if nlog:
            npath = (work_dir / (src.stem + ".normalized.c")).resolve()
            npath.write_bytes(ntext.encode("latin-1"))
            profile, ast, cmd = parse(cfg, npath, preprocessed=preprocessed)
            annotate_files(ast, {"file": None})
            main_file, text = str(npath), ntext
        r21log = []
        if cfg.get("enable_r21"):
            text, r21log = r21(cfg, text, ast, main_file)
        if r21log:
            profile, ast, main_file = reparse(text, "r21")
        r22log = []
        if isa != "hvx":
            text, r22log = r22(cfg, text, ast, main_file)
        if r22log:
            profile, ast, main_file = reparse(text, "r22")
    nlog = r20log + r25log + r23log + nlog + r21log + r22log
    if isa not in ("rvv", "hvx"):
        res = {"tool": TOOL_VERSION, "isa": isa, "input": src.name,
               "input_sha256": hashlib.sha256(orig_text.encode("latin-1")).hexdigest(),
               "parse_profile": profile, "rewrites": nlog, "rejections": [],
               "output_sha256": hashlib.sha256(text.encode("latin-1")).hexdigest()}
        if preprocessed:
            res["r20_retained"] = r20_retained
        if entry:
            res["r25_retained"] = r25_retained
        return res, text, None
    low = Lowerer(text, main_file, cfg, ast, macros)
    low.log.extend(r12)
    low.log.extend(nlog)
    rejects = []
    fns = [n for n in kids(ast) if n.get("kind") == "FunctionDecl" and
           any(c.get("kind") == "CompoundStmt" for c in kids(n)) and
           n.get("loc", {}).get("_file", n.get("loc", {}).get("expansionLoc", {}).get("_file")) == main_file]
    for fn in fns:
        try:
            low.function(fn)
        except Reject as r:
            rejects.append({"function": fn.get("name"), "rule": r.rule, "message": r.message,
                            "line": low.line_of(r.node) if r.node else None})
    result = {"tool": TOOL_VERSION, "input": src.name,
              "input_sha256": hashlib.sha256(orig_text.encode("latin-1")).hexdigest(),
              "parse_profile": profile, "functions": [f["name"] for f in fns],
              "rejections": rejects}
    if isa == "hvx":
        result["isa"] = isa
    if preprocessed:
        result["r20_retained"] = r20_retained
    if entry:
        result["r25_retained"] = r25_retained
    if rejects:
        return result, None, None
    out = low.apply()
    if low.edits:
        out = f'#include "{header_name}"  /* inserted by rvv_ptr_lower */\n' + out
    def utf8(x):
        return x.encode("latin-1").decode("utf-8", "replace") if isinstance(x, str) else x
    result["rewrites"] = [{k: utf8(v) for k, v in e.items()} for e in low.log]
    result["rule_counts"] = {}
    for e in low.log:
        result["rule_counts"][e["rule"]] = result["rule_counts"].get(e["rule"], 0) + 1
    result["ptr_ops"] = [low.ops[k] for k in sorted(low.ops)]
    result["copy_types"] = sorted(low.copy_types)
    result["output_sha256"] = hashlib.sha256(out.encode()).hexdigest()
    return result, out, (gen_header(low.ops, low.copy_types, isa), gen_prototypes(low.ops, low.copy_types, isa))


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("input")
    ap.add_argument("--out-dir", required=True)
    ap.add_argument("--config", default=str(HERE / "config.json"))
    ap.add_argument("--isa", choices=["rvv", "neon", "x86", "hvx"], default="rvv",
                    help="rvv: normalise + pointer-lower; neon/x86: normalise only")
    ap.add_argument("--preprocessed", action="store_true",
                    help="input is a self-contained preprocessed unit (gcc -E -P -CC with shim headers): "
                         "parsed alone, and R20 (drop unreferenced static inline functions) is applied")
    ap.add_argument("--entry", help="R25: keep only the call graph of this function (plus pinned and "
                                    "address-taken functions); applied to all ISAs, only when given")
    a = ap.parse_args()
    cfg = json.loads(Path(a.config).read_text())
    out_dir = Path(a.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    stem = Path(a.input).stem
    try:
        result, out, header = lower_file(cfg, a.input, out_dir, isa=a.isa, preprocessed=a.preprocessed, entry=a.entry)
    except Reject as r:
        result, out, header = {"tool": TOOL_VERSION, "input": Path(a.input).name,
                               "rejections": [{"rule": r.rule, "message": r.message}]}, None, None
    if out is not None and a.isa not in ("rvv", "hvx"):
        (out_dir / f"{stem}.normalized.c").write_bytes(out.encode("latin-1"))
        (out_dir / f"{stem}.normalization.json").write_text(json.dumps(result, indent=1, ensure_ascii=False) + "\n")
        print(f"OK {Path(a.input).name} isa={a.isa} rewrites={len(result['rewrites'])}")
        return 0
    if out is not None:
        (out_dir / f"{stem}.lowered.c").write_bytes(out.encode("latin-1"))
        hname = json.loads(Path(a.config).read_text())["isa"]["hvx"]["ops_header"] if a.isa == "hvx" else "qcp_rvv_ptr_ops.h"
        (out_dir / hname).write_text(header[0])
        (out_dir / (hname[:-2] + ".proto.h")).write_text(header[1])
    (out_dir / f"{stem}.lowering.json").write_text(json.dumps(result, indent=1, ensure_ascii=False) + "\n")
    status = "REJECTED" if result.get("rejections") else "OK"
    print(f"{status} {Path(a.input).name} rewrites={len(result.get('rewrites', []))} "
          f"rejections={len(result.get('rejections', []))}")
    return 1 if result.get("rejections") else 0


if __name__ == "__main__":
    sys.exit(main())
