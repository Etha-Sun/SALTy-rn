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
from pathlib import Path

TOOL_VERSION = "rvv_ptr_lower 1.3.0"
HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
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


def clang_command(cfg, profile, src):
    cmd = [str(REPO / cfg["clang"][0])] + cfg["clang"][1:]
    cmd += cfg["target_flags"] + ["-fsyntax-only", "-nostdinc",
                                  "-isystem", str(REPO / cfg["clang_resource_include"])]
    for inc in cfg["libc_includes"]:
        cmd += ["-isystem", str(REPO / inc)]
    for inc in cfg["user_includes"]:
        cmd += ["-I" + str(REPO / inc)]
    for h in cfg["profiles"][profile]:
        cmd += ["-include", h]
    return cmd + [str(src)]


def clang_env():
    env = dict(os.environ)
    env.setdefault("ZIG_GLOBAL_CACHE_DIR", "/tmp/rvv-ptr-lower-zig")
    env.setdefault("ZIG_LOCAL_CACHE_DIR", "/tmp/rvv-ptr-lower-zig")
    return env


def parse(cfg, src, extra_includes=()):
    """Return (profile, ast). Tries the fixed profile order; first clean parse wins."""
    errors = {}
    for profile in cfg["profile_order"]:
        cmd = clang_command(cfg, profile, src)
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


class Lowerer:
    def __init__(self, text, main_file):
        self.text = text
        self.main_file = main_file
        self.edits = []          # (start, end, replacement, seq)
        self.log = []
        self.ops = {}            # ptr-op name -> signature record
        self.copy_types = set()
        self.temp_counter = 0
        self.lifted = []
        self.fn = None
        self.idents = set(re.findall(r"\b[A-Za-z_]\w*\b", text))

    # ---- source positions -------------------------------------------------
    def plain(self, loc):
        return loc is not None and "spellingLoc" not in loc and loc.get("_file") == self.main_file

    def span(self, n, what="node"):
        r = n.get("range", {})
        b, e = r.get("begin"), r.get("end")
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

    @staticmethod
    def type_text(t):
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

    def record_op(self, call, out_type):
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
        vec = [is_rvv_type(a.get("type")) for a in args]
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
    def vec_operand(self, n, pre):
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
        if k == "CallExpr" and is_intrinsic_call(s) and node_is_rvv(s):
            self.lifted.append(s)
            t = self.fresh()
            tname = self.type_text(s["type"])
            pre.append(f"{tname} {t};")
            pre.append(self.call_into(s, t, pre) + ";")
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

    def lifted_args(self, call, pre, top=False):
        """Arguments of a call in pointer form (R7); nested vector calls are lifted (R6).
        Reordering safety of the lifts is checked per statement by check_lifts."""
        name = callee_name(call)
        texts = self.arg_texts(call)
        args = kids(call)[1:]
        out = []
        for a, txt in zip(args, texts):
            if is_rvv_type(a.get("type")):
                out.append("&" + self.vec_operand(a, pre))
            elif involves_rvv(a):
                out.append(self.scalar_expr(a, pre))
            else:
                out.append(txt)
        return out

    def call_into(self, call, target, pre, top=False):
        """Text of `qcp_p_f(&target, args')`; nested lifts are appended to pre."""
        op = self.record_op(call, self.type_text(call["type"]))
        args = self.lifted_args(call, pre, top)
        return f"{op}(&{target}" + "".join(", " + a for a in args) + ")"

    def scalar_expr(self, n, pre, top=False):
        """Lower a non-vector expression that may contain vector subexpressions."""
        if node_is_rvv(n):
            raise Reject("VECEXPR", "vector value in scalar context", n)
        if not involves_rvv(n):
            return self.src(n)
        k = n.get("kind")
        if k == "CallExpr":
            if not is_intrinsic_call(n):
                raise Reject("VECCALL", f"non-intrinsic call {callee_name(n)} with vector arguments", n)
            op = self.record_op(n, None)
            return f"{op}(" + ", ".join(self.lifted_args(n, pre, top)) + ")"
        if k == "BinaryOperator" and n.get("opcode") in ("&&", "||", ","):
            if any(involves_rvv(c) for c in kids(n)[1:]):
                raise Reject("CONDEVAL", f"vector call in conditionally evaluated operand of {n['opcode']}", n)
        if k == "ConditionalOperator" and any(involves_rvv(c) for c in kids(n)[1:]):
            raise Reject("CONDEVAL", "vector call in a branch of ?:", n)
        # generic splice: keep the node's text, replacing each child that changes
        s, e = self.span(n)
        pieces, cur = [], s
        for c in kids(n):
            if not involves_rvv(c):
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
            if has_side_effect(c):
                raise Reject("SIDEEFFECT", f"lifted call {callee_name(c)} has side effects", c)
        lifted_ids = {id(c) for c in lifted}
        reads = set()
        for c in lifted:
            reads |= decl_refs(c)
        writes = set()

        def walk(x, top):
            if id(x) in lifted_ids:
                return
            k = x.get("kind")
            if k == "CallExpr" and not is_intrinsic_call(x) and not is_vsetvl_builtin(x):
                raise Reject("SIDEEFFECT", f"call to {callee_name(x)} in a statement with lifted vector calls", x)
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
        if not any(involves_rvv(d) or is_rvv_type(d.get("type")) for d in decls):
            return
        rvv_decls = [d for d in decls if is_rvv_type(d.get("type"))]
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
        tname = self.type_text(d["type"])
        v = d["name"]
        init = kids(d)[0] if kids(d) else None
        if init is None:
            return [f"{tname} {v};"], "keep"
        if d.get("init") != "c":
            raise Reject("SHAPE", "unsupported initialiser style", d)
        si = strip(init)
        if si.get("kind") == "CallExpr" and is_intrinsic_call(si) and node_is_rvv(si):
            call = self.call_into(si, v, pre, top=True)
            return [f"{tname} {v};"] + pre + [call + ";"], "R1"
        if si.get("kind") == "DeclRefExpr":
            u = self.vec_operand(si, pre)
            return [f"{tname} {v};", f"{self.copy_op(tname)}(&{v}, &{u});"], "R2"
        raise Reject("VECEXPR", f"vector initialiser of kind {si.get('kind')}", d)

    def expr_stmt(self, n, parent_kind):
        if not involves_rvv(n):
            return
        s, _ = self.span(n, "statement")
        e = self.stmt_end(n)
        x = strip(n)
        pre = []
        if node_is_rvv(x):
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
            if r.get("kind") == "CallExpr" and is_intrinsic_call(r):
                direct = set()
                for a in kids(r)[1:]:
                    sa = strip(a)
                    if is_rvv_type(a.get("type")) and sa.get("kind") == "DeclRefExpr":
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
        if not involves_rvv(n):
            return
        val = kids(n)[0]
        if node_is_rvv(val):
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
            if involves_rvv(cond):
                if parent_kind != "CompoundStmt":
                    raise Reject("SHAPE", "if with vector condition outside a block", n)
                self.cond_lift(n, cond, "R10")
            for c in rest:
                self.stmt(c, "IfStmt")
        elif k == "SwitchStmt":
            ch = kids(n)
            if involves_rvv(ch[0]):
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
                if h and involves_rvv(h):
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
            if involves_rvv(n):
                raise Reject("SHAPE", f"vector code inside unsupported statement {k}", n)

    def function(self, fn):
        self.fn = fn["name"]
        ptype = fn.get("type", {}).get("qualType", "")
        for p in kids(fn):
            if p.get("kind") == "ParmVarDecl" and is_rvv_type(p.get("type")):
                raise Reject("VECPARAM", f"function {fn['name']} has a vector parameter", p)
        m = re.match(r"^(.*?)\s*\(", ptype)
        if m and RVV_TYPE.match(m.group(1).strip()):
            raise Reject("VECRET", f"function {fn['name']} returns a vector", fn)
        body = [c for c in kids(fn) if c.get("kind") == "CompoundStmt"]
        if body:
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


def gen_header(ops, copy_types):
    """Pointer-form ops as macros over the real intrinsics. Macros (not functions) keep
    arguments that must be integer constant expressions (vget/vset index, vxrm
    rounding mode, ...) constant."""
    lines = ["/* Generated by " + TOOL_VERSION + ". Pointer-form wrappers over the real RVV",
             " * intrinsics: vector arguments are read through pointers and a vector result",
             " * is written through the first pointer. Used to compile and differentially",
             " * test the lowered program; the QCP proof uses a separate shim with the same",
             " * names and contracts. */",
             "#pragma once", "#include <riscv_vector.h>", ""]
    for t in sorted(copy_types):
        lines.append(f"static inline void {PTR_PREFIX}copy_{t}({t} *qcp_r, const {t} *qcp_a) {{ *qcp_r = *qcp_a; }}")
    for name in sorted(ops):
        r = ops[name]
        params, call = [], []
        if r["out_param"]:
            params.append("qcp_r")
        for i, isv in enumerate(r["vector_params"]):
            params.append(f"qcp_a{i}")
            call.append(f"*(qcp_a{i})" if isv else f"(qcp_a{i})")
        inv = f"{r['intrinsic']}({', '.join(call)})"
        body = f"(*(qcp_r) = {inv})" if r["out_param"] else f"({inv})"
        sig = "; ".join(f"{p}{' (vector)' if v else ''}" for p, v in zip(r["params"], r["vector_params"]))
        lines.append(f"/* {name}: {('out ' + r['out_param'] + '; ') if r['out_param'] else ''}{sig} -> {r['return_type']} */")
        lines.append(f"#define {name}({', '.join(params)}) {body}")
    return "\n".join(lines) + "\n"

def gen_prototypes(ops, copy_types):
    """The pointer-form interface as C prototypes (canonical types). This is the list
    of functions the QCP shim must implement and specify."""
    lines = ["/* Generated by " + TOOL_VERSION + ". Pointer-form interface (prototypes). */",
             "#pragma once", "#include <riscv_vector.h>", ""]
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


def normalize(text, ast, main_file):
    low = Lowerer(text, main_file)

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
                    if k == "CallExpr" and not is_intrinsic_call(anc) and not (callee_name(anc) or "").startswith(("v", "__builtin")):
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
    return low.apply(), low.log


def lower_file(cfg, src, work_dir, header_name="qcp_rvv_ptr_ops.h", isa="rvv"):
    src = Path(src).resolve()
    # clang reports byte offsets; latin-1 maps each byte to one character, so string
    # indices equal byte offsets and the file round-trips byte-exactly.
    orig_text = src.read_bytes().decode("latin-1")
    cfg = cfg_for(cfg, isa)
    profile, ast, cmd = parse(cfg, src)
    annotate_files(ast, {"file": None})
    main_file = str(src)
    text, r12 = orig_text, []
    if isa == "rvv":
        text, r12 = expand_local_macros(cfg, orig_text, ast, str(src), work_dir)
        if r12:
            epath = (work_dir / (src.stem + ".r12-expanded.c")).resolve()
            epath.write_bytes(text.encode("latin-1"))
            profile, ast, cmd = parse(cfg, epath)
            annotate_files(ast, {"file": None})
            main_file = str(epath)
    ntext, nlog = normalize(text, ast, main_file)
    if nlog:
        npath = (work_dir / (src.stem + ".normalized.c")).resolve()
        npath.write_bytes(ntext.encode("latin-1"))
        profile, ast, cmd = parse(cfg, npath)
        annotate_files(ast, {"file": None})
        main_file, text = str(npath), ntext
    if isa != "rvv":
        res = {"tool": TOOL_VERSION, "isa": isa, "input": src.name,
               "input_sha256": hashlib.sha256(orig_text.encode("latin-1")).hexdigest(),
               "parse_profile": profile, "rewrites": nlog, "rejections": [],
               "output_sha256": hashlib.sha256(text.encode("latin-1")).hexdigest()}
        return res, text, None
    low = Lowerer(text, main_file)
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
    return result, out, (gen_header(low.ops, low.copy_types), gen_prototypes(low.ops, low.copy_types))


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("input")
    ap.add_argument("--out-dir", required=True)
    ap.add_argument("--config", default=str(HERE / "config.json"))
    ap.add_argument("--isa", choices=["rvv", "neon"], default="rvv",
                    help="rvv: normalise + pointer-lower; neon: normalise only")
    a = ap.parse_args()
    cfg = json.loads(Path(a.config).read_text())
    out_dir = Path(a.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    stem = Path(a.input).stem
    try:
        result, out, header = lower_file(cfg, a.input, out_dir, isa=a.isa)
    except Reject as r:
        result, out, header = {"tool": TOOL_VERSION, "input": Path(a.input).name,
                               "rejections": [{"rule": r.rule, "message": r.message}]}, None, None
    if out is not None and a.isa != "rvv":
        (out_dir / f"{stem}.normalized.c").write_bytes(out.encode("latin-1"))
        (out_dir / f"{stem}.normalization.json").write_text(json.dumps(result, indent=1, ensure_ascii=False) + "\n")
        print(f"OK {Path(a.input).name} isa={a.isa} rewrites={len(result['rewrites'])}")
        return 0
    if out is not None:
        (out_dir / f"{stem}.lowered.c").write_bytes(out.encode("latin-1"))
        (out_dir / "qcp_rvv_ptr_ops.h").write_text(header[0])
        (out_dir / "qcp_rvv_ptr_ops.proto.h").write_text(header[1])
    (out_dir / f"{stem}.lowering.json").write_text(json.dumps(result, indent=1, ensure_ascii=False) + "\n")
    status = "REJECTED" if result.get("rejections") else "OK"
    print(f"{status} {Path(a.input).name} rewrites={len(result.get('rewrites', []))} "
          f"rejections={len(result.get('rejections', []))}")
    return 1 if result.get("rejections") else 0


if __name__ == "__main__":
    sys.exit(main())
